Exercises to Accompany TeachingWithR Workshop
================
Matthew Beckman & Justin Post
June 25, 2021

<hr>

Here, we join an analysis already in progress…

-   Part 1 (RStudio IDE Scavenger Hunt) has been omitted from the
    following analysis.
-   Part 2 (Import Data) is consolodated
-   **Part 3 (Data Wrangling) Exercises Follow**

<hr>

### Part 2. Import Data (Code Recap)

<hr>

``` r
## from instructions before workshop, if needed:
# devtools::install_github("mdbeckman/dcData")

# packages
library(tidyverse)  
library(dcData)     

# data intake
data("BabyNames", package = "dcData")

BabyNamesSupp <- 
  read_csv("https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv")

# 2020 data intake was issued as a challenge task only
BabyNames2020 <-   
    read_csv("https://jbpost2.github.io/TeachingWithR/datasets/yob2020.txt", 
             col_names = FALSE)


# inspecting the data
head(BabyNamesSupp)
tail(BabyNamesSupp)
```

<hr>

# Part 3. R Markdown

Note: you might hang onto the RStudio default text provided in the new R
Markdown file for the moment… it’s packed with tiny examples that will
come in handy!

<hr>

## 3.1 Goal

We’ll be investigating the popularity of names in the US each year.
Choose a few (4-5) names to investigate to you–friends, family, TV
character, colleagues in the workshop!

<hr>

## 3.2 Update yaml Header

-   **Task 1:** “Knit” the document to render the initial HTML document

-   **Task 2:** update yaml header as necessary to include an
    informative title, author name, & relevant date.

    -   “Knit” to verify update
    -   in general, Knit very often as you get the hang of the new tools

<!-- -->

    ---
    title: "Add a title"
    author: "Add your name"
    date: "Pick a date"
    output: html_document
    ---

<hr>

## 3.3 Add Narrative & Code Chunk

-   **Task 1:** Write a bit of narrative to introduce the project (no R
    code)
    -   Which names have you chosen to investigate and why?  
    -   “Knit”  
    -   Add a bullet list of “famous” persons that share the name  
    -   “Knit”  
    -   Note: it really isn’t important *what* you write, we’re just
        practicing a few elements of R Markdown syntax.
-   **Task 2:** create an R code chunk to set up for the investigation:
    -   call the `tidyverse` and `dcData` packages  
    -   data intake:
        -   `BabyNames` from `dcData` package  
        -   `BabyNamesSupp.csv` using `read_csv( )`  
    -   Although we had done much of this work previously, writing it
        into a code chunk within your R Markdown document more closely
        connects the analysis to your narrative, and takes a big step
        toward reproducibility.
-   **Task 3:** Just for fun, add a note at the end of your document
    with a time/date stamp reflecting when the analysis was last
    modified. Call the R function `now()` directly from `lubridate`
    package INLINE for the time stamp.
    -   For example, “These notes were last modified 2021-06-25
        12:25:12”  
    -   “Knit” (notice the time stamp)  
    -   “Knit” again (notice the time stamp)

<hr>

## 3.4 Render Various Output Formats

R Markdown is a flexible syntax that can render the same .Rmd (text)
file in different formats. If you know the syntax, you can update the
`output:` directly in the yaml header. RStudio provides a shortcut as a
(tiny) menu arrow next to the “Knit (yarn)” icon revealing a few common
choices.

-   **Task 1:** MS Word
    -   only if you have Microsoft Word installed on your computer
        already
    -   use choice drop-down next to the “Knit (yarn)” shortcut
    -   alternatively, update yaml with “`output: word_document`”
-   **Task 2:** PDF
    -   you may need this R command first:
        `tinytex::install_tinytex()`  
    -   use choice drop-down next to the “Knit (yarn)” shortcut
    -   `output: pdf_document`
-   **Task 3:** R Notebook
    -   use choice drop-down next to the “Knit (yarn)” shortcut
    -   `output: html_notebook`
    -   note: the “Knit” button now says “Preview”–you will get the
        “Knit (yarn)” back when you revert to `output: html_document`
    -   can you spot any differences b/w R Notebook & R Markdown doc?
-   **Task 4 (challenge):** add some LaTeX to include mathematics your
    document (e.g, formula for the area of a circle) & “knit”

<hr>

# Part 4. Data wrangling

\[coming up next…\]

<hr>

<br>

<a href = "https://jbpost2.github.io/TeachingWithR/CourseFiles.html"><button type="button">Course
Files Page</button></a>
