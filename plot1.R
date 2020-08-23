#Assignment for Coursera EDA


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "hpc.zip")

unzip("hpc.zip")

dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dat$Date <- as.Date(dat$Date, "%d/%m/%y")
dat2 <- subset(dat, Date >= "2020-01-01" & Date <= "2020-02-02" )
# View(dat2)

png(filename="plot1.png", width=480, height=480)
hist(as.numeric(dat2$Global_active_power), col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
