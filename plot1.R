# Plot 1


makePlot1 <- function() {


        library(data.table)
        
        # Read the data - assume file is unzipped to current directory
        # Pre-filter using date strings as encoded 
        powerComp <- fread("household_power_consumption.txt", header = T, na.strings ="?", stringsAsFactors= F )[Date %in% c("1/2/2007", "2/2/2007")  ,]
        
        # Add a combined Date time field
        powerComp$datetime <- as.data.frame(strptime(paste(powerComp$Date, powerComp$Time),"%d/%m/%Y %H:%M:%S"))
        
        # Create png device
        png("plot1.png", width = 480, height =480, units="px")
        
        # Create Histogram
        hist(powerComp$Global_active_power,xlab="Global Active Power (kilowats)" ,col="red", main = "Global Active Power")
        
        # Close Device
        dev.off()
}
