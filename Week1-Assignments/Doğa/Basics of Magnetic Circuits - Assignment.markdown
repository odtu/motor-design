- **Calculate the airgap flux density analytically (assuming infinitely permeable core)**

![](https://latex.codecogs.com/gif.latex?%5Cint%20Hdl%3DNI)

![](https://latex.codecogs.com/gif.latex?H*0.01%3D100*120)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;note that:  one can ignore the reluctance of the core which is the infinitely permeable,

![](https://latex.codecogs.com/gif.latex?%5Cfrac%7BB%7D%7B%5Cmu%20_%7Bo%7D%5Cmu%20_%7Br%7D%7D*0.01%3D100*120)

![](https://latex.codecogs.com/gif.latex?B%3D%5Cfrac%7B100*120*4%5Cpi%2010%5E%7B-7%7D%7D%7B0.01%7D)

![](https://latex.codecogs.com/gif.latex?B%3D1.5072T)

- **Calculate the inductance of this device**


![](https://latex.codecogs.com/gif.latex?L%3DL_%7Bm%7D&plus;L_%7Bleakage%7D)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assume ![](https://latex.codecogs.com/gif.latex?L_%7Bleakage%7D) is too smaller than ![](https://latex.codecogs.com/gif.latex?L_%7Bm%7D)

![](https://latex.codecogs.com/gif.latex?L_%7Bm%7D%3D%5Cfrac%7BN%5Cphi%20%7D%7BI%7D%3D%5Cfrac%7B100*%281.5072*%281*0.02%29%29%7D%7B120%7D%3D0.025H)

- **Model the C-core in 2D by using any FEA software, and solve (just magnetostatic).**

COMSOL Multiphysics model of C core is available below with its mesh:

![](Mesh.png "")




-  **Draw the magnetic flux density distribution (assuming core is electric steel with a relative permeability of 1000, just linear material, no saturation at this point)**

![](B_Distribution.png "")

- **Then repeat the previous part with the B-H curve below (If the software has a similar built-in material, you can use it). Comment on the maximum levels of flux densities compared to the case with linear core material.**

Steel Core:

![](B_Distribution_SteelBH.png "")

Iron Core:

![](B_Distribution_IronBH.png "")

Air Core:

![](B_Distribution_AirBH.png "")

- **Plot the flux density vector distribution (e.g. like the one below), and comment on the fringing flux and leakage flux effect. You may need to play with mesh-size and vector-size to obtain a nice figure**

![](airgap.png "")

- **Plot the airgap flux density distribution across the airgap (i.e. on a horizontal line drawn at the center of the gap). It is expected to be like a flat sine wave**


![](airgapline.png "")


![](airgaplineB.png "")

- **Calculate the total flux in the core, and the leakage flux (You need to integrate B over some line).**

![](totalfluxinthecore.jpg "")

![](leakage.jpg "")

- **Calculate the main inductance, and compare it with the analytical results**

![](https://latex.codecogs.com/gif.latex?L_%7Bm%7D%3D%5Cfrac%7BN%5Cphi%20%7D%7BI%7D%3D%5Cfrac%7B100*0.0788%7D%7B120%7D%3D0.065)

- **Calculate the leakage inductance and compare it with the main inductance.**

![](https://latex.codecogs.com/gif.latex?L_%7Bleakage%7D%3D%5Cfrac%7BN%5Cphi%20%7D%7BI%7D%3D%5Cfrac%7B100*0.006%7D%7B120%7D%3D0.005)