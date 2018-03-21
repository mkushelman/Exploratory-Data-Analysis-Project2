## Loading the data 
source("load_data.R")

library(dplyr)
## Group NEI by years
GroupbyYear <- group_by(NEI, year)

## Calculate total exmissions for each year
TotalEmissionsByYear <- summarise(GroupbyYear, sum(Emissions))

## Plot dependency total emmisions from year
plot(TotalEmissionsByYear, main = "Total PM2.5 emissions by year",
     xlab = "Years", ylab = "Emissions (in tons)",
     type = "b", pch = 20, col = "red")
## Save the plot into pgn file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
