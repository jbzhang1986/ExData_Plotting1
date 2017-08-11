rm(list = ls())
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "/media/My Storage/Dropbox/Data Science JHU/Exploratory_Data_Analysis/Course_Project/power.zip")
setwd("/media/My Storage/Dropbox/Data Science JHU/Exploratory_Data_Analysis/Course_Project/")
unzip(power.zip)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_project <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data_project$DateTime <- strptime(paste(data_project$Date, data_project$Time), "%Y-%m-%d %H:%M:%S")

# plot 2
plot(data_project$DateTime, data_project$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()

