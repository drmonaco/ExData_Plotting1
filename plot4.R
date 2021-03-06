getwd()
setwd("/Users/danielmonaco1/Desktop/Regression_R/Coursera")
data = read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

data_subset = subset(data,data$Date == "1/2/2007"| data$Date == "2/2/2007")

FullTimeDate <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data_subset$Sub_metering_1 = as.double(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 = as.double(data_subset$Sub_metering_2)
data_subset$Sub_metering_3 = as.double(data_subset$Sub_metering_3)

png(filename = "plot4.png",width = 480, height = 480)

par(mfrow = c(2,2))

plot(FullTimeDate,data_subset$Global_active_power,type = "l",ylab="Global Active Power",xlab= "")
plot(FullTimeDate,data_subset$Voltage,type = "l",ylab="Voltage",xlab= "datetime")
plot(FullTimeDate,data_subset$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(FullTimeDate,data_subset$Sub_metering_2,col = "red")
lines(FullTimeDate,data_subset$Sub_metering_3,col = "blue")
legend("topright",lwd=1,col = c("black","red","blue"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(FullTimeDate,data_subset$Global_reactive_power,type = "l",ylab="Voltage",xlab= "Global_reactive_power")


dev.off()
