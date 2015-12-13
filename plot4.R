# Read data
library(dplyr)
pwr_cons <- read.csv("./household_power_consumption.txt", sep = ";",
                     nrows = 2075259, na.strings = "?", stringsAsFactors = F)
pwr_cons$Date <- as.Date(pwr_cons$Date, "%d/%m/%Y")

# slice and select
pwr_cons <- filter( pwr_cons, (Date >= "2007-02-01") & 
                     (Date <= "2007-02-02") )

pwr_cons <- mutate(pwr_cons, FullTime = as.POSIXct(paste(Date,Time)))

# Plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(pwr_cons, { plot(FullTime, Global_active_power, type="l", 
                      ylab="Global Active Power (kilowatts)", xlab="")
                 plot(FullTime, Voltage, type="l", 
                      ylab="Voltage (volt)", xlab="")
                 plot(FullTime, Sub_metering_1, type="l", 
                      ylab="Global Active Power (kilowatts)", xlab="")
                 lines(FullTime, Sub_metering_2,col='Red')
                 lines(FullTime, Sub_metering_3,col='Blue')
                 legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
                        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                 plot(FullTime, Global_reactive_power, type="l", 
                      ylab="Global Rective Power (kilowatts)",xlab="")
               })

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

