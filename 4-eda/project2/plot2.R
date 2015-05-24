library(plyr)

# Load files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Preprocess data

NEI2 <- NEI[NEI$fips == "24510",]

# Run the functions length, mean, and sd on the value of "change" for each group,
# broken down by sex + condition
totals <- ddply(NEI2, "year", summarise,
               totalInThousands    = (sum(Emissions) / 1000)
              )

# Generate graph

png(file = "plot2.png", width = 640, height = 480)

par(mar=c(5,4,2,2))
barplot(totals$totalInThousands,
        names.arg = totals$year,
        ylab = "Thousands of tons of emissions in  Baltimore",
        xlab = "Year",
        col = "red")
dev.off()
