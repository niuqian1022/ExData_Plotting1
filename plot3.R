data<-read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", 
                 col.names = var.names, stringsAsFactor = FALSE)
#transform Date and Time into Date/Time classes
data$Date<-as.Date(data$Date, "%d/%m/%Y")
time<-paste(data$Date, data$Time)
data$Time<-strptime(time, "%Y-%m-%d %H:%M:%S")
#plot3
with(data, plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Time, Sub_metering_1))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), xjust = 1)
dev.copy(png, "plot3.png")
dev.off()