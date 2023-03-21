#reading the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_houshold_power_consumption.zip")
unzip("exdata_data_houshold_power_consumption.zip")
data <- read.table(file="household_power_consumption.txt", sep = ";", header = TRUE)
#formating the file
subdata <- subset(data, data$Date=="1/2/2007"| data$Date=="2/2/2007")
#plot 1
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()