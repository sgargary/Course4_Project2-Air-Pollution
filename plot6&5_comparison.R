#Comparing plot5 and plot6

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(gridExtra)
library(ggplot2)
library(dplyr)

#emissions from motor vehicle sources = EMV

Mobile <- grep("Mobile",SCC$EI.Sector)

EMV <- as.data.frame(SCC[Mobile, "SCC"])

 
q5 <- NEI %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  subset(SCC %in% EMV[,1]) %>%
  summarise( emissions_motorvehicle=sum(Emissions))


plot5 <- ggplot(q5, aes(x = year, y = emissions_motorvehicle))+geom_point()

#emissions from motor vehicle sources = EMV

Mobile <- grep("Mobile",SCC$EI.Sector)

EMV <- as.data.frame(SCC[Mobile, "SCC"])

q6 <- NEI %>%
  subset(fips == "06037") %>%
  group_by(year) %>%
  subset(SCC %in% EMV[,1]) %>%
  summarise( emissions_motorvehicle_LA =sum(Emissions))


plot6 <- ggplot(q6, aes(x = year, y = emissions_motorvehicle_LA))+geom_point()




grid.arrange(plot5, plot6, ncol=2, nrow = 1)

dev.copy(png,'plot5&6Comparison.png')
dev.off()
