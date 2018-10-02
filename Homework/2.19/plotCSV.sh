#!/bin/bash

#####
# processes the raw CSV file into a readable form before calling the julia
# program that generates the PNG from the data
#####

# save command line arguments
filename=$1
xAxis=$2
yAxis=$3

# chop off the file extension
filenameNoExt=${filename%.*}

# make a readable version of the CSV file
sed '1d; s/,$//g' $filename > $filenameNoExt.in

# call the julia program that will create the PNG
julia plotCSV.jl $filenameNoExt $xAxis $yAxis

# because Gadfly's 'draw(PNG())' can't deal with full paths
# move the created PNG from the current directory to where it's supposed to go
mv $(basename $filenameNoExt.png) $filenameNoExt.png
