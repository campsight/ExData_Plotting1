# plot 4
# read data
fulldataset <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", rep("numeric",7)), na.strings=c("?"))
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y")
selectedPowerData <- subset(fulldataset, Date == as.Date("01022007", format="%d%m%Y") | Date == as.Date("02022007", format="%d%m%Y"))
selectedPowerData$DateTime <- strptime(paste(selectedPowerData$Date, selectedPowerData$Time), format="%Y-%m-%d %H:%M:%S")

# draw plot
## prepare for 4 graphs
par(mfrow=c(2,2))
par(bg=NA)

## graph 1
plot(selectedPowerData$DateTime, selectedPowerData$Global_active_power, xlab=" ", ylab="Global Active Power", type="l")

## graph 2
plot(selectedPowerData$DateTime, selectedPowerData$Voltage, xlab="datetime", ylab="Voltage", type="l")

## graph 3
plot(selectedPowerData$DateTime, selectedPowerData$Sub_metering_1, xlab=" ", ylab="Energy sub metering", type="n")
lines(selectedPowerData$DateTime, selectedPowerData$Sub_metering_1)
lines(selectedPowerData$DateTime, selectedPowerData$Sub_metering_2, col="red")
lines(selectedPowerData$DateTime, selectedPowerData$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=names(selectedPowerData)[7:9], lty=1, box.lwd=0, cex=0.9)

## graph 4
plot(selectedPowerData$DateTime, selectedPowerData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

# write to png
if (!file.exists("./figure")){dir.create("./figure")}
dev.copy(png, file="./figure/plot4.png")
dev.off()
