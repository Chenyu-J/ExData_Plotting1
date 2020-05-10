library(tidyverse)
library(lubridate)

#Reads in data from file then subsets data for specified dates
power_df <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")

df <- power_df %>% mutate(Date = as.Date(Date, "%d/%m/%Y")) %>% filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot1.png", width=480, height=480)

## Plot 1
hist(as.numeric(df[, "Global_active_power"]), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()