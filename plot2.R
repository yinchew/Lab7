# set working directory
setwd("D:/UM/DS/")

# load library data.table
library(data.table)

# get full dataset
DT<-fread("./household_power_consumption 2.txt",na.strings = "?")

# set data as d:m:y
DT$Date<-as.Date(DT$Date,"%d/%m/%Y")

# subsetting the data
DT.filter<-subset(DT,subset=(Date>="2007-02-01"&Date<="2017-02-02"))
#remove multiple object
rm(DT)

# converting dates
datetime<-paste(as.Date(DT.filter$Date),DT.filter$Time)
DT.filter$Datetime<-as.POSIXct(datetime)

# output histogram to PNG
plot(DT.filter$Global_active_power~DT.filter$Datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
