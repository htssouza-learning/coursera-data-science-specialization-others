install.packages("caret")
library(caret)

install.packages("kernlab")
library(kernlab)
data(spam)
str(spam)
table(spam$type)

plot(density(spam$your[spam$type == "nonspam"]),
     col = "blue",
     main = "",
     xlab = "Frequency of 'your'")
lines(density(spam$your[spam$type == "spam"]),
      col = "red")
abline(v=0.5, col="black")
prediction <- ifelse(spam$your > 0.5, "spam", "nospam")
table(prediction, spam$type) / length(spam$type)

library(ggplot2)
library(dplyr)
sample <- filter(spam, capitalAve <= 10)
ggplot(sample, aes(x = capitalAve, fill = type, alpha=0.5)) +
    geom_histogram() +
    xlab("Capital Letter Count") +
    ylab("Count")
