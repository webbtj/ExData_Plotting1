# read and filter data to only Feb 1 - 2, 2007, data source must be in working dir
filename <- "household_power_consumption.txt"
data<-read.table(filename, sep=";", header=TRUE, stringsAsFactors = FALSE)
data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#create a png line plot
png("plot3.png", width=480, height=480)
par(bg=NA)
plot(data$DateTime, as.numeric(data$Sub_metering_1),
     type="l", xlab=NA, ylab="Energy sub metering", col="black")
lines(data$DateTime, as.numeric(data$Sub_metering_2), col="red")
lines(data$DateTime, as.numeric(data$Sub_metering_3), col="blue")
legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()