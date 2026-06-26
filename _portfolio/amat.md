---
title: "AMAT - Agentic Mission Analysis Toolbox"
excerpt: |-
  AMAT is a modular software platform with swappable backend physics engines and astrodynamics libraries, for deterministic spacecraft mission analysis and flight planning. Supports GMAT, SPICE, Orekit, and more. It is architecturally designed to interface with both humans and AI orchestrators, empowering mission analysis through a single natural language prompt. <br>
  
  The demonstration here is a mission from Low Earth Orbit (LEO) to Geosynchronous Earth Orbit (GEO). Mission specifications were communicated to an AI coding assistant, which generated the mission specification sheets, and executed the full pipeline without human intervention or making guesses. The in-house developed targeter autonomously computed the most fuel-efficient flight plan from an inclined LEO to an equatorial GEO using impulse burns. The flight path is propagated using NASA's General Mission Analysis Tool (GMAT) as the simulation backend, then rendered as an interactive 3D scene. <br>

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
  <span class="amat-highlight">If you liked this project, please give <a href="https://github.com/ThisisShoo/AMAT">my project on GitHub</a> a star!</span> <br><br>

  Shown here is an AMAT render of a spacecraft maneuvering from LEO to GEO. Use the drop-down menu on the top left to select refernce frame. The EarthFixed reference frame also includes ground track drawn on the surface of Earth. <br><br>

  Hover mouse over number to see the mission checkpoints:
</p>

<ol class="amat-checkpoints">
  <li>
    <strong>initial_state</strong>
    <div>The start of simulation.</div>
  </li>
  <li>
    <strong>post_initial_coast</strong>
    <div>TargetSat completes a few revolutions. After this point, the targeter starts looking for a burn window to execute GTO insertion. In this case, the best timing is at the initial orbit's intersection with the equatorial plane.</div>
  </li>
  <li>
    <strong>post_transfer_injection</strong>
    <div>TargetSat finishes the impulse burn for GTO insertion. Since it's more economical to make plane changes at higher altitudes, this burn is tangential-only.</div>
  </li>
  <li>
    <strong>post_orbit_insertion</strong>
    <div>TargetSat finishes the burn to circularize the orbit. It concurrently completes the plane change.</div>
  </li>
  <li>
    <strong>final_state_checkpoint</strong>
    <div>TargetSat completes a few refolutions in the target GEO. At this point, ground track in EarthFixed frame largely remains static over the same ground location, as expected for GEO spacecrafts.</div>
  </li>
</ol>

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

  .amat-checkpoints {
    max-width: 900px;
    margin-top: 0;
  }

  .amat-checkpoints li {
    margin-bottom: 0.75rem;
  }

  .amat-checkpoints li div {
    margin-left: 1.25rem;
    margin-top: 0.15rem;
  }

  .amat-highlight {
    display: inline-block;
    padding: 0.4rem 0.6rem;
    border-left: 4px solid #2f81f7;
    background: rgba(47, 129, 247, 0.12);
    font-weight: 600;
  }
</style>
