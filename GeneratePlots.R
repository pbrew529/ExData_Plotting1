# Generate Plots
# Sources all of the scripts and runs the functions that generate plots
# Assumes that the following files aree downloaded to the working directory
# DownloadFile.R, plot1.R, plot2.R, plot3.R, plot4.R

# Note that each plot funtion is designed to run independently, so the data is read again each time
generatePlots <- function(){
        
        # Source all files
        source("DownloadFile.R")
        source("plot1.R")
        source("plot2.R")
        source("plot3.R")
        source("plot4.R")
        
        # Downlaod the data
        DownloadPowerData()
        
        # Generate all of the plots
        # creates png files in the working directory
        makePlot1()
        makePlot2()
        makePlot3()
        makePlot4()
        
        
}