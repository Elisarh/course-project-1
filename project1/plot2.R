datosfich<-"./household_power_consumption.txt"
datos<-read.table(datosfich,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subsetdatos<-datos[datos$Date%in%c("1/2/2007","2/2/2007"),]

datetime<-strptime(paste(subsetdatos$Date,subsetdatos$Time,sep=""),
                   "%d/%m/%Y %H:%M:%S")
globalActPow<-as.numeric(subsetdatos$Global_active_power)
png("plot 2.png",width=480,height=480)
plot(datetime,globalActPow,type="l",xlab="",ylab="Global Acive Power(Kilowatts)")
dev.off()