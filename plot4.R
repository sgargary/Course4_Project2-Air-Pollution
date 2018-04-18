#plot4 
##changes in emissions from coal combustion-related sources
## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


comb <- grep("Coal",SCC$EI.Sector)

SCCCoal <- as.data.frame(SCC[comb, "SCC"])

library(ggplot2)

q4 <- NEI %>%
  subset(SCC %in% SCCCoal[,1]) %>%
  group_by(year) %>%
  summarise( emissions_coalcombustion=sum(Emissions))

 
ggplot(q4, aes(x = year, y = emissions_coalcombustion))+geom_point()


dev.copy(png,'plot4.png')
dev.off()
