---
title: "GMAT Automation for Asteroid Trajectory Prediction"
excerpt: |-
  Monte Carlo simulation of real asteroid trajectories for prediction of future Earth encounters with uncertainties. <br>
  Project repository: [https://github.com/ThisisShoo/GMAT-Monte-Carlo-Propagator](https://github.com/ThisisShoo/GMAT-Monte-Carlo-Propagator)
collection: portfolio
layout: single
# permalink: /portfolio/gmat-asteroid/
---

<p class="project-highlight">
  <a href="https://github.com/ThisisShoo/GMAT-Monte-Carlo-Propagator">View the project on GitHub</a>
</p>

Project Overview
======

Asteroid encounters provide a valuable opportunity for astronomers and space domain awareness. Near-Earth Objects (NEOs) are the most frequent cis-lnar visitors from the intra-solar system space. Their relatively small sizes (meter-scale for most detected NEOs so far), low albedo, and fast speed present a challenge to characterize their trajectories with sufficient confidence, hence making predicting future encounters more difficult downstream. This project leverages the multi-shooting method to predict the statistically likely future encounters, and potentially reveals trajectory geometries of potential interest. 

Technical Approach
======

Asteroid initial conditions were retrieved from the Asteroid Terristrial-impact Last Alert System (ATLAS) via NASA's Horizons system. The state uncertainties were obtained from the Small Body Database (SBDB). By perturbing the initial state with a vector randomly generated from the uncertainties, 500 trajectories were generated through automating NASA's General Mission Analysis Tool (GMAT), and the likelihood of an encounter event is determined statistically from these asteroids' geocentric distance. 

Validation
======

This study was validated against published encounter predictions for real temporarily captured or near-Earth asteroids, namely 2006 RH<sub>120</sub>, 2020 CD<sub>3</sub>, 2022 NX<sub>1</sub>, 2024 PT<sub>5</sub>

The simulated encounter windows and geocentric-distance trends can be compared against the literature values to check whether the automated GMAT/Monte Carlo workflow reproduces the expected capture or close-approach behavior.

<style>
  .project-highlight {
    display: inline-block;
    padding: 0.45rem 0.65rem;
    border-left: 4px solid #2f81f7;
    background: rgba(47, 129, 247, 0.12);
    font-weight: 600;
  }
</style>
