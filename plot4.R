#script for the first assignment of coursera Exploratory Data Analysis course
#run with:source("plot4.R")

#subsetting and formatting the data
elecPwr<-read.csv2("household_power_consumption.txt")
elecPwrRng<-elecPwr[which(elecPwr$Date=="1/2/2007"|elecPwr$Date=="2/2/2007"),]
elecPwrRng[1:9]<-lapply(elecPwrRng[1:9],as.character)
elecPwrRng[3:9]<-lapply(elecPwrRng[3:9],as.numeric)
#add date time column
elecPwrRng$DateTime <- paste(elecPwrRng$Date,elecPwrRng$Time)
elecPwrRng$DateTime <- strptime(elecPwrRng$DateTime,format = "%d/%m/%Y %H:%M:%S")

#plot function
plot4<- function () {
    par(mar=c(4,4,4,4),mfcol=c(2,2))
    tickpos <- seq(as.POSIXct("2007-02-01", tz="GMT"), as.POSIXct("2007-02-03", tz="GMT"),by="1 days")
    plot(elecPwrRng$DateTime,elecPwrRng$Global_active_power,type = "l",xaxt="n",ylab = "Global Active Power (kilowatts)",xlab = "")
    axis.POSIXct(1, at=tickpos, labels=c("Thu","Fri","Sat"))
    plot(elecPwrRng$DateTime,elecPwrRng$Sub_metering_1,type = "l",xaxt="n",ylab = "Energy sub metering",xlab = "")
    lines(elecPwrRng$DateTime,elecPwrRng$Sub_metering_2,col = "red")
    lines(elecPwrRng$DateTime,elecPwrRng$Sub_metering_3,col = "blue")
    axis.POSIXct(1, at=tickpos, labels=c("Thu","Fri","Sat"))
    plot(elecPwrRng$DateTime,elecPwrRng$Voltage,type = "l",xaxt="n",ylab = "Voltage",xlab = "datetime")
    axis.POSIXct(1, at=tickpos, labels=c("Thu","Fri","Sat"))
    plot(elecPwrRng$DateTime,elecPwrRng$Global_reactive_power,type = "l",xaxt="n",ylab = "Global Reactive Power",xlab = "datetime")
    axis.POSIXct(1, at=tickpos, labels=c("Thu","Fri","Sat"))
}
#show plot in screen
plot4()
#write to file
png("plot4.png")
plot4()
dev.off()