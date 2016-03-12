# Exploratory Data Analysis - week 1 project
# plot1.R

# -------- this section is common to every plotx.R programs -------- start 
# the data was previously downloaded in "data" directory and unzipped
# reading data
ds<-read.table("data/household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)

# subset data extracting only the two indicated dates
ds2<-ds[ds$Date == "1/2/2007" | ds$Date == "2/2/2007",]
# -------- this section is common to every plotx.R programs -------- end 



# make the plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(ds2$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()