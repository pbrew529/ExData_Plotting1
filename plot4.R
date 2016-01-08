# Plot 4
# Read the data - assume file is unzipped to current directory

library(data.table)

#Pre-filter using date strings as encoded 
powerComp <- fread("household_power_consumption.txt", header = T, na.strings ="?", stringsAsFactors= F )[Date %in% c("1/2/2007", "2/2/2007")  ,]

# Add a combined Date time field
powerComp$datetime <- as.data.frame(strptime(paste(powerComp$Date, powerComp$Time),"%d/%m/%Y %H:%M:%S"))


#Fourth Graph
png("plot4.png", width = 480, height= 480)
par(mfrow=c(2,2),mar = c(5.1,4.1,4.1,2.1) )
with(powerComp,
     {
             plot(datetime,Global_active_power,type="l", ylab="Global Active Power", xlab="")
             plot(datetime,Voltage, type="l",ylab="Voltage")
             plot(datetime,Sub_metering_1, type="l", ylab = "Enery sub metering", xlab="") 
             lines(datetime,Sub_metering_2, col="red") 
             lines(datetime,Sub_metering_3, col="blue")
             legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red" ,"blue"), lty=1, bty="n")
             plot(datetime,Global_reactive_power, type="l")
     }
     
)
dev.off()