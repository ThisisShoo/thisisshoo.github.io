# Content Guide

This site has been trimmed down to the sections currently backed by Shuhan's CV.

## Main identity

Edit `_config.yml` for the site title, description, sidebar biography, email, GitHub, LinkedIn, location, and institutional affiliation.

## Header navigation

Edit `_data/navigation.yml` to add, remove, or reorder top-menu links.

## Home page

Edit `_pages/about.md` for the front page bio, research interests, and featured current project.

## CV page

Edit `_pages/cv.md` for the web CV. To add a downloadable PDF, place `CV_Eng.pdf` in the repo root and add links like `[Download my CV](/CV_Eng.pdf)` in `_pages/about.md` and `_pages/cv.md`.

## Projects

Add one Markdown file per project in `_portfolio/`. Use `_portfolio/portfolio-1.md` as the model:

```markdown
---
title: "Project Title"
excerpt: "One-sentence summary."
collection: portfolio
---

Project description goes here.
```

## Publications, talks, teaching, and blog posts

The sample entries have been removed. When you have real items to publish, add Markdown files under `_publications/`, `_talks/`, `_teaching/`, or `_posts/`, and then add the matching page back into `_data/navigation.yml` if you want it visible in the header.
