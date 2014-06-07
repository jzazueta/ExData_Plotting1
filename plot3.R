## Plot 2

##   Unzip data source
dir <- getwd()
unzip("exdata-data-household_power_consumption.zip",exdir=dir)

##   Read File

power <- read.csv("household_power_consumption.txt",
                  sep = ";", header = TRUE, stringsAsFactors = FALSE)

##   Convert dates, time and numbers
datetime <- paste(power$Date,power$Time) 
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
power$datetime <- datetime
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Global_active_power <- as.numeric(power$Global_active_power)

##      Subsetting data to "2007-02-02" or "2007-02-01"
power <- power[power$Date=="2007-02-02"| power$Date== "2007-02-01",]

##   Create Plot file    
png(file="plot3.png", bg="white")
        plot(power$datetime,power$Sub_metering_1, type = "lines",
     ylab= "Energy sub metering", xlab="")
        lines(power$datetime,power$Sub_metering_2, col = "red")
        lines(power$datetime,power$Sub_metering_3, col = "blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2",
                                      "Sub_metering_3"),lty = c(1,1,1), 
               col = c("black","red","blue"))

dev.off()
