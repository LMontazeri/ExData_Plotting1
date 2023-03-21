#reading the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_houshold_power_consumption.zip")
unzip("exdata_data_houshold_power_consumption.zip")
data <- read.table(file="household_power_consumption.txt", sep = ";", header = TRUE)
#formating the file
subdata <- subset(data, data$Date=="1/2/2007"| data$Date=="2/2/2007")
TimeDate <- strptime(paste(subdata$Date,subdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
subplusdata <- cbind(subdata, TimeDate)
subplusdata$Sub_metering_1<-as.numeric(subplusdata$Sub_metering_1)
subplusdata$Sub_metering_2<-as.numeric(subplusdata$Sub_metering_2)
subplusdata$Sub_metering_3<-as.numeric(subplusdata$Sub_metering_3)
#plot3 
png("plot3.png", width = 450, height= 450 )
with(subplusdata,plot(TimeDate, Sub_metering_1, col= "black", type="l", xlab="Day", ylab="Energy sub metering" ))
lines(subplusdata$TimeDate, subplusdata$Sub_metering_2, col = "red")
lines(subplusdata$TimeDate, subplusdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black","red","blue"))
dev.off()