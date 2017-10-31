#!/bin/bash

echo "Downloading required packages..."
apt-get update
apt-get install -y --no-install-recommends make unzip wget gfortran 

cd ~/Desktop

echo "Downloading MODFLOW2005.."
wget https://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.12.00/MF2005.1_12u.zip
unzip MF2005.1_12u.zip
rm MF2005.1_12u.zip

cd MF2005.1_12u/make

echo "Compiling MODFLOW2005..."
make -f makefile 
#sudo ln -s ~/MF2005.1_12u/make/mf2005 /usr/local/bin/mf2005

echo "Installation done!"
