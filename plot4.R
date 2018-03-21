## Loading the data 
source("load_data.R")
library(dplyr)
## Retrive coal related SCC from the SCC table
CoalSCC = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

## merge NEI and CoalSCC data sets
Merge <- merge(x=NEI, y=CoalSCC, by='SCC')

## Prepare for plot
e <- select(Merge, year, Emissions)
e <- group_by(e, year)
e <- summarise(e, sum(Emissions))

## Plot
plot(e, main = "Emissions from coal combustion-related sources by years",
     xlab = "Years", ylab = "Emissions (in tons)",
     type = "b", pch = 20, col = "red")
## Save the plot into pgn file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
