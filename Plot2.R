library(tidyverse)

#Reads in data from file then subsets data for specified dates
power_df <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")

df_2 <- power_df %>% mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>% 
  filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = df_2[, "Date"]
     , y = df_2[, "Global_active_power"]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
