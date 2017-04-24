# Exploratory Data Analysis Week 1
# Plot 1
# Load data
setwd("/Users/dishaan/Documents/Coursera/DataScience/Course4/Week1")
original <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
head(original)

# Using data from the dates 2007-02-01 and 2007-02-02
data_2_1 <- original[which(original$Date == "1/2/2007"),]
data_2_2 <- original[which(original$Date == "2/2/2007"),]
plot_data <- rbind(data_2_1, data_2_2)

# Replace ? by NA and then remove the NAs
replace(plot_data, plot_data == "?", NA)
plot_data <- plot_data[complete.cases(plot_data),]
head(plot_data)

# Global Active Power Histgram
if(!file.exists('plots')) dir.create('plots')
png(filename = './plots/plot1.png', width = 480, height = 480, units = 'px')
hist(as.numeric(as.character(plot_data$Global_active_power)), col = "red",
     main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()


