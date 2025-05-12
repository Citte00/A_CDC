# Biophysical model of evapotranspiration during plant growth
#### Authors: Ciarimboli Luca, Citterio Lorenzo, Dell'Otto Marianna
#### University supervisors: Perotto Simona, Ferro Nicola
#### External supervisor: Antona Alessandro (Agricola Moderna)

## General description
This project is part of the course 052497 - "NUMERICAL ANALYSIS FOR PARTIAL DIFFERENTIAL EQUATIONS" at Politecnico di Milano. 

The goal of this project is to simulate the growth of a lettuce plant in a vertical farm to quantize the evapotranspiration.

The project is done in collaboration with [Agricola Moderna](https://agricolamoderna.com/). The code is implemented with the use of [FreeFEM](https://freefem.org/). For the visualization of the plots [ParaView](https://www.paraview.org/) and [Matlab](https://it.mathworks.com/products/matlab.html) are employed.

The model implemented is inspired by the following papers, which are included in the `doc` folder:
* [Computational analysis of the environment in an indoor vertical farming system -  Naranjani,Najafianashrafi, Pascual et al.](https://escholarship.org/uc/item/0hd561bp)
* [Validation of a Dynamic Lettuce Growth Model for Greenhouse Climate Control - E.J. Van Henten](https://www.sciencedirect.com/science/article/pii/S0308521X94902801)
* [Plant factories; crop transpiration and energy balance - Graamans, van den Dobbelsteen, Meinenb,Stanghellini](https://www.sciencedirect.com/science/article/pii/S0308521X16306515)

The models, proposed in each paper, are implemented in the respective files, which are contained in the `src` folder:
* in `Naranjani_newton.edp`, the Navier-Stokes equantions are solved in a 3D cube cell (through the Newton method);
* in `Naranjani_energy.edp`, energy balance equation and species mass fraction equations are solved;
* in `VanHenten.edp`, the system of ODE is solved through the Crank Nicolson method;
* in `Graamans.edp`, the equations for the heat exchange are solved.

Moreover:
* `main.edp` contains the code to run a 20-days simulation;
* `grid_study.edp` contains the code to solve the PDEs for different mesh sizes;
* `data.edp` contains all the physical constant needed;
* `plot_commands.sh` contains all the commands needed for the generation of the gnuplot file;

## Additional remarks
* The (given) intensity of the led is 45 W/m^2 or 4.6*45 PPFD (considering a complete light spectrum).
* The temperature is considered in K in `Naranjani_energy.edp`, meanwhile in °C in `VanHenten.edp` and `Graamans.edp`.
* The source terms for H2O (`Sh2o`) and for CO2 (`Sco2`) are obtained, based on the molar balance of the photosynthesis reaction equation, from the gross canopy photosynthesis (`fphot`). The unit of measure of `Sh2o` and `Sco2` is kg/m^3, while `fphot` is in g* m^-2* s^-1. 
* The amount of latent heat exchanged is calculated in `Graamans.edp` and used as a source term in `Naranjani_energy.edp`.
* The physical value for the air viscosity `mu` should be 1e-5; however, greater values are considered to allow computation in local PCs.
* The presence of a singular lettuce plant is modeled.
