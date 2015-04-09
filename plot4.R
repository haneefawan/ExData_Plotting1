## Getting the dataset
hpc_raw <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")
hpc_raw$Date <- as.Date(hpc_raw$Date, format="%d/%m/%Y")

## Creating subset 01-02-2007 -- 02-02-2007
hpc_subset <- subset(hpc_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc_raw)

## Converting date
datetime <- paste(as.Date(hpc_subset$Date), hpc_subset$Time)
hpc_subset$Datetime <- as.POSIXct(datetime)

## Creating Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpc_subset, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power",xlab="datetime")
})

## Saving to .png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
