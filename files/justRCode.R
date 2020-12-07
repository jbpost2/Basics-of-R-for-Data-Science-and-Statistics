#####################################################
##Just the R code in lectures from course:
##Introduction to Data Science using R
##Justin Post 
#####################################################

#####################################################
##Part I
#####################################################

## ----echo=FALSE,message=FALSE, warning = FALSE----
library(tidyverse)

## ----calc2, echo=TRUE-------
#simple math operations
# <-- is a comment - code not evaluated
3 + 7
10 * exp(3) #exp is exponential function
log(pi^2) #log is natural log by default


## ----basic, echo = TRUE, out.width = "400px", fig.align='center'----
mean(cars$speed)
hist(cars$speed)


## ----save,echo=TRUE---------
#save for later
avg <- (5 + 7 + 6) / 3
#call avg object
avg
#strings (text) can be saved as well
words <- c("Hello there!", "How are you?")
words


## ----ls, echo = TRUE--------
ls()


## ----rm, echo = TRUE--------
rm(avg)
ls()


## ----builtin, echo = TRUE----
letters
head(cars, n = 3)


## ----str1, echo = TRUE------
class(cars)


## ----str2, echo = TRUE------
class(exp)


## ----plot1, echo = TRUE, fig.align = 'center', out.width = '350px'----
plot(cars)


## ----plot2, echo = TRUE, fig.align = 'center', out.width = '350px'----
plot(exp)


## ----create, echo = TRUE----
vec <- c(1, 4, 10)
class(vec)

fit <- lm(dist ~ speed, data = cars)
class(fit)


## ----obj2, echo = TRUE------
class(cars)


## ----obj3, echo = TRUE------
typeof(cars)


## ----obj1, echo = TRUE------
str(cars)



## ----vecs-------------------
#vectors (1 dimensional) objects
x <- c(17, 22, 1, 3, -3)
y <- c("cat", "dog", "bird", "frog")
x
y



## ----seq1-------------------
v <- seq(from = 1, to = 5, by = 1)
v


## ----seq2-------------------
v <- seq(from = 1, to = 5, by = 1)
v
str(v)


## ----seq3-------------------
1:20 


## ----seq5-------------------
1:20/20
1:20 + 1




## ----popvec,echo=TRUE-------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4


## ----popvec2,echo=TRUE------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4


## ----checktype, echo = TRUE----
#check 'type'
is.numeric(x)
is.numeric(y)
is.numeric(z)


## ----popvec3,echo=TRUE------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4


## ----checktype2, echo = TRUE----
#check 'type'
is.numeric(x)
is.numeric(y)
is.numeric(z)


## ----checklength, echo = TRUE----
#check 'length'
length(x)
length(y)
length(z)


## ----mat1,echo=TRUE---------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4
#combine in a matrix
matrix(c(x, y, z), ncol = 3)


## ----mat2,echo=TRUE---------
x <- c("Hi", "There", "Friend", "!")
y <- c("a", "b", "c", "d")
z <- c("One", "Two", "Three", "Four")
is.character(x)


## ----mat3, echo = TRUE------
matrix(c(x, y, z), nrow = 6)



## ----df1,echo=TRUE----------
x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
data.frame(x, y, z)


## ----df2,echo=TRUE,eval=TRUE----
data.frame(char = x, data1 = y, data2 = z)



## ----list1,echo=TRUE--------
list(1:3, rnorm(2), c("!", "?"))


## ----list2,echo=TRUE--------
list(seq = 1:3, normVals = rnorm(2), punctuation = c("!", "?"))


## ----indexVec---------------
letters #built-in vector


## ---------------------------
letters[1] #R starts counting at 1!


## ---------------------------
letters[26]


## ----indexVec2--------------
letters[1:4]
letters[c(5, 10, 15, 20, 25)]
x <- c(1, 2, 5); letters[x]


## ----indexVec3--------------
letters[-(1:4)]
x <- c(1, 2, 5); letters[-x]


## ----matindex---------------
mat <- matrix(c(1:4, 20:17), ncol = 2)
mat


## ----matindex2--------------
mat
mat[c(2, 4), ]


## ----matindex3--------------
mat[, 1]
mat[2, ]
mat[2, 1]


## ----matindex4,eval=FALSE----
## mat <- matrix(c(1:4, 20:17), ncol = 2,
##         ###<b>
##           dimnames = list(NULL,
##                 c("First", "Second"))
##         ###</b>
##         )
## mat

## ----matindex5,echo=FALSE----
mat<-matrix(c(1:4,20:17),ncol=2,
            dimnames=list(NULL,
                          c("First","Second")))
mat


## ----matindex6--------------
mat[, "First"]


## ----matindex7, error = TRUE----
mat[-c(1,3), -"First"]


## ----matindex8, error = TRUE----
mat[-c(1,3), "First"]


## ----irisstr----------------
str(iris)


## ----dfindex----------------
iris[1:4, 2:4]


## ----dfindex1b--------------
iris[1, ]


## ----dfindex2---------------
iris[ , c("Sepal.Length", "Species")]


## ----dfindex3---------------
iris$Sepal.Length


## ----listindex1-------------
x <- list("HI", c(10:20), 1)
x


## ----listindex1b------------
x <- list("HI", c(10:20), 1)
x[2:3]


## ----listindex2-------------
x <- list("HI", c(10:20), 1)
x[1]
x[[1]]


## ----listindex3-------------
x[[2]]
x[[2]][4:5]


## ----listindex4-------------
x <- list("HI", c(10:20), 1)
str(x)
x <- list(First = "Hi", Second = c(10:20), Third = 1)
x$Second


## ----dflist-----------------
str(x)
str(iris)


## ----dflist2----------------
typeof(x)
typeof(iris)


## ----listindex5-------------
iris[[2]]


## ---------------------------
iris$Sp


## ---------------------------
iris[["Petal.Len", exact = FALSE]]




#####################################################
##Part II
#####################################################


## ----echo=FALSE,warning=FALSE,message=FALSE----
library(tidyverse)
library(haven)
library(knitr)
library(RSQLite)
library(methods)




## ----readCSVhidden, echo = FALSE, eval = TRUE----
neuralgiaData <- read.csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")


## ----readCSV, echo = TRUE, eval = FALSE----
## neuralgiaData <- read.csv(
##            "C:/repos/DataScienceR/datasets/neuralgia.csv"
##            )


## ----printCSV---------------
head(neuralgiaData)


## ----getwd------------------
getwd()


## ----setwd1,eval=FALSE------
## setwd("C:/repos/DataScienceR/datasets")
## #or
## setwd("C:\\repos\\DataScienceR\\datasets")



## ----readCSVrel, eval = FALSE----
## neuralgiaData <- read.csv("datasets/neuralgia.csv")


## ----readCSV2, eval = TRUE----
neuralgiaData <- read.csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")
head(neuralgiaData)



## ----install1, eval=FALSE----
## install.packages("readr")
## #can do multiple packages at once
## install.packages(c("readr", "readxl", "haven", "DBI", "httr"))



## ----libreq1----------------
library("readr")
require("haven")


## ----libreq2,error=TRUE,warning=TRUE----
library("notAPackage")
require("notAPackage")


## ----tidy, eval=FALSE-------
## install.packages("tidyverse")


## ----tidy2, eval=FALSE------
## install.packages("tidyverse")


## ----loadTidy, message = TRUE----
library(tidyverse)


## ----readCSVex, eval = TRUE----
dplyr::filter(neuralgiaData, Treatment == "P")


## ----readCSVex2, eval = TRUE, message = TRUE----
neuralgiaData2 <- readr::read_csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")


## ----viewData---------------
neuralgiaData2


## ----class------------------
class(neuralgiaData2)


## ----simplify---------------
neuralgiaData[,1]
neuralgiaData2[,1]


## ----pull-------------------
pull(neuralgiaData2, 1) #or pull(neuralgiaData2, Treatment)
neuralgiaData2$Treatment 


## ----helpcsv, eval = FALSE----
## help(read_csv)


## ----readSpace--------------
read_table2("https://www4.stat.ncsu.edu/~online/datasets/chemical.txt")


## ----readTab----------------
read_tsv("https://www4.stat.ncsu.edu/~online/datasets/crabs.txt")


## ----readGeneral------------
read_delim("https://www4.stat.ncsu.edu/~online/datasets/umps2012.txt", delim = ">",
           col_names = c("Year", "Month", "Day", "Home", "Away", "HPUmpire"))


## ---- warning = FALSE-------
#install package if necessary
library(readxl)
#reads first sheet by default
edData <- read_excel("datasets/censusEd.xlsx")
edData


## ---------------------------
excel_sheets("datasets/censusEd.xlsx")


## ---- eval = FALSE----------
## read_excel("datasets/censusEd.xlsx", sheet = "EDU01D")


## ---------------------------
edData <- read_excel("datasets/censusEd.xlsx", sheet = "EDU01A", 
                     range = cell_cols("A:D"))
edData


## ----eval=TRUE--------------
#install if necessary
library(haven)
smokeData <- read_sas("https://www4.stat.ncsu.edu/~online/datasets/smoke2003.sas7bdat")
smokeData


## ---------------------------
str(smokeData)


## ---------------------------
attr(smokeData$SDDSRVYR, "label")


## ----eval=TRUE--------------
bodyFatData <- read_spss("https://www4.stat.ncsu.edu/~online/datasets/bodyFat.sav")
bodyFatData


## ----eval=FALSE-------------
## write_csv(x = smokeData,
##           path = "C:/repos/DataScienceR/datasets/smokeData.csv")


## ----eval=FALSE-------------
## write_csv(x = bodyFatData,
##           path = "C:/repos/DataScienceR/datasets/smokeData.csv",
##           append = TRUE)


## ---- eval = FALSE----------
## {
##   {
##     "name": "Barry Sanders"
##     "games" : 153
##     "position": "RB"
##   },
##   {
##     "name": "Joe Montana"
##     "games": 192
##     "position": "QB"
##   }
## }



## ---------------------------
baseURL <- "https://www.potterapi.com/v1/"
value <- "spells?"
key <- "key=$2a$10$UMvDCH.93fa2KOjKbJYkOOPMNzdzQpJ0gMnVEtcHzW5Ic04HUmcsa"
URL <- paste0(baseURL, value, key)
#spellData <- RCurl::getURL(URL) #Website currently down...


## ---- warning = FALSE, message = FALSE, eval = FALSE----
## spellDataDF <- jsonlite::fromJSON(spellData)
## as_tibble(spellDataDF)




## ---- eval = FALSE----------
## con <- DBI::dbConnect(RMySQL::MySQL(),
##   host = "hostname.website",
##   user = "username",
##   password = rstudioapi::askForPassword("DB password")
## )


## ---- eval = FALSE----------
## tbl(con, "name_of_table")


## ---- eval = FALSE----------
## #devtools::install_github("r-dbi/bigrquery")
## library(DBI)
## con <- dbConnect(
##   bigrquery::bigquery(),
##   project = "publicdata",
##   dataset = "samples",
##   billing = "your-project-id-here"
##   )


## ---- eval = FALSE----------
## dbListTables(con)
## natality <- tbl(con, "natality")
## 
## natality %>%
##   select(starts_with("mother"), year, cigarette_use, weight_pounds) %>%
##   collect()
## 
## dbDisconnect(con)




#####################################################
##Part III
#####################################################


## ----echo=FALSE,warning=FALSE,message=FALSE----
library(tidyverse)
library(haven)
rm(iris)



## ---------------------------
"hi" == " hi" #== is comparison
"hi" == "hi"
4 >= 1


## ---------------------------
4 != 1
sqrt(3)^2  == 3
dplyr::near(sqrt(3)^2, 3)


## ---------------------------
#use of is. functions
is.numeric("Word")
is.numeric(10)


## ---------------------------
is.character("10")
is.na(c(1:2, NA, 3))
is.matrix(c("hello", "world"))


## ---------------------------
iris <- as_tibble(iris)
iris


## ---------------------------
head(iris)


## ----eval=FALSE-------------
## iris[iris$Species == "setosa", ]


## ---------------------------
iris$Species == "setosa" #vector indicating setosa values


## ---------------------------
iris[iris$Species == "setosa", ]


## ---------------------------
subset(iris, Species == "setosa")


## ---------------------------
filter(iris, Species == "setosa")


## ---------------------------
#coerce numeric to string
c("hi", 10)
#coerce TRUE/FALSE to numeric
c(TRUE, FALSE) + 0


## ---------------------------
#logical to character
c(TRUE, "hi")


## ---------------------------
as.numeric(c(TRUE, FALSE, TRUE))
mean(c(TRUE, FALSE, TRUE))


## ---------------------------
as.character(c(1, 2, 3.5, TRUE))


## ---------------------------
set.seed(3)
x <- runif(n = 10, min = 0, max = 1); x
(x < 0.25) | (x > 0.75)
(x < 0.25) || (x > 0.75)


## ---------------------------
filter(iris, (Petal.Length > 1.5) & (Petal.Width > 0.3) & 
         (Species == "setosa"))


## ---------------------------
(iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) &
  (iris$Species == "setosa")


## ---------------------------
filter(iris, (Petal.Length > 1.5) & (Petal.Width > 0.3) & 
         (Species == "setosa"))


## ---- eval = FALSE----------
## iris[(iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) &
##          (iris$Species == "setosa"), ]


## ----eval=TRUE--------------
#install.packages("Lahman")
library(Lahman)
head(Batting, n = 4) #look at just first 4 observations


## ---------------------------
Batting <- as_tibble(Batting)
Batting


## ---------------------------
filter(Batting, teamID == "PIT")


## ---------------------------
filter(Batting, teamID == "PIT" & yearID == 2000)


## ---------------------------
#reorder by teamID
arrange(Batting, teamID)


## ---------------------------
#get secondary arrangement as well
arrange(Batting, teamID, G)


## ---------------------------
#descending instead
arrange(Batting, teamID, desc(G))



## ---------------------------
#Choose a single column by name
select(Batting, X2B)


## ---------------------------
#Choose a single column by name
select(Batting, playerID, X2B)


## ---------------------------
arrange(select(filter(Batting, teamID == "PIT"), playerID, G, X2B), desc(X2B))


## ---------------------------
Batting %>% filter(teamID == "PIT") %>% select(playerID, G, X2B) %>% arrange(desc(X2B)) 


## ---------------------------
#all columns between
Batting %>% select(X2B:HR)


## ---------------------------
#all columns containing
Batting %>% select(contains("X"))


## ---------------------------
#all columns starting with
Batting %>% select(starts_with("X"))


## ---------------------------
#multiple selections
Batting %>% select(starts_with("X"), ends_with("ID"), G)


## ---------------------------
#reorder
Batting %>% select(playerID, HR, everything())


## ---------------------------
#rename our previous
Batting %>% 
  select(starts_with("X"), ends_with("ID"), G) %>% 
  rename("Doubles" = X2B, "Triples" = X3B)




## ---------------------------
temp <- cbind(iris, extra = rep("a", 150))
str(temp)


## ---------------------------
iris$extra <- rep("a", 150)
str(iris)


## ----eval=TRUE--------------
library(fivethirtyeight)
fandango


## ---------------------------
##Create an average rottentomatoes score variable
fandango %>% mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2)


## ---------------------------
#can't see it!
fandango %>% mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2) %>% 
  select(film, year, avgRotten, everything())


## ---------------------------
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
         avgMeta = (metacritic_norm + metacritic_user_nom)/2) %>%
  select(film, year, avgRotten, avgMeta, everything())


## ---------------------------
#transmute will keep the new variable(s) only
fandango %>% transmute(avgRotten = (rottentomatoes + rottentomatoes_user)/2)


## ---------------------------
#transmute will keep the new variable(s) only
fandango %>% transmute(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
                       avgMeta = (metacritic_norm + metacritic_user_nom)/2) 


## ---------------------------
fandango %>% select(rottentomatoes) %>% mutate(cumulativeSum = cumsum(rottentomatoes))


## ---------------------------
fandango %>% select(rottentomatoes) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ---------------------------
fandango %>% select(year, rottentomatoes) %>% 
  group_by(year) %>% mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ----eval=FALSE-------------
## if (condition) {
##   then execute code
## }
## 
## #if then else
## if (condition) {
##   execute this code
## } else {
##   execute this code
## }


## ----eval=FALSE-------------
## #Or more if statements
## if (condition) {
##   execute this code
## } else if (condition2) {
##   execute this code
## } else if (condition3) {
##   execute this code
## } else {
##   #if no conditions met
##   execute this code
## }


## ---------------------------
#silly example
a <- 5
if (a < 10){
  print("hi")
}


## ---------------------------
if (a < 10){
  print("hi")
} else if (a < 40){
  print("goodbye")
} else {
  print("aloha")
}


## ---------------------------
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


## ---------------------------
#silly example
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


## ---------------------------
airquality <- as_tibble(airquality)
airquality


## ---- error = TRUE, message = TRUE, warning = TRUE----
if(airquality$Wind >= 15) { 
  "High Wind"
}


## ----eval=FALSE-------------
## ifelse(vector_condition, if_true_do_this, if_false_do_this)


## ---------------------------
ifelse(airquality$Wind >= 15, "HighWind",
       ifelse(airquality$Wind >= 10, "Windy",
              ifelse(airquality$Wind >= 6, "LightWind", "Calm")))


## ---------------------------
mutate(airquality, status = ifelse(airquality$Wind >= 15, "HighWind",
                                   ifelse(airquality$Wind >= 10, "Windy",
                                          ifelse(airquality$Wind >= 6, "LightWind", "Calm")))
)


## ---- warning = FALSE-------
# create two simple data frames
a <- data_frame(color = c("green", "yellow", "red"), num = 1:3)
b <- data_frame(color = c("green", "yellow", "pink"), size = c("S", "M", "L"))


## ---------------------------
a


## ---------------------------
b


## ---------------------------
a


## ---------------------------
b


## ---------------------------
inner_join(a, b)


## ---------------------------
a


## ---------------------------
b


## ---------------------------
full_join(a, b)


## ---------------------------
a


## ---------------------------
b


## ---------------------------
left_join(a, b)


## ---------------------------
a


## ---------------------------
b


## ---------------------------
right_join(a, b)


## ---------------------------
right_join(a,b)


## ---------------------------
left_join(b, a)


## ---------------------------
a


## ---------------------------
b


## ---------------------------
semi_join(a, b)


## ---------------------------
a


## ---------------------------
b


## ---------------------------
anti_join(a, b)


## ---------------------------
b <- b %>% rename(col = color)
a


## ---------------------------
b


## ---------------------------
a


## ---------------------------
b


## ---------------------------
inner_join(a, b, 
           by = c("color" = "col"))





#####################################################
##Part IV
#####################################################


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

