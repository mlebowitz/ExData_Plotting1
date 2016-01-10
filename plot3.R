#make sure we are doing one graph per page
par(mfcol=c(1,1))

#read full dataset
alldata<-read.csv("household_power_consumption.txt", sep=";")

#select dates for exercise
pdata<-alldata[(alldata$Date=="2/2/2007")|(alldata$Date=="1/2/2007"),]

rtimes<-strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

plotcolors<-c("black", "red", "blue")
plotnames<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(rtimes, pdata$Sub_metering_1, 
     type="n", 
     ylab="Energy sub metering", 
     xlab="")

legend("topright",lty=1, col=plotcolors, legend = plotnames)

for (i in 1:3) lines(rtimes, pdata[[plotnames[i]]], col = plotcolors[i])

dev.copy(png, file="plot3.png")
dev.off()