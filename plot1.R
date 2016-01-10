#make sure we are doing one graph per page
par(mfcol=c(1,1))

#read full dataset
alldata<-read.csv("household_power_consumption.txt", sep=";")

#select dates for exercise
pdata<-alldata[(alldata$Date=="2/2/2007")|(alldata$Date=="1/2/2007"),]

hist(as.numeric(pdata$Global_active_power), col="red", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main ="Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()
