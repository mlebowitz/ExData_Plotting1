#Plot 2

#make sure we are doing one graph per page
par(mfcol=c(1,1))

#read full dataset
alldata<-read.csv("household_power_consumption.txt", sep=";")

#select dates for exercise
pdata<-alldata[(alldata$Date=="2/2/2007")|(alldata$Date=="1/2/2007"),]

rtimes<-strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

plot(rtimes, pdata$Global_active_power, 
     type="n", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")
lines(rtimes, pdata$Global_active_power)

dev.copy(png, file="plot2.png")
dev.off()
