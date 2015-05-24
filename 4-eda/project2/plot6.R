library(plyr)
library(ggplot2)

# Load files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Preprocess data

# Baltimore
NEI2 <- NEI[NEI$fips %in% c("24510", "06037"),]
NEI2[NEI2$fips == "24510", "city"] <- "Baltimore"
NEI2[NEI2$fips == "06037", "city"] <- "Los Angeles"

# get coal sources (SCC ids)
source_names <- SCC$SCC.Level.Two
motor_sources <- SCC[SCC$SCC.Level.Two %in% source_names[grepl("Vehicles", source_names, ignore.case = TRUE)], "SCC"]

# filter NEI2 data frame
NEI3 <- NEI2[NEI2$SCC %in% motor_sources,]

# Run the functions length, mean, and sd on the value of "change" for each group,
# broken down by sex + condition
totals <- ddply(NEI3, c("year", "city"), summarise,
                totalInTons    = sum(Emissions)
)

# Generate graph

png(file = "plot6.png", width = 640, height = 480)
qplot(
  year, totalInTons,
  data = totals,
  facets = . ~ city,
  geom = c("line", "smooth"),
  method="lm")
dev.off()
