file = "household_power_consumption.txt"
#reading select rows by read.table(only works for this database where seleted data is continuous)
DF.row1 <- read.table(file, header = TRUE,sep=";", nrow = 1)
nc <- ncol(DF.row1)
DF.Date <- read.table(file, header = TRUE,sep = ";", as.is = TRUE, 
                      colClasses = c(NA, rep("NULL", nc - 1)))
n12 <- which(DF.Date$Date == "1/2/2007")
n22 <- which(DF.Date$Date == "2/2/2007")
epc <- read.table(file, sep=";", col.names = names(DF.row1), nrows= length(n12)+length(n22),
                  skip = n12[1], as.is = TRUE)

library(lubridate)
epc$Date_Time <- dmy_hms(paste(epc$Date,epc$Time))
png(file = "plot2.png",width = 480, height = 480, units = "px") 
plot(epc$Date_Time,epc$Global_active_power,type="n",xlab="",ylab="GLobal Active Power (kilowatts)")
lines(epc$Date_Time,epc$Global_active_power)
dev.off()