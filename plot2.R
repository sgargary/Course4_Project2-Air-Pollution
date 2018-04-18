#plot2
## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

q2 <- NEI %>%
  subset(fips == "24510") %>%
  group_by(year) %>%
  summarise(total_PM2.5=sum(Emissions))

with(q2, plot(year, total_PM2.5 , main = "total PM2.5 emission_Baltimore City", pch=19))

dev.copy(png,'plot2.png')
dev.off()