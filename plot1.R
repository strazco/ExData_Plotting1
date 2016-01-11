plot1 <- function() {
  
  # rule of thumb memory required = no. of columns * no. of rows * 8 bytes/numeric
  # Household Power Consumption has 2,075,259 Rows and 9 cols
  # = 149,418,648 
  
  just5 <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows = 5)
  classes <- sapply(just5, class) ## for speed
  mydata <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes, na.strings= "?")
  
  ## convert to a decent date
  mydata$Date <- as.Date(mydata$Date , "%d/%m/%Y")
  
  ## subset the date range
  plotdata <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

  ## set up plot parameters and save .png
  par(mfrow=c(1,1))
  png(file="plot1.png",width=480,height=480)
  hist(plotdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  dev.off() ## don't forget to turn off!


}