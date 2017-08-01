#####################################################
##Just the R code in lectures from course:
##Introduction to Data Science using R
##Justin Post 2017
#####################################################

#####################################################
##Part I
#####################################################

#####################################################
##Objects and Common Classes

#simple math operations (# is a comment, not evaluated)
3 + 7
10 * exp(3)
log(pi^2) #log is natural log by default

#save for later
avg <- (5 + 7 + 6) / 3
#call avg object
avg
#strings can be saved as well
words <- "Hello there!"
words

#vectors (1 dimensional) objects
#all elements of the same 'type'
x <- c(1, 3, 10, -20, sqrt(2))
y <- c("cat", "dog", "bird", "floor")
x
y

1:20 / 20
seq(from = 1, to = 10, by = 2)
runif(4, min = 0, max = 1)


#populate vectors
x <- rep(0.2, times = 6)
y <- c(1, 3, 4, -1, 5, 6)

#check 'type'
is.numeric(x)
is.numeric(y)

#check 'length'
length(x)
length(y)

#combine in a matrix (check help(matrix))
matrix(c(x, y), ncol = 2)

x <- c("Hi", "There", "!")
y <- c("a", "b", "c")
z <- c("One", "Two", "Three")
is.character(x)
matrix(c(x, y, z), nrow = 3)

#data frames
x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
data.frame(x, y, z)
data.frame(char = x, data1 = y, data2 = z)

#lists
list("Hi", 1, 2, "!")

x <- c("Hi", "There", "!")
y <- c(1, 3, 4, -1, 5, 6)
list(x, y)


#####################################################
##Attributes and Basic Data Manipulation

iris
str(iris)
attributes(iris)

#accessing vector values
letters #built in vector
letters[10]

letters[1:4]
letters[c(5, 10, 15, 20, 25)]
x <- c(1, 2, 5)
letters[x]

#access matrix values
mat <- matrix(c(1:4, 20:17), ncol = 2)
mat

mat[2, 2]
mat[ , 1]
mat[2, ]

mat[2:4, 1]
mat[c(2, 4), ]

mat <- matrix(c(1:4, 20:17), ncol = 2,
              dimnames = list(NULL,
                              c("First", "Second"))
              )
mat

mat<-matrix(c(1:4,20:17),ncol=2,
            dimnames=list(NULL,
                          c("First","Second")))
mat

mat[, "First"]

#assign after creation
mat <- matrix(c(1:4, 20:17), ncol = 2)
dimnames(mat) <- list(NULL, c("First", "Second"))
mat

str(mat)
attributes(mat)

#data frames
str(iris)

iris[1:4, 2:4]
iris[1, ]

iris[ , c("Sepal.Length", "Species")]

iris$Sepal.Length

#lists
x <- list("HI", c(10:20), 1)
x[[1]]
x[[3]]

x[[2]]
x[[2]][4:5]

x <- list("HI", c(10:20), 1)
str(x)
x <- list(First="Hi", Second=c(10:20), Third=1)
x$Second

str(iris)
iris[[2]]

#setting attributes
x <- seq(from = 1, to = 10, by = 2)
str(x)
attributes(x)

names(x) <- letters[1:length(x)]
str(x)
attributes(x)

attr(x, which = "MyAttr") <- "Best vector ever"
str(attributes(x))
attributes(x)$MyAttr


#####################################################
##Reading/Writing Data

#packages
install.packages("readr")
#can do multiple packages at once
install.packages(c("readr", "readxl", "haven", "DBI", "httr"))

library("readr")
require("haven")

install.packages("tidyverse")
library(tidyverse)

#working directory
getwd()
setwd("E:\\Other\\DataScienceR")
#or
setwd("E:/Other/DataScienceR")

#reading data
scoreData <- read_csv(file = "https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/scores.csv")

scoreData
attributes(scoreData)$class

scoreStub <- read_csv("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/scoresStub.csv")

scoreStub

ggplot(data = scoreData, aes(x = day, y = AFinal)) + geom_boxplot()


#overwrite day column with factor version
scoreData$day <- as.factor(scoreData$day)
levels(scoreData$day)

scoreData$day <- ordered(scoreData$day, levels = levels(scoreData$day)[c(7, 5, 1, 3, 4, 2, 6)])

levels(scoreData$day)

ggplot(data = filter(scoreData, day %in% c("Mon", "Sat", "Sun", "Thu")), aes(x = day, y = AFinal)) + 
  geom_boxplot()

umpData <- read_delim("https://raw.githubusercontent.com/
                    jbpost2/DataScienceR/master/datasets/umps2012.txt", delim = ">", col_names = c("Year", "Month", "Day", "Home", "Away", "HPUmpire"))

umpData

#a guess based on reading a few columns
cigData <- read_fwf("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/cigarettes.txt", col_positions = fwf_empty("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/cigarettes.txt", col_names = c("brand", "tar", "nicotine", "weight", "co")))

cigData

#need to skip first line!
cigData <- read_fwf("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/cigarettes.txt", col_positions = fwf_empty("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/cigarettes.txt", col_names = c("brand", "tar", "nicotine", "weight", "co")), skip = 1)

cigData

#another option
cigData<-read_fwf("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/cigarettes.txt", col_positions = fwf_widths(c(17, 4, 5, 11, 4), col_names = c("brand", "tar", "nicotine", "weight", "co")), skip = 1)

cigData


library(readxl)
#just first sheet
edData <- read_excel("datasets/censusEd.xls", sheet = "EDU01A")

edData

excel_sheets("datasets/censusEd.xls")

#just first sheet
edData <- read_excel("datasets/censusEd.xls", sheet = "EDU01A", 
                     range = cell_cols("A:D"))

edData

library(haven)
bodyFatData<-read_spss("https://github.com/jbpost2/DataScienceR/blob/master/datasets/bodyFat.sav?raw=true.sav")

bodyFatData

smokeData<-read_sas("https://github.com/jbpost2/DataScienceR/blob/master/datasets/smoke2003.sas7bdat?raw=true")

smokeData

str(smokeData)

attr(smokeData$SDDSRVYR, "label")

write_csv(x = smokeData, path = "E:/Other/DataScienceR/datasets/output/smokeData.csv")

write_csv(x = bodyFatData, path = "E:/Other/DataScienceR/datasets/smokeData.csv", append = TRUE)



#####################################################
##Data manipulation

#logical statements
#Use of ==, !=, >=, <=, >, <
"hi" == " hi"
"hi" == "hi"
4 == 1
4 >= 3
4 != 1
"hi" != "hello"

#use of is. functions
is.numeric("Word")
is.numeric(10)
is.character("10")
is.na(c(1:2, NA, 3))

iris <- tbl_df(iris)
iris

##Obtain a vector that indicates which rows are "setosa" species
iris$Species == "setosa"

iris[iris$Species == "setosa", ]

filter(iris, Species == "setosa")

filter(iris, Species != "setosa")

#silly example
a <- 5
if (a < 10){
  print("hi")
}

if (a < 10){
  print("hi")
} else if (a < 40){
  print("goodbye")
} else {
  print("aloha")
}

#silly example
a <- 20
if (a < 10){
  print("hi")
}

if (a < 10){
  print("hi")
} else if (a < 40){
  print("goodbye")
} else {
  print("aloha")
}

a <- "string"
if (a < 10){
  print("hi")
}

if (a < 10){
  print("hi")
} else if (a < 40){
  print("goodbye")
} else {
  print("aloha")
}


#coerce numeric to string
c("hi", 10)
#coerce TRUE/FALSE to numeric
c(TRUE, FALSE) + 0

#logical to character
c(TRUE, "hi")

as.numeric(c(TRUE, FALSE, TRUE))
mean(c(TRUE, FALSE, TRUE))
as.character(c(1, 2, 3.5, TRUE))

#compound statements
set.seed(3)
x <- runif(n = 10, min = 0, max = 1); x
(x < 0.25) | (x > 0.75)
(x < 0.25) || (x > 0.75)

filter(iris, (Petal.Length > 1.5) & (Petal.Width > 0.3) & 
         (Species == "setosa"))

(iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) &
  (iris$Species == "setosa")

#won't work!
if ((iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) &
    (iris$Species == "setosa")) {
  "Large Setosa"
}

#syntax
ifelse(vector_condition, if_true_do_this, if_false_do_this)

ifelse((iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) & 
         (iris$Species == "setosa"), "L-S", "NotL-S")

transmute(iris, Size =
            ifelse((Petal.Length > 1.5) & (Petal.Width > 0.3) &
                     (Species == "setosa"), "L-S", "NotL-s"))

mutate(iris, Size =
         ifelse((Petal.Length > 1.5) & (Petal.Width > 0.3) &
                  (Species == "setosa"), "LS", "NotLS"))

#dplyr
#install.packages("Lahman")
library(Lahman)
head(Batting, n = 4) #look at just first 4 observations

Batting <- tbl_df(Batting)
Batting

filter(Batting, teamID == "PIT")
filter(Batting, teamID == "PIT" & yearID == 2000)

#reorder by teamID
arrange(Batting, teamID)
#get secondary arrangement as well
arrange(Batting, teamID, G)
#descending instead
arrange(Batting, teamID, desc(G))

arrange(filter(Batting, teamID == "PIT"), desc(G))
Batting %>% filter(teamID == "PIT") %>% arrange(desc(G))

a<-runif(n = 10)
a
#silly example
a %>% quantile()
a %>% quantile() %>% range()

#Choose a single column by name
Batting %>% select(X2B)
#all columns between
Batting %>% select(X2B:HR)
#all columns containing
Batting %>% select(contains("X"))
#all columns starting with
Batting %>% select(starts_with("X"))
#all columns ending with
Batting %>% select(ends_with("ID"))

##Create an Extra Base Hits variable
Batting %>% mutate(ExtraBaseHits = X2B + X3B + HR)
#can't see it!
Batting %>% mutate(ExtraBaseHits = X2B + X3B + HR) %>% select(ExtraBaseHits)
#transmute will keep the new variable only
Batting %>% transmute(ExtraBaseHits = X2B + X3B + HR)

Batting %>% summarise(AvgX2B = mean(X2B, na.rm = TRUE))
Batting %>% group_by(teamID) %>% summarise(AvgX2B = mean(X2B, na.rm = TRUE))

# create two simple data frames
a <- data_frame(color = c("green", "yellow", "red"), num = 1:3)
b <- data_frame(color = c("green", "yellow", "pink"), size = c("S", "M", "L"))
a
b
inner_join(a, b)
full_join(a, b)
left_join(a, b)
right_join(a, b)
left_join(b, a)
semi_join(a, b)
anti_join(a, b)

b <- b %>% rename(col = color)
a
b
inner_join(a, b, by = c("color" = "col"))


#####################################################
##Numerical and Graphical Summaries

#categorical data
titanicData <- read_csv("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/titanic.csv")
titanicData

#numeric summaries
table(titanicData$embarked)
table(titanicData$survived)
table(titanicData$sex)
table(titanicData$survived,
      titanicData$sex)
table(titanicData$survived,
      titanicData$embarked)
table(titanicData$sex,
      titanicData$embarked)
table(titanicData$sex, titanicData$embarked, titanicData$survived)
tab <- table(titanicData$sex, titanicData$embarked, titanicData$survived)

str(tab)

#returns embarked vs survived table for females
tab[1, , ]
#returns embarked vs survived table for males
tab[2, , ]
#returns survived vs sex table for embarked "C"
tab[, 1, ]
#Survived status for males that embarked at "Q"
tab[2, 2, ]

#bar plots
ggplot(data = titanicData, aes(x = as.factor(embarked)))
g <- ggplot(data = titanicData, aes(x = as.factor(embarked)))
g + geom_bar()
g <- ggplot(data = titanicData %>% drop_na(embarked),
            aes(x = as.factor(embarked)))
g + geom_bar()

#Fix x axis, x axis label and give title
g <- ggplot(data = titanicData %>% drop_na(embarked),
            aes(x = as.factor(embarked)))
g + geom_bar() + 
  labs(x = "City Embarked", title = "Bar Plot of Embarked City 
       for Titanic Passengers") + 
  scale_x_discrete(labels = c("Cherbourg","Queenstown","Southampton"))

#filled bar plot
g <- ggplot(data = titanicData %>% drop_na(embarked),
            aes(x = as.factor(embarked)))
g + geom_bar(aes(fill = as.factor(survived)))

g <- ggplot(data = titanicData %>% drop_na(embarked),
            aes(x = as.factor(embarked)))
g + geom_bar(aes(fill = as.factor(survived))) +
  labs(x = "City Embarked", 
       title = "Bar Plot of Embarked City for Titanic Passengers") + 
  scale_x_discrete(labels = c("Cherbourg", "Queenstown", "Southampton")) + 
  scale_fill_discrete(name = "Surived", labels = c("No","Yes"))

g <- ggplot(data = titanicData %>% drop_na(embarked),
            aes(x = as.factor(embarked)))
g + geom_bar(aes(fill = as.factor(survived))) +
  labs(x = "City Embarked", 
       title = "Bar Plot of Embarked City for Titanic Passengers") +
  scale_x_discrete(labels = c("Cherbourg", "Queenstown", "Southampton")) + 
  scale_fill_discrete(name = "Surived",labels = c("No","Yes")) +
  coord_flip()

#side-by-side bar plot
twoWayData<-titanicData %>% group_by(embarked, survived) %>%
  summarise(count=n())
twoWayData

g <- ggplot(data = twoWayData %>% drop_na(embarked), 
            aes(x = as.factor(embarked), y = count, fill = as.factor(survived)))+
  geom_bar(stat = "identity", position = "dodge") %>%
  labs(x = "City Embarked", 
       title = "Bar Plot of Embarked City for Titanic Passengers") + 
  scale_x_discrete(labels = c("Cherbourg", "Queenstown", "Southampton")) + 
  scale_fill_discrete(name = "Surived", labels = c("No", "Yes"))

#save table/graph
tab <- tbl_df(table(titanicData$embarked,titanicData$survived))

names(tab) <- c("Embarked","Survived","Count")

write_csv(x = tab, path = "titanicTable.csv", col_names = TRUE)

#by default ggsave saves last plot
#guesses file type by extension
ggsave(filename = "output/titanicBarPlot.png")
ggsave(filename = "output/titanicBarPlot.pdf")


#quantitative data
CO2 <- tbl_df(CO2)
CO2

mean(CO2$uptake)
#note you can easily get a trimmed mean
mean(CO2$uptake, trim = 0.05) #5% trimmed mean
median(CO2$uptake)

#quartiles and mean
summary(CO2$uptake)
var(CO2$uptake)
sd(CO2$uptake)
IQR(CO2$uptake)
quantile(CO2$uptake, probs = c(0.1, 0.2))
#combine
stats <- c(summary(CO2$uptake), var(CO2$uptake),
           sd(CO2$uptake), quantile(CO2$uptake, probs = c(0.1, 0.2)))
stats
str(stats)
attributes(stats)
#special names function
names(stats)[7:10] <- c("Var", "SD", "10thP", "20thP")
stats

cov(CO2$conc, CO2$uptake)
cor(CO2$conc, CO2$uptake)

#summaries by subsets of data
CO2 %>% group_by(Treatment) %>% summarise(avg = mean(uptake))
CO2 %>% group_by(Treatment) %>% summarise(med = median(uptake))
CO2 %>% group_by(Treatment) %>% summarise(var = var(uptake))

CO2 %>% group_by(Treatment, Type) %>% summarise(avg = mean(uptake))

#dot plots
g <- ggplot(CO2, aes(x = uptake))+
  geom_dotplot()

g <- ggplot(CO2, aes(x = uptake))+
  geom_dotplot(col = "Blue")

g <- ggplot(CO2, aes(x = uptake))+
  geom_dotplot(aes(col = Treatment))

g <- ggplot(CO2, aes(x = uptake))+
  geom_dotplot(aes(col = Treatment),
               stackgroups = TRUE, method = "histodot",
               binpositions = "all",stackdir = "down")

#histogram/density
g <- ggplot(CO2, aes(x = uptake))+
  geom_histogram()

g <- ggplot(CO2, aes(x = uptake))+
  geom_histogram(color = "blue", fill = "red", linetype = "dashed",
                 size = 2,binwidth = 3)

g <- ggplot(CO2, aes(x = uptake))+
  geom_density()

g <- ggplot(CO2, aes(x = uptake))+
  geom_density(adjust = 0.25, alpha = 0.5, aes(fill = Treatment))

g <- ggplot(CO2, aes(x = uptake))+
  geom_histogram(aes(y = ..density.., fill = Treatment))+
  geom_density(adjust = 0.25, alpha = 0.5, aes(fill = Treatment)) 

#ecdf
g <- ggplot(CO2, aes(x = uptake))+
  stat_ecdf(geom = "step")

g <- ggplot(CO2, aes(x = uptake, color = Treatment)) +
  stat_ecdf(geom = "step") +
  ylab("ECDF")

#scatter plots
scoresFull <- read_csv("https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/scoresFull.csv")
scoresFull

g <- ggplot(scoresFull, aes(x = homeRushYds, y = HFinal)) +
  geom_point()

g <- ggplot(scoresFull, aes(x = homeRushYds, y = HFinal)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(method = lm, col = "Red") 

paste("Hi", "What", "Is", "Going", "On", "?", sep = " ")
paste("Hi", "What", "Is", "Going", "On", "?", sep = ".")

correlation <- cor(scoresFull$homeRushYds,scoresFull$HFinal)

g <- ggplot(scoresFull, aes(x = homeRushYds,y = HFinal)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(method = lm, col = "Red") + 
  geom_text(x = 315, y = 10, size = 5, label = paste0("Correlation = ", round(correlation, 2)))

g <- ggplot(scoresFull, aes(x = homeRushYds, y = HFinal)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(method = lm, col = "Red") + 
  geom_rug()

g <- ggplot(scoresFull, aes(x = homeRushYds, y = HFinal)) +
  geom_point()+
  facet_grid(. ~ surface)

g <- ggplot(scoresFull, aes(x = homeRushYds, y = HFinal))+
  geom_point()+  
  facet_grid(roof ~ surface)

g <- ggplot(scoresFull, aes(x = homeRushYds,y = HFinal)) +
  geom_point(aes(col = homeSpread), alpha = 0.3, size = 0.5) +  
  facet_grid(roof ~ surface)

pairs(select(scoresFull, Hturnovers, homeRushYds,
             homePassYds, HFinal), cex = 0.3)

Correlation <- cor(select(scoresFull, Hturnovers, homeRushYds,
                          homePassYds, HFinal), method = "spearman")
#install corrplot library
library(corrplot)
corrplot(Correlation, type = "upper",
         title = "Figure 2: Correlation matrix of variables.",
         tl.pos = "lt")
corrplot(Correlation, type = "lower", method = "number",
         add = TRUE, diag = FALSE, tl.pos = "n")

#install GGally
library(GGally)
ggpairs(iris, aes(colour = Species, alpha = 0.4))

#box and violin plots
g <- ggplot(scoresFull, aes(x = surface, y = homePassYds)) +
  geom_boxplot(fill = "grey")

g <- ggplot(scoresFull, aes(x = surface, y = homePassYds)) +
  geom_boxplot(fill = "grey") +
  geom_jitter(aes(col = roof), alpha = 0.3, size = 0.3) +
  stat_summary(fun.y = mean, geom = "line", 
               lwd = 1.5, aes(group = roof, col = roof))

g <- ggplot(scoresFull, aes(x = surface, y = homePassYds))+
  geom_violin(fill = "grey")

oneDate<-paste(scoresFull$date[1], scoresFull$season[1], sep = "-")
oneDate

library(lubridate)
as.Date(oneDate,"%d-%b-%Y")
as.Date(oneDate,"%d-%b-%Y")+1

scoresFull$date <- paste(scoresFull$date, scoresFull$season, sep = "-") %>% 
  as.Date("%d-%b-%Y")

subScores <- scoresFull %>% 
  filter(homeTeam %in% c("Pittsburgh Steelers", "Cleveland Browns",
                         "Baltimore Ravens", "Cincinnati Bengals")) %>% 
  group_by(season, homeTeam) %>%
  summarise(homeAvgYds = mean(homePassYds + homeRushYds))

subScores

g <- ggplot(subScores, aes(x = season, y = homeAvgYds, color = homeTeam)) +
  geom_line(lwd = 2)

#3d plots
install.packages("plot3Drgl")
library(plot3Drgl)

scatter3D(x = scoresFull$homeRushYds, y = scoresFull$awayRushYds,
          z = scoresFull$HFinal)

plotrgl()


#####################################################
##Basic Analyses

voting <- tbl_df(read.csv("datasets/counties.csv", header = TRUE))
voting

votePlot <- ggplot(voting, aes(x = college, y = income))
votePlot + 
  geom_point()+
  geom_text(x = 40, y = 15000, label = round(cor(voting$college, voting$income), 2))

#SLR
lm(income ~ college, data = voting)
fit <- lm(income ~ college, data = voting)

attributes(fit)
fit[[1]]
coefficients(fit)
fit$coefficients

fit[[2]]
residuals(fit)
fit$residuals

#no generic function for some things
rank(fit)
y(fit)
fit$rank

#ANOVA table (F tests)
anova(fit)

#coefficient type III tests
summary(fit)

plot(fit)

votePlot +
  geom_point() +
  geom_smooth(method = "lm") + 
  geom_smooth()

predict(fit, newdata = data.frame(college = c(40, 10)))
predict(fit, newdata = data.frame(college = c(40, 10)), se.fit = TRUE)
predict(fit, newdata = data.frame(college = c(40, 10)),
        se.fit = TRUE, interval = "confidence")
predict(fit, newdata = data.frame(college = c(40, 10)),
        se.fit = TRUE, interval = "prediction")

votePlot +
  geom_point(aes(col = region)) +
  geom_smooth(method = "lm", aes(col = region))

fits <- voting %>% group_by(region) %>% 
  do(model = lm(income ~ college, data = .))
names(fits)

fits$model[[1]]
fits$model[[2]]

#mlr
fit2<-lm(income ~ college + Perot, data = voting)
anova(fit2)
summary(fit2)
coef(fit2)
fit2$rank
plot(fit2)
predict(fit2, newdata = data.frame(college = 40, Perot = 20))
