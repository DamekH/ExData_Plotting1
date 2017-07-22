# Load data and store as an element - assumes file is in working directory
all_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", dec = ".", nrows = 2075259)

# Subset data by date
subset_data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007") , ]

# Convert character vectors storing dates and times into POSIXct format
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Convert Global active and reactive power columns to numeric vector
G_A_P <- as.numeric(subset_data$Global_active_power)
G_R_P <- as.numeric(subset_data$Global_reactive_power)

# Convert and store voltage as numeric vector
Volt <- G_R_P <- as.numeric(subset_data$Voltage)

# Convert and store each sub-metering column as a numeric vector
SM_1 <- as.numeric(subset_data$Sub_metering_1)
SM_2 <- as.numeric(subset_data$Sub_metering_2)
SM_3 <- as.numeric(subset_data$Sub_metering_3)

# Open device and defines size of image
png("plot4.png", width = 480, height = 480)
# Creates multiple items within image
par(mfrow = c(2, 2))

# Construct first line plot
plot(date_time, G_A_P, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# Construct second line plot of voltage against time
plot(date_time, Volt, type = "l", xlab = "datetime", ylab = "Voltage")

# Construct and save line plot 3 in lower left
plot(date_time, SM_1, type = "l", col = "black", xlab = " ", ylab = "Energy Submetering")
# add additional lines to plot
 lines(date_time, SM_2, type = "l", col = "red")
 lines(date_time, SM_3, type = "l", col = "blue")
# Create legend for the plot
 legend(border = "white", "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# Construct and save line plot in lower right
plot(date_time, G_R_P, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()