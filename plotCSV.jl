# part of 'plotCSV.sh'
# plot the provided, processed data
# NOTE: provided filename MUST be extension-less

#using Pkg

#Pkg.add("CSV")
#Pkg.add("DataFrames")
#Pkg.add("StatPlots")

using CSV
using DataFrames
using StatPlots

# capture filename from command line
dataFileNoExt = ARGS[1]

# capture CSV from command line
rawCSV = ARGS[2]

# create a DataFrame from the processed CSV file
data = CSV.read(IOBuffer(rawCSV))

# get the header names from the DataFrame
xAxis= string(names(data)[1])
yAxis= string(names(data)[2])

# generate plot from dataFrame 
@df data scatter(cols(1),
                 cols(2),
                 xlabel = xAxis,
                 ylabel = yAxis,
                 legend = false,
                 smooth = true)

# save the generated plot in the same directory as the original data file
savefig(dataFileNoExt * ".png")
