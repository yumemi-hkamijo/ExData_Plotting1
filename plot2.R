# download dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

# load dataset
dataset <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007" ), ]

# format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime,)

# plot 2
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
