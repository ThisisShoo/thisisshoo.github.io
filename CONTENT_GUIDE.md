# Content Guide

This site has been trimmed down to the sections currently backed by Shuhan's CV.

## Main identity

Edit `_config.yml` for the site title, description, sidebar biography, email, GitHub, LinkedIn, location, and institutional affiliation.

## Header navigation

Edit `_data/navigation.yml` to add, remove, or reorder top-menu links.

## Home page

Edit `_pages/about.md` for the front page bio, research interests, and featured current project.

## CV PDF

Replace `files/CV_Shuhan Zheng.pdf` to update the CV; there is no separate web CV to maintain. The header and home page link directly to the PDF. If you change its filename, update `_data/navigation.yml`, `_pages/about.md`, and `_pages/cv-redirect.html` (which forwards old CV and resume URLs to the PDF). Encode spaces in URLs as `%20`.

## Private-link pitch presentation

The presentation at `/idea-market-nov06` is intentionally absent from menus, project lists, and sitemaps. It is public to anyone who knows the URL; `noindex` is not access control. Replace `files/Pitch final.pptx`, then run `powershell -ExecutionPolicy Bypass -File scripts/export-pitch.ps1` on Windows with PowerPoint installed to refresh the slide images, original GIFs, and slide manifest. Commit the generated `assets/projects/hdst-pitch/` files along with the presentation. GIF playback is preserved; PowerPoint slide transitions and object entrance animations are not reproduced.

## Project entries

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
