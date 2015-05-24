library(plyr)

# Load files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Preprocess data

# Run the functions length, mean, and sd on the value of "change" for each group,
# broken down by sex + condition
totals <- ddply(NEI, "year", summarise,
               totalInMillions    = (sum(Emissions) / 1000000)
              )

# Generate graph

png(file = "plot1.png", width = 640, height = 480)
par(mar=c(5,4,2,2))
barplot(totals$totalInMillions,
        names.arg = totals$year,
        ylab = "Total Emissions (millions of tons of PM2.5)",
        xlab = "Year",
        col = "red")
dev.off()
