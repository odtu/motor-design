# Week 1- Basics of Magnetic Circuits

## Topics Covered:

- Magnetic Circuits and basic equations
- Distribution of flux, saturation
- Leakage flux, fringing flux
- Definition of inductance

## Assignment:

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

- Increase the current by 2, 5, 10 times and repeat the calculation of inductance to see how the inductance changes with current.

## Some Hints:

- Understand the analytical model before building the FEA model.

- When constructing the FEA model, go step-by-step. First try the simplest case and check if it is working as intended, if it works then make it more realistic.

- I strongly advise you to start with 2D simulation. Don't worry you will have time to do enough 3D simulations in the following weeks.

- Don't try to model 100 turns wire by wire. Instead use a rectangular coil as shown in the figure (i.e. you can assume 1 turn, with 12000 A). I leave it to you of choosing the coil dimensions.

- Don't forget to choose a reasonable solution space (i.e. air around the core), and don't forget to assign air material properties.

## Deliverables:

- I expect each student to prepare his/her own assignments including the analytical calculations

- A set of figures (.png) for flux distribution etc.

- A document (preberably in .md format, but .doc is also ok) for you comments etc.

- Put your files in a separate folder with your name in Week1-Assignments folder (you should have write access to the Github repo)

- If you can't manage to upload to the GitHub please bring your files in a USB stick on Friday

- Do NOT put your FEA files or any big files to the course repo (You are free to create your own repos for this purpose).

- If you didn't put effort on any of these above, there is almost no benefit you can get from this course. Therefore, I advise you not to waste your time on Friday as well.

## Still Have Questions?

- Please don't hesitate to ask for help. You are encouraged to work together, but I expect everyone to prepare their own assignments.

- If you have a public question, please [open an issue](https://github.com/odtu/motor-design/issues/new) in this repo, and I will try to answer it asap.

