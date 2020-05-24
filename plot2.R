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


#Plot2: Global_active_power v.s. (Date and Time)
par(mfrow=c(1,1))
plot(data_sub$Global_active_power ~ data_sub$Date_and_Time, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
