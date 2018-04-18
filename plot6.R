#plot6
## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#emissions from motor vehicle sources = EMV

Mobile <- grep("Mobile",SCC$EI.Sector)

EMV <- as.data.frame(SCC[Mobile, "SCC"])

library(ggplot2)
library(dplyr)

q6 <- NEI %>%
  subset(fips == "06037") %>%
  group_by(year) %>%
  subset(SCC %in% EMV[,1]) %>%
  summarise( emissions_motorvehicle_LA =sum(Emissions))


ggplot(q6, aes(x = year, y = emissions_motorvehicle_LA))+geom_point()


dev.copy(png,'plot6.png')
dev.off()
