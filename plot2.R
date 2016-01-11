plot2 <- function() {
  
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
  par(mfrow=c(1,1))
  png(file="plot2.png",width=480,height=480)
  plot(plotdata$Global_active_power ~ plotdata$Time, type="l", ylab="Global Active Power (kilowatts)", xlab="Time")  
  dev.off() ## don't forget to turn off!


}