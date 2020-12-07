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

