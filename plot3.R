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

#prepare output file and make plot 3

png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
