# download dataset
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

# load dataset
dataset <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007" ), ]

# plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

# export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()