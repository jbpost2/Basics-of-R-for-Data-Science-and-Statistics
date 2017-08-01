###########################################################
##Code corresponding to activities in course:
##Introduction to Data Science Using R
##_Your_Name_Here_
##August 7-8, 2017
###########################################################

###########################################################
##Objects and Common Classes 
###########################################################

#Write R code to do the following:

#1. Create and save a vector that contains the elements 4, 7, 10, 13. Call the object 'vec'.
#1a. Add 8 to each element of vec.
#1b. Square each element of vec.
#1c. Sum the elements of vec.

#2. Create and save a vector of length 4 that consists of adjectives. Call the object 'adj'.
#2a. Create and save a second vector of length 4 that consists of nouns. Call the object 'nouns'.
#2b. Run the following code: 
paste(adj, nouns)

#3. Create and save a vector of 26 random values between 0 and 1 using the code: 
unif <- runif(n = 26)
#3a. Create and save a vector of 26 random values from the standard normal distribution using the code: 
norm <- rnorm(n = 30)
#3b. Type `letters' into the console. This is a built-in object in R.
#3c. Create and save a data frame that has three columns given by letters, unif, and norm. Make sure the columns are named and call the object 'dataDF'.


###########################################################
##Attributes and Basic Data Manipulation
###########################################################

#Write R code to do the following:

#1. Print out the element in the 1st row and 1st column of the dataDF object.

#2. Print out the 5th row of the dataDF object.

#3. Print out the 'unif' column using three different methods.

#4. Print out the 5th-10th and 20th rows of the 'unif' column of the dataDF object in one R command.

#5. Look at the attributes of the dataDF object.

#6. Add a new attribute called "descriptor" that contains the 'pasted' adj and noun vectors. Investigate the attributes again.


###########################################################
##Reading/Writing Data
###########################################################

#Write R code to do the following:

#1. Go to the gitHub datasets folder and look at the breastcancer.dat file. Click on the "raw" button.

#2. Read in the BreastCancer.dat data file using the URL you got for the gitHub page after clicking "raw". Save the R object as cancerData.

#3. Repeat the above process to read in the mosquito.txt file. Save the R object as mosquitoData.

#4. Repeat the above process to read in the mosquito2.txt file. Note this is a tab delimited file. Save the R object as mosquitoData2.
#4a. Use the code below to create a combined version of the mosquito data sets. Save the object as mosquitoFullData.
rbind(mosquitoData, mosquitoData2)
#4b. Write the mosquitoFullData out to a .csv file with name of your choice.

#5. Repeat the above process to read in the effort.dta file. Note that this is a stata file. Save the R object as effortData.


###########################################################
##Manipulating Data
###########################################################

#Do not overwrite the data set in any of the steps below unless specified. Using the cancerData and chaining/piping where possible. Write R code to do the following:

#1. Have R sort the data set by youngest to oldest.

#2. Have R print out only women who were over 50.

#3. Have R print out only women who were over 50 and premenopausal.

#4. Have R print out only women who were (over 50 and premenopausal) or (under 50 and Postmenopausal).

#5. Have R find the average 'size' of the tumor for each of the previous three groups. You should have three statements to complete this.

#6. Have R create a new variable called 'flag' that is "flag" if the women were (over 50 and premenopausal) or (under 50 and Postmenopausal) and "no flag" if they were not. This variable should be added to the data frame.

#7. Have R find the average 'size' of the tumor for the "flag" and "no flag" groups in one R statment.

#8. Have R find the number of women that were premenopausal and Postmenopausal.

#9. Create a new data frame called abbCancerData that only has the id, size, grade, and flag variables.


###########################################################
##Categorical Plots
###########################################################

#Recall the Lahman package that has data about baseball players. Consider the "Master" data set. Write R code to do the following:

#1. Convert the Master data set to a tibble

#2. Create a table that gives the frequency of players by birth months.

#3. Create a table that gives the proportion of players by birth months. (Proportion = # in category/total #)
                                                                        
#4. Create a bar chart of the player birth month frequencies. Give the plot appropriate labels.
                                                                      
#5. Create a two-way contingency table that gives the frequencies of birthCountry and the way the player throws ("throws").
                                                                      
#6. Create a stacked bar chart of the player birth month frequencies. Give the plot appropriate labels.


###########################################################
##Quantitative Plots
###########################################################

#We will continue the use of the Lahman package. This time we will look at the Batting data set. Write R code to do the following:

#1. Convert the Batting data set to a tibble.

#2. Create a histogram of the games played variable and overlay a smoothed density.

#3. Create side by side box plots of the hits (H) variable with the lgID as the grouping variable.

#4. Find the 'summary' of the hits variable.

#5. Find the total number of homeruns for each year.

#6. Report the correlation between AB and H. Note: The NA values can cause a problem here. Check the options on the cor function.

#7. Create a scatter plot of the AB and H variables (AB on x axis). Label and title appropriately.

#8. Add a regression line to the plot of your choosing.

#9. Color the points by the number of homeruns.

#10. Make all of the points smaller.


###########################################################
##Basic Analyses
###########################################################

#We'll use the data set built into ggplot2 called msleep. That is, once you've loaded the ggplot2 library the data set will be available to you.  Write R code to do the following:

#1. Fit a SLR model with ln (log in R) of body weight as your response and time awake as your predictor.

#2. Obtain the fitted regression equation.

#3. Predict the log body weight for a mammal that is awake 18 hours

#4. Transform the prediction to the body weight scale

#5. Obtain confidence and prediction intervals for a mammal that is awake 18 hours

#6. Obtain diagnostic plots for the model fit.


