Exercises 3 - Common Data Objects Solutions
================

## 3.1 Vectors

1.  Create a vector `vec` with elements 2, 4, 6, …, 12.

``` r
vec <- seq(from = 2, to = 12, by = 2)
#or
vec <- (1:6)*2
```

2.  Write code to see the 1st, 3rd, and 5th elements of `vec` in the
    console.

``` r
vec[c(1, 3, 5)]
```

    ## [1]  2  6 10

3.  You can exclude elements from a vector by using a ‘`-`’ sign in
    front of their indices. Utilize the `length()` function to see the
    `vec` object in the console without its last element.

``` r
vec[-length(vec)]
```

    ## [1]  2  4  6  8 10

## 3.2 Subsetting data frames

1.  The `iris` dataframe is a built-in R object. Write code to show the
    4th column of the `iris` dataset in the console (there are many ways
    to do this!).

``` r
## using column index
iris[, 4]
```

    ##   [1] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 0.2 0.2 0.1 0.1 0.2 0.4 0.4 0.3
    ##  [19] 0.3 0.3 0.2 0.4 0.2 0.5 0.2 0.2 0.4 0.2 0.2 0.2 0.2 0.4 0.1 0.2 0.2 0.2
    ##  [37] 0.2 0.1 0.2 0.2 0.3 0.3 0.2 0.6 0.4 0.3 0.2 0.2 0.2 0.2 1.4 1.5 1.5 1.3
    ##  [55] 1.5 1.3 1.6 1.0 1.3 1.4 1.0 1.5 1.0 1.4 1.3 1.4 1.5 1.0 1.5 1.1 1.8 1.3
    ##  [73] 1.5 1.2 1.3 1.4 1.4 1.7 1.5 1.0 1.1 1.0 1.2 1.6 1.5 1.6 1.5 1.3 1.3 1.3
    ##  [91] 1.2 1.4 1.2 1.0 1.3 1.2 1.3 1.3 1.1 1.3 2.5 1.9 2.1 1.8 2.2 2.1 1.7 1.8
    ## [109] 1.8 2.5 2.0 1.9 2.1 2.0 2.4 2.3 1.8 2.2 2.3 1.5 2.3 2.0 2.0 1.8 2.1 1.8
    ## [127] 1.8 1.8 2.1 1.6 1.9 2.0 2.2 1.5 1.4 2.3 2.4 1.8 1.8 2.1 2.4 2.3 1.9 2.3
    ## [145] 2.5 2.3 1.9 2.0 2.3 1.8

``` r
## using column name
iris[, "Petal.Width"]
```

    ##   [1] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 0.2 0.2 0.1 0.1 0.2 0.4 0.4 0.3
    ##  [19] 0.3 0.3 0.2 0.4 0.2 0.5 0.2 0.2 0.4 0.2 0.2 0.2 0.2 0.4 0.1 0.2 0.2 0.2
    ##  [37] 0.2 0.1 0.2 0.2 0.3 0.3 0.2 0.6 0.4 0.3 0.2 0.2 0.2 0.2 1.4 1.5 1.5 1.3
    ##  [55] 1.5 1.3 1.6 1.0 1.3 1.4 1.0 1.5 1.0 1.4 1.3 1.4 1.5 1.0 1.5 1.1 1.8 1.3
    ##  [73] 1.5 1.2 1.3 1.4 1.4 1.7 1.5 1.0 1.1 1.0 1.2 1.6 1.5 1.6 1.5 1.3 1.3 1.3
    ##  [91] 1.2 1.4 1.2 1.0 1.3 1.2 1.3 1.3 1.1 1.3 2.5 1.9 2.1 1.8 2.2 2.1 1.7 1.8
    ## [109] 1.8 2.5 2.0 1.9 2.1 2.0 2.4 2.3 1.8 2.2 2.3 1.5 2.3 2.0 2.0 1.8 2.1 1.8
    ## [127] 1.8 1.8 2.1 1.6 1.9 2.0 2.2 1.5 1.4 2.3 2.4 1.8 1.8 2.1 2.4 2.3 1.9 2.3
    ## [145] 2.5 2.3 1.9 2.0 2.3 1.8

``` r
## using column name and $ operator
iris$Petal.Width
```

    ##   [1] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 0.2 0.2 0.1 0.1 0.2 0.4 0.4 0.3
    ##  [19] 0.3 0.3 0.2 0.4 0.2 0.5 0.2 0.2 0.4 0.2 0.2 0.2 0.2 0.4 0.1 0.2 0.2 0.2
    ##  [37] 0.2 0.1 0.2 0.2 0.3 0.3 0.2 0.6 0.4 0.3 0.2 0.2 0.2 0.2 1.4 1.5 1.5 1.3
    ##  [55] 1.5 1.3 1.6 1.0 1.3 1.4 1.0 1.5 1.0 1.4 1.3 1.4 1.5 1.0 1.5 1.1 1.8 1.3
    ##  [73] 1.5 1.2 1.3 1.4 1.4 1.7 1.5 1.0 1.1 1.0 1.2 1.6 1.5 1.6 1.5 1.3 1.3 1.3
    ##  [91] 1.2 1.4 1.2 1.0 1.3 1.2 1.3 1.3 1.1 1.3 2.5 1.9 2.1 1.8 2.2 2.1 1.7 1.8
    ## [109] 1.8 2.5 2.0 1.9 2.1 2.0 2.4 2.3 1.8 2.2 2.3 1.5 2.3 2.0 2.0 1.8 2.1 1.8
    ## [127] 1.8 1.8 2.1 1.6 1.9 2.0 2.2 1.5 1.4 2.3 2.4 1.8 1.8 2.1 2.4 2.3 1.9 2.3
    ## [145] 2.5 2.3 1.9 2.0 2.3 1.8

``` r
## like a list
iris[[4]]
```

    ##   [1] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 0.2 0.2 0.1 0.1 0.2 0.4 0.4 0.3
    ##  [19] 0.3 0.3 0.2 0.4 0.2 0.5 0.2 0.2 0.4 0.2 0.2 0.2 0.2 0.4 0.1 0.2 0.2 0.2
    ##  [37] 0.2 0.1 0.2 0.2 0.3 0.3 0.2 0.6 0.4 0.3 0.2 0.2 0.2 0.2 1.4 1.5 1.5 1.3
    ##  [55] 1.5 1.3 1.6 1.0 1.3 1.4 1.0 1.5 1.0 1.4 1.3 1.4 1.5 1.0 1.5 1.1 1.8 1.3
    ##  [73] 1.5 1.2 1.3 1.4 1.4 1.7 1.5 1.0 1.1 1.0 1.2 1.6 1.5 1.6 1.5 1.3 1.3 1.3
    ##  [91] 1.2 1.4 1.2 1.0 1.3 1.2 1.3 1.3 1.1 1.3 2.5 1.9 2.1 1.8 2.2 2.1 1.7 1.8
    ## [109] 1.8 2.5 2.0 1.9 2.1 2.0 2.4 2.3 1.8 2.2 2.3 1.5 2.3 2.0 2.0 1.8 2.1 1.8
    ## [127] 1.8 1.8 2.1 1.6 1.9 2.0 2.2 1.5 1.4 2.3 2.4 1.8 1.8 2.1 2.4 2.3 1.9 2.3
    ## [145] 2.5 2.3 1.9 2.0 2.3 1.8

2.  Write code to see just the first five rows and just the `Species`
    and `Sepal.Width` columns of the `iris` object in the console.

``` r
iris[1:5, c("Sepal.Width", "Species")]
```

    ##   Sepal.Width Species
    ## 1         3.5  setosa
    ## 2         3.0  setosa
    ## 3         3.2  setosa
    ## 4         3.1  setosa
    ## 5         3.6  setosa

3.  Write code to see `iris` dataset in the console with the columns
    displayed in alphabetical order. This can be done using the `sort()`
    function. Use the result of `sort(colnames(iris))` along with `[]`
    to select the columns in alphabetical order.

``` r
iris[, sort(colnames(iris))]
```

    ##     Petal.Length Petal.Width Sepal.Length Sepal.Width    Species
    ## 1            1.4         0.2          5.1         3.5     setosa
    ## 2            1.4         0.2          4.9         3.0     setosa
    ## 3            1.3         0.2          4.7         3.2     setosa
    ## 4            1.5         0.2          4.6         3.1     setosa
    ## 5            1.4         0.2          5.0         3.6     setosa
    ## 6            1.7         0.4          5.4         3.9     setosa
    ## 7            1.4         0.3          4.6         3.4     setosa
    ## 8            1.5         0.2          5.0         3.4     setosa
    ## 9            1.4         0.2          4.4         2.9     setosa
    ## 10           1.5         0.1          4.9         3.1     setosa
    ## 11           1.5         0.2          5.4         3.7     setosa
    ## 12           1.6         0.2          4.8         3.4     setosa
    ## 13           1.4         0.1          4.8         3.0     setosa
    ## 14           1.1         0.1          4.3         3.0     setosa
    ## 15           1.2         0.2          5.8         4.0     setosa
    ## 16           1.5         0.4          5.7         4.4     setosa
    ## 17           1.3         0.4          5.4         3.9     setosa
    ## 18           1.4         0.3          5.1         3.5     setosa
    ## 19           1.7         0.3          5.7         3.8     setosa
    ## 20           1.5         0.3          5.1         3.8     setosa
    ## 21           1.7         0.2          5.4         3.4     setosa
    ## 22           1.5         0.4          5.1         3.7     setosa
    ## 23           1.0         0.2          4.6         3.6     setosa
    ## 24           1.7         0.5          5.1         3.3     setosa
    ## 25           1.9         0.2          4.8         3.4     setosa
    ## 26           1.6         0.2          5.0         3.0     setosa
    ## 27           1.6         0.4          5.0         3.4     setosa
    ## 28           1.5         0.2          5.2         3.5     setosa
    ## 29           1.4         0.2          5.2         3.4     setosa
    ## 30           1.6         0.2          4.7         3.2     setosa
    ## 31           1.6         0.2          4.8         3.1     setosa
    ## 32           1.5         0.4          5.4         3.4     setosa
    ## 33           1.5         0.1          5.2         4.1     setosa
    ## 34           1.4         0.2          5.5         4.2     setosa
    ## 35           1.5         0.2          4.9         3.1     setosa
    ## 36           1.2         0.2          5.0         3.2     setosa
    ## 37           1.3         0.2          5.5         3.5     setosa
    ## 38           1.4         0.1          4.9         3.6     setosa
    ## 39           1.3         0.2          4.4         3.0     setosa
    ## 40           1.5         0.2          5.1         3.4     setosa
    ## 41           1.3         0.3          5.0         3.5     setosa
    ## 42           1.3         0.3          4.5         2.3     setosa
    ## 43           1.3         0.2          4.4         3.2     setosa
    ## 44           1.6         0.6          5.0         3.5     setosa
    ## 45           1.9         0.4          5.1         3.8     setosa
    ## 46           1.4         0.3          4.8         3.0     setosa
    ## 47           1.6         0.2          5.1         3.8     setosa
    ## 48           1.4         0.2          4.6         3.2     setosa
    ## 49           1.5         0.2          5.3         3.7     setosa
    ## 50           1.4         0.2          5.0         3.3     setosa
    ## 51           4.7         1.4          7.0         3.2 versicolor
    ## 52           4.5         1.5          6.4         3.2 versicolor
    ## 53           4.9         1.5          6.9         3.1 versicolor
    ## 54           4.0         1.3          5.5         2.3 versicolor
    ## 55           4.6         1.5          6.5         2.8 versicolor
    ## 56           4.5         1.3          5.7         2.8 versicolor
    ## 57           4.7         1.6          6.3         3.3 versicolor
    ## 58           3.3         1.0          4.9         2.4 versicolor
    ## 59           4.6         1.3          6.6         2.9 versicolor
    ## 60           3.9         1.4          5.2         2.7 versicolor
    ## 61           3.5         1.0          5.0         2.0 versicolor
    ## 62           4.2         1.5          5.9         3.0 versicolor
    ## 63           4.0         1.0          6.0         2.2 versicolor
    ## 64           4.7         1.4          6.1         2.9 versicolor
    ## 65           3.6         1.3          5.6         2.9 versicolor
    ## 66           4.4         1.4          6.7         3.1 versicolor
    ## 67           4.5         1.5          5.6         3.0 versicolor
    ## 68           4.1         1.0          5.8         2.7 versicolor
    ## 69           4.5         1.5          6.2         2.2 versicolor
    ## 70           3.9         1.1          5.6         2.5 versicolor
    ## 71           4.8         1.8          5.9         3.2 versicolor
    ## 72           4.0         1.3          6.1         2.8 versicolor
    ## 73           4.9         1.5          6.3         2.5 versicolor
    ## 74           4.7         1.2          6.1         2.8 versicolor
    ## 75           4.3         1.3          6.4         2.9 versicolor
    ## 76           4.4         1.4          6.6         3.0 versicolor
    ## 77           4.8         1.4          6.8         2.8 versicolor
    ## 78           5.0         1.7          6.7         3.0 versicolor
    ## 79           4.5         1.5          6.0         2.9 versicolor
    ## 80           3.5         1.0          5.7         2.6 versicolor
    ## 81           3.8         1.1          5.5         2.4 versicolor
    ## 82           3.7         1.0          5.5         2.4 versicolor
    ## 83           3.9         1.2          5.8         2.7 versicolor
    ## 84           5.1         1.6          6.0         2.7 versicolor
    ## 85           4.5         1.5          5.4         3.0 versicolor
    ## 86           4.5         1.6          6.0         3.4 versicolor
    ## 87           4.7         1.5          6.7         3.1 versicolor
    ## 88           4.4         1.3          6.3         2.3 versicolor
    ## 89           4.1         1.3          5.6         3.0 versicolor
    ## 90           4.0         1.3          5.5         2.5 versicolor
    ## 91           4.4         1.2          5.5         2.6 versicolor
    ## 92           4.6         1.4          6.1         3.0 versicolor
    ## 93           4.0         1.2          5.8         2.6 versicolor
    ## 94           3.3         1.0          5.0         2.3 versicolor
    ## 95           4.2         1.3          5.6         2.7 versicolor
    ## 96           4.2         1.2          5.7         3.0 versicolor
    ## 97           4.2         1.3          5.7         2.9 versicolor
    ## 98           4.3         1.3          6.2         2.9 versicolor
    ## 99           3.0         1.1          5.1         2.5 versicolor
    ## 100          4.1         1.3          5.7         2.8 versicolor
    ## 101          6.0         2.5          6.3         3.3  virginica
    ## 102          5.1         1.9          5.8         2.7  virginica
    ## 103          5.9         2.1          7.1         3.0  virginica
    ## 104          5.6         1.8          6.3         2.9  virginica
    ## 105          5.8         2.2          6.5         3.0  virginica
    ## 106          6.6         2.1          7.6         3.0  virginica
    ## 107          4.5         1.7          4.9         2.5  virginica
    ## 108          6.3         1.8          7.3         2.9  virginica
    ## 109          5.8         1.8          6.7         2.5  virginica
    ## 110          6.1         2.5          7.2         3.6  virginica
    ## 111          5.1         2.0          6.5         3.2  virginica
    ## 112          5.3         1.9          6.4         2.7  virginica
    ## 113          5.5         2.1          6.8         3.0  virginica
    ## 114          5.0         2.0          5.7         2.5  virginica
    ## 115          5.1         2.4          5.8         2.8  virginica
    ## 116          5.3         2.3          6.4         3.2  virginica
    ## 117          5.5         1.8          6.5         3.0  virginica
    ## 118          6.7         2.2          7.7         3.8  virginica
    ## 119          6.9         2.3          7.7         2.6  virginica
    ## 120          5.0         1.5          6.0         2.2  virginica
    ## 121          5.7         2.3          6.9         3.2  virginica
    ## 122          4.9         2.0          5.6         2.8  virginica
    ## 123          6.7         2.0          7.7         2.8  virginica
    ## 124          4.9         1.8          6.3         2.7  virginica
    ## 125          5.7         2.1          6.7         3.3  virginica
    ## 126          6.0         1.8          7.2         3.2  virginica
    ## 127          4.8         1.8          6.2         2.8  virginica
    ## 128          4.9         1.8          6.1         3.0  virginica
    ## 129          5.6         2.1          6.4         2.8  virginica
    ## 130          5.8         1.6          7.2         3.0  virginica
    ## 131          6.1         1.9          7.4         2.8  virginica
    ## 132          6.4         2.0          7.9         3.8  virginica
    ## 133          5.6         2.2          6.4         2.8  virginica
    ## 134          5.1         1.5          6.3         2.8  virginica
    ## 135          5.6         1.4          6.1         2.6  virginica
    ## 136          6.1         2.3          7.7         3.0  virginica
    ## 137          5.6         2.4          6.3         3.4  virginica
    ## 138          5.5         1.8          6.4         3.1  virginica
    ## 139          4.8         1.8          6.0         3.0  virginica
    ## 140          5.4         2.1          6.9         3.1  virginica
    ## 141          5.6         2.4          6.7         3.1  virginica
    ## 142          5.1         2.3          6.9         3.1  virginica
    ## 143          5.1         1.9          5.8         2.7  virginica
    ## 144          5.9         2.3          6.8         3.2  virginica
    ## 145          5.7         2.5          6.7         3.3  virginica
    ## 146          5.2         2.3          6.7         3.0  virginica
    ## 147          5.0         1.9          6.3         2.5  virginica
    ## 148          5.2         2.0          6.5         3.0  virginica
    ## 149          5.4         2.3          6.2         3.4  virginica
    ## 150          5.1         1.8          5.9         3.0  virginica

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
