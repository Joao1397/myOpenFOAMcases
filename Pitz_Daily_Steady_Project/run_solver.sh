#!/bin/bash

foamListTimes -rm
rm log.*
rm *.foam
rm -rf postProcessing

checkMesh > log.checkMesh 2>&1 &

decomposePar > log.decomposePar 2>&1 &

mpirun -np 8 foamRun -solver incompressibleFluid -parallel > log.incompressibleFluido 2>&1 &

reconstructPar -constant -noZero -noLagrangian -fields '(U p)' > log.reconstructPar 2>&1 &

rm -rf process*

touch Pitz_Daily_Steady.foam
