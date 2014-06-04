## Plot 1

##   Unzip data source
        dir <- getwd()
        unzip("exdata-data-household_power_consumption.zip",exdir=dir)

##   Read File

        power <- read.table("household_power_consumption.txt",
                            sep = ";", header = TRUE)
        
##   Convert dates, time and numbers
        power$Time <- strptime(power$Time,"%h:%m:%s")
        power$Date <- as.Date(power$Date,"%d/%m/%Y")
        power$Global_active_power <- as.numeric(power$Global_active_power)
        
##      Subsetting data to "2007-02-02" or "2007-02-01"
        power <- power[power$Date=="2007-02-02"| power$Date== "2007-02-01",]
##   Creat Plot file    
        png(file="plot1.png", bg="white")
        hist(power$Global_active_power/median(power$Global_active_power), 
             main = paste("Global Active Power"), 
             xlab = "Global Active Power (kilowatts)", 
             col = "orange red")
        dev.off()
        