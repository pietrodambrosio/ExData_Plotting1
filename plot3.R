# Exploratory Data Analysis - week 1 project
# plot3.R

# -------- this section is common to every plotx.R programs -------- start 
# the data was previously downloaded in "data" directory and unzipped
# reading data
ds<-read.table("data/household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)

# subset data extracting only the two indicated dates
ds2<-ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007",]
# -------- this section is common to every plotx.R programs -------- end



# extract data for x-axis and y-axis
dtm <- strptime(paste(ds2$Date, ds2$Time, sep=" "), "%d/%m/%Y %H:%M:%S",tz = "America/Los_Angeles") 
sm1 <- as.numeric(ds2$Sub_metering_1)
sm2 <- as.numeric(ds2$Sub_metering_2)
sm3 <- as.numeric(ds2$Sub_metering_3)


# make the plot3
png("plot3.png", width=480, height=480)
plot(dtm, sm1, type="l", ylab="Energy Sub metering", xlab="")
lines(dtm, sm2, type="l", col="red")
lines(dtm, sm3, type="l", col="blue")
# lty  1 = continous line
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
