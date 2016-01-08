# Plot 2
# Read the data - assume file is unzipped to current directory

library(data.table)

#Pre-filter using date strings as encoded 
powerComp <- fread("household_power_consumption.txt", header = T, na.strings ="?", stringsAsFactors= F )[Date %in% c("1/2/2007", "2/2/2007")  ,]

# Add a combined Date time field
powerComp$datetime <- as.data.frame(strptime(paste(powerComp$Date, powerComp$Time),"%d/%m/%Y %H:%M:%S"))

#Second Graph
png("plot2.png", width = 480, height= 480)
par( mar = c(2.1,4.1,4.1,2.1))
with(powerComp,plot(datetime,Global_active_power, type="l", ylab = "Global Active Power (killowatts)"))
dev.off()