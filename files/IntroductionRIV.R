## ----echo=FALSE,warning=FALSE,message=FALSE----
library(tidyverse)
library(readxl)
library(haven)
library(knitr)

## ----echo=FALSE-------------
titanicData <- read_csv("datasets/titanic.csv")
titanicData


## ---------------------------
table(titanicData$embarked)


## ---------------------------
table(titanicData$survived)
table(titanicData$sex)


## ---------------------------
table(titanicData$survived,
      titanicData$sex)


## ---------------------------
table(titanicData$survived,
      titanicData$embarked)
table(titanicData$sex,
      titanicData$embarked)


## ---------------------------
table(titanicData$sex, titanicData$embarked, titanicData$survived)


## ---------------------------
tab <- table(titanicData$sex, titanicData$embarked, titanicData$survived)

str(tab)


## ----echo=FALSE-------------
str(tab)

## ---------------------------
#returns embarked vs survived table for females
tab[1, , ]


## ----echo=FALSE-------------
str(tab)

## ---------------------------
#returns embarked vs survived table for males
tab[2, , ]


## ----echo=FALSE-------------
str(tab)

## ---------------------------
#returns survived vs sex table for embarked "C"
tab[, 1, ]


## ----echo=FALSE-------------
str(tab)

## ---------------------------
#Survived status for males that embarked at "Q"
tab[2, 2, ]


## ---------------------------
CO2 <- as_tibble(CO2)
CO2


## ---------------------------
mean(CO2$uptake)
#note you can easily get a trimmed mean
mean(CO2$uptake, trim = 0.05) #5% trimmed mean
median(CO2$uptake)


## ---------------------------
#quartiles and mean
summary(CO2$uptake)


## ---------------------------
var(CO2$uptake)
sd(CO2$uptake)


## ---------------------------
IQR(CO2$uptake)
quantile(CO2$uptake, probs = c(0.1, 0.2))


## ---------------------------
cov(CO2$conc, CO2$uptake)
cor(CO2$conc, CO2$uptake)


## ---------------------------
CO2 %>% group_by(Treatment) %>% 
	summarise(avg = mean(uptake), med = median(uptake), var = var(uptake))


## ---------------------------
CO2 %>% group_by(Treatment, conc) %>% 
		summarise(avg = mean(uptake), med = median(uptake), var = var(uptake))


## ---------------------------
aggregate(x = CO2$uptake, by = list(CO2$Treatment), FUN = summary)


## ---------------------------
aggregate(uptake ~ Treatment, data = CO2, FUN = summary)


## ---- eval = FALSE----------
## aggregate(uptake ~ Treatment, data = CO2, FUN = summary)


## ---- eval = FALSE----------
## aggregate(uptake ~ Treatment + conc, data = CO2, FUN = summary)


## ---------------------------
aggregate(uptake ~ Treatment + conc, data = CO2, FUN = summary)


## ----echo=TRUE--------------
titanicData <- read_csv("datasets/titanic.csv")
#convert survival status to a factor
titanicData$survived <- as.factor(titanicData$survived)
levels(titanicData$survived) #R knows it isn't numeric now


## ---------------------------
titanicData$survived[1] <- "5"


## ----factorLevel, error = TRUE----
#overwrite with another possible level
levels(titanicData$survived) <- c(levels(titanicData$survived), "5")
levels(titanicData$survived)

#no error
titanicData$survived[1] <- "5" 


## ----reread,echo = TRUE-----
levels(titanicData$survived) <- c("Died", "Survived", "Other")
levels(titanicData$survived)


## ----reread2,echo = TRUE----
levels(titanicData$survived) <- c("Died", "Survived", "Other")
levels(titanicData$survived)


## ----factorOrder,echo=TRUE, eval = TRUE----
#or use ordered()
titanicData$survived <- factor(titanicData$survived,
                                  levels(titanicData$survived)[c(3, 2, 1)])
levels(titanicData$survived)


## ----echo=TRUE--------------
titanicData <- read_csv("datasets/titanic.csv")
titanicData$survived <- as.factor(titanicData$survived)
levels(titanicData$survived) <- c("Died", "Survived")
titanicData


## ---- eval=TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived))


## ----eval=TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived)) + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = survived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = survived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = survived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## #global
## ggplot(data = titanicData, aes(x = survived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = survived))


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## #global
## ggplot(data = titanicData, aes(x = survived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = survived))


## ----eval = TRUE, out.width = "450px", fig.align='center'----
titanicData <- titanicData %>% drop_na(survived, sex, embarked)
g <- ggplot(data = titanicData, aes(x = survived))
g + geom_bar()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = as.character(survived))) + 
  geom_bar() + 
  labs(x = "Survival Status", title = "Bar Plot of Survival for Titanic Passengers")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + 
  geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") +
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male"))


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") + 
  scale_x_discrete(labels = c("Person Died", "Person Survived")) + 
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male")) + 
  coord_flip()


## ----eval=FALSE,echo=TRUE----
## ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar()
## ggplot(data = titanicData, aes(x = survived, fill = sex)) + stat_count() ```


## ----eval = TRUE, out.width = "450px", fig.align='center'----
sumData <- titanicData %>% group_by(survived, sex) %>% summarize(count = n())
ggplot(sumData, aes(x = survived, y = count, fill = sex)) + 
  geom_bar(stat = "identity")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + 
  geom_bar(position = "dodge")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + 
  geom_bar(position = "fill")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived)) + 
  geom_bar(aes(fill =sex), position = "dodge") +
  facet_wrap(~ embarked)


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived)) + 
  geom_bar(aes(fill =sex), position = "dodge") +
  facet_grid(pclass ~ embarked)


## ---------------------------
CO2 <- as_tibble(CO2)
CO2


## ----eval = TRUE, out.width = "450px", fig.align='center'----
g <- ggplot(CO2, aes(x = uptake))
g + geom_histogram()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
g + geom_histogram(color = "blue", fill = "red", size = 2, binwidth = 3)




## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = uptake)) + geom_density()


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = uptake)) +
  geom_density(adjust = 0.5, alpha = 0.5, aes(fill = Treatment))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = uptake)) + 
  geom_density(adjust = 0.5, alpha = 0.5, position = "stack", aes(fill = Treatment))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2) + 
  geom_histogram(aes(y = ..density.., x = uptake, fill = Treatment)) +
  geom_density(adjust = 0.25, alpha = 0.5, position = "stack", 
               aes(x = uptake, fill = Treatment)) 


## ----eval=FALSE,echo=TRUE,message=FALSE----
## ggplot(CO2, aes(x = uptake, fill = Treatment)) +
##   geom_histogram(aes(y = ..density..)) +
##   geom_density(adjust = 0.25, alpha = 0.5, position = "stack")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g <- ggplot(CO2, aes(x = Treatment, y = uptake))
g + geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = Treatment, y = uptake)) + 
  geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = Treatment, y = uptake)) + 
  geom_jitter(width = 0.1) + 
  geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = Treatment, y = uptake)) + geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1) + facet_wrap(~ Type)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g <- ggplot(CO2, aes(x = conc, y = uptake)) 
g + geom_point()


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = conc, y = uptake)) + geom_point() +  
  geom_smooth(aes(col = "loess")) +
  geom_smooth(method = lm, aes(col = "linear")) + 
  scale_colour_manual(name = 'Smoother', values =c('linear'='red', 'loess'='purple'), 
                      labels = c('Linear','GAM'), guide = 'legend')


## ---------------------------
paste("Hi", "What", "Is", "Going", "On", "?", sep = " ")
paste("Hi", "What", "Is", "Going", "On", "?", sep = ".")
paste0("Hi", "What", "Is", "Going", "On", "?")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
correlation <- cor(CO2$conc, CO2$uptake)
ggplot(CO2, aes(x = conc, y = uptake)) + geom_point() +
  geom_smooth(method = lm, col = "Red") + 
  geom_text(x = 750, y = 10, size = 5, 
            label = paste0("Correlation = ", round(correlation, 2)))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = conc, y = uptake)) + 
  geom_text(aes(label = Plant))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = conc, y = uptake)) + 
  geom_point(aes(color = Type), size = 2.5) +
  facet_wrap(~ Treatment)


## ---- echo = TRUE, out.width = "600px", fig.align='center', message = FALSE, warning = FALSE----
library(GGally) #install GGally if needed
ggpairs(iris, aes(colour = Species, alpha = 0.4))


## ---------------------------
voting <- read_csv("datasets/counties.csv")


## ---------------------------
voting


## ---------------------------
votePlot <- ggplot(voting, aes(x = college, y = income))

## ----eval=FALSE-------------
## votePlot +
##   geom_point()+
##   geom_text(x = 40, y = 15000,
##             label = round(cor(voting$college, voting$income), 2))


## ----eval=TRUE,echo=FALSE----
votePlot+geom_point()+
  geom_text(x=40,y=15000,
            label=round(cor(voting$college,voting$income),2))


## ---------------------------
lm(income ~ college, data = voting)


## ---------------------------
fit <- lm(income ~ college, data = voting)
attributes(fit)


## ---------------------------
fit[[1]]
coefficients(fit)
fit$coefficients


## ----eval=FALSE-------------
## fit[[2]]
## residuals(fit)
## fit$residuals


## ----error=TRUE-------------
#no generic function for some things
rank(fit)
y(fit)
fit$rank


## ---------------------------
#ANOVA table (F tests)
anova(fit)


## ---------------------------
#coefficient type III tests
summary(fit)


## ----eval=FALSE-------------
## plot(fit)


## ----eval=FALSE-------------
## votePlot +
##   geom_point() +
##   geom_smooth(method = "lm") +
##   geom_smooth()


## ----echo=FALSE,message=FALSE----
votePlot+geom_point()+geom_smooth(method="lm")+geom_smooth()


## ---------------------------
predict(fit, newdata = data.frame(college = c(40, 10)))


## ---------------------------
predict(fit, newdata = data.frame(college = c(40, 10)), se.fit = TRUE)


## ---------------------------
predict(fit, newdata = data.frame(college = c(40, 10)),
        se.fit = TRUE, interval = "confidence")


## ---------------------------
predict(fit, newdata = data.frame(college = c(40, 10)),
        se.fit = TRUE, interval = "prediction")


## ---------------------------
fit2<-lm(income ~ college + Perot, data = voting)


## ---------------------------
anova(fit2)


## ---------------------------
summary(fit2)


## ---------------------------
coef(fit2)
fit2$rank


## ----eval=FALSE-------------
## plot(fit2)


## ---------------------------
predict(fit2, newdata = data.frame(college = c(40, 30), Perot = c(20, 25)))

