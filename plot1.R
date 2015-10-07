plot1 <- function()
{
    par(mfrow=c(1,1));
    # Read data from only 2 columns: Date and Global_active_power
    data = read.csv("household_power_consumption.txt", 
                    header=TRUE, sep=";", na.strings = "?", 
                    colClasses = c("character", "NULL", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL"),
                    stringsAsFactors=FALSE);
    # Filter
    data = data$Global_active_power[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
    
    # plot graph
    hist(data, main="Global Active Power", 
         ylab = "Frequency", xlab="Global Active Power (kilowatts)", 
         col="red");
    
    # Save to file
    dev.copy(png, "plot1.png");
    dev.off()
}