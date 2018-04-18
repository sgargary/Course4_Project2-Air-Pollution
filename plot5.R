#plot5
## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#emissions from motor vehicle sources = EMV

Mobile <- grep("Mobile",SCC$EI.Sector)

EMV <- as.data.frame(SCC[Mobile, "SCC"])

library(ggplot2)
library(dplyr)

q5 <- NEI %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  subset(SCC %in% EMV[,1]) %>%
  summarise( emissions_motorvehicle=sum(Emissions))


ggplot(q5, aes(x = year, y = emissions_motorvehicle))+geom_point()


dev.copy(png,'plot5.png')
dev.off()
