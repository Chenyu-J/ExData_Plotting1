library(tidyverse)

#Reads in data from file then subsets data for specified dates
power_df <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")

df_2 <- power_df %>% mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>% 
  filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(df_2[, "Date"], df_2[, "Global_active_power"], type="l", lables = weekdays("Date"), xlab="Date", ylab="Global Active Power")

# Plot 2
plot(df_2[, "Date"],df_2[, "Voltage"], type="l", xlab="Date", ylab="Voltage")

# Plot 3
plot(df_2[, "Date"], df_2[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(df_2[, "Date"], df_2[, "Sub_metering_2"], col="red")
lines(df_2[, "Date"], df_2[, "Sub_metering_3"],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(df_2[, "Date"], df_2[,"Global_reactive_power"], type="l", xlab="Date", ylab="Global_reactive_power")

dev.off()
