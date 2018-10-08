#!/bin/bash

# processes and plots data

# julia versioning (may be edited for use on your machine) (inelegant solution)
julia='/Applications/Julia-1.0.app/Contents/Resources/julia/bin/julia'

# save command line arguments
dataFile="$1"
procFile="$2"

# chop off the file extension
dataFileNoExt=${dataFile%.*}

# behead the data file, then run the data through the desired process
procDataNoHead=$(tail -n +2 "$dataFile" | "$procFile")

# slap the header back on top
headersCSV=$(head -n 1 "$dataFile" | sed s/\ /,/g)
procData="$headersCSV\n$procDataNoHead"

# create the PNG
$julia plotCSV.jl "$dataFileNoExt" "$procData"
