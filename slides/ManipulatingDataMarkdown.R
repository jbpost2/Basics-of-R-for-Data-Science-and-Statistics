## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
options(dplyr.print_min = 5)
options(tibble.print_min = 5)
library(knitr)
library(htmlwidgets)
opts_chunk$set(message = FALSE, cache = TRUE, warning = FALSE)


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


## ---- echo = FALSE, fig.align='center', out.width = "500px"----
knitr::include_graphics("../img/filterVisualF.png")


## ---- echo = FALSE, fig.align='center', out.width = "400px"----
knitr::include_graphics("../img/selectVisualF.png")


## ---- echo = FALSE, fig.align='center', out.width = "520px"----
knitr::include_graphics("../img/createVarVisualF.png")


## ----startMD.png, out.width = "700px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMD.png")


## ----startMDDoc.png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMDDoc.png")


## ----startMDPres.png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMDPres.png")


## ----startMDShiny.png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMDShiny.png")


## ----chunk_png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/chunk.png")


## ---- fig.align='center', message = FALSE, out.width=275, echo = FALSE----
knitr::include_graphics("../img/codeChunkGear.PNG")


## ---- echo = FALSE, fig.align='center'----
knitr::include_graphics("../img/compile.png")


## ----knit, echo=FALSE, fig.align='center', out.width='150px'----
knitr::include_graphics("../img/knit.png")


## ----eval=TRUE---------------------
#install.packages("Lahman")
library(Lahman)
head(Batting, n = 4) #look at just first 4 observations


## ----eval=TRUE---------------------
myBatting <- as_tibble(Batting); myBatting


## ---- echo = FALSE, fig.align='center', out.width = "500px"----
knitr::include_graphics("../img/filterVisualF.png")


## ----------------------------------
"hi" == " hi" #== is comparison
"hi" == "hi"
4 >= 1


## ----------------------------------
4 != 1
sqrt(3)^2  == 3
dplyr::near(sqrt(3)^2, 3)


## ----------------------------------
#use of is. functions
is.numeric("Word")
is.numeric(10)


## ----------------------------------
is.character("10")
is.na(c(1:2, NA, 3))
is.matrix(c("hello", "world"))


## ----------------------------------
myBatting$G > 20 #vector indicating Games > 20


## ----------------------------------
filter(myBatting, G > 20)


## ----------------------------------
(myBatting$G > 20) & (myBatting$yearID == 2015)


## ----------------------------------
filter(myBatting, (G > 20) & (yearID == 2015))


## ----------------------------------
filter(myBatting, teamID %in% c("ATL", "PIT", "WSH"))


## ----------------------------------
#reorder by teamID
arrange(myBatting, teamID)


## ----------------------------------
#get secondary arrangement as well
arrange(myBatting, teamID, G)


## ----------------------------------
#descending instead
arrange(myBatting, teamID, desc(G))


## ---- echo = FALSE, fig.align='center', out.width = "400px"----
knitr::include_graphics("../img/selectVisualF.png")


## ----------------------------------
#Choose a single column by name
select(myBatting, X2B)


## ----------------------------------
#Choose a single column by name
select(myBatting, playerID, X2B)


## ----------------------------------
arrange(select(filter(myBatting, teamID == "PIT"), playerID, G, X2B), desc(X2B))


## ----------------------------------
myBatting %>% 
  filter(teamID == "PIT") %>% 
  select(playerID, G, X2B) %>% 
  arrange(desc(X2B)) 


## ----------------------------------
#all columns between
myBatting %>% 
  select(X2B:HR)


## ----------------------------------
#all columns containing
myBatting %>% 
  select(contains("X"))


## ----------------------------------
#all columns starting with
myBatting %>% 
  select(starts_with("X"))


## ----------------------------------
#multiple selections
myBatting %>% 
  select(starts_with("X"), ends_with("ID"), G)


## ----------------------------------
#reorder
myBatting %>% 
  select(playerID, HR, everything())


## ----------------------------------
#rename our previous
myBatting %>% 
  select(starts_with("X"), ends_with("ID"), G) %>% 
  rename("Doubles" = X2B, "Triples" = X3B)


## ---- echo = FALSE, fig.align='center', out.width = "500px"----
knitr::include_graphics("../img/createVarVisualF.png")


## ----------------------------------
temp <- cbind(iris, extra = rep("a", 150))
str(temp)


## ----------------------------------
iris$extra <- rep("a", 150)
str(iris)


## ----eval=TRUE---------------------
library(fivethirtyeight)
fandango


## ----------------------------------
##Create an average rottentomatoes score variable
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2)


## ----------------------------------
#can't see it!
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2) %>% 
  select(film, year, avgRotten, everything())


## ----------------------------------
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
         avgMeta = (metacritic_norm + metacritic_user_nom)/2) %>%
  select(film, year, avgRotten, avgMeta, everything())


## ----------------------------------
fandango %>% 
  select(rottentomatoes) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ----------------------------------
fandango %>% 
  select(year, rottentomatoes) %>% 
  group_by(year) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ----------------------------------
fandango %>% 
  select(rottentomatoes) %>% 
  mutate(cumulativeSum = cumsum(rottentomatoes))


## ----eval=FALSE--------------------
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


## ----eval=FALSE--------------------
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


## ----------------------------------
myAirquality <- as_tibble(airquality)
myAirquality


## ---- error = TRUE, message = TRUE, warning = TRUE----
if(airquality$Wind >= 15) { 
  "High Wind"
  }


## ----------------------------------
myAirquality <- myAirquality %>% 
  mutate(Status = if_else(Wind >= 15, "HighWind",
                          if_else(Wind >= 10, "Windy",
                                  if_else(Wind >= 6, "LightWind", "Calm"))))
myAirquality


## ---- out.width="450px", echo = FALSE, fig.align='center'----
knitr::include_graphics("../img/longWideF.png")


## ---- eval = FALSE-----------------
## tempsData <- read_table2(file = "https://www4.stat.ncsu.edu/~online/datasets/cityTemps.txt")
## tempsData

## ---- echo = FALSE-----------------
tempsData <- read_table2(file = "../datasets/cityTemps.txt")
tempsData


## ---- echo = FALSE-----------------
tempsData


## ----------------------------------
tempsData %>% pivot_longer(cols = 2:8, names_to = "day", values_to = "temp")


## ----------------------------------
newTempsData <- tempsData %>% 
  pivot_longer(cols = sun:sat, names_to = "day", values_to = "temp")
newTempsData


## ----------------------------------
newTempsData %>% 
  pivot_wider(names_from = "day", values_from = "temp")


## ---- out.width="650px", echo = FALSE, fig.align='center'----
knitr::include_graphics("../img/uniteSeparateF.png")


## ---- eval = FALSE-----------------
## chicagoData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/Chicago.csv")
## chicagoData

## ---- echo = FALSE-----------------
chicagoData <- read_csv("../datasets/Chicago.csv")
chicagoData


## ----------------------------------
chicagoData %>% 
  separate(date, c("Month", "Day", "Year"), sep = "/", convert = TRUE, remove = FALSE)


## ----------------------------------
chicagoData %>% 
  separate(date, c("Month", "Day", "Year"), sep = "/", convert = TRUE, remove = FALSE) %>% 
  unite(MonthDay, Month, Day, sep = "-")

