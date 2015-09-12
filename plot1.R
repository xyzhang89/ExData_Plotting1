#date file electric power consumption
file = "household_power_consumption.txt"
#reading select rows by package "sqldf"
library(sqldf)
#the data in the file is separated by ";" instead of space, need to add seq=";"
epc <- read.csv.sql(file, sql = 'select * from file where Date == "1/2/2007" or Date == "2/2/2007"',
                    header=TRUE,sep=";")
png(file = "plot1.png",width = 480, height = 480, units = "px") 
hist(epc$Global_active_power, col = "red",main="GLobal Active Power", 
     xlab = "GLobal Active Power (kilowatts)", ylab="Frequency")
dev.off()