# set working directory
setwd("D:/UM/DS/")

# load library data.table
library(data.table)

# get full dataset
DT<-fread("./household_power_consumption 2.txt",na.strings = "?")

# set data as d:m:y
DT$Date<-as.Date(DT$Date,"%d/%m/%Y")

# subsetting the data
DT.filter<-subset(DT,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
#remove multiple object
rm(DT)

# converting dates
datetime<-paste(as.Date(DT.filter$Date),DT.filter$Time)
DT.filter$Datetime<-as.POSIXct(datetime)

#plot the graph with legends
with(DT.filter,{
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Energy sub metering",xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  })
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.75)

#output histogram to PNG
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
