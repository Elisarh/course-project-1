datosfich<-"./household_power_consumption.txt"
datos<-read.table(datosfich,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subsetdatos<-datos[datos$Date%in%c("1/2/2007","2/2/2007"),]

datetime<-strptime(paste(subsetdatos$Date,subsetdatos$Time,sep=""),
                   "%d/%m/%Y %H:%M:%S")
globalactivepower<-as.numeric(subsetdatos$Global_active_power)
subMetering1<-as.numeric(subsetdatos$Sub_metering_1)
subMetering2<-as.numeric(subsetdatos$Sub_metering_2)
subMetering3<-as.numeric(subsetdatos$Sub_metering_3)

png("plot3.png", width=480, height=480)

with(subsetdatos,plot(datetime,subMetering1,type="l",
                     xlab="",ylab="Energy Sub metering"))
with(subsetdatos,lines(datetime,subMetering2,type="l",col="Red"))
with(subsetdatos,lines(datetime,subMetering3,type="l",col="Blue"))


legend("topright",col=c("black","red","blue"),lty=1,lwd=2.5,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()