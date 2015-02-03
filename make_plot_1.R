library(data.table);
setwd("~/data");
data <- read.table("household_power_consumption.txt",
                   nrows=2075259,
                   header=T,
                   quote="",
                   sep=";",
                   na.strings = "?");
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",];
setwd("~/plots");
png("plot1.png", width = 480, height = 480);
hist(data$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency");
dev.off();
