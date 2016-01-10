par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#read full dataset
alldata<-read.csv("household_power_consumption.txt", sep=";")

#select dates for exercise
pdata<-alldata[(alldata$Date=="2/2/2007")|(alldata$Date=="1/2/2007"),]

rtimes<-strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

#plot upper left
plot(rtimes, pdata$Global_active_power, 
     type="n", 
     ylab="Global Active Power", 
     xlab="")
lines(rtimes, pdata$Global_active_power)


#plot lower left 
plotcolors<-c("black", "red", "blue")
plotnames<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(rtimes, pdata$Sub_metering_1, 
     type="n", 
     ylab="Energy sub metering", 
     xlab="")

legend("topright",lty=1, col=plotcolors, legend = plotnames, cex=.5)

for (i in 1:3) lines(rtimes, pdata[[plotnames[i]]], col = plotcolors[i])

#upper right
plot(rtimes, pdata$Voltage, 
     type="n", 
     ylab="Voltage", 
     xlab="datetime")
lines(rtimes, pdata$Voltage)

#lower right
plot(rtimes, pdata$Global_reactive_power, 
     type="n", 
     ylab="Global_Reactive_Power", 
     xlab="datetime")
lines(rtimes, pdata$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off()
