# Exploratory Data Analysis Week 1
# Plot 3
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
plot_data$Date <- as.Date(plot_data$Date, format = '%d/%m/%Y')
plot_data$plot3time <- as.POSIXct(paste(plot_data$Date, plot_data$Time))


# Plot3 Creation
if(!file.exists('plots')) dir.create('plots')
png(filename = './plots/plot3.png', width = 480, height = 480, units = 'px')
plot(plot_data$plot3time, as.numeric(as.character(plot_data$Sub_metering_1)), 
     type = 'l', xlab ='', ylab='Energy sub metering')
lines(plot_data$plot3time, as.numeric(as.character(plot_data$Sub_metering_2)), 
      type = 'l', col = 'red')
lines(plot_data$plot3time, as.numeric(as.character(plot_data$Sub_metering_3)), 
      type = 'l', col = 'blue')
legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



