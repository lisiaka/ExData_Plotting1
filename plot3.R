##loading and unzipping data
setwd("/Users/maria/Documents/Coursera-R/2018/git/ExpDA")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip",method="curl")
unzip("household_power_consumption.zip")

##reading file into R data frame: important to set separators and header=TRUE
household_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
household_data$Date<-as.Date(household_data$Date,"%d/%m/%Y")
household_data_filtered<-household_data[(household_data$Date=="2007-02-01")|(household_data$Date=="2007-02-02"),]
household_data_filtered$Sub_metering_1<-as.double(as.character(household_data_filtered$Sub_metering_1))
household_data_filtered$Sub_metering_2<-as.double(as.character(household_data_filtered$Sub_metering_2))
household_data_filtered$Sub_metering_3<-as.double(as.character(household_data_filtered$Sub_metering_3))

##converting Date and Time to datetime format
household_data_filtered$DateTime<-strptime(paste(as.character(household_data_filtered$Date,"%d/%m/%Y"),as.character(household_data_filtered$Time)),"%d/%m/%Y %H:%M:%S")

##building the plot
with(household_data_filtered, plot(x=DateTime,y=Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(x=household_data_filtered$DateTime,y=household_data_filtered$Sub_metering_2,col="red")
lines(x=household_data_filtered$DateTime,y=household_data_filtered$Sub_metering_3,col="blue")
##adding legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col =c("Black","Red","Blue"))

##saving to file
dev.copy(png, file = "plot3.png")
dev.off()