# Read data

pwr_cons <- read.csv("./household_power_consumption.txt", sep = ";", nrows = 2075259, na.strings = "?")
days <- as.Date(pwr_cons$Date, "%d/%m/%Y")

# slice and select
days <- which((days >= "2007-02-01") & (days <= "2007-02-02" ))
Global_active_power <- pwr_cons$Global_active_power[days]
rm(days)
rm(pwr_cons)

# Plot
hist(Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


