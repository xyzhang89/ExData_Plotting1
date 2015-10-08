#date file electric power consumption
file = "household_power_consumption.txt"
#reading select rows by package "sqldf"
library(sqldf)
#the data in the file is separated by ";" instead of space, need to add seq=";"
epc <- read.csv.sql(file, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"',
                    header=TRUE,sep=";")
library(lubridate)
epc$Date_Time <- dmy_hms(paste(epc$Date,epc$Time))
png(file = "plot4.png",width = 480, height = 480, units = "px")  
par(mfrow = c(2,2))
plot(epc$Date_Time,epc$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(epc$Date_Time,epc$Global_active_power)
plot(epc$Date_Time,epc$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(epc$Date_Time,epc$Voltage)
plot(epc$Date_Time,epc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(epc$Date_Time,epc$Sub_metering_1,col="black")
lines(epc$Date_Time,epc$Sub_metering_2,col="red")
lines(epc$Date_Time,epc$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),bty="n",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(epc$Date_Time,epc$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(epc$Date_Time,epc$Global_reactive_power)
dev.off()