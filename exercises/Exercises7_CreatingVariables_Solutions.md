Exercises 7 - Creating Variables Solutions
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

## 7.1 Create a New Variable

1.  Write a brief note using Markdown syntax that mentions we’ll be
    investigating the name George in more detail and that we’ll be
    creating a new variable that represents the change year to year.

2.  Use the `BabyNamesFull` data object and filter the data to only
    contain observations where `sex` is `M` and the name is `George`.

3.  Create a new variable using `mutate()` that is the difference from
    year to year for the `count` variable. This can be done using the
    `lag()` function via `count-lag(count)`. Call this variable `diff`.

``` r
BabyNamesFull %>%
  filter(sex == "M" & name == "George") %>% 
  mutate(diff = count - lag(count))
```

    ##       name sex count year  diff
    ## 1   George   M  5126 1880    NA
    ## 2   George   M  4664 1881  -462
    ## 3   George   M  5193 1882   529
    ## 4   George   M  4736 1883  -457
    ## 5   George   M  4961 1884   225
    ## 6   George   M  4674 1885  -287
    ## 7   George   M  4671 1886    -3
    ## 8   George   M  4284 1887  -387
    ## 9   George   M  4912 1888   628
    ## 10  George   M  4430 1889  -482
    ## 11  George   M  4458 1890    28
    ## 12  George   M  3931 1891  -527
    ## 13  George   M  4760 1892   829
    ## 14  George   M  4320 1893  -440
    ## 15  George   M  4365 1894    45
    ## 16  George   M  4289 1895   -76
    ## 17  George   M  4286 1896    -3
    ## 18  George   M  4078 1897  -208
    ## 19  George   M  4853 1898   775
    ## 20  George   M  4019 1899  -834
    ## 21  George   M  5403 1900  1384
    ## 22  George   M  3609 1901 -1794
    ## 23  George   M  4223 1902   614
    ## 24  George   M  3961 1903  -262
    ## 25  George   M  4219 1904   258
    ## 26  George   M  4256 1905    37
    ## 27  George   M  4201 1906   -55
    ## 28  George   M  4445 1907   244
    ## 29  George   M  4584 1908   139
    ## 30  George   M  4688 1909   104
    ## 31  George   M  5440 1910   752
    ## 32  George   M  6586 1911  1146
    ## 33  George   M 11734 1912  5148
    ## 34  George   M 13873 1913  2139
    ## 35  George   M 17603 1914  3730
    ## 36  George   M 22307 1915  4704
    ## 37  George   M 23381 1916  1074
    ## 38  George   M 24195 1917   814
    ## 39  George   M 26321 1918  2126
    ## 40  George   M 25176 1919 -1145
    ## 41  George   M 26895 1920  1719
    ## 42  George   M 27472 1921   577
    ## 43  George   M 27349 1922  -123
    ## 44  George   M 27028 1923  -321
    ## 45  George   M 27366 1924   338
    ## 46  George   M 26567 1925  -799
    ## 47  George   M 25895 1926  -672
    ## 48  George   M 25958 1927    63
    ## 49  George   M 24392 1928 -1566
    ## 50  George   M 23007 1929 -1385
    ## 51  George   M 22772 1930  -235
    ## 52  George   M 20673 1931 -2099
    ## 53  George   M 20432 1932  -241
    ## 54  George   M 18351 1933 -2081
    ## 55  George   M 18491 1934   140
    ## 56  George   M 18551 1935    60
    ## 57  George   M 18191 1936  -360
    ## 58  George   M 18431 1937   240
    ## 59  George   M 18432 1938     1
    ## 60  George   M 17885 1939  -547
    ## 61  George   M 18304 1940   419
    ## 62  George   M 19257 1941   953
    ## 63  George   M 21270 1942  2013
    ## 64  George   M 21678 1943   408
    ## 65  George   M 20420 1944 -1258
    ## 66  George   M 19311 1945 -1109
    ## 67  George   M 21566 1946  2255
    ## 68  George   M 23911 1947  2345
    ## 69  George   M 21920 1948 -1991
    ## 70  George   M 21313 1949  -607
    ## 71  George   M 20166 1950 -1147
    ## 72  George   M 20203 1951    37
    ## 73  George   M 19792 1952  -411
    ## 74  George   M 19156 1953  -636
    ## 75  George   M 18681 1954  -475
    ## 76  George   M 18153 1955  -528
    ## 77  George   M 17233 1956  -920
    ## 78  George   M 16864 1957  -369
    ## 79  George   M 15641 1958 -1223
    ## 80  George   M 15000 1959  -641
    ## 81  George   M 14060 1960  -940
    ## 82  George   M 13633 1961  -427
    ## 83  George   M 12561 1962 -1072
    ## 84  George   M 12088 1963  -473
    ## 85  George   M 11795 1964  -293
    ## 86  George   M 10689 1965 -1106
    ## 87  George   M  9941 1966  -748
    ## 88  George   M  9703 1967  -238
    ## 89  George   M  9386 1968  -317
    ## 90  George   M  9203 1969  -183
    ## 91  George   M  8924 1970  -279
    ## 92  George   M  8228 1971  -696
    ## 93  George   M  7162 1972 -1066
    ## 94  George   M  6605 1973  -557
    ## 95  George   M  6283 1974  -322
    ## 96  George   M  5840 1975  -443
    ## 97  George   M  5564 1976  -276
    ## 98  George   M  5601 1977    37
    ## 99  George   M  5289 1978  -312
    ## 100 George   M  5253 1979   -36
    ## 101 George   M  5293 1980    40
    ## 102 George   M  5157 1981  -136
    ## 103 George   M  4987 1982  -170
    ## 104 George   M  4488 1983  -499
    ## 105 George   M  4262 1984  -226
    ## 106 George   M  4253 1985    -9
    ## 107 George   M  4343 1986    90
    ## 108 George   M  4087 1987  -256
    ## 109 George   M  4291 1988   204
    ## 110 George   M  4510 1989   219
    ## 111 George   M  4564 1990    54
    ## 112 George   M  4176 1991  -388
    ## 113 George   M  3892 1992  -284
    ## 114 George   M  3510 1993  -382
    ## 115 George   M  3318 1994  -192
    ## 116 George   M  3286 1995   -32
    ## 117 George   M  3225 1996   -61
    ## 118 George   M  3175 1997   -50
    ## 119 George   M  3044 1998  -131
    ## 120 George   M  3040 1999    -4
    ## 121 George   M  3034 2000    -6
    ## 122 George   M  3084 2001    50
    ## 123 George   M  3012 2002   -72
    ## 124 George   M  2909 2003  -103
    ## 125 George   M  2734 2004  -175
    ## 126 George   M  2822 2005    88
    ## 127 George   M  2699 2006  -123
    ## 128 George   M  2757 2007    58
    ## 129 George   M  2550 2008  -207
    ## 130 George   M  2380 2009  -170
    ## 131 George   M  2365 2010   -15
    ## 132 George   M  2311 2011   -54
    ## 133 George   M  2328 2012    17
    ## 134 George   M  2522 2013   194
    ## 135 George   M  3004 2014   482
    ## 136 George   M  3049 2015    45
    ## 137 George   M  3304 2016   255
    ## 138 George   M  3166 2017  -138
    ## 139 George   M  3072 2018   -94
    ## 140 George   M  3175 2019   103

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
