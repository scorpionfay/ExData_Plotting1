library(lubridate)
library(dplyr)

# Read data
p1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter data
p1data <- p1[p1$Date %in% c("1/2/2007","2/2/2007") ,]

# Transform column from character to numeric, add column datetime
p1data <- transform(p1data,
                    Global_active_power=as.numeric(Global_active_power),
                    Sub_metering_1=as.numeric(Sub_metering_1),
                    Sub_metering_2=as.numeric(Sub_metering_2),
                    Sub_metering_3=as.numeric(Sub_metering_3))
p1data <- mutate(p1data, datetime=dmy_hms(paste(p1data$Date, " ", p1data$Time)))

# Export plot
png("plot3.png", width=480, height=480)
plot(p1data$datetime,p1data$Sub_metering_1,xlab="", ylab="Energy sub metering",type="l", col="black")
lines(p1data$datetime,p1data$Sub_metering_2,col="red")
lines(p1data$datetime,p1data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=2)
dev.off()