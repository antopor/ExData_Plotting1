plot2 <- function()
{
    par(mfrow=c(1,1));
    # Read data from only 3 columns: Date, Time and Global_active_power
    data <- read.csv("household_power_consumption.txt", 
                     header=TRUE, sep=";", na.strings = "?", 
                     colClasses = c("character", "character", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL"),
                     stringsAsFactors=FALSE);
    # Filter
    data = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",];
    # Mix Date and Time
    data$Date <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S");
    data$Time = NULL
    
    # Plot graph
    plot(data, type="l", xlab="", ylab="Global Active Power (kilowatts)");
    
    # Save to file
    dev.copy(png, "plot2.png");
    dev.off()
}