#Assignment for Coursera EDA


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "hpc.zip")

unzip("hpc.zip")

dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
dat1 <- subset(dat, Date %in% c("1/2/2007","2/2/2007"))
dat1$Date <- as.Date(dat1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dat1$Date), dat1$Time)
dat1$Datetime <- as.POSIXct(datetime)
View(dat1)

png(filename="plot1.png", width=480, height=480)
hist(as.numeric(dat1$Global_active_power), col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
