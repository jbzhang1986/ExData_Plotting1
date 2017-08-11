rm(list = ls())
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "/media/My Storage/Dropbox/Data Science JHU/Exploratory_Data_Analysis/Course_Project/power.zip")
setwd("/media/My Storage/Dropbox/Data Science JHU/Exploratory_Data_Analysis/Course_Project/")
unzip(power.zip)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_project <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data_project$DateTime <- strptime(paste(data_project$Date, data_project$Time), "%Y-%m-%d %H:%M:%S")

# plot 3
plot(data_project$DateTime, data_project$Sub_metering_1, type = "l", ylab = "Energy Sub Meteing")
lines(data_project$DateTime, data_project$Sub_metering_2, col = "red")
lines(data_project$DateTime, data_project$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

