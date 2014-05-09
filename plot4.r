Sys.setlocale("LC_TIME", "English") #set date format to english
coolnames=colnames(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows=1))
FirstRows=66638 #number of rows to skip for dates not relevant
LastRow=69517 #number of last row to read


colclassesN=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") #types fo columns to read
filo=read.csv("household_power_consumption.txt",sep = ";", nrows=(LastRow-FirstRows),na.strings = "?",skip=FirstRows,colClasses=colclassesN,col.names=coolnames)
DateTime=strptime(paste(filo[,1],filo[,2]), "%d/%m/%Y %H:%M:%S") #combining the date and time columns and converting to type date, note that since year is in four digint it is in Y
filo=filo[,3:ncol(filo)] #removing the original date and time columns 
filo=cbind(DateTime,filo) #adding the converted and combined columns


#part 4
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow=c(2,2), mar=c(6,6,2,1))

plot(filo[,1],filo[,2],ylab="Global Active Power (killowatts)",xlab="",type="n",cex.lab=0.7,cex.axis=0.8) #type="n" -> Do not plot anything,cex.lab decreases lable font size
lines(filo[,1],filo[,2])#add line

plot(filo[,1],filo[,4],ylab="Voltage",xlab="datetime",type="n",cex.lab=0.8,cex.axis=0.8) #type="n" -> Do not plot anything
lines(filo[,1],filo[,4])#add line

plot(filo[,1],filo[,6],ylab="Energy Sub Metering",xlab="",type="n",cex.lab=0.7,cex.axis=0.8)
lines(filo[,1],filo[,6],col="black")#add line
lines(filo[,1],filo[,7],col="red")
lines(filo[,1],filo[,8],col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7) #lty adds a line to the legend instead of a point

plot(filo[,1],filo[,3],ylab="Global_reactive_power",xlab="datetime",type="n",cex.lab=0.8,cex.axis=0.8) #type="n" -> Do not plot anything
lines(filo[,1],filo[,3])#add line

dev.off()
