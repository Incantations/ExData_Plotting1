# COURSERA EXPLORATORY DATA ANALYSIS PROJECT 1 
# PLOT 1
# Script to produce the first plot for course project 1
# If you run the script with the required data it will save 4 files to the current working directory.

# Read in the data. Note that the data must be in the source location labeled household_power_consumption.txt
data<-read.csv("household_power_consumption.txt",sep =";",skip = 66636,nrows = 2880,na.strings="\\?")

# Add the variable names
titles<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","SM1","SM2","SM3")
names(data)<-titles

# Set up a new time and date variable
data$timeAndDate<-mapply(paste,as.character(data$Date),as.character(data$Time))
data$timeAndDate<-strptime(data$timeAndDate,"%d/%m/%Y %H:%M:%S")

#Plot1: Histogram of global active power
png(filename = "plot1.png",width = 480, height = 480)
plot1<-hist(data$Global_active_power ,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",ylim = c(0,1200), main = ("Global Active Power"))
dev.off()
