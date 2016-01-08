# Download and Uzip the data set If not there
DownloadPowerData <- function(){
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filesavepath <- "household_power_consumption"

if(!file.exists("ExpData")){
        dir.create(("ExpData"))
}

# Download and extract
download.file(fileurl, filesavepath)
unzip(filesavepath, exdir = "ExpData")
}


