#calcuate which and how many lines to read in to get data from 01/02/07 to 02/02/07
start<-strptime("16/12/06 17:24:00", "%d/%m/%y %H:%M:%S")
stop1<-strptime("01/02/07 00:00:00", "%d/%m/%y %H:%M:%S")
stop2<-strptime("02/02/07 23:59:00", "%d/%m/%y %H:%M:%S")
difftime(stop1, start, units = "mins") # +1 to get the number of lines to skip when read data: 66637
difftime(stop2, stop1, units = "mins") # +1 to get the number of lines to read: 2880
#read data starting from row "01/02/07 00:00:00" to "02/02/07 23:59:00"
var.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
              "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data<-read.table("household_power_consumption.txt", skip = 66637, nrows = 2880, sep = ";", 
                 col.names = var.names, stringsAsFactor = FALSE)
#transform Date and Time into Date/Time classes
data$Date<-as.Date(data$Date, "%d/%m/%Y")
time<-paste(data$Date, data$Time)
data$Time<-strptime(time, "%Y-%m-%d %H:%M:%S")

#plot 1
with(data, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
                main = "Global Active Power"))
dev.copy(png, "plot1.png")
dev.off()
