# NAPDE Project - Biophysical model of evapotranspiration during plant growth
## Authors: Ciarimboli Luca, Citterio Lorenzo, Dell'Otto Marianna
## University supervisors: Perotto Simona, Ferro Nicola
## External supervisor: Antona Alessandro


This project is part of the course 052497 - "NUMERICAL ANALYSIS FOR PARTIAL DIFFERENTIAL EQUATIONS" at Politecnico di Milano 
The goal of this project is to simulate the growth of a lettuce plant in a vertical farm to quantize the evapotranspiration.
The project is done in collaboration with Agricola Moderna. The code is implemented with the use of [FreeFEM](https://freefem.org/)

The model implemented is inspired by the following papers:
* [Computational analysis of the environment in an indoor vertical farming system -  Naranjani,Najafianashrafi, Pascual et al.](https://escholarship.org/uc/item/0hd561bp)
* [Validation of a Dynamic Lettuce Growth Model for Greenhouse Climate Control - E.J. Van Henten](https://www.sciencedirect.com/science/article/pii/S0308521X94902801)
* [Plant factories; crop transpiration and energy balance - Graamans, van den Dobbelsteen, Meinenb,Stanghellini](https://www.sciencedirect.com/science/article/pii/S0308521X16306515)

The model proposed in each paper are implemented in the respective files:
* in `Naranjani_newton.edp`, the Navier-Stokes equantion are solved in a 3D cube cell (through the Newton method);
* in `Naranjani_energy.edp`, energy balance equation and species mass fraction equations are solved;
* in `VanHenten.edp`, the system of ODE is solved through the Crank Nicolson method;
* in `Graamans.edp`, the equations for the heat exchange are solved.

Moreover:
* `main.edp` contains the code to run a 20-days simulation;
* `data.edp` contains all the physical constant needed;
* `commands.txt` contains all the commands needed for the generation of the gnuplot file.

## Remarks
To merge the results obtained by each paper and create a global model, we performed the following physical transformation:

