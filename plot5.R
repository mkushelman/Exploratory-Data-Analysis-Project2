## Loading the data 
source("load_data.R")
library(dplyr)
## Retrieve the NEI information for Baltimore, MD (fips == "24510")
BaltimoreNEI <- filter(NEI, fips == "24510")


## Retrive motor vehicle sources SCC from the SCC table
MotorSCC = SCC[grepl("motor", SCC$Short.Name, ignore.case=TRUE),]

## merge BaltimoreNEI and MotorSCC data sets
Merge <- merge(x=BaltimoreNEI, y=MotorSCC, by='SCC')

## Prepare for plot
e <- select(Merge, year, Emissions)
e <- group_by(e, year)
e <- summarise(e, sum(Emissions))

## Plot
plot(e, main = "Emissions from motor vehicle sources in Baltimore by years",
     xlab = "Years", ylab = "Emissions (in tons)",
     type = "b", pch = 20, col = "red")
## Save the plot into pgn file
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()
