# if (!file.exists("./data/household_power_consumption.txt")) {
#  file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#  file_name <- "household_power_consumption.zip"
#  download.file(file_url, file_name, method = "curl")
#  unzip(file_name)
# }

data_file <- "./data/household_power_consumption.txt"
data <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(data_subset)
date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(data_subset$Global_active_power)
sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()