getwd()
setwd("/Users/danielmonaco1/Desktop/Regression_R/Coursera")
data = read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
data$Date = as.Date(data$Date,format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

data_subset = subset(data$Global_active_power,data$Date == "2007-02-01"| data$Date == "2007-02-02")


png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(data_subset), col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()