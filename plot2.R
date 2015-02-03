library(data.table);
setwd("~/data");
data <- read.table("household_power_consumption.txt",
                   nrows=2075259,
                   header=T,
                   quote="",
                   sep=";",
                   na.strings = "?");
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",];
dateAndTime <- paste(data$Date,data$Time)
dateAndTime <- strptime(dateAndTime,"%d/%m/%Y %T") 
data$Time <-dateAndTime

setwd("~/plots");
png("plot2.png", width = 480, height = 480);

with(data,
        plot(Time,
             Global_active_power,
             type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)"
             )
     )

dev.off();
