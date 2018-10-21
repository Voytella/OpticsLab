#!/bin/bash

# convert a data file (.dat) into a tabular file (.tab)

dataFile=$1

# format the file and remove quotes added by Haskell program
./tabularize < $dataFile | sed s/\"//g
