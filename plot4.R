# download dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

# load dataset
dataset <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007" ), ]

# format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})

# export file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
