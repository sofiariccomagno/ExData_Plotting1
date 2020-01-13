#load data and subset relevant interval

data <- read.table("./household_power_consumption.txt",
                   header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format variables

datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(subsetdata$Global_active_power)
sm1 <- as.numeric(subsetdata$Sub_metering_1)
sm2 <- as.numeric(subsetdata$Sub_metering_2)
sm3 <- as.numeric(subsetdata$Sub_metering_3)
grp<-as.numeric(subsetdata$Global_reactive_power)
volt<-as.numeric(subsetdata$Voltage)

#prepare output file and make plot 4 (4 plots in the same file)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#plot 1 of 4
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot 2 of 4
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

#plot 3 of 4
plot(datetime, sm1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#plot 4 of 4
plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
