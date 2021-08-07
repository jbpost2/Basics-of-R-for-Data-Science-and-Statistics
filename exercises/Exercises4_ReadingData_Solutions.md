Exercises 4 - Reading Data Solutions
================

## 4.1 Read data contained in an R package.

1.  Load the `dcData` and `tidyverse` packages. Use the

-   Note: `dcData` is installed from GitHub, so it requires an extra
    step. - `devtools::install_github("mdbeckman/dcData")`
-   this might take a while (30+ sec?) depending on your Internet
    connection After loading in the `dcData` package, read the
    `BabyNames` data from `dcData` into your R environment using the
    `data()` function as follows:  
    `data(BabyNames)`  
    Now you should see the `BabyNames` object in the Environment pane
    -   Double click the object name to open a spreadsheet View  
    -   Spreadsheet view includes basic sorting capability!

``` r
# devtools::install_github("mdbeckman/dcData")

library(tidyverse)  # this actually loads a group of packages all at once
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --

    ## v ggplot2 3.3.4     v purrr   0.3.4
    ## v tibble  3.1.2     v dplyr   1.0.7
    ## v tidyr   1.1.3     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(dcData)     
data(BabyNames)
#or
data("BabyNames", package = "dcData")
```

<hr>

## 4.2 Read a .csv file from the web

The file “BabyNameSupp.csv” includes a few years of more recent data to
augment the `BabyNames` data. The file can be downloaded straight to R
from the link here:

<https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv>

Read this file in using `read_csv()` from the `readr` package. Save the
data as an object called `BabyNamesSupp`.

Note: Reading the data **will** produce a warning message! Read the
warning message carefully; what seems to have gone wrong?

-   Open the spreadsheet view to investigate `BabyNamesSupp`  
-   Can you confirm what seems to have gone wrong during the data
    intake?

``` r
BabyNamesSupp <- read_csv("https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv")
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   name = col_character(),
    ##   sex = col_logical(),
    ##   count = col_double(),
    ##   year = col_double()
    ## )

    ## Warning: 84619 parsing failures.
    ##   row col           expected actual                                                                 file
    ## 19208 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19209 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19210 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19211 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## 19212 sex 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'
    ## ..... ... .................. ...... ....................................................................
    ## See problems(...) for more details.

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
