#Assignment for Coursera EDA


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "hpc.zip")

unzip("hpc.zip")

dat <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dat1 <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
dat1$Date <- as.Date(dat1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dat1$Date), dat1$Time)
dat1$Datetime <- as.POSIXct(datetime)

png(filename="plot3.png", width=480, height=480)
## Plot 3
with(dat1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
})
lines(dat1$Datetime, dat1$Sub_metering_2, type="l", col="red")
lines(dat1$Datetime, dat1$Sub_metering_3, type="l", col="blue")

legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()