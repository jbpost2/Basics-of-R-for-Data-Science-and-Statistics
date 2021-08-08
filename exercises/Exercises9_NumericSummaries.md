Exercises 9 - Numeric Summaries
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

## 9.1 Summarize Counts

1.  We’ll consider the names of interest we had from before. Filter the
    data to only include those names then group the data by name and
    sex. Now use `summarize()` to create a new variable called total
    that is the sum of the counts (remove `NA`’s with `na.rm = TRUE`).

2.  Filter the `BabyNamesFull` data object to only include rows where
    the `count` is more than 50000. Save this as an R object. Then,
    create a contingency table to count the number of times each name
    appears.

3.  Let’s investigate the total number of names in each year. Group the
    data by year and find the sum of the count variable. Once you’ve
    done that, run `summary()` on the total counts.

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
