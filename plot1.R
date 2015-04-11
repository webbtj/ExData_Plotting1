# read and filter data to only Feb 1 - 2, 2007, data source must be in working dir
filename <- "household_power_consumption.txt"
data<-read.table(filename, sep=";", header=TRUE, stringsAsFactors = FALSE)
data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#create a png histograph
png("plot1.png", width=480, height=480)
par(bg=NA)
hist(as.numeric(data$Global_active_power), main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()