---
title: "Catalog Acquisition and Compilation tool"
excerpt: |-
  Autonomous data retrieval, sanitizing, and management pipeline with user interface API. Scalable scientific database solution designed for hierarchical and relational data. <br>
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

Due to their relative isolation and ancient stellar population, dwarf galaxies provide a fossil record5
of the early universe’s chemical composition and metallicity. With the advancements in observation technologies, spectroscopic studies on the dwarf galaxies near the Milky Way are becoming increasingly precise. he emergence of numerous improved spectroscopic data will enable further data-driven research, mainly constraining existing models or validating and calibrating future chemical abundance measurements. However, since such data is almost always taken by multiple telescopes and recorded in different catalogs, one catalog consolidating all relevant stellar information will be an excellent source of data to drive further galactic chemical evolution research.

Technical Approach
======

This project required constructing a scalable database with an intake pipeline and an output interface. The intake pipeline was reponsible for sanitizing data to correct for naming inconsistencies, as well as cross-matching stellar positions using k-d tree search. The output interface was a database API that outputs the data in a user-specified form. JSON was used to store the highly relational and hierarchica; data. 

Project Outcome
======

After being accepted by the capstone project reviewers, this project was adopted by the University of Toronto Near Field Cosmology Group for internal research use. 

<style>
  .project-highlight {
    display: inline-block;
    padding: 0.45rem 0.65rem;
    border-left: 4px solid #2f81f7;
    background: rgba(47, 129, 247, 0.12);
    font-weight: 600;
  }
</style>
