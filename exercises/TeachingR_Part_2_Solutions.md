Exercises to Accompany TeachingWithR Workshop
================
Matthew Beckman & Justin Post
June 25, 2021

# Part 2. Import Data

<hr>

## 2.1 Packages

-   **Task 1:** call the `dcData` and `tidyverse` packages
    -   Note: `dcData` is installed from GitHub, so it requires an extra
        step. You may have already done this from the instructions prior
        to the workshop, but it is shown again here if needed:
    -   `devtools::install_github("mdbeckman/dcData")`
    -   this might take a while (30+ sec?) depending on your Internet
        connection

<hr>

### Solution

``` r
## from instructions before workshop, if needed
# devtools::install_github("mdbeckman/dcData")

library(tidyverse)  # this actually loads a group of packages all at once
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
```

<hr>

## 2.2 Data Intake: `BabyNames`

-   **Task 1:** Read `BabyNames` data from `dcData` into your R
    environment using the `data()` function
    -   Locate the `BabyNames` object in the Environment pane  
    -   Double click the object name to open a spreadsheet View  
    -   Spreadsheet view includes basic sorting capability

Use the spreadsheet view to answer the following:

-   **Task 2:** how many total rows of data are included?

-   **Task 3:** describe what each row in the data *actually*
    represents.

-   **Task 4:** find the largest `count` in the `BabyNames` data. How
    would you interpret this result?

-   **Task 5:** what are the max & min available `year` in the data?

<hr>

### Solution

Task 2.2.1:

``` r
data("BabyNames", package = "dcData")
```

Task 2.2.2: about 1.8 million rows. We can see this from environment
tab, spreadsheet view (footer), among other places

Task 2.2.3: The frequency of a given name, within a year, associated
with a `sex`

Task 2.2.4: According to US Social Security records, 1947 was a banner
year to name a female Linda!

Task 2.2.5: `BabyNames` data spans 1880 through 2013

<hr>

## 2.3 Data Intake: `BabyNamesSupp`

The file “BabyNameSupp.csv” includes a few years of more recent data to
augment the `BabyNames` data. Run the starter code shown below to read
the data and complete the tasks.

**Important:** The starter code **will** produce a warning message!
Don’t worry, it’s part of the exercise!

``` r
# starter code for BabyNamesSupp 
BabyNamesSupp <- read_csv("https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv")
```

    ## Parsed with column specification:
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

-   **Task 1:** Read the warning message carefully; what seems to have
    gone wrong?

-   **Task 2:** open the spreadsheet view to investigate
    `BabyNamesSupp`…

    -   Which years of data are available to us in `BabyNamesSupp`?
    -   Can you confirm what seems to have gone wrong during the data
        intake?

-   **Task 3:** use the following R functions to investigate
    `BabyNamesSupp` further:

    -   `head(BabyNamesSupp)`
    -   `tail(BabyNamesSupp)`
    -   `str(BabyNamesSupp)`

-   **Task 4 (Challenge):** Why did `read_csv( )` seem to have this
    problem with the data intake? Any ideas how we might fix it?

    -   Hint: “RStudio &gt;&gt; Help &gt;&gt; read\_csv”
    -   don’t worry about *actually* fixing it yet, just try to identify
        root cause.

At this point, we aren’t attempting to prepare the `BabyNamesSupp` data
for analysis. We’re just reading it into the R environment and making
observations. We’ll be using these data again in later exercises, so we
will make the necessary corrections at that point.

<hr>

### Solution

Task 2.3.1: The warning indicates a “parsing failure” and shows that R
was expecting logical elements (e.g., TRUE/FALSE) and found “M” in many
cases

Task 2.3.2: Yup, R interpreted “F” (meaning female in our data) to mean
FALSE and then could not handle “M” appropriately as a result. These
data include years 2014 through 2019.

Task 2.3.3:

``` r
head(BabyNamesSupp)
```

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["sex"],"name":[2],"type":["lgl"],"align":["right"]},{"label":["count"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["year"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"Emma","2":"FALSE","3":"20941","4":"2014"},{"1":"Olivia","2":"FALSE","3":"19817","4":"2014"},{"1":"Sophia","2":"FALSE","3":"18628","4":"2014"},{"1":"Isabella","2":"FALSE","3":"17102","4":"2014"},{"1":"Ava","2":"FALSE","3":"15708","4":"2014"},{"1":"Mia","2":"FALSE","3":"13516","4":"2014"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

``` r
tail(BabyNamesSupp)
```

<div data-pagedtable="false">

<script data-pagedtable-source type="application/json">
{"columns":[{"label":["name"],"name":[1],"type":["chr"],"align":["left"]},{"label":["sex"],"name":[2],"type":["lgl"],"align":["right"]},{"label":["count"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["year"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"Zyhaire","2":"NA","3":"5","4":"2019"},{"1":"Zyheem","2":"NA","3":"5","4":"2019"},{"1":"Zykel","2":"NA","3":"5","4":"2019"},{"1":"Zyking","2":"NA","3":"5","4":"2019"},{"1":"Zyn","2":"NA","3":"5","4":"2019"},{"1":"Zyran","2":"NA","3":"5","4":"2019"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>

</div>

``` r
str(BabyNamesSupp)
```

    ## tibble [196,177 × 4] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ name : chr [1:196177] "Emma" "Olivia" "Sophia" "Isabella" ...
    ##  $ sex  : logi [1:196177] FALSE FALSE FALSE FALSE FALSE FALSE ...
    ##  $ count: num [1:196177] 20941 19817 18628 17102 15708 ...
    ##  $ year : num [1:196177] 2014 2014 2014 2014 2014 ...
    ##  - attr(*, "problems")= tibble [84,619 × 5] (S3: tbl_df/tbl/data.frame)
    ##   ..$ row     : int [1:84619] 19208 19209 19210 19211 19212 19213 19214 19215 19216 19217 ...
    ##   ..$ col     : chr [1:84619] "sex" "sex" "sex" "sex" ...
    ##   ..$ expected: chr [1:84619] "1/0/T/F/TRUE/FALSE" "1/0/T/F/TRUE/FALSE" "1/0/T/F/TRUE/FALSE" "1/0/T/F/TRUE/FALSE" ...
    ##   ..$ actual  : chr [1:84619] "M" "M" "M" "M" ...
    ##   ..$ file    : chr [1:84619] "'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'" "'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'" "'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'" "'https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv'" ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   name = col_character(),
    ##   ..   sex = col_logical(),
    ##   ..   count = col_double(),
    ##   ..   year = col_double()
    ##   .. )

Task 2.3.4 (Challenge): The help documentation explains that
`read_csv( )` guesses each variable type based on the first 1000
records. The data source had apparently sorted results such that the
first 1000 (or more) rows were all “F” so `read_csv( )` concluded these
to be logical (e.g., TRUE or FALSE) data. Quite a reasonable default
under most circumstances, but shows why we should always carefully
inspect our data intake!

<hr>

## 2.4 Help Documentation for Data Sets

Search “RStudio &gt;&gt; Help” to learn about the data…

-   **Task 1:** what can you learn about `BabyNames` data from RStudio
    Help?
-   **Task 2:** what can you learn about `BabyNamesSupp` data from
    RStudio Help? What happened?

<hr>

### Solution

Task 2.4.1: Lots! Sice this is loaded from an R package, the package
author can make additional information available to you that describes
the data, explains the variables, provides a source, etc.

Task 2.4.2: Nothing! The data were read from an external file, so R
doesn’t have any information at all to share with us.

<hr>

## 2.5 Data for 2020 (Challenge)

**Task 1:** Want to include 2020 data too? See if you can locate it,
read the data into R, and review the data intake (hint: `BabyNames` help
documentation includes a source to investigate).

Again, we aren’t attempting to process the 2020 data yet. We’re just
reading it into the R environment and making observations about that
process. We’ll be using this data again later in the exercises, so we
will make the necessary corrections at that point.

<hr>

## Solution

Task 2.5.1 (Challenge): visit “RStudio &gt;&gt; Help &gt;&gt; BabyNames
&gt;&gt; Source” and then download the zip file to find the 2020 data
inside. This can be read into R using `read_csv( )` even though the file
extension is `.txt` since the data are comma delimited. You may note
that the structure of the data differs slightly from our two other
sources, so we will need some new tools to process it for use.

``` r
## challenge
# locate zip file including all years of data, identify 2020 and read into R:
BabyNames2020 <- 
    read_csv("https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt", 
             col_names = FALSE)
```

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_character(),
    ##   X2 = col_logical(),
    ##   X3 = col_double()
    ## )

    ## Warning: 13911 parsing failures.
    ##   row col           expected actual                                                           file
    ## 17361  X2 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt'
    ## 17362  X2 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt'
    ## 17363  X2 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt'
    ## 17364  X2 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt'
    ## 17365  X2 1/0/T/F/TRUE/FALSE      M 'https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt'
    ## ..... ... .................. ...... ..............................................................
    ## See problems(...) for more details.

<hr>

# Part 3. R Markdown

Note: you might hang onto the RStudio default text provided in the new R
Markdown file for the moment… it’s packed with tiny examples that will
come in handy!

\[coming up next…\]

<hr>

<br>

<a href = "https://jbpost2.github.io/TeachingWithR/CourseFiles.html"><button type="button">Course
Files Page</button></a>
