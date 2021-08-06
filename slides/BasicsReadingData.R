## ----setup, echo = FALSE, message = FALSE, warning = FALSE----------
library(tidyverse)
library(haven)
library(knitr)
library(RSQLite)
library(methods)
options(dplyr.print_min = 5)
options(tibble.print_min = 5)
options(dplyr.print_min = 5)
knitr::opts_chunk$set(echo = TRUE, eval = TRUE, message = FALSE, warning = FALSE)


## ---- fig.align = 'left', out.width = '205px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/rawData.png")


## ---- fig.align = 'left', out.width = '30px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/arrow.png")


## ---- fig.align = 'left', out.width = '205px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/ImportR.png")


## ---- fig.align = 'left', out.width = '30px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/arrow.png")


## ---- fig.align = 'left', out.width = '205px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/SummarizeR.png")


## ---- fig.align = 'left', out.width = '30px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/arrow.png")


## ---- fig.align = 'left', out.width = '205px', out.height = "249px", echo = FALSE----
knitr::include_graphics("../img/AnalysisR.png")


## ----calc2, echo=TRUE-----------------------------------------------
#simple math operations
# <-- is a comment - code not evaluated
3 + 7
10 * exp(3) #exp is exponential function
log(pi^2) #log is natural log by default


## ----basic, echo = TRUE, out.width = "400px", fig.align='center'----
mean(cars$speed)
hist(cars$speed)


## ----save,echo=TRUE-------------------------------------------------
#save for later
avg <- (5 + 7 + 6) / 3
#call avg object
avg
#strings (text) can be saved as well
words <- c("Hello there!", "How are you?")
words


## ----ls, echo = TRUE------------------------------------------------
ls()


## ----rm, echo = TRUE------------------------------------------------
rm(avg)
ls()


## ----builtin, echo = TRUE-------------------------------------------
letters
head(cars, n = 3)


## ----str1, echo = TRUE----------------------------------------------
class(cars)


## ----str2, echo = TRUE----------------------------------------------
class(exp)


## ----plot1, echo = TRUE, fig.align = 'center', out.width = '350px'----
plot(cars)


## ----plot2, echo = TRUE, fig.align = 'center', out.width = '350px'----
plot(exp)


## ---- echo = TRUE---------------------------------------------------
vec <- c(1, 4, 10)
vec


## ---- echo = TRUE---------------------------------------------------
fit <- lm(dist ~ speed, data = cars)
fit


## ---- echo = TRUE---------------------------------------------------
class(vec)
summary(vec)


## ---- echo = TRUE---------------------------------------------------
class(fit)
summary(fit)


## ----obj2, echo = TRUE----------------------------------------------
class(cars)


## ----obj3, echo = TRUE----------------------------------------------
typeof(cars)


## ----obj1, echo = TRUE----------------------------------------------
str(cars)


## ----vectorVis, echo = FALSE, fig.align='center', out.width = '650px', echo = FALSE----
knitr::include_graphics("../img/vectorVisualF.png")


## ----vecs-----------------------------------------------------------
#vectors (1 dimensional) objects
x <- c(17, 22, 1, 3, -3)
y <- c("cat", "dog", "bird", "frog")
x
y


## ----functionVis2, echo = FALSE, out.width = "800px", fig.align= 'center', echo = FALSE----
knitr::include_graphics("../img/funVisual2F.png")


## ----seq2-----------------------------------------------------------
v <- seq(from = 1, to = 5, by = 1)
v
str(v)


## ----seq3-----------------------------------------------------------
1:20 


## ----seq5-----------------------------------------------------------
1:20/20
1:20 + 1


## ----matrixVis, echo = FALSE, out.width = "500px", fig.align= 'center', echo = FALSE----
knitr::include_graphics("../img/matrixVisualF.png")


## ----popvec,echo=TRUE-----------------------------------------------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4


## ----popvec2,echo=TRUE----------------------------------------------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4


## ----checktype, echo = TRUE-----------------------------------------
#check 'type'
is.numeric(x)
is.numeric(y)
is.numeric(z)


## ----popvec3,echo=TRUE----------------------------------------------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4


## ----checktype2, echo = TRUE----------------------------------------
#check 'type'
is.numeric(x)
is.numeric(y)
is.numeric(z)


## ----checklength, echo = TRUE---------------------------------------
#check 'length'
length(x)
length(y)
length(z)


## ----mat1,echo=TRUE-------------------------------------------------
#populate vectors
x <- c(17, 3, 13, 11)
y <- rep(-3, times = 4)
z <- 1:4
#combine in a matrix
matrix(c(x, y, z), ncol = 3)


## ----mat2,echo=TRUE-------------------------------------------------
x <- c("Hi", "There", "Friend", "!")
y <- c("a", "b", "c", "d")
z <- c("One", "Two", "Three", "Four")
is.character(x)


## ----mat3, echo = TRUE----------------------------------------------
matrix(c(x, y, z), nrow = 6)


## ----dataset, out.width = "600px",echo=FALSE, fig.align='center', echo = FALSE----
knitr::include_graphics("../img/dataset.png")


## ----dfVis, echo = FALSE, out.width = "500px", fig.align= 'center', echo = FALSE----
knitr::include_graphics("../img/dfVisualF.png")


## ----df1,echo=TRUE--------------------------------------------------
x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
data.frame(x, y, z)


## ----df2,echo=TRUE,eval=TRUE----------------------------------------
data.frame(char = x, data1 = y, data2 = z)


## ----listVis, echo = FALSE, out.width = "600px", fig.align= 'center', echo = FALSE----
knitr::include_graphics("../img/listVisualF.png")


## ----list1,echo=TRUE------------------------------------------------
list(1:3, rnorm(2), c("!", "?"))


## ----list2,echo=TRUE------------------------------------------------
list(seq = 1:3, normVals = rnorm(2), punctuation = c("!", "?"))


## ----indexVec-------------------------------------------------------
letters #built-in vector


## -------------------------------------------------------------------
letters[1] #R starts counting at 1!


## -------------------------------------------------------------------
letters[26]


## ----indexVec2------------------------------------------------------
letters[1:4]
letters[c(5, 10, 15, 20, 25)]
x <- c(1, 2, 5); letters[x]


## ----indexVec3------------------------------------------------------
letters[-(1:4)]
x <- c(1, 2, 5); letters[-x]


## ----matindex-------------------------------------------------------
mat <- matrix(c(1:4, 20:17), ncol = 2)
mat


## ----matindex2------------------------------------------------------
mat
mat[c(2, 4), ]


## ----matindex3------------------------------------------------------
mat[, 1]
mat[2, ]
mat[2, 1]


## ----irisstr--------------------------------------------------------
str(iris)


## ----dfindex--------------------------------------------------------
iris[1:4, 2:4]


## ----dfindex1b------------------------------------------------------
iris[1, ]


## ----dfindex2-------------------------------------------------------
iris[ , c("Sepal.Length", "Species")]


## ----dfindex3-------------------------------------------------------
iris$Sepal.Length


## ----listindex1-----------------------------------------------------
x <- list("HI", c(10:20), 1)
x


## ----listindex1b----------------------------------------------------
x <- list("HI", c(10:20), 1)
x[2:3]


## ----listindex2-----------------------------------------------------
x <- list("HI", c(10:20), 1)
x[1]
x[[1]]


## ----listindex3-----------------------------------------------------
x[[2]]
x[[2]][4:5]


## ----listindex4-----------------------------------------------------
x <- list("HI", c(10:20), 1)
str(x)
x <- list(First = "Hi", Second = c(10:20), Third = 1)
x$Second


## ----dflist---------------------------------------------------------
str(x)
str(iris)


## ----dflist2--------------------------------------------------------
typeof(x)
typeof(iris)


## -------------------------------------------------------------------
iris[2]


## -------------------------------------------------------------------
iris[[2]]


## ----csv, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/commaDelim.png")


## ----space, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/spaceDelim.png")


## ----tab, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/tabDelim.png")


## ----general, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/generalDelim.png")


## ----loadR, fig.align = 'center', out.width = "250px", echo = FALSE----
include_graphics("../img/loadR.png")


## ---- eval = FALSE--------------------------------------------------
## install.packages("readr")


## ----install2, out.width = "700px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/packages.png")


## ----libreq1--------------------------------------------------------
library("tidyverse")


## ----readCSVex, eval = TRUE-----------------------------------------
#stats::filter(...) calls time-series function from stats package
dplyr::filter(iris, Species == "virginica")


## -------------------------------------------------------------------
getwd()


## ---- out.width = "800px",echo=FALSE--------------------------------
knitr::include_graphics("../img/setwd.png")


## ----setwd1,eval=FALSE----------------------------------------------
## setwd("C:/Users/jbpost2/repos/Basics-of-R-for-Data-Science-and-Statistics/datasets")
## #or
## setwd("C:\\Users\\jbpost2\\repos\\camp\\Basics-of-R-for-Data-Science-and-Statistics\\datasets")
## #better to use R projects!


## ---- eval = TRUE---------------------------------------------------
neuralgiaData <- read_csv("neuralgia.csv")
neuralgiaData


## ---- echo = TRUE, eval = FALSE-------------------------------------
## neuralgiaData <- read_csv(
## "C:/Users/jbpost2/repos/Basics-of-R-for-Data-Science-and-Statistics/datasets/neuralgia.csv"
##            )


## ---- eval = FALSE--------------------------------------------------
## neuralgiaData <- read_csv("../datasets/neuralgia.csv")


## ----project.png, out.width = "600px",echo=FALSE, fig.align = 'center'----
knitr::include_graphics("../img/project.png")


## ---- eval = TRUE---------------------------------------------------
neuralgiaData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")
neuralgiaData


## ----class----------------------------------------------------------
class(neuralgiaData)


## ----simplify-------------------------------------------------------
neuralgiaData2 <- as.data.frame(neuralgiaData)
neuralgiaData2[,1]
neuralgiaData[,1]


## ----pull-----------------------------------------------------------
pull(neuralgiaData, Treatment) #or pull(neuralgiaData, 1)
neuralgiaData$Treatment 


## ----readSpace------------------------------------------------------
read_table2("https://www4.stat.ncsu.edu/~online/datasets/chemical.txt")


## ----readTab--------------------------------------------------------
read_tsv("https://www4.stat.ncsu.edu/~online/datasets/crabs.txt")


## ----readGeneral----------------------------------------------------
read_delim("https://www4.stat.ncsu.edu/~online/datasets/umps2012.txt", 
           delim = ">",
           col_names = c("Year", "Month", "Day", "Home", "Away", "HPUmpire"))


## ---- warning = FALSE-----------------------------------------------
#install package if necessary
library(readxl)
#reads first sheet by default
edData <- read_excel("../datasets/censusEd.xlsx")
edData


## -------------------------------------------------------------------
excel_sheets("../datasets/censusEd.xlsx")


## ---- eval = FALSE--------------------------------------------------
## read_excel("../datasets/censusEd.xlsx", sheet = "EDU01D")


## ----eval=TRUE------------------------------------------------------
#install if necessary
library(haven)
smokeData <- read_sas("https://www4.stat.ncsu.edu/~online/datasets/smoke2003.sas7bdat")
smokeData


## ----eval=TRUE------------------------------------------------------
bodyFatData <- read_spss("https://www4.stat.ncsu.edu/~online/datasets/bodyFat.sav")
bodyFatData


## ---- fig.align='center', out.width="75%", echo = FALSE-------------
knitr::include_graphics("../img/tidyverse.png")


## ---- eval = FALSE--------------------------------------------------
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


## ---- fig.align='center', out.width="75%", echo = FALSE-------------
knitr::include_graphics("../img/dates.PNG")


## ---- echo = TRUE, eval = FALSE-------------------------------------
## library(httr)
## GET("http://newsapi.org/v2/everything?qlnTitle=Juneteenth&from=2021-06-01&language=en&
##     apiKey=myKeyGoesHere")


## ---- echo = FALSE--------------------------------------------------
library(httr)
myData <- GET("http://newsapi.org/v2/everything?qInTitle=tesla&from=2021-06-01&language=en&pageSize=100&apiKey=aa4b545bfbd64d4bb22ba0cb9f78189c")


## ---- echo = TRUE---------------------------------------------------
str(myData, max.level = 1)


## ---- echo = TRUE, message = FALSE----------------------------------
library(dplyr)
library(jsonlite)
parsed <- fromJSON(rawToChar(myData$content))
str(parsed, max.level = 1)


## ---- out.width = "650px", echo = FALSE, fig.align='center', fig.cap= "Source: oreilly.com"----
knitr::include_graphics("../img/lahman.jpg")


## ---- eval = FALSE--------------------------------------------------
## con <- DBI::dbConnect(RMySQL::MySQL(),
##   host = "hostname.website",
##   user = "username",
##   password = rstudioapi::askForPassword("DB password")
## )


## ---- eval = FALSE--------------------------------------------------
## tbl(con, "name_of_table")

