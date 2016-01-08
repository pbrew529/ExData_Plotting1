# Plot 3

# Read the data - assume file is unzipped to current directory

library(data.table)

#Pre-filter using date strings as encoded 
powerComp <- fread("household_power_consumption.txt", header = T, na.strings ="?", stringsAsFactors= F )[Date %in% c("1/2/2007", "2/2/2007")  ,]

# Add a combined Date time field
powerComp$datetime <- as.data.frame(strptime(paste(powerComp$Date, powerComp$Time),"%d/%m/%Y %H:%M:%S"))


# Third Graph
png("plot3.png", width = 480, height= 480)
par( mar = c(2.1,4.1,4.1,2.1))
with(powerComp,
     {  plot(datetime,Sub_metering_1, type="l", ylab = "Enery sub metering") 
             lines(datetime,Sub_metering_2, col="red") 
             lines(datetime,Sub_metering_3, col="blue")
             legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red" ,"blue"), lty=1)
     }
)
dev.off()