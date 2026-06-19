---
title: "AMAT - Agentic Mission Analysis Toolbox"
excerpt: |-
  A modular and backend-neutral architecture for AI-orchestrated spaceflight mission design and analysis. The demonstration here is a mission from Low Earth Orbit (LEO) to Geosynchronous Earth Orbit (GEO). The in-house developed targeter autonomously computes the most fuel-efficient flight plan from an inclined LEO to an equatorial GEO. The flight path is propagated using NASA's General Mission Analysis Tool (GMAT) as the simulation backend, then rendered as an interactive 3D scene.<br>
  Follow the project development on GitHub: [https://github.com/ThisisShoo/AMAT](https://github.com/ThisisShoo/AMAT)
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

<p class="amat-notes">
  AMAT render of a spacecraft maneuvering from LEO to GEO. Use the drop-down menu on the top left to select refernce frame. The EarthFixed reference frame also includes ground track drawn on the surface of Earth. <br>

  Hover mouse over number to see the mission checkpoints: <br>
  1. initial_state - The start of simulation. <br>
  2. post_initial_coast - TargetSat completes a few revolutions. After this point, the targeter starts looking for a burn window to execute GTO insertion. In this case, the best timing is at the initial orbit's intersection with the equatorial plane. <br>
  3. post_transfer_injection - TargetSat finishes the impulse burn for GTO insertion. Since it's more economical to make plane changes at higher altitudes, this burn is tangential-only. <br>
  4. post_orbit_insertion - TargetSat finishes the burn to circularize the orbit. It concurrently completes the plane change. <br>
  5. final_state_checkpoint - TargetSat completes a few refolutions in the target GEO. At this point, ground track in EarthFixed frame largely remains static over the same ground location, as expected for GEO spacecrafts. 
</p>

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

  .amat-notes {
    max-width: 900px;
  }
</style>
