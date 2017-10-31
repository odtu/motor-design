# Week 1- C-Core

## Topics Covered:

- Magnetic Circuits and basic equations
- Distribution of flux, saturation
- Leakage flux, fringing flux
- Definition of inductance

## Assignment

As the first week's assignment, you are required to model a C-core as shown below:

![](./images/C-core.png)

The steps to be completed:

- Calculate the airgap flux density analytically (assuming infinitely permeable core)

- Calculate the inductance of this device

- Model the C-core in 2D by using any FEA software, and solve (just magnetostatic).

- Draw the magnetic flux density distribution (assuming core is electric steel with a relative permeability of 1000, just linear material, no saturation at this point)

- Then repeat the previous part with the B-H curve below (If the software has a similar built-in material, you can use it). Comment on the maximum levels of flux densities compared to the case with linear core material.

![](http://www.electronics-tutorials.ws/electromagnetism/mag18.gif)

- Plot the flux density vector distribution (e.g. like the one below), and comment on the fringing flux and leakage flux effect. You may need to play with mesh-size and vector-size to obtain a nice figure

![](https://www.researchgate.net/profile/Oliver_Probst/publication/221911664/figure/fig2/AS:305256002015233@1449790110356/Fig-6-Typical-axial-flow-permanent-magnet-generator-with-iron-core-Small-figure.png)

- Plot the airgap flux density distribution across the airgap (i.e. on a horizontal line drawn at the center of the gap). It is expected to be like a flat sine wave

- Calculate the total flux in the core, and the leakage flux (You need to integrate B over some line).

- Calculate the main inductance, and compare it with the analytical results

- Calculate the leakage inductance and compare it with the main inductance.


A short course on motor-design using finite element software. The course is held weekly by [PowerLab](http://power.eee.metu.edu.tr)

## Program

- ## Week1: [Flux Distribution in C-Core](Week1-Ccore.md)
