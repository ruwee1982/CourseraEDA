#Assignment for Coursera EDA


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "hpc.zip")

unzip("hpc.zip")

dat <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dat1 <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
dat1$Date <- as.Date(dat1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dat1$Date), dat1$Time)
dat1$Datetime <- as.POSIXct(datetime)

png(filename="plot2.png", width=480, height=480)
## Plot 2
with(dat1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()