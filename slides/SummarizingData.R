## ---- echo = FALSE, message = FALSE, warning = FALSE----------------
library(tidyverse)
library(haven)
library(knitr)
options(dplyr.print_min = 5)
options(tibble.print_min = 5)
opts_chunk$set(message = FALSE, cache = TRUE)


## ----step4a, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/rawData.png")


## ----arrow4a, fig.align = 'left', out.width = '30px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/arrow.png")


## ----step4b, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/ImportR.png")


## ----arrow4b, fig.align = 'left', out.width = '30px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/arrow.png")


## ----step4c, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/SummarizeR.png")


## ----arrow4c, fig.align = 'left', out.width = '30px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/arrow.png")


## ----step4d, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/AnalysisR.png")


## ---- echo = FALSE,  out.width = "260px", fig.align='center'--------
knitr::include_graphics("../img/summarizeAllF.png")


## ---- echo = FALSE,  out.width = "295px", fig.align='center'--------
knitr::include_graphics("../img/summarizeGroupsF.png")


## ---- echo = FALSE, out.width="500px", fig.align='center'-----------
knitr::include_graphics("../img/variableTypes.png")


## ----echo=TRUE------------------------------------------------------
titanicData <- read_csv("../datasets/titanic.csv")
titanicData


## -------------------------------------------------------------------
table(titanicData$embarked)


## -------------------------------------------------------------------
table(titanicData$survived)
table(titanicData$sex)


## -------------------------------------------------------------------
table(titanicData$survived,
      titanicData$sex)


## -------------------------------------------------------------------
table(titanicData$survived,
      titanicData$embarked)
table(titanicData$sex,
      titanicData$embarked)


## -------------------------------------------------------------------
table(titanicData$sex, titanicData$embarked, titanicData$survived)


## -------------------------------------------------------------------
tab <- table(titanicData$sex, titanicData$embarked, titanicData$survived)

str(tab)


## ----echo=FALSE-----------------------------------------------------
str(tab)

## -------------------------------------------------------------------
#returns embarked vs survived table for females
tab[1, , ]


## ----echo=FALSE-----------------------------------------------------
str(tab)

## -------------------------------------------------------------------
#returns embarked vs survived table for males
tab[2, , ]


## ----echo=FALSE-----------------------------------------------------
str(tab)

## -------------------------------------------------------------------
#returns survived vs sex table for embarked "C"
tab[, 1, ]


## ----echo=FALSE-----------------------------------------------------
str(tab)

## -------------------------------------------------------------------
#Survived status for males that embarked at "Q"
tab[2, 2, ]


## -------------------------------------------------------------------
CO2 <- as_tibble(CO2)
CO2


## -------------------------------------------------------------------
mean(CO2$uptake)
#note you can easily get a trimmed mean
mean(CO2$uptake, trim = 0.05) #5% trimmed mean
median(CO2$uptake)


## -------------------------------------------------------------------
#quartiles and mean
summary(CO2$uptake)


## -------------------------------------------------------------------
var(CO2$uptake)
sd(CO2$uptake)


## -------------------------------------------------------------------
IQR(CO2$uptake)
quantile(CO2$uptake, probs = c(0.1, 0.2))


## -------------------------------------------------------------------
cov(CO2$conc, CO2$uptake)
cor(CO2$conc, CO2$uptake)


## -------------------------------------------------------------------
CO2 %>% 
  group_by(Treatment) %>% 
	summarise(avg = mean(uptake), med = median(uptake), var = var(uptake))


## -------------------------------------------------------------------
CO2 %>% 
  group_by(Treatment, conc) %>% 
		summarise(avg = mean(uptake), med = median(uptake), var = var(uptake))


## -------------------------------------------------------------------
aggregate(x = CO2$uptake, by = list(CO2$Treatment), FUN = summary)


## ---- eval = FALSE--------------------------------------------------
## aggregate(uptake ~ Treatment, data = CO2, FUN = summary)


## ---- eval = TRUE---------------------------------------------------
aggregate(uptake ~ Treatment + conc, data = CO2, FUN = summary)


## ----echo=TRUE------------------------------------------------------
#convert survival status to a factor
titanicData$survived <- as.factor(titanicData$survived)
levels(titanicData$survived) #R knows it isn't numeric now


## ---- error=TRUE, error = TRUE, message = TRUE, warning=TRUE--------
titanicData$survived[1] <- "5"


## ----reread,echo = TRUE---------------------------------------------
levels(titanicData$survived) <- c("Died", "Survived")
levels(titanicData$survived)


## ----echo=TRUE------------------------------------------------------
titanicData <- read_csv("../datasets/titanic.csv")
titanicData$mySurvived <- as.factor(titanicData$survived)
levels(titanicData$mySurvived) <- c("Died", "Survived")
titanicData$myEmbarked <- as.factor(titanicData$embarked)
levels(titanicData$myEmbarked) <- c("Cherbourg", "Queenstown", "Southampton")
titanicData <- titanicData %>% drop_na(mySurvived, sex, myEmbarked)


## ---- eval=TRUE, out.width = "450px", fig.align='center'------------
ggplot(data = titanicData, aes(x = mySurvived))


## ----eval=TRUE, out.width = "450px", fig.align='center'-------------
ggplot(data = titanicData, aes(x = mySurvived)) + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----------
## g <- ggplot(data = titanicData, aes(x = mySurvived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----------
## g <- ggplot(data = titanicData, aes(x = mySurvived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----------
## g <- ggplot(data = titanicData, aes(x = mySurvived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----------
## #global
## ggplot(data = titanicData, aes(x = mySurvived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = mySurvived))


## ----eval = FALSE, out.width = "450px", fig.align='center'----------
## #global
## ggplot(data = titanicData, aes(x = mySurvived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = mySurvived))


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived)) + 
  geom_bar() + 
  labs(x = "Survival Status", title = "Bar Plot of Survival for Titanic Passengers")


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + geom_bar()


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + 
  geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") +
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male"))


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") + 
  scale_x_discrete(labels = c("Person Died", "Person Survived")) + 
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male")) + 
  coord_flip()


## ----eval=FALSE,echo=TRUE-------------------------------------------
## ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar()
## ggplot(data = titanicData, aes(x = survived, fill = sex)) + stat_count()


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
sumData <- titanicData %>% 
  group_by(survived, sex) %>% 
  summarize(count = n())
ggplot(sumData, aes(x = survived, y = count, fill = sex)) + 
  geom_bar(stat = "identity")


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + 
  geom_bar(position = "dodge")


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + 
  geom_bar(position = "fill")


## ----eval = TRUE, out.width = "450px", fig.align='center'-----------
ggplot(data = titanicData, aes(x = mySurvived)) + 
  geom_bar(aes(fill =sex), position = "dodge") +
  facet_wrap(~ myEmbarked)


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g <- ggplot(titanicData, aes(x = age))
g + geom_density()


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + geom_density(adjust = 0.5, alpha = 0.5, aes(fill = mySurvived))


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + geom_density(adjust = 0.5, alpha = 0.5, position = "stack", aes(fill = mySurvived))


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g <- ggplot(titanicData, aes(x = mySurvived, y = age))
g + geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + 
  geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1, alpha = 0.3)


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + 
  geom_jitter(width = 0.1, alpha = 0.3) + 
  geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1, alpha = 0.3) + 
  facet_wrap(~ myEmbarked)


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g <- ggplot(titanicData, aes(x = age, y = fare))
g + geom_point()


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + geom_point() +  
  geom_smooth(aes(col = "loess")) +
  geom_smooth(method = lm, aes(col = "linear")) + 
  scale_colour_manual(name = 'Smoother', values =c('linear'='red', 'loess'='purple'), 
                      labels = c('Linear','GAM'), guide = 'legend')


## -------------------------------------------------------------------
paste("Hi", "What", "Is", "Going", "On", "?", sep = " ")
paste("Hi", "What", "Is", "Going", "On", "?", sep = ".")
paste0("Hi", "What", "Is", "Going", "On", "?")


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
correlation <- cor(titanicData$fare, titanicData$age, use = "complete.obs")
g + geom_point() +
  geom_smooth(method = lm, col = "Red") + 
  geom_text(x = 40, y = 400, size = 5, 
            label = paste0("Correlation = ", round(correlation, 2)))


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + geom_text(aes(label = survived, color = mySurvived))


## ---- echo = TRUE, out.width = "500px", fig.align='center', warning = FALSE----
g + geom_point(aes(color = sex), size = 2.5) +
  facet_wrap(~ myEmbarked)


## ---- echo = TRUE, out.width = "600px", fig.align='center', message = FALSE, warning = FALSE----
library(GGally) #install GGally if needed
ggpairs(iris, aes(colour = Species, alpha = 0.4))

