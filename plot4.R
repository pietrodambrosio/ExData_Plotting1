# Exploratory Data Analysis - week 1 project
# plot4.R

# -------- this section is common to every plotx.R programs -------- start 
# the data was previously downloaded in "data" directory and unzipped
# reading data
ds<-read.table("data/household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)

# subset data extracting only the two indicated dates
ds2<-ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007",]
# -------- this section is common to every plotx.R programs -------- end



# extract data for x-axis and y-axis
dtm <- strptime(paste(ds2$Date, ds2$Time, sep=" "), "%d/%m/%Y %H:%M:%S",tz = "America/Los_Angeles") 
gap <- as.numeric(ds2$Global_active_power)
sm1 <- as.numeric(ds2$Sub_metering_1)
sm2 <- as.numeric(ds2$Sub_metering_2)
sm3 <- as.numeric(ds2$Sub_metering_3)
grp <- as.numeric(ds2$Global_reactive_power)
vol <- as.numeric(ds2$Voltage)


# make the plot4
png("plot4.png", width=480, height=480)

# set mfrow to plot 2x2
par(mfrow = c(2, 2)) 

# plot(1,1)
plot(dtm, gap, type="l", xlab="", ylab="Global Active Power")

# plot(1,2)
plot(dtm, vol, type="l", xlab="datetime", ylab="Voltage")

# plot(2,1)
plot(dtm, sm1, type="l", xlab="", ylab="Energy Submetering")
lines(dtm, sm2, type="l", col="red")
lines(dtm, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="o")

# plot(2,2)
plot(dtm, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the device
dev.off()
