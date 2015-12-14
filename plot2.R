#script for the first assignment of coursera Exploratory Data Analysis course
#run with:source("plot2.R")

#subsetting and formatting the data
elecPwr<-read.csv2("household_power_consumption.txt")
elecPwrRng<-elecPwr[which(elecPwr$Date=="1/2/2007"|elecPwr$Date=="2/2/2007"),]
elecPwrRng[1:9]<-lapply(elecPwrRng[1:9],as.character)
elecPwrRng[3:9]<-lapply(elecPwrRng[3:9],as.numeric)
#add date time column
elecPwrRng$DateTime <- paste(elecPwrRng$Date,elecPwrRng$Time)
elecPwrRng$DateTime <- strptime(elecPwrRng$DateTime,format = "%d/%m/%Y %H:%M:%S")

#plot function
plot2<- function () {
    plot(elecPwrRng$DateTime,elecPwrRng$Global_active_power,type = "l",xaxt="n",ylab = "Global Active Power (kilowatts)",xlab = "")
    tickpos <- seq(as.POSIXct("2007-02-01", tz="GMT"), as.POSIXct("2007-02-03", tz="GMT"),by="1 days")
    axis.POSIXct(1, at=tickpos, labels=c("Thu","Fri","Sat"))
}

#show plot in screen
plot2()

#write to file
png("plot2.png")
plot2()
dev.off()
