#script for the first assignment of coursera Exploratory Data Analysis course
#run with:source("plot1.R")

#subsetting and formatting the data
elecPwr<-read.csv2("household_power_consumption.txt")
elecPwrRng<-elecPwr[which(elecPwr$Date=="1/2/2007"|elecPwr$Date=="2/2/2007"),]
elecPwrRng[1:9]<-lapply(elecPwrRng[1:9],as.character)
elecPwrRng[3:9]<-lapply(elecPwrRng[3:9],as.numeric)

#plot function
plot1<- function () {
    hist(elecPwrRng$Global_active_power,xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
}

#show plot in screen
plot1()

#write to file
png("plot1.png")
plot1()
dev.off()
