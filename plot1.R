# Plot 1

# Read the data - assume file is unzipped to current directory

library(data.table)

#Pre-filter using date strings as encoded 
powerComp <- fread("household_power_consumption.txt", header = T, na.strings ="?", stringsAsFactors= F )[Date %in% c("1/2/2007", "2/2/2007")  ,]

#Clean up the data


# Add a combined Date time field
powerComp$datetime <- as.data.frame(strptime(paste(powerComp$Date, powerComp$Time),"%d/%m/%Y %H:%M:%S"))

#Create png device
png("plot1.png", width = 480, height =480, units="px")
hist(powerComp$Global_active_power,xlab="Global Active Power (kilowats)" ,col="red", main = "Global Active Power")
dev.off()
