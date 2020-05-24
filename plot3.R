#load data
data <- read.csv("/Users/siying/Downloads/household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format='%H:%M:%S')
data$Time <- sub(".*\\s+", "",  data$Time) #Remove the date part
str(data)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

Date_and_Time <- paste(data_sub$Date, data_sub$Time)
data_sub$Date_and_Time <- as.POSIXct(Date_and_Time)


#Plot3: Energy sub metering v.s. (Date and Time)
par(mfrow=c(1,1))
plot(data_sub$Sub_metering_1 ~ data_sub$Date_and_Time, col = 'Black',ylab = "Energy sub metering", xlab = "", type = "l")
lines(data_sub$Sub_metering_2 ~ data_sub$Date_and_Time, col = 'Red')
lines(data_sub$Sub_metering_3 ~ data_sub$Date_and_Time, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd=c(1,1,1),cex=0.5)
