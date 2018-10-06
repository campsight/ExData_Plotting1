# plot 2

# read data
fulldataset <- read.csv("household_power_consumption.txt", sep=";", colClasses=c("character", "character", rep("numeric",7)), na.strings=c("?"))
fulldataset$Date <- as.Date(fulldataset$Date, format="%d/%m/%Y")
selectedPowerData <- subset(fulldataset, Date == as.Date("01022007", format="%d%m%Y") | Date == as.Date("02022007", format="%d%m%Y"))
selectedPowerData$DateTime <- strptime(paste(selectedPowerData$Date, selectedPowerData$Time), format="%Y-%m-%d %H:%M:%S")

# draw plot
par(bg=NA)
plot(selectedPowerData$DateTime, selectedPowerData$Global_active_power, xlab=" ", ylab="Global Active Power (kilowatts)", type="l")

# write to png
if (!file.exists("./figure")){dir.create("./figure")}
dev.copy(png, file="./figure/plot2.png")
dev.off()