## Loading the data 
pathWD <- getwd() 
DatasetDIR <- file.path(pathWD, "Data")
f <- file.path(DatasetDIR, "Source_Classification_Code.rds"); SCC <- readRDS(f)
f <- file.path(DatasetDIR, "summarySCC_PM25.rds"); NEI <- readRDS(f)

dim(SCC)
## [1] 11717    15
names(SCC)
## [1] "SCC"                 "Data.Category"       "Short.Name"          "EI.Sector"           "Option.Group"       
## [6] "Option.Set"          "SCC.Level.One"       "SCC.Level.Two"       "SCC.Level.Three"     "SCC.Level.Four"     
## [11] "Map.To"              "Last.Inventory.Year" "Created_Date"        "Revised_Date"        "Usage.Notes"
dim(NEI)
## [1] 6497651       6
names(NEI)
## [1] "fips"      "SCC"       "Pollutant" "Emissions" "type"      "year"
##
## Check records.
library(dplyr)
a <- filter(NEI, Pollutant != "PM25-PRI")
str(a)
## 'data.frame':	0 obs. of  6 variables:
##   $ fips     : chr 
## $ SCC      : chr 
## $ Pollutant: chr 
## $ Emissions: num 
## $ type     : chr 
## $ year     : int 
## Conclusion: all records in NEI has Pollutant = "PM25-PRI"
