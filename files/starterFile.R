###########################################################
##Code corresponding to activities in course:
##Introduction to Data Science Using R
###########################################################

###########################################################
##Objects and Common Classes 
###########################################################

#Write R code to do the following:

#1. Create and save a vector that contains the elements 4, 7, 10, 13. Call the object 'vec'.
#1a. Add 8 to each element of vec.
#1b. Square each element of vec.
#1c. Sum the elements of vec.

#2a. Create and save a vector of length 4 that consists of adjectives. Call the object 'adj'.
#2b. Create and save a second vector of length 4 that consists of nouns. Call the object 'nouns'.
#2c. Run the following code: 
paste(adj, nouns)

#3. Create a matrix that has first column the adj values and the second column the nouns values.
#4.  Create and save a data frame that has three columns given by vec, adj, and nouns. Call the object 'dataDF'. 

###########################################################
##Attributes and Basic Data Manipulation
###########################################################

#Write R code to do the following:

#1. Print out the element in the 1st row and 1st column of the dataDF object.

#2. Print out the 3rd row of the dataDF object.

#3. Print out the 'adj' column using three different methods.

#4. Print out the 1st and 4th rows of just the 'nouns' column of the dataDF object in one R command.

#5. Look at the structure of the dataDF object.  Note that factors are special types of vectors - we'll cover them later.


###########################################################
##Reading/Writing Data
###########################################################

#Write R code to do the following:

#1. Read in the BreastCancer.dat data file from the URL 'https://www4.stat.ncsu.edu/~online/datasets/BreastCancer.dat'. Save the R object as cancerData.

#2. Read in the mosquito.txt file from 'https://www4.stat.ncsu.edu/~online/datasets/mosquito.txt'. Save the R object as mosquitoData.

#3. Read in the mosquito2.txt file from 'https://www4.stat.ncsu.edu/~online/datasets/mosquito2.txt'. Note this is a tab delimited file. Save the R object as mosquitoData2.

#3a. Use the code below to create a combined version of the mosquito data sets. Save the object as mosquitoFullData.
rbind(mosquitoData, mosquitoData2)

#3b. Write the mosquitoFullData out to a .csv file with name of your choice.

#4. Read in the effort.dta file form the URL 'https://www4.stat.ncsu.edu/~online/datasets/effort.dta'. Note that this is a stata file. Save the R object as effortData.





