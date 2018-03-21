## Loading the data 
source("load_data.R")
library(dplyr); library(ggplot2)
## Retrieve NEI information for Baltimore, MD and Los Angeles
BaltimoreNEI <- filter(NEI, fips == "24510")
LosAngelesNEI <- filter(NEI, fips == "06037")

## Retrive motor vehicle sources SCC from the SCC table
MotorSCC = SCC[grepl("motor", SCC$Short.Name, ignore.case=TRUE),]

## merge MotorSCC and BaltimoreNEI(Merge1)/LosAngelesNEI(Merge2) data sets
Merge1 <- merge(x=BaltimoreNEI, y=MotorSCC, by='SCC')
Merge2 <- merge(x=LosAngelesNEI, y=MotorSCC, by='SCC')

## Prepare for plot
e1 <- select(Merge1, year, Emissions)
e1 <- group_by(e1, year)
e1 <- summarise(e1, em = sum(Emissions))


e2 <- select(Merge2, year, Emissions)
e2 <- group_by(e2, year)
e2 <- summarise(e2, em = sum(Emissions))

e1["city"] <- paste(rep('Baltimore', 4))           # Add column "city"
e2["city"] <- paste(rep('LosAngeles', 4))          # Add column "city"

e <- rbind(e1, e2)

## Plot
g <- ggplot(e, aes(year, em))+
     geom_point()+geom_line()+ facet_grid(. ~ city)+
     ggtitle("Motor vehicle emissions by years")+
     xlab("Years")+ylab("Emissions (in tons)")
g
## Save the plot into pgn file
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()
