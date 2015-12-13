# Read data
library(dplyr)
pwr_cons <- read.csv("./household_power_consumption.txt", sep = ";",
                     nrows = 2075259, na.strings = "?", stringsAsFactors = F)
pwr_cons$Date <- as.Date(pwr_cons$Date, "%d/%m/%Y")

# slice and select
pwr_cons <- filter( pwr_cons, (Date >= "2007-02-01") & 
                     (Date <= "2007-02-02") )

mutate(pwr_cons, FullTime = as.POSIXct(paste(Date,Time)))

# Plot
with(pwr_cons, plot(FullTime, Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="") )

# Save

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

