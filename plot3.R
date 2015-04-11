# COURSERA EXPLORATORY DATA ANALYSIS PROJECT 1 
# PLOT 3
# Script to produce the third plot for course project 1
# If you run the script with the required data it will save 4 files to the current working directory.

# Read in the data. Note that the data must be in the source location labeled household_power_consumption.txt
data<-read.csv("household_power_consumption.txt",sep =";",skip = 66636,nrows = 2880,na.strings="\\?")

# Add the variable names
titles<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","SM1","SM2","SM3")
names(data)<-titles

# Set up a new time and date variable
data$timeAndDate<-mapply(paste,as.character(data$Date),as.character(data$Time))
data$timeAndDate<-strptime(data$timeAndDate,"%d/%m/%Y %H:%M:%S")

#Plot3: Energy submetering over time
png(filename = "plot3.png",width = 480, height = 480)
plot(data$timeAndDate,data$SM1, type = 'l',ylab = 'Energy sub metering', xlab = '')
lines(data$timeAndDate,data$SM2, col = "red")
lines(data$timeAndDate,data$SM3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)
dev.off()


