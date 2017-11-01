#!/bin/bash

# SHOULD BE DONE BY SCIUNIT
#echo "Downloading required packages..."
#apt-get update
#apt-get install -y --no-install-recommends make unzip wget gfortran 

cd ~/Desktop

# If it's already installed, don't install it again
if [ $(find ~/Desktop/MF2005.1_12u/make/ -name mf2005) ]
then
    echo "MODFLOW2005 already installed on ~/Desktop."
    echo "Skipping installation..."
else
    echo "Downloading MODFLOW2005.."
    wget https://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.12.00/MF2005.1_12u.zip
    unzip MF2005.1_12u.zip
    rm MF2005.1_12u.zip
    echo "Installation done!"
fi

# Compiling MODFLOW2005
cd MF2005.1_12u/make
echo "Compiling MODFLOW2005..."
make -f makefile

# Getting the directory name from the path to the .nam file
MODFLOWdir="$(echo $1 | sed 's/\/[^\/]*\.nam//')"

# Switching to the directory where the files are
cd ${MODFLOWdir}

echo "Running MODFLOW2005 using the files in `pwd`"

# Using the directory, get the .nam file and run it with that
~/Desktop/MF2005.1_12u/make/mf2005 $1
