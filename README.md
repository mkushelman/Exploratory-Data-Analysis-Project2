# Course Project 2: Air Pollution Case Study

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as [the National Emissions Inventory (NEI)](https://www.epa.gov/air-emissions-inventories). 

## Data
The [zip file with data](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) for this project contains two rds files:  
  1.  summarySCC_PM25.rds - _PM2.5 Emissions Data_   
  2.  Source_Classification_Code.rds - _Source Classification Code Table_  

File \#| Short description
-------|---------------------------------------------------------------------
1      | This file contains a data frame with all of the PM2.5 emissions data (for 1999, 2002, 2005, and 2008) measured in tons of PM2.5 emitted from a specific type of source. 
2      | This file provides a mapping from the unique code of the source in the 1st file to the actual name of the PM2.5 source

Here is the columns description in the 1st file:

Column     | Description
-----------|---------------------------------------------------------------------------------------
fips       | A five-digit number (represented as a string) indicating the U.S. county
SCC        | The name of the source as indicated by a digit string (see source code classification table)
Pollutant  | A string indicating the pollutant
Emissions  | Amount of PM2.5 emitted, in tons
type       | The type of source (point, non-point, on-road, or non-road)
year       | The year of emissions recorded


## Assignment
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008.

## Questions 
No | Question
---|------------------------------------------------------------------------------------
1  | Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.      
2  | Have total emissions from PM2.5 decreased in the __Baltimore City__, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3  | Of the four types of sources indicated by the type (_point, nonpoint, onroad, nonroad_) variable, which of these four sources have seen decreases in emissions from 1999-2008 for __Baltimore City__? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
4  | Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
5  | How have emissions from motor vehicle sources changed from 1999-2008 in __Baltimore City__?
6  | Compare emissions from motor vehicle sources in __Baltimore City__ with emissions from motor vehicle sources in __Los Angeles County__, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

### Notes
1.  Present a R code and a plot in png file for each question.
2.  In Question 4, the coal combustion-related sources were searched only in the _Short.Name_ column of the 2d table.
3.  In Questions 5,6 the  motor vehicle sources were searched only in the _Short.Name_ column of the 2d table. 

