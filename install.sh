#!/bin/bash

# Installs MODFLOW2005
# Should be done only once to install MODFLOW2005 in the SciUnit. MODFLOW2005 is run using modflow.sh

echo "Downloading MODFLOW2005.."
wget --no-check-certificate https://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.12.00/MF2005.1_12u.zip
unzip MF2005.1_12u.zip
rm MF2005.1_12u.zip
echo "Installation done!"

# Compiling MODFLOW2005
cd MF2005.1_12u/make
echo "Compiling MODFLOW2005..."
make -f makefile
