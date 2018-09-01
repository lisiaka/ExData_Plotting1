##loading and unzipping data
setwd("/Users/maria/Documents/Coursera-R/2018/git/ExpDA")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip",method="curl")
unzip("household_power_consumption.zip")

##reading file into R data frame: important to set separators and header=TRUE
household_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
household_data$Date<-as.Date(household_data$Date,"%d/%m/%Y")
household_data_filtered<-household_data[(household_data$Date=="2007-02-01")|(household_data$Date=="2007-02-02"),]
household_data_filtered$Global_active_power<-as.double(as.character(household_data_filtered$Global_active_power))

##building first plot - histogram with red bars and title and x-axis label
hist(household_data_filtered$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power")

##saving to file
dev.copy(png, file = "plot1.png")
dev.off()

