# read and filter data to only Feb 1 - 2, 2007, data source must be in working dir
filename <- "household_power_consumption.txt"
data<-read.table(filename, sep=";", header=TRUE, stringsAsFactors = FALSE)
data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime<-strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#create a png line plot
png("plot2.png", width=480, height=480)
par(bg=NA)
plot(data$DateTime, as.numeric(data$Global_active_power),
     type="l", xlab=NA, ylab="Global Active Power (kilowatts)")
dev.off()