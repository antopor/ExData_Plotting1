plot3 <- function()
{
    par(mfrow=c(1,1));
    # Read data from only 5 columns: Date, Time, Sub_metering_1 , Sub_metering_2, Sub_metering_3
    data <- read.csv("household_power_consumption.txt", 
                     header=TRUE, sep=";", na.strings = "?", 
                     colClasses = c("character", "character", "NULL", "NULL", "NULL", "NULL", "numeric", "numeric", "numeric"),
                     stringsAsFactors=FALSE);
    
    # Filter
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",];
    # Mix Date and Time
    data$Date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S");
    data$Time <- NULL
    
    dev.new();
    # Plot graph
    plot(data$Date, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering");
    lines(data$Date, data$Sub_metering_2, type="l", col="red");
    lines(data$Date, data$Sub_metering_3, type="l", col="blue");
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col=c("black", "red", "blue"), lwd=c(2.5,2.5,2.5), 
           #inset=c(0.008, 0), 
           cex=0.8);
    
    # Save to file
    dev.copy(png, "plot3.png");
    dev.off();
}