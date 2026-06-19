---
title: "AMAT - Agentic Mission Analysis Toolbox"
excerpt: "A modular and backend-neutral architecture for AI-orchestrated spaceflight mission design and analysis. The demonstration here is a mission from Low Earth Orbit (LEO) to Geosynchronous Earth Orbit (GEO). The in-house developed targeter autonomously computes the most fuel-efficient flight plan from an inclined LEO to an equatorial GEO. The flight path is propagated using NASA's General Mission Analysis Tool (GMAT) as the simulation backend, then rendered as an interactive 3D scene."
collection: portfolio
layout: single
permalink: /portfolio/amat/
---

<div class="amat-viewer-frame">
  <iframe
    src="/projects/amat/"
    title="AMAT interactive 3D mission viewer"
    loading="eager"
    allowfullscreen>
  </iframe>
</div>

<p><a href="/projects/amat/" class="btn">Open full-screen viewer</a></p>

<style>
  .amat-viewer-frame {
    width: min(100vw - 2rem, 1200px);
    height: min(78vh, 760px);
    margin: 1rem 0;
    border: 1px solid #d0d7de;
    background: #000;
  }

  .amat-viewer-frame iframe {
    display: block;
    width: 100%;
    height: 100%;
    border: 0;
    background: #000;
  }
</style>
