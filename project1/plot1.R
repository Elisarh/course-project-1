datosfich<-"./household_power_consumption.txt"
datos<-read.table(datosfich,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subsetdatos<-datos[datos$Date%in%c("1/2/2007","2/2/2007"),]


global<-as.numeric(subsetdatos$Global_active_power)

png("plot1.png",width=480,height=480)

hist(global,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()
    