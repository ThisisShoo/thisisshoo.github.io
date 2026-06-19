# AMAT LEO-to-GEO Demo Viewer

This folder is a standalone GitHub Pages-ready export of the AMAT LEO-to-GEO trajectory viewer.

Copy the whole `for_demo` folder into a GitHub Pages repository, or copy `index.html` wherever you want the demo page to live.

To embed it in another page:

```html
<iframe
  src="./for_demo/index.html"
  title="AMAT LEO-to-GEO trajectory demo"
  style="width: 100%; height: 720px; border: 0;"
  loading="lazy"
></iframe>
```

Notes:

- The trajectory data is embedded directly in `index.html`.
- The viewer loads Three.js and planet textures from public CDNs/NASA URLs, so the page expects network access.
- Regenerate this folder after rerunning the AMAT visualization pipeline if you want the website demo to reflect new simulation output.
