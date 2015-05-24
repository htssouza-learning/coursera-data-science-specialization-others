library(plyr)
library(ggplot2)

# Load files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Preprocess data

# get coal sources (SCC ids)
source_names <- SCC$Short.Name
coal_sources <- SCC[SCC$Short.Name %in% source_names[grepl("coal", source_names, ignore.case = TRUE)], "SCC"]

# filter NEI data frame
NEI2 <- NEI[NEI$SCC %in% coal_sources,]

# Run the functions length, mean, and sd on the value of "change" for each group,
# broken down by sex + condition
totals <- ddply(NEI2, "year", summarise,
                totalInTons    = sum(Emissions)
)

# Generate graph
png(file = "plot4.png", width = 640, height = 480)
qplot(
  year, totalInTons,
  data = totals,
  geom = c("line", "smooth"),
  method="lm")
dev.off()
