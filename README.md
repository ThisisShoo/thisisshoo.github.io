# Shuhan Zheng Personal Site

This repository hosts Shuhan Zheng's personal website at `https://thisisshoo.github.io`.

The site is built with Jekyll using the Academic Pages/Minimal Mistakes structure, but the sample content has been removed. Current public content is based on `CV.txt`.

## Editing Content

Use `CONTENT_GUIDE.md` for where to add future material.

Common updates:

* Edit `_pages/about.md` for the home page.
* Edit `_pages/cv.md` for the web CV.
* Add or replace `CV_Eng.pdf` in the repo root when a downloadable CV should be published.
* Add project pages under `_portfolio/`.
* Edit `_data/navigation.yml` to change the header menu.
* Edit `_config.yml` for sidebar contact details and site metadata.

## Local Preview

With Ruby and Bundler installed:

```bash
bundle install
bundle exec jekyll serve -l -H localhost
```

Then open `http://localhost:4000`.

With Docker:

```bash
docker compose up
```

Then open `http://localhost:4000`.
