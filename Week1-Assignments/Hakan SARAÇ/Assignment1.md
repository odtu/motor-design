### Flux distributions

Air Gap Reluctance = 0.01/(4*pi*10^-7*0.01*1) = 796000 ampere/weber

Inductance of the device = N^2/R = 100^2/795000 = 0.0126 henry

Flux Distribution for relative permeability 1000
![](https://lh3.googleusercontent.com/Nfiqmt7ORctdg32veQvogDhQ0HeOuNBGSpXWAmZrzw5-TzDipNezgA4ix_0w81_YZu1BTJISH3nHRBgCMUI3KJxC0ob6lYRVnKlUOnHEsPrB3uBaPDAriG1eIDgjHpf7oPsCWOdCQl3ASgg0jIfYW1qBlGAm6pYwb2I8jGOCiwuPrdNvJ0BtoZOmhy15xhOn_CGLTDURnQmr3TzDZzLv7-ptgkDXrrsM-4z96FlDjXh5kiiBAsLoLpVZ3GP8vbBQSTeBYm5OA8xrSWGdnrrbyAtm5xK-kDhuYObJQEsnqJDQitP90S8TIlU3XU42IsPYzHWQ8G5UU8a25N-vAQ4O3lWUUKeNZlD_Bt62mzOS4TlgYtli361u324vd5o6TJYFzfqwIVpNBZchwGZR_8_PgQEYIhcx84XtOBOQSutPspp1dDBEnfQ6ilqhmU4bEZmbX-5XOzpFtxkVriA2zW2OU5kwHZMxR96SW8XEEpBjaTRpIJVWMfK6LGc8AneJJNQd0n8yRD_WcMjWs6nuDCTsRfdb-jGjJUjZ3sDNm8ciR3wb0q5rPRGxqsT0ZKuflkuERubdnyuly-BCPUYRKGziMAw63EsGShelugqnh9NGdg=w1237-h646-no)

I tried the create two materials with the given B-H curve however since the B field is small it resulted as same for both materials

for iron & steel in the given figure for I=120 and Nt= 100
![](https://lh3.googleusercontent.com/ZiRANvhzIDbBNyPOpFJmUBHKYnfE09wAMLp96O_wbwTmHpqVTHkrGnK66vPODKdW15pXzIrho7K-BoS8vwHBlGONDOy0uSipSKIgxl18MwMZmJzxCXlPtJclhoJ0O6KwXv-dHZxZW6lJdisCKKHYNXMQ4q4usQmNPiLXTV9sK3rRMqBmCXYy_PIqhcZaFRot1lIQKOeUE2YGUb-0hTNA2W7_K45Gc8P4NCXEt30IDd8x3LurOgyDtn34FNnaXWfqYENorj-yqruPWkUxj6QSEDVTs6Cy49yp8rvfn-mEH49l4Ki-nX3IkXY1Q7AQd3BA3Kz2aFy_WXtXsS-HT3hum_yhmq_m55j0QhQ8n_DhKOsLejOSbNVMmmd7lTsqTD4C8QOmdcmji_31UlPuUS4jIdnB8E7-O25ydXgqkzR36Mbjcksb3PYVtseQOCWkwhEXBMee5xX9eo8LJfGXdNGRRAgVEanlLK87K2jOEGegAvZAoQ_ZhmHE-hvKVj8UcqW8pI9cZAB2rLKW5PqLLszgjboK4e8uvUyUHNnvwq743fJEH0urykH_GnuI84D01dbPl1Pt8WsxFRaSEqRNaDaFKrXWtlBcca54lohTcRmIxw=w958-h410-no)
Due to the leakage, left handside of the core has more B than the right handside

### Leakage and main flux&inductance comparisons

leakage flux is around 3.77mT for I = 120 and material is steel
total flux is around 27.39 mT

then main inductance becomes : 27.39*10^-3*0,02*1/120 = 4.56 microhenry which is very different from the analytical results.
leakage inductance : 3.77*10^-3*0,055*1/120 = 1.72 microhenry  which is 37% of the main inductance


for 24kA
B = 7.4mT for leakage
B = 54.7mT in core

for 60kA
B = 18.9 mT for leakage
B =137.46mT in core

for 120kA
B = 37.8 mT  for leakage
B = 275.34 mT in core

for the results above the core is steel given in the assignment

both changed linearly since because no saturation occured in the core.
in the case of a saturation, the change of B with current would decrease inside the core.








