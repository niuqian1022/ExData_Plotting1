data<-read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", 
                 col.names = var.names, stringsAsFactor = FALSE)
#transform Date and Time into Date/Time classes
data$Date<-as.Date(data$Date, "%d/%m/%Y")
time<-paste(data$Date, data$Time)
data$Time<-strptime(time, "%Y-%m-%d %H:%M:%S")

#plot 2
with(data, plot(Time, Global_active_power, type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png")
dev.off()