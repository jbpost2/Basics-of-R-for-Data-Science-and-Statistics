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

