# Load data and store as an element - assumes file is in working directory
all_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", dec = ".", nrows = 2075259)

# Subset data by date
subset_data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007") , ]

# Convert character vectors storing dates and times into POSIXct format
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Convert Global active power column to numeric vector
G_A_P <- as.numeric(subset_data$Global_active_power)

# Open device and defines size of image
png("plot2.png", width = 480, height = 480)

# Construct and save line plot
plot(date_time, G_A_P, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
