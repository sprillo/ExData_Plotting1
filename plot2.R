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
png("plot2.png", width = 480, height = 480);

# plot
with(data,
        plot(Time,
             Global_active_power,
             type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)"
             )
     )

# done!
dev.off();
