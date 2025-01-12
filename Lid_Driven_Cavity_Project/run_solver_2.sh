#!/bin/bash

foamListTimes -rm
rm log.*
rm *.foam
rm -rf postProcessing

checkMesh | tee log.checkMesh

// icoFoam | // tee log.icoFoam

decomposePar | tee log.decomposePar

mpirun -np 8 icoFoam -parallel | tee log.icoFoam
reconstructPar -constant -noZero -noLagrangian -fields '(U p)' | tee log.reconstructPar
rm -rf process*
touch cavity2d.foam