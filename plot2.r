Sys.setlocale("LC_TIME", "English") #set date format to english
coolnames=colnames(read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows=1))
FirstRows=66638 #number of rows to skip for dates not relevant
LastRow=69517 #number of last row to read


colclassesN=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") #types fo columns to read
filo=read.csv("household_power_consumption.txt",sep = ";", nrows=(LastRow-FirstRows),na.strings = "?",skip=FirstRows,colClasses=colclassesN,col.names=coolnames)
DateTime=strptime(paste(filo[,1],filo[,2]), "%d/%m/%Y %H:%M:%S") #combining the date and time columns and converting to type date, note that since year is in four digint it is in Y
filo=filo[,3:ncol(filo)] #removing the original date and time columns 
filo=cbind(DateTime,filo) #adding the converted and combined columns


#part 2
png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white", res = NA, family = "", restoreConsole = TRUE)

plot(filo[,1],filo[,2],ylab="Global Active Power (killowatts)",xlab="",type="n",cex.lab=0.7,cex.axis=0.8) #type="n" -> Do not plot anything,cex.lab decreases lable font size
lines(filo[,1],filo[,2])#add line

dev.off()
