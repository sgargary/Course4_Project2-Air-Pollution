## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#summary(NEI)
#fips               SCC             Pollutant           Emissions            type                year     
#Length:6497651     Length:6497651     Length:6497651     Min.   :     0.0   Length:6497651     Min.   :1999  
#Class :character   Class :character   Class :character   1st Qu.:     0.0   Class :character   1st Qu.:2002  
#Mode  :character   Mode  :character   Mode  :character   Median :     0.0   Mode  :character   Median :2005  
#                                                         Mean   :     3.4                      Mean   :2004  
#                                                         3rd Qu.:     0.1                      3rd Qu.:2008  
#                                                         Max.   :646952.0                      Max.   :2008  



#Plot1_Base plotting
library(dplyr)
q1 <- NEI %>%
  group_by(year) %>%
  summarise(total_PM2.5=sum(Emissions))
with(q1, plot(year, total_PM2.5 , main = "total PM2.5 emission from all sources", pch=19))

dev.copy(png,'plot1.png')
dev.off()


# "year" "total_PM2.5"
# "1" 1999 7332966.73700002
# "2" 2002 5635780.49823926
# "3" 2005 5454703.0771284
# "4" 2008 3464205.83780584
