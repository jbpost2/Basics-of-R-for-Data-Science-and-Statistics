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

