plot4 <- function()
{
    # Read data from only 8 columns: Date, Time, Global_active_power, Voltage, 
    # Global_reactive_power,  Sub_metering_1 , Sub_metering_2, Sub_metering_3
    data <- read.csv("household_power_consumption.txt", 
                     header=TRUE, sep=";", na.strings = "?", 
                     colClasses = c("character", "character", "numeric", "numeric", "numeric", "NULL", "numeric", "numeric", "numeric"),
                     stringsAsFactors=FALSE);
    
    # Filter
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",];
    data$Date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S");
    data$Time <- NULL
    
    par(mfrow=c(2,2));
    
    # Plot graphs
    # Date / Global Active Power
    plot(data$Date, data$Global_active_power, type="l", 
         xlab="", ylab="Global Active Power", 
         cex.lab=0.8, cex.axis=0.8);
    # Date / Voltage
    plot(data$Date, data$Voltage, type="l", 
         xlab="datetime", ylab="Voltage", 
         cex.lab=0.8, cex.axis=0.8);
    # Date / Energy Sub Metering
    plot(data$Date, data$Sub_metering_1, type="l", 
         xlab="", ylab="Energy sub metering", 
         cex.lab=0.8, cex.axis=0.8);
    lines(data$Date, data$Sub_metering_2, type="l", col="red");
    lines(data$Date, data$Sub_metering_3, type="l", col="blue");
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col=c("black", "red", "blue"), 
           lwd=c(2.5,2.5,2.5), cex=0.7, inset=c(0.02, 0), bty = "n");
    # Date / Global Reactive Power
    plot(data$Date, data$Global_reactive_power, type="l", 
         xlab="datetime", ylab="Global_reactive_power", 
         cex.lab=0.8, cex.axis=0.8);
    
    # Save to file
    dev.copy(png, "plot4.png");
    dev.off()
}