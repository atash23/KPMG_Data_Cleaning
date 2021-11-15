# KPMG_Data_Cleaning
Hi [Client point-of-contact],

Thank you for providing us with the three datasets from Sprocket Central Pty Ltd. The below table 
highlights the summary statistics from the three datasets received. Please let us know if the figures are 
not aligned with your understanding.

Table name	No. of records	Distinct customer ID	Date data is received
Customer Demographics	4000	customer_id	09.11.2021
Customer Address
	4003	customer_id	09.11.2021
Transaction Data
	20000	customer_id	09.11.2021

We have identified few data quality issues and how this may impact our analysis going forward. Below are our recommendations on ways to clean the underlying data and mitigate these issues.
•	Additional customer_ids in the Transaction Data and Customer Address Data but not in Customer Demographic
Mitigation: Please ensure that all tables are from the same period. 
This indicates that the data may not be in sync with each other which may skew analysis results if there are missing data records.
•	Join Customer Addresses Data to Customer Demographic Data. Joined dataset will make work easier in analysis phase, since we will not jump around different datasets. 
•	Inconsistent values for the same attribute 
(e.g. Female being represented as “F” and “Fema”) 
Consistent values in these columns will help us get consistent results during analysis phase.
•	Various columns, such as the brand of a purchase, or job title, have empty values in 
certain records. 
Mitigation: If only a small number of rows are empty, filter out the record entirely from the training set for prediction.
Else, if it is a core field, impute based on distribution in the training dataset. For key datasets, such as transactions, less than 1% of transactions (totaling less than 0.1% of revenue) have missing fields. These records have been removed from the training dataset.

Moving forward, the team will continue with the data cleaning, standardization and transformation process for the purpose of model analysis. Questions will be raised along the way and assumptions documented. Please let me know if you have any questions.

Kind Regards
Atash
