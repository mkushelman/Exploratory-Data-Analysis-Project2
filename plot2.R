## Loading the data 
source("load_data.R")

library(dplyr)
## Retrieve the NEI information for Baltimore, MD (fips == "24510")
BaltimoreNEI <- filter(NEI, fips == "24510")

## Group BaltimoreNEI by years
GroupbyYear <- group_by(BaltimoreNEI, year)

## Calculate total exmissions for each year
TotalEmissionsByYear <- summarise(GroupbyYear, sum(Emissions))

## Plot
plot(TotalEmissionsByYear, main = "Baltimore PM2.5 emissions by year",
     xlab = "Years", ylab = "Emissions (in tons)",
     type = "b", pch = 20, col = "red")
## Save the plot into pgn file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
