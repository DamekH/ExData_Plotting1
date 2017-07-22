# Load data and store as an element - assumes file is in working directory
all_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", dec = ".", nrows = 2075259)

# Subset data by date
subset_data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007") , ]

# Convert character vectors storing dates and times into POSIXct format
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Convert Global active power column to numeric vector
G_A_P <- as.numeric(subset_data$Global_active_power)

# Convert and store each sub-metering column as a numeric vector
SM_1 <- as.numeric(subset_data$Sub_metering_1)
SM_2 <- as.numeric(subset_data$Sub_metering_2)
SM_3 <- as.numeric(subset_data$Sub_metering_3)

# Open device and defines size of image
png("plot3.png", width = 480, height = 480)

# Construct and save line plot
plot(date_time, SM_1, type = "l", col = "black", xlab = " ", ylab = "Energy Submetering")
# add additional lines to plot
 lines(date_time, SM_2, type = "l", col = "red")
 lines(date_time, SM_3, type = "l", col = "blue")
# Create legend for the plot
 legend(border = "black", "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()