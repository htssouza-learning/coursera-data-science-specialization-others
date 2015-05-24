library(plyr)
library(ggplot2)

# Load files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Preprocess data

NEI2 <- NEI[NEI$fips == "24510",]

# Run the functions length, mean, and sd on the value of "change" for each group,
# broken down by sex + condition
totals <- ddply(NEI2, c("year", "type"), summarise,
               totalInTons    = sum(Emissions)
              )

# Generate graph

png(file = "plot3.png", width = 640, height = 480)
qplot(
  year, totalInTons,
  data = totals,
  facets = .~type,
  geom = c("line", "smooth"),
  method="lm")
dev.off()

