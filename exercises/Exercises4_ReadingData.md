Exercises 4 - Reading Data
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

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>
