Exercises 8 - tidyr Solutions
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

# 8.1 Widening Data

1.  We are going to ‘widen’ that data by taking the observations for the
    names ‘Shannon’ and ‘Lindsay’ and make one row that has the counts
    for both `M` and `F` observations. Add a brief section of text
    corresponding to this goal.

2.  Filter the `BabyNamesFull` data object to only include the names
    ‘Shannon’ and ‘Lindsay’. Then use the `pivot_wider()` function to
    create a wider data set as noted above.

``` r
BabyNamesFull %>% 
  filter(name %in% c("Shannon", "Lindsay")) %>%
  pivot_wider(names_from = sex, values_from = count)
```

    ## # A tibble: 252 x 4
    ##    name     year     M     F
    ##    <chr>   <dbl> <dbl> <dbl>
    ##  1 Lindsay  1880     7    NA
    ##  2 Lindsay  1881     8    NA
    ##  3 Shannon  1881     5    NA
    ##  4 Lindsay  1882     9    NA
    ##  5 Lindsay  1884     9    NA
    ##  6 Lindsay  1885     6    NA
    ##  7 Shannon  1885     6    NA
    ##  8 Lindsay  1886     5    NA
    ##  9 Lindsay  1888     8    NA
    ## 10 Lindsay  1889    10    NA
    ## # ... with 242 more rows

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
