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
png("plot2.png", width=480, height=480)
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()