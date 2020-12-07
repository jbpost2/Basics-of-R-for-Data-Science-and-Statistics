#Quick summaries of chemData
summary(chemData)

#plots
library(ggplot2)
ggplot(chemData, aes(x = conc, y = percent)) + geom_point() + geom_smooth()
ggplot(chemData, aes(x = temp, y = percent)) + geom_point() + geom_smooth()
ggplot(chemData, aes(x = time, y = percent)) + geom_point() + geom_smooth()
       