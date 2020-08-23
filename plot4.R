#Assignment for Coursera EDA


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "hpc.zip")

unzip("hpc.zip")

dat <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dat1 <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
dat1$Date <- as.Date(dat1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dat1$Date), dat1$Time)
dat1$Datetime <- as.POSIXct(datetime)


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

with(dat1, {
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
})

with(dat1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
})
lines(dat1$Datetime, dat1$Sub_metering_2, type="l", col="red")
lines(dat1$Datetime, dat1$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, bty="n",col=c("black","red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6, xpd-TRUE)

with(dat1, {
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_reactive_power", xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
