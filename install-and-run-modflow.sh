#!/bin/bash

# SHOULD BE DONE BY SCIUNIT
#echo "Downloading required packages..."
#apt-get update
#apt-get install -y --no-install-recommends make unzip wget gfortran 

# Getting the MI resource
wget https://www.hydroshare.org/django_irods/download/bags/$1.zip

unzip $1.zip

cd $1/data/contents

# Running MODFLOW2005 on the .nam file in the MI resource

# Finding where the mf2005 executable is in the sciunit
# This could return a mf2005 executable in a different sciunit, however...
cd ../../..
modflowrun=`find . -path *cde-root/*/make/mf2005 -type f | head -1`
echo "modflowrun: $modflowrun"
$modflowrun `find -iregex .*".nam"`


