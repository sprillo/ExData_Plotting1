# set wd to directory containing household_power_consumption.txt
setwd("~/data");

# read household_power_consumption.txt to variable data
data <- read.table("household_power_consumption.txt",
                   nrows=2075259,
                   header=T,
                   quote="",
                   sep=";",
                   na.strings = "?");

# subset data to days 1/2/2007 and 2/2/2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",];

# replace data$Time values by POSIXlt values resulting from combining data$Date
# and data$Time
dateAndTime <- paste(data$Date,data$Time)
dateAndTime <- strptime(dateAndTime,"%d/%m/%Y %T") 
data$Time <-dateAndTime

# set wd to plots directory where we will save the plot
setwd("~/plots");

# start png device
png("plot4.png", width = 480, height = 480);

par(mfrow = c(2,2))

###################### First Plot #####################

plot(data$Time,
     data$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l")

###################### Second Plot ####################

plot(data$Time,
     data$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

###################### Third Plot #####################

# draw plot frame ONLY
plot(data$Time,
     data$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "n")

# add points to plot separately
points(data$Time,data$Sub_metering_1,type = "l",col = "black")
points(data$Time,data$Sub_metering_2,type = "l",col = "red")
points(data$Time,data$Sub_metering_3,type = "l",col = "blue")

# add legend
legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd = 1,
       box.lwd = 0,
       box.col = "transparent",
       bg = "transparent")

###################### Fourth Plot ####################

plot(data$Time,
     data$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

########################## Done! ######################

# done!
dev.off();
