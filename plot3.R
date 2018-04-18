#plot3
## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
q3 <- NEI %>%
  subset(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(total_PM2.5=sum(Emissions))

ggplot(q3, aes(x = year, y = total_PM2.5, color = type ))+geom_point()

dev.copy(png,'plot3.png')
dev.off()