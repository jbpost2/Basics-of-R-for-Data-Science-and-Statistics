What’s in a Name?? (Part 4 Solutions)
================
Matthew Beckman & Justin Post
June 25, 2021

<hr>

Here, we join an analysis already in progress…

-   Part 1 (RStudio IDE Scavenger Hunt) has been omitted from the
    following analysis.
-   Part 2 (Import Data) and Part 3 (R Markdown) have been blended for
    the purposes of our investigation
-   **Part 4 (Data Wrangling) Exercises Follow**

<hr>

# Names to be investigated

<hr>

We’re investigating the popularity of names in the US each year. Matt
has chosen to investigate the names of each person in his immediate
family: Matthew, Sarah, Eden, Jack, and Hazel. They’re his favorite
people, and also his favorite names! He’s feeling torn about how to
include his son Jack in the analysis. Jack’s legal name is “Jon” but he
is nearly always called “Jack”–the spelling of “Jon” honors Scandinavian
heritage on both sides of the family, and the nickname “Jack”
specifically honors his great-grandfather.

Some famous persons by each name of the family include:

-   Sarah Jessica Parker
-   Eden Hazard
-   Jack (Jackie) Robinson
-   Hazel Findlay
-   Richard Stallman. Seriously, the first hit of an Internet search for
    “famous Matthew” was Richard Stallman (!) whose given name is…
    Matthew. “Matthew the Apostle” (Matt’s namesake) was third on that
    particular list: <https://playback.fm/people/first-name/matthew>

This document was last modified 2021-06-25 10:28:47.

<hr>

# Part 4. Data wrangling

<hr>

## 4.1 Combine our Data Sets with `dplyr::bind_rows( )`

<hr>

-   **Task 1:** use the starter code below to read the 2020 data:

``` r
BabyNames2020 <- 
  read_csv("https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt", 
           col_names = FALSE, col_types = cols(X2 = col_character()))
```

-   **Task 2:** the starter code from Task 4.1.1 includes a hint to
    correct the issue discovered when reading the `BabyNamesSupp` csv
    data file. Can you fix the issue with the `sex` column type?

-   **Task 3:** before we combine our three data sources, let’s align
    them such that all three data sources are organized to include the
    same variables/columns, with the same names. Namely, the variables
    in the 2020 data should be renamed, and it needs a new variable to
    reflect the year (2020) for all rows. Note: the order of the columns
    are not important, as long as they have identical names in each data
    set to be combined.

-   **Task 4:** use `bind_rows()` to combine `BabyNames` &
    `BabyNamesSupp` & the 2020 data

<hr>

### Solution

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
    ## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.5.0

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(dcData)

data("BabyNames", package = "dcData")

# Task 4.1.2
BabyNamesSupp <- 
  read_csv("https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv",
           col_types = cols(sex = col_character()))  # fixes `sex`
    
# Tasks 4.1.1 & Task 4.1.3
BabyNames2020 <- 
    read_csv("https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt", 
             col_names = FALSE, col_types = cols(X2 = col_character())) %>%
    rename(name = X1, sex = X2, count = X3) %>%  # rename solution to Task 4.1.3
    mutate(year = 2020)                          # year solution to Task 4.1.3

# Task 4.1.4
BabyNamesFull <- bind_rows(BabyNames, BabyNamesSupp, BabyNames2020)
```

<hr>

## 4.2 Data Wrangling and Summaries

-   **Task 1:** filter the data to include only the names you wish to
    investigate

-   **Task 2:** for each name, compute the total frequency across all
    years of available data (1880 through 2020) and then arrange the
    results in descending order by total.

-   **Task 3:** for each combination of name AND sex, compute the total
    frequency across all years of available data (1880 through 2020) and
    then arrange the results by name.

-   **Task 4:** filter the year you joined your current institution (or
    any specific, meaningful year you like) and repeat tasks 2 and 3.

<hr>

### Solution

``` r
# vector of names
beckmans <- c("Matthew", "Sarah", "Eden", "Jack", "Hazel")

BabyNamesFull %>%
    filter(name %in% beckmans) %>%                   # Task 4.2.1
    group_by(name) %>%                               # Task 4.2.2
    summarise(total = sum(count, na.rm = TRUE)) %>%  # Task 4.2.2
    arrange(desc(total))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["total"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"Matthew","2":"1622951"},{"1":"Sarah","2":"1086935"},{"1":"Jack","2":"714762"},{"1":"Hazel","2":"273991"},{"1":"Eden","2":"45777"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

``` r
BabyNamesFull %>%
    filter(name %in% beckmans) %>%
    group_by(name, sex) %>%                          # Task 4.2.3
    summarise(total = sum(count, na.rm = TRUE)) %>%  # Task 4.2.3
    arrange(name)
```

    ## `summarise()` regrouping output by 'name' (override with `.groups` argument)

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["sex"],"name":[2],"type":["chr"],"align":["left"]},{"label":["total"],"name":[3],"type":["dbl"],"align":["right"]}],"data":[{"1":"Eden","2":"F","3":"38138"},{"1":"Eden","2":"M","3":"7639"},{"1":"Hazel","2":"F","3":"271254"},{"1":"Hazel","2":"M","3":"2737"},{"1":"Jack","2":"F","3":"2682"},{"1":"Jack","2":"M","3":"712080"},{"1":"Matthew","2":"F","3":"5539"},{"1":"Matthew","2":"M","3":"1617412"},{"1":"Sarah","2":"F","3":"1083601"},{"1":"Sarah","2":"M","3":"3334"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

``` r
# Task 4.2.4--Matt joined Penn State in 2015
BabyNamesFull %>%
    filter(name %in% beckmans, year == 2015) %>%
    group_by(name) %>%
    summarise(total = sum(count, na.rm = TRUE)) %>% 
    arrange(desc(total))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["total"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"Matthew","2":"12775"},{"1":"Jack","2":"8511"},{"1":"Sarah","2":"4536"},{"1":"Hazel","2":"4311"},{"1":"Eden","2":"2638"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

``` r
BabyNamesFull %>%
    filter(name %in% beckmans, year == 2015) %>%
    group_by(name, sex) %>%
    summarise(total = sum(count, na.rm = TRUE)) %>% 
    arrange(name)
```

    ## `summarise()` regrouping output by 'name' (override with `.groups` argument)

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["sex"],"name":[2],"type":["chr"],"align":["left"]},{"label":["total"],"name":[3],"type":["dbl"],"align":["right"]}],"data":[{"1":"Eden","2":"F","3":"2065"},{"1":"Eden","2":"M","3":"573"},{"1":"Hazel","2":"F","3":"4299"},{"1":"Hazel","2":"M","3":"12"},{"1":"Jack","2":"F","3":"6"},{"1":"Jack","2":"M","3":"8505"},{"1":"Matthew","2":"F","3":"15"},{"1":"Matthew","2":"M","3":"12760"},{"1":"Sarah","2":"F","3":"4526"},{"1":"Sarah","2":"M","3":"10"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

<hr>

# Part 5. Graph it

\[coming up next…\]

<hr>

<br>

<a href = "https://jbpost2.github.io/TeachingWithR/CourseFiles.html"><button type="button">Course
Files Page</button></a>
