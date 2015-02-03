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

# set wd to plots directory where we will save the plot
setwd("~/plots");

# start png device
png("plot1.png", width = 480, height = 480);

# plot
hist(data$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency");

# done!
dev.off();
