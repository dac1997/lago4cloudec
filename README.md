# Taken from  LAGO onedataSim : packed tools for [ARTI](https://github.com/lagoproject/arti)
## Description


Encouraged from the repository, we started from this package to perform our simulations

## Pre-requisites

2. Had [Docker](https://www.docker.com/) (or [Singularity](https://singularity.lbl.gov/) or [udocker](https://pypi.org/project/udocker/)) installed on your PC (or HPC/HTC facility) 




## Building the container

Example build

  docker build --no-cache --build-arg PASS_FOR_LAGO_CORSIKA=<password> -t lagoecuadorcloudsim https://github.com/dac1997/lago4cloud.git



Final Purpose is to run on Cloud based servers






