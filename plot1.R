# Read data
p1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Filter data
p1data <- p1[p1$Date %in% c("1/2/2007","2/2/2007") ,]

# Transform column Global_active_power from character to numeric
p1data <- transform(p1data,Global_active_power=as.numeric(Global_active_power))

# Export plot
png("plot1.png", width=480, height=480)
hist(p1data$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()