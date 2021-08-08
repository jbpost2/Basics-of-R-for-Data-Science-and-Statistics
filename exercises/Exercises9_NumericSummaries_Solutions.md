Exercises 9 - Numeric Summaries Solutions
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

## 9.1 Summarize Counts

1.  We’ll consider the names of interest we had from before. Filter the
    data to only include those names then group the data by name and
    sex. Now use `summarize()` to create a new variable called total
    that is the sum of the counts (remove `NA`’s with `na.rm = TRUE`).

``` r
names <- c("Justin", "George", "Alexander", "Jacob", "Anderson")
BabyNamesFull %>%
    filter(name %in% names) %>%
    group_by(name, sex) %>%                          
    summarise(total = sum(count, na.rm = TRUE)) 
```

    ## `summarise()` has grouped output by 'name'. You can override using the `.groups` argument.

    ## # A tibble: 10 x 3
    ## # Groups:   name [5]
    ##    name      sex     total
    ##    <chr>     <chr>   <dbl>
    ##  1 Alexander F        4466
    ##  2 Alexander M      684145
    ##  3 Anderson  F         950
    ##  4 Anderson  M       28016
    ##  5 George    F        9942
    ##  6 George    M     1470178
    ##  7 Jacob     F        2259
    ##  8 Jacob     M      941483
    ##  9 Justin    F        3797
    ## 10 Justin    M      778247

2.  Filter the `BabyNamesFull` data object to only include rows where
    the `count` is more than 50000. Save this as an R object. Then,
    create a contingency table to count the number of times each name
    appears.

``` r
temp <- BabyNamesFull %>%
  filter(count >50000)
table(temp$name)
```

    ## 
    ##      Ashley Christopher       David     Deborah       Debra       James 
    ##           1          12          25           3           1          49 
    ##       Jason    Jennifer     Jessica        John       Linda        Lisa 
    ##           6          14           3          49          10           5 
    ##        Mark        Mary     Matthew     Michael    Patricia     Richard 
    ##           6          46           1          46           4          12 
    ##      Robert     William 
    ##          51          26

3.  Let’s investigate the total number of names in each year. Group the
    data by year and find the sum of the count variable. Once you’ve
    done that, run `summary()` on the total counts.

``` r
temp <- BabyNamesFull %>% 
  group_by(year) %>%
  summarize(total = sum(count))
summary(temp$total)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##  192700 1728436 3092162 2535652 3677142 4199919

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
