Exercises 6 - dplyr Solutions
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

# 6.1 Fix the BabyNameSupp Data

Edit your code chunk that reads the data in from a csv file and add the
argument `col_types = cols(sex = col_character())` to the `read_csv()`
code.

``` r
BabyNamesSupp <- 
  read_csv("https://github.com/jbpost2/Basics-of-R-for-Data-Science-and-Statistics/raw/master/datasets/BabyNamesSupp.csv",
           col_types = cols(sex = col_character()))  # fixes `sex`
```

# 6.2 Combining Data Sets with `dplyr::bind_rows()`

1.  Write a quick note below your last R code chunk that mentions that
    we are going to combine the two data sets into one.

2.  Use the `bind_rows()` function from `dplyr` to combine `BabyNames` &
    `BabyNamesSupp` via `bind_rows(BabyNames, BabyNamesSupp)` into an
    object called `BabyNamesFull`.

``` r
BabyNamesFull <- bind_rows(BabyNames, BabyNamesSupp)
```

<hr>

# 6.3 Filter and Arrange Rows

-   Filter the `BabyNamesFull` data to include only the names we are
    interested in (Hint: use `%in%`). Just have this print out to the
    console.

-   Continue the previous code to then reorder the rows descending on
    the `count` variable.

``` r
# vector of names
names <- c("Justin", "Alexander", "Jacob", "Anderson", "George")

BabyNamesFull %>%
  filter(name %in% names) %>% 
  head() #This is just added so we don't have too much print out
```

    ##        name sex count year
    ## 1    George   F    26 1880
    ## 2    George   M  5126 1880
    ## 3     Jacob   M   404 1880
    ## 4 Alexander   M   211 1880
    ## 5  Anderson   M    43 1880
    ## 6    Justin   M     8 1880

``` r
BabyNamesFull %>%
  filter(name %in% names) %>% 
  arrange(desc(count)) %>%
  head() #Added for less printing
```

    ##     name sex count year
    ## 1  Jacob   M 35997 1998
    ## 2  Jacob   M 35344 1999
    ## 3 Justin   M 35034 1988
    ## 4  Jacob   M 34462 2000
    ## 5  Jacob   M 34140 1997
    ## 6 Justin   M 32842 1989

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>