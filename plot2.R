getwd()
setwd("/Users/danielmonaco1/Desktop/Regression_R/Coursera")
data = read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

#data$Date = as.Date(data$Date,format="%d/%m/%Y")
#data$Time <- format(data$Time, format="%H:%M:%S")

data_subset = subset(data,data$Date == "1/2/2007"| data$Date == "2/2/2007")

FullTimeDate <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png(filename = "plot2.png",width = 480, height = 480)
plot(FullTimeDate,data_subset$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab= "")
dev.off()