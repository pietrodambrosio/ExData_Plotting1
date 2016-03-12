# Exploratory Data Analysis - week 1 project
# plot2.R

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


# make the plot2
png("plot2.png", width=480, height=480)
plot(dtm, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
