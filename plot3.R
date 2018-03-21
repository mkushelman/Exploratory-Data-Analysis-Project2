## Loading the data 
source("load_data.R")

library(dplyr); library(ggplot2)
## Retrieve the NEI information for Baltimore, MD (fips == "24510")
BaltimoreNEI <- filter(NEI, fips == "24510")
GroupByTypeByYear <- group_by(BaltimoreNEI, type, year)

em <- summarise(GroupByTypeByYear, emission = sum(Emissions))

## Plot dependency total emmisions
g <- ggplot(em, aes(year, emission))
g+geom_point()+ geom_line()+ facet_grid(. ~ type)+
  ggtitle("Baltimore PM2.5 emissions types by years")+
  xlab("Years")+ylab("Emissions (in tons)")
## Save the plot into pgn file
dev.copy(png, file="plot3-1.png", height=480, width=480)
dev.off()

## Plot
qplot(year, emission, data = em, color=type,geom = c("point", "line"))+
  ggtitle("Baltimore PM2.5 emissions types by years")+
  xlab("Years")+ylab("Emissions (in tons)")
## Save the plot into pgn file
dev.copy(png, file="plot3-2.png", height=480, width=480)
dev.off()
