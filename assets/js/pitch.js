(() => {
  const viewer = document.getElementById('pitch-viewer');
  const stage = document.getElementById('pitch-stage');
  const previous = document.getElementById('pitch-prev');
  const next = document.getElementById('pitch-next');
  const select = document.getElementById('pitch-select');
  const status = document.getElementById('pitch-status');
  let slides = [];
  let index = 0;
  let generation = 0;
  const base = viewer.dataset.assets;

  function showSlide(value) {
    index = Math.max(0, Math.min(slides.length - 1, value));
    const slide = slides[index];
    const currentGeneration = ++generation;
    stage.replaceChildren();
    stage.setAttribute('aria-busy', 'true');
    status.textContent = 'Loading slide...';
    previous.disabled = index === 0;
    next.disabled = index === slides.length - 1;
    select.value = String(index);
    const background = new Image();
    background.className = 'pitch-background';
    background.alt = slide.text;
    const images = [background];
    for (const [number, animation] of slide.animations.entries()) {
      const image = new Image();
      image.className = 'pitch-animation';
      image.alt = `Slide ${index + 1}, animation ${number + 1}`;
      Object.assign(image.style, {
        left: `${animation.x}%`, top: `${animation.y}%`,
        width: `${animation.width}%`, height: `${animation.height}%`
      });
      image.dataset.file = animation.src;
      images.push(image);
    }
    let remaining = images.length;
    let failed = false;
    for (const image of images) {
      image.onload = () => {
        if (generation !== currentGeneration) return;
        remaining--;
        if (!remaining) { stage.setAttribute('aria-busy', 'false'); if (!failed) status.textContent = ''; }
      };
      image.onerror = () => {
        if (generation !== currentGeneration) return;
        failed = true;
        stage.setAttribute('aria-busy', 'false');
        status.textContent = 'A slide asset could not load. Reload the page or download the PowerPoint.';
      };
      stage.append(image);
      image.src = base + (image.dataset.file || slide.image);
    }
  }
  previous.addEventListener('click', () => showSlide(index - 1));
  next.addEventListener('click', () => showSlide(index + 1));
  select.addEventListener('change', () => showSlide(Number(select.value)));
  viewer.addEventListener('keydown', event => {
    if (!slides.length || event.target.tagName === 'SELECT') return;
    if (event.key === 'ArrowRight' || event.key === 'ArrowLeft') {
      event.preventDefault();
      showSlide(index + (event.key === 'ArrowRight' ? 1 : -1));
    }
  });
  document.getElementById('pitch-fullscreen').addEventListener('click', async () => {
    try {
      if (document.fullscreenElement) await document.exitFullscreen();
      else await viewer.requestFullscreen();
    } catch { status.textContent = 'Fullscreen is unavailable in this browser.'; }
  });
  fetch(base + 'slides.json').then(response => {
    if (!response.ok) throw new Error('Manifest unavailable');
    return response.json();
  }).then(data => {
    slides = data.slides;
    if (!slides.length) throw new Error('Empty presentation');
    slides.forEach((slide, i) => select.add(new Option(`Slide ${i + 1} / ${slides.length}`, i)));
    select.disabled = false;
    showSlide(0);
  }).catch(() => { status.textContent = 'The presentation could not load. Please download the PowerPoint.'; });
})();
