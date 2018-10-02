# part of 'plotCSV.sh'
# given an extensionless path, will read the processes file and produce its PNG

using DataFrames
using Gadfly

# capture filename from command line
filename = ARGS[1]

# capture x and y axis names from command line
dataHeader = map(chomp, split(readline(open(filename)), ','))
xAxis = dataHeader[1]
xErrMin = dataHeader[2]
xErrMax = dataHeader[3]
yAxis = dataHeader[4]
yErrMin = dataHeader[5]
yErrMax = dataHeader[6] 

# create a DataFrame from the processed CSV file
data = readtable(filename * ".in")

# generate a plot of the data
dataPlot = plot(data, 
                x=xAxis, xmin=xErrMin, xmax=xErrMax, 
                y=yAxis, ymin=yErrMin, ymax=yErrMax,
                Geom.point, Geom.errorbar);

# get the base of the filename (chopping off the full path and the newline)
filenameBase = chomp(readstring(`basename $filename`))

# saving the png in the current directory because it can't handle full paths
draw(PNG(filenameBase * ".png", 5inch, 3inch), dataPlot)
