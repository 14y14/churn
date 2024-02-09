churnProb = function(dataset, customerId){

  #linmod = glm(mergedData$Exited ~ mergedData$CreditScore + mergedData$Gender + mergedData$Age+ mergedData$Tenure+mergedData$Balance+mergedData$NumOfProducts
   #            +mergedData$HasCrCard+mergedData$IsActiveMember+mergedData$EstimatedSalary, family = "binomial")

  #churn_prob <- predict(linmod, newdata = merged, type = "response")

  # Add churn probability as a new column to your table
  #merged$Churn_Probability <- churn_prob


  customer_row <- dataset[dataset$CustomerId == customerId, ]

  # Check if customer ID exists in the dataset
  if (nrow(customer_row) == 0) {
    return("Customer ID not found in the dataset.")
  }

  # Extract churn probability for the customer
  churnprobability <- customer_row$Churn_Probability
  return(churnprobability)
}
