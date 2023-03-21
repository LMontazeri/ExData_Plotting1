#reading the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_houshold_power_consumption.zip")
unzip("exdata_data_houshold_power_consumption.zip")
data <- read.table(file="household_power_consumption.txt", sep = ";", header = TRUE)
#formating the file
subdata <- subset(data, data$Date=="1/2/2007"| data$Date=="2/2/2007")
TimeDate <- strptime(paste(subdata$Date,subdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
subplusdata <- cbind(subdata, TimeDate)
subplusdata$Global_active_power <- as.numeric(subplusdata$Global_active_power)
#plot2 
png("plot2.png", width= 450, height = 450)
with(subplusdata, plot(subplusdata$TimeDate, subplusdata$Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()