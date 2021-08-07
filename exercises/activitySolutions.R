###########################################################
##Code corresponding to activities in course:
##Introduction to Data Science Using R
##_Your_Name_Here_
##August 13-14, 2018
###########################################################

###########################################################
##Objects and Common Classes 
###########################################################

#Write R code to do the following:

#1. Create and save a vector that contains the elements 4, 7, 10, 13. Call the object 'vec'.
vec <- c(4, 7, 10, 13)
#1a. Add 8 to each element of vec.
vec + 8
#1b. Square each element of vec.
vec^2
#1c. Sum the elements of vec.
sum(vec)  

#2a. Create and save a vector of length 4 that consists of adjectives. Call the object 'adj'.
adj<-c("short","intelligent","altruistic","boxy")
#2b. Create and save a second vector of length 4 that consists of plural nouns. Call the object 'nouns'.
nouns<-c("bugs","beings","strangers","houses")
#2c. Run the following code: 
paste(adj, nouns)

#3. Create a matrix that has first column the adj values and the second column the nouns values.
matrix(c(adj, nouns), ncol = 2)

#4.  Create and save a data frame that has three columns given by vec, adj, and nouns. Call the object 'dataDF'. 
dataDF <- data.frame(vec, adj, nouns)
dataDF


###########################################################
##Attributes and Basic Data Manipulation
###########################################################

#Write R code to do the following:

#1. Print out the element in the 1st row and 1st column of the dataDF object.
dataDF[1, 1]

#2. Print out the 3rd row of the dataDF object.
dataDF[3, ]

#3. Print out the 'adj' column using three different methods.
dataDF[ , "adj"]
dataDF[ , 2]
dataDF$adj

#4. Print out the 1st and 4th rows of just the 'nouns' column of the dataDF object in one R command.
dataDF[c(1, 4), "nouns"]

#5. Look at the structure of the dataDF object.  Note that factors are special types of vectors - we'll cover them later.
str(dataDF)


###########################################################
##Reading/Writing Data
###########################################################

#Write R code to do the following:

#1. Go to the gitHub datasets folder and look at the breastcancer.dat file. Click on the "raw" button.

#2. Read in the BreastCancer.dat data file using the URL you got for the gitHub page after clicking "raw". Note this is a tab delimited file.  Save the R object as cancerData.
cancerData <- read_tsv(file = "https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/BreastCancer.dat")

#3. Repeat the above process to get a link to read in the mosquito.txt file. Save the R object as mosquitoData.
mosquitoData <- read_delim(file = "https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/mosquito.txt", skip = 1, delim = "&", col_names = c("Day", "Cage", "Treatment", "Response"))

#4. Repeat the above process to get a link to read in the mosquito2.txt file. Note this is a tab delimited file. Save the R object as mosquitoData2.
#4a. Use the code below to create a combined version of the mosquito data sets. Save the object as mosquitoFullData.
rbind(mosquitoData, mosquitoData2)
#4b. Write the mosquitoFullData out to a .csv file with name of your choice.
mosquitoData2 <- read_tsv(file = "https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/mosquito2.txt", skip = 1, col_names = c("Day", "Cage", "Treatment", "Response"))
mosquitoFullData <- rbind(mosquitoData, mosquitoData2)
write_csv(mosquitoFullData, path="mosquitoFullData.txt")

#5. Repeat the above process to get a link to read in the effort.dta file. Note that this is a stata file. Right click on view raw and copy the link address. Save the R object as effortData.
library(haven)
effortData <- read_stata("https://github.com/jbpost2/DataScienceR/blob/master/datasets/effort.dta?raw=true")


###########################################################
##Manipulating Data
###########################################################

#Do not overwrite the data set in any of the steps below unless specified. We'll use the cancerData object read in during a previous activity.  Try to use chaining/piping where possible! Write R code to do the following:

#in case you haven't read the data in
cancerData <- read_tsv(file = "https://raw.githubusercontent.com/jbpost2/DataScienceR/master/datasets/BreastCancer.dat")

#1. Have R sort the data set by youngest to oldest.
cancerData %>% arrange(age)

#2. Have R print out only women who were over 50.
cancerData %>% filter(age > 50)

#3. Have R print out only women who were over 50 and premenopausal.
cancerData %>% filter((age > 50) & (meno == "premenopausal"))

#4. Have R print out only women who were (over 50 and premenopausal) or (under 50 and Postmenopausal).
cancerData %>% filter(((age > 50) & (meno == "premenopausal")) | ((age < 50) & (meno == "Postmenopausal")))

#5. Have R find the average 'size' of the tumor for each of the previous three groups. You'll need one statement for each group to complete this.
cancerData %>% filter(age > 50) %>% summarize(avg1 = mean(size, na.rm = TRUE))
cancerData %>% filter((age > 50) & (meno == "premenopausal")) %>% summarize(avg2 = mean(size, na.rm = TRUE))
cancerData %>% filter(((age > 50) & (meno == "premenopausal")) | ((age < 50) & (meno == "Postmenopausal"))) %>% summarize(avg3 = mean(size, na.rm = TRUE))

#6. Have R create a new variable called 'flag' that is "flag" if the women were (over 50 and premenopausal) or (under 50 and Postmenopausal) and "no flag" if they were not. This variable should be added to the data frame.
cancerData %>% mutate(flag = ifelse(((age > 50) & (meno == "premenopausal")) | ((age < 50) & (meno == "Postmenopausal")), "flag", "no flag"))

#7. Have R find the average 'size' of the tumor for the "flag" and "no flag" groups in one R statment.
cancerData %>% mutate(flag = ifelse(((age > 50) & (meno == "premenopausal")) | ((age < 50) & (meno == "Postmenopausal")), "flag", "no flag")) %>% group_by(flag) %>% summarise(Avg4 = mean(size, na.rm = TRUE))

#8. Have R find the number of women that were premenopausal and Postmenopausal, respectively.  Hint use summarize with n() as your function: ex: summarize(count = n())
cancerData %>% group_by(meno) %>% summarize(count = n())

#9. Create a new data frame called abbCancerData that only has the id, size, grade, and flag variables.
abbCancerData <- cancerData %>% mutate(flag = ifelse(((age > 50) & (meno == "premenopausal")) | ((age < 50) & (meno == "Postmenopausal")), "flag", "no flag")) %>% select(id, size, grade, flag)


###########################################################
##Categorical Plots
###########################################################

#Recall the Lahman package that has data about baseball players. Consider the "Master" data set. Write R code to do the following:

#1. Convert the Master data set to a tibble
library(Lahman)
myMaster <- tbl_df(Master)

#2. Create a table that gives the frequency of players by birth months.
table(myMaster$birthMonth)

#3. Create a table that gives the proportion of players by birth months. (Proportion = # in category/total #)
tab <- table(myMaster$birthMonth)
tab <- tab / sum(tab)
tab

#4. Create a bar chart of the player birth month frequencies. Give the plot appropriate labels.
g <- ggplot(myMaster %>% drop_na(birthMonth), aes(x = as.factor(birthMonth)))
g + geom_bar() + 
	labs(x = "Birth Month", title = "Bar Graph of Player Birth Month") +
	scale_x_discrete(labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

#5. Create a two-way contingency table that gives the frequencies of how the player bats ("bats") and the way the player throws ("throws").
twoWayTable <- table(myMaster$bats, myMaster$throws)
twoWayTable

#6. Create a stacked bar chart of the player bat and throw preferences. Give the plot appropriate labels.
g <- ggplot(myMaster %>% drop_na(bats, throws), aes(x = bats))
g + geom_bar(aes(fill = throws)) + labs(title = "Bar Graph of Handedness and Batting Style")


###########################################################
##Quantitative Plots
###########################################################

#We will continue the use of the Lahman package. This time we will look at the Batting data set. Write R code to do the following:

#1. Convert the Batting data set to a tibble.
myBatting <-tbl_df(Batting)

#2. Create a histogram of the games played variable and overlay a smoothed density.
g <- ggplot(myBatting %>% drop_na(G), aes(x = G))
g + geom_histogram(binwidth = 5, linetype = 1, size = 1.25, color = "black", fill = "lightblue", aes(y = ..density..)) + 
	geom_density(size = 1.5)

#3. Create side by side box plots of the hits (H) variable with the lgID as the grouping variable.
g <- ggplot(myBatting %>% drop_na(H, lgID), aes(x = as.factor(lgID)))
g + geom_boxplot(aes(y = H))

#4. Find the 'summary' of the hits variable.
summary(myBatting$H)

#5. Find the total number of homeruns for each year.
myBatting %>% group_by(yearID) %>% summarize(Total = sum(HR, na.rm = TRUE))

#6. Report the correlation between AB and H. Note: The NA values can cause a problem here. Check the options on the cor function.
cor(myBatting$AB, myBatting$H, use = "complete.obs")

#7. Create a scatter plot of the AB and H variables (AB on x axis). Label and title appropriately.
g <- ggplot(myBatting %>% drop_na(AB, H), aes(x = AB, y=H))
g + geom_point(na.rm = TRUE) + 
	labs(x = "At Bats", y = "Hits", title = "Scatterplot of Hits versus At Bats")

#8. Add a regression line to the plot of your choosing.
g + geom_point(na.rm = TRUE) + 
	labs(x = "At Bats", y = "Hits", title = "Scatterplot of Hits versus At Bats") + 
	geom_smooth(method = lm)

#9. Color the points by the number of homeruns.
g + geom_point(na.rm = TRUE, aes(col = HR)) + 
	labs(x = "At Bats", y = "Hits", title = "Scatterplot of Hits versus At Bats") + 
	geom_smooth(method = lm, col = "red")

#10. Make all of the points smaller.
g + geom_point(na.rm = TRUE, size = 0.5, aes(col = HR)) + 
	labs(x = "At Bats", y = "Hits", title = "Scatterplot of Hits versus At Bats") + 
	geom_smooth(method = lm, col="red")

###########################################################
##Basic Analyses
###########################################################

#We'll use the data set built into ggplot2 called msleep. That is, once you've loaded the ggplot2 library the data set will be available to you.  Write R code to do the following:

#1. Fit a SLR model with ln (log in R) of body weight as your response and time awake as your predictor.
fit <- lm(log(bodywt) ~ awake, data = msleep)

#2. Obtain the fitted regression equation.
fit$coefficients

#3. Predict the log body weight for a mammal that is awake 18 hours
predict(fit, data.frame(awake = 18))

#4. Transform the prediction to the body weight scale
exp(predict(fit, data.frame(awake = 18)))

#5. Obtain confidence and prediction intervals for a mammal that is awake 18 hours
exp(predict(fit, data.frame(awake = 18), interval="confidence"))
exp(predict(fit, data.frame(awake = 18), interval="prediction"))

#6. Obtain diagnostic plots for the model fit.
plot(fit)
