library(tidyverse)

#Reads in data from file then subsets data for specified dates
power_df <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")

df_2 <- power_df %>% mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>% 
  filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot3.png", width=480, height=480)

# Plot 3
plot(df_2[, "Date"], df_2[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(df_2[, "Date"], df_2[, "Sub_metering_2"],col="red")
lines(df_2[, "Date"], df_2[, "Sub_metering_3"],col="blue")

legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
