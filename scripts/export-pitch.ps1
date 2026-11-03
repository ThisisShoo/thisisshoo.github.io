$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$root = Split-Path $PSScriptRoot -Parent
$source = Join-Path $root 'files/Pitch final.pptx'
$output = Join-Path $root 'assets/projects/hdst-pitch'
New-Item -ItemType Directory -Force $output | Out-Null
$zip = [IO.Compression.ZipFile]::OpenRead($source)
function Read-DeckXml($path) {
    $reader = [IO.StreamReader]::new($zip.GetEntry($path).Open())
    try { return [xml]$reader.ReadToEnd() } finally { $reader.Dispose() }
}
$app = New-Object -ComObject PowerPoint.Application
$deck = $null
try {
    $deck = $app.Presentations.Open($source, -1, 0, 0)
    $presentationXml = Read-DeckXml 'ppt/presentation.xml'
    $size = $presentationXml.GetElementsByTagName('p:sldSz')[0]
    $slides = @()
    for ($i = 1; $i -le $deck.Slides.Count; $i++) {
        $xml = Read-DeckXml "ppt/slides/slide$i.xml"
        $rels = Read-DeckXml "ppt/slides/_rels/slide$i.xml.rels"
        $animations = @()
        $hiddenShapes = @()
        foreach ($pic in $xml.GetElementsByTagName('p:pic')) {
            $blip = $pic.GetElementsByTagName('a:blip')[0]
            $id = $blip.GetAttribute('embed', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships')
            $rel = $rels.Relationships.Relationship | Where-Object Id -eq $id
            if ($rel.Target -notmatch '\.gif$') { continue }
            $transform = $pic.GetElementsByTagName('a:xfrm')[0]
            if ($transform.rot -or $pic.GetElementsByTagName('a:srcRect').Count) {
                throw "Slide $i has a cropped or rotated GIF that needs manual handling."
            }
            $name = Split-Path $rel.Target -Leaf
            [IO.Compression.ZipFileExtensions]::ExtractToFile($zip.GetEntry("ppt/media/$name"), (Join-Path $output $name), $true)
            $off = $transform.GetElementsByTagName('a:off')[0]
            $ext = $transform.GetElementsByTagName('a:ext')[0]
            $animations += @{
                src = $name
                x = 100 * [double]$off.x / [double]$size.cx
                y = 100 * [double]$off.y / [double]$size.cy
                width = 100 * [double]$ext.cx / [double]$size.cx
                height = 100 * [double]$ext.cy / [double]$size.cy
            }
            # Export a clean background so transparent GIF frames never reveal a frozen frame.
            $shapeId = [int]$pic.GetElementsByTagName('p:cNvPr')[0].id
            foreach ($shape in $deck.Slides.Item($i).Shapes) {
                if ($shape.Id -eq $shapeId) { $shape.Visible = 0; $hiddenShapes += $shape }
            }
        }
        $deck.Slides.Item($i).Export((Join-Path $output "slide-$i.png"), 'PNG', 1600, 900)
        foreach ($shape in $hiddenShapes) { $shape.Visible = -1 }
        $slides += @{
            image = "slide-$i.png"
            text = ($xml.GetElementsByTagName('a:t') | ForEach-Object InnerText) -join ' '
            animations = $animations
        }
    }
    $manifest = @{ width = [double]$size.cx; height = [double]$size.cy; slides = $slides }
    $manifest | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $output 'slides.json') -Encoding utf8
    Write-Output "Exported $($slides.Count) slides."
} finally {
    if ($deck) { $deck.Close() }
    $app.Quit()
    $zip.Dispose()
}
