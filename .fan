#!/bin/bash

ARG=$1

if   [ $1 -eq 7 ]; then
 echo Setting fan to speed 7 
 echo level 7 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 6 ]; then
 echo Setting fan to speed 6
 echo level 6 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 5 ]; then
 echo Setting fan to speed 5
 echo level 5 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 4 ]; then
 echo Setting fan to speed 4
 echo level 4 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 3 ]; then
 echo Setting fan to speed 3
 echo level 3 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 2 ]; then
 echo Setting fan to speed 2
 echo level 2 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 1 ]; then
 echo Setting fan to speed 1
 echo level 1 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 -eq 0 ]; then
 echo Setting fan to speed 0
 echo level 0 | sudo tee /proc/acpi/ibm/fan 

elif [ $1 == auto ]; then
 echo Setting fan to  speed
 echo level auto | sudo tee /proc/acpi/ibm/fan 

else 
 echo No changes to fan
fi
