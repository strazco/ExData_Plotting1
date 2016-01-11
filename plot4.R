plot4 <- function() {
  
  # rule of thumb memory required = no. of columns * no. of rows * 8 bytes/numeric
  # Household Power Consumption has 2,075,259 Rows and 9 cols
  # = 149,418,648 
  
  #just5 <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows = 5)
  #classes <- sapply(just5, class) ## for speed
  mydata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes, na.strings= "?")
  
  
  mydata$Date <- as.Date(mydata$Date , "%d/%m/%Y")
  #mydata$Date<-strptime(mydata$Date, "%m/%d/%Y")
    ## subset the date range
  plotdata <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

  ## convert to a decent date/time
  # was really having troubles with this so dropped it
  # mydata$Time <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  #
  
  ## set up plot parameters and save .png
  png(file="plot4.png",width=480,height=480)
  
  par(mfrow=c(2,2))
  
  with(plotdata, plot(Time, Global_active_power, ylab="Global Active Power", xlab="Time"))
  
  
  with(plotdata, plot(Time, Voltage, ylab="Voltage", xlab="Time"))
  
    
  plot(plotdata$Sub_metering_1 ~ plotdata$Time, type="b", ylab="Energy sub metering", xlab="Time", lwd=1)  
  
  x <- nrow(plotdata)
  par(new=T)
  for(i in 1:x) {
    lines(plotdata$Time[i], plotdata$Sub_metering_2[i], type="b", col="red", lwd=1)
  }
  
  
  x <- nrow(plotdata)
  par(new=T)
  for(i in 1:x) {
    lines(plotdata$Time[i], plotdata$Sub_metering_3[i], type="b", col="blue", lwd=1)
  }
  
  legend("topright",c("1", "2", "3"), lty = c(1,1,1), col=c("black","red","blue"))
  
  
  with(plotdata, plot(Time, Global_reactive_power, ylab="Global_reactive_power", xlab="Time"))
  
  
  dev.off() ## don't forget to turn off!


}