## Getting the dataset

hpc_raw <- read.csv("./GitHub/Exploratory-Data-Analysis//household_power_consumption.txt", header=T, sep=';', na.strings="?")
hpc_raw$Date <- as.Date(hpc_raw$Date, format="%d/%m/%Y")

## Create subset 01-02-2007 -- 02-02-2007

hpc_subset <- subset(hpc_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc_raw)

## Date conversion
datetime <- paste(as.Date(hpc_subset$Date), hpc_subset$Time)
hpc_subset$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(hpc_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to .png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
