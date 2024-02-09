#   4. Write a test as follows: the churn probability for the customer identified in step 3.4
#   as having the highest probability is always higher than that of the customer identified in the same
#   step as having the lowest probability.
library(testthat)

#get merged dataset:
#0. Get datasets
path = "C:/Users/Layla/OneDrive - Universität Zürich UZH/14. Semester/R course/Day 5/"
dCustomer = fread(paste0(path,"data_customer.csv"))
dPersonal = fread(paste0(path,"data_personal.csv"))

#   1. Merge the two data tables on the column CustomerId.
mergedData = merge(dCustomer, dPersonal, by="CustomerId")

#generate linmod
linmod = glm(mergedData$Exited ~ mergedData$CreditScore + mergedData$Gender + mergedData$Age+ mergedData$Tenure+mergedData$Balance+mergedData$NumOfProducts
             +mergedData$HasCrCard+mergedData$IsActiveMember+mergedData$EstimatedSalary, family = "binomial")
#linmod
#make churn prob
churn_prob <- predict(linmod, newdata = mergedData, type = "response")

# Add churn probability as a new column to your table
mergedData$Churn_Probability <- churn_prob

#print(mergedData[min(mergedData$Churn_Probability), ])

expect_lt(mergedData[which.min(mergedData$Churn_Probability), ]$Churn_Probability, mergedData[which.max(mergedData$Churn_Probability), ]$Churn_Probability)

