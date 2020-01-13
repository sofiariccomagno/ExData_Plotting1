#load data and subset relevant interval

data <- read.table("./household_power_consumption.txt",
                   header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#format variables

gap<-as.numeric(subsetdata$Global_active_power)

#prepare output file and make plot 1

png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()