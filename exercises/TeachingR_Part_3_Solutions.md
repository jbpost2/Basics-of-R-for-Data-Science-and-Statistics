Exercises to Accompany TeachingWithR Workshop
================
Matthew Beckman & Justin Post
June 25, 2021

<hr>

# Part 1. RStudio IDE Scavenger Hunt

\[omitted for brevity…\]

<hr>

# Part 2. Import Data (Code Recap)

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

### Solution (for example)

Matt has chosen the names of his family members: Matthew, Sarah, Eden,
Jack, & Hazel.

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

### Solution (for example)

Task 3.2.2: Your yaml header should appear at the beginning of the Rmd
document, but here is some example text

    ---
    title: "What's in a Name??"
    author: "Matt Beckman & Justin Post"
    date: "June 25, 2021"
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
        10:27:38”  
    -   “Knit” (notice the time stamp)  
    -   “Knit” again (notice the time stamp)

<hr>

### Solution

Task 3.3.1:

Some sample narrative text follows; note that it is simply one long line
of soft-wrapped text, and no formatting of any kind is imposed:

I’ve chosen to investigate the names of each person in my immediate
family: Matthew, Sarah, Eden, Jack, and Hazel. They’re my favorite
people, and also my favorite names! I’m a bit torn about how I’ll
include my son Jack in the analysis. His legal name is “Jon” but he is
nearly always called “Jack”–the spelling of “Jon” honors our
scandinavian heritage on both sides of the family, and the nickname
“Jack” specifically honors his great-grandfather.

Some famous persons by each name of the family include:

-   Sarah Jessica Parker
-   Eden Hazard
-   Jack (Jackie) Robinson
-   Hazel Findlay
-   Richard Stallman. Seriously, the first hit of my Internet search for
    “famous Matthew” was Richard Stallman (!) whose given name is…
    Matthew. “Matthew the Apostle” (my namesake) was third on that
    particular list: <https://playback.fm/people/first-name/matthew>

Task 3.3.2

``` r
# libraries
library(tidyverse)
library(dcData)

# data intake
data("BabyNames", package = "dcData")
BabyNamesSupp <- read_csv("https://jbpost2.github.io/TeachingWithR/datasets/BabyNamesSupp.csv",  
                          col_types = cols(sex = col_character()))  # fixes `sex`
```

Task 3.3.3

Here’s the code I used:

    This document was last modified 2021-06-25 10:27:39.

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
