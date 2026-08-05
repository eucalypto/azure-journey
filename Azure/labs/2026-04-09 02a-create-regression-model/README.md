# Lab: Explore regression with Azure Machine Learning Designer

**Certification:** AI-900  
**Date completed:** 2026-04-09  
**Lab Link:** https://microsoftlearning.github.io/AI-900-AIFundamentals/instructions/02a-create-regression-model.html

## Scenario

> A car selling company wants to predict car prices for their available cars, using data from past sells. Since car buying contains a lot of negotiations, it's not enough to take the base price of the car.


## What I Did

- Create Workspace in Azure Machine Learning Studio
- Create Compute Cluster for training
- create pipeline for training in Designer
- run the pipeline as a job
- from this create an inference pipeline and set it up to receive user input as data
- deploy the inference pipeline as an API
- test the API (via Python script)

Testing of the deployed API with the [./test_api.py](./test_api.py) script results:
```
b'{"Results": {"WebServiceOutput0": [{"predicted_price": 14996.972300458227}]}}'

b'{"Results": {"WebServiceOutput0": [{"predicted_price": 23141.26283450902}]}}'

b'{"Results": {"WebServiceOutput0": [{"predicted_price": 39628.13596455278}]}}'
```

## Gotchas & Learnings

- **Problem:** The account I had from the training provider did not have the rights to deploy the inference pipeline as ACI (Azure Container Instance)  
  **Fix:** I had to manually create an AKS Compute Cluster as new resource to use as the inference cluster to deploy the API.  
  **Takeaway:** If you lack the permissions do do it one way, try another.
    
- **Problem:** The testing of the deployed API could not be done via the "Test" Tab of the API page.  
  **Fix:** I had to run the provided Python script that calls the API locally.  
  **Takeaway:** Using the API from code like Python is the correct way to use the API anyway :)

- **Problem:** The regression model had a Coefficient of Determination (R^2) of less than ~0.8 This means less than 80% of the price variations could be explained by the full model.  
  **Fix:** No fix here since this lab only uses linear regression as a model  
  **Takeaway:** This 0.8 can be seen as a base value. Linear regression models are very lightweihgt and can be trained quickly. If a more sophisticated model gives an R^2 of only a bit more than this 0.8 then the overhead of compute and time might not be worth it.


## Resources

- [GitHub lab instructions link](https://microsoftlearning.github.io/AI-900-AIFundamentals/instructions/02a-create-regression-model.html)




  
