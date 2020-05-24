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


#Plot 1: frequency of Global_active_power
par(mfrow=c(1,1))
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
hist(data_sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

