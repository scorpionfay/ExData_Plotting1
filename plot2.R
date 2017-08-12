library(lubridate)
library(dplyr)

# Read data
p1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter data
p1data <- p1[p1$Date %in% c("1/2/2007","2/2/2007") ,]

# Transform column Global_active_power from character to numeric, add column datetime
p1data <- transform(p1data,Global_active_power=as.numeric(Global_active_power))
p1data <- mutate(p1data, datetime=dmy_hms(paste(p1data$Date, " ", p1data$Time)))

# Export plot
png("plot2.png", width=480, height=480)
plot(p1data$datetime,p1data$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()