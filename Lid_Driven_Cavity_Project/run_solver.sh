#!/bin/bash

foamCleanCase

ideasUnvToFoam Global_Mesh.unv | tee log.UnvToFoam
checkMesh | tee log.checkMesh

// pyFoamPlotRunner.py icoFoam | tee log.icoFoam
icoFoam | tee log.icoFoam
touch cavity2d.foam