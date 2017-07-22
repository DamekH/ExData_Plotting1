# Load data and store as an element - assumes file is in working directory
all_data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", dec = ".", nrows = 2075259)

# Subsets data by date
subset_data <- all_data[all_data$Date %in% c("1/2/2007", "2/2/2007") , ]

# Converts Global active power column to numeric vector
G_A_P <- as.numeric(subset_data$Global_active_power)

# Opens device and defines size of image
png("plot1.png", width = 480, height = 480)

# Creates histogram with desired features and labels
hist(G_A_P, freq = TRUE, col = "red", border = "black", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()