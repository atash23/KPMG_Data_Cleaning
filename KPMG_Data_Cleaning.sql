--Joining Costumer demographic and Customer address data

SELECT *
FROM KPMG..CustomerDemographic$ dem
Join KPMG..CustomerAddress$ adr
	On adr.customer_id = dem.customer_id

--Checking unique values in gender column
SELECT DISTINCT gender
FROM KPMG..CustomerDemographic$ dem
Join KPMG..CustomerAddress$ adr
	On adr.customer_id = dem.customer_id

--Found 6 unique values (F, Femal, Male, U, Female, M)

--Standardizing values in gender column (F, Femal to Female), (M to Male)
UPDATE
	KPMG..CustomerDemographic$
SET
	gender = 
		CASE
			WHEN gender = 'F' THEN 'Female'
			WHEN gender = 'Femal' THEN 'Female'
			WHEN gender = 'M' THEN 'Male'
			ELSE gender
		END


--Checking unique values in state column
SELECT DISTINCT state
FROM KPMG..CustomerDemographic$ dem
Join KPMG..CustomerAddress$ adr
	On adr.customer_id = dem.customer_id
order by state
--Found 6 unique values (New South Wales, NSW, QLD, VIC, Victoria)
--Standardizing values in state column (New South Wales to NSW), (Victoria to VIC)
UPDATE
	KPMG..CustomerAddress$
SET
	state = 
		CASE
			WHEN state = 'New South Wales' THEN 'NSW'
			WHEN state = 'Victoria' THEN 'VIC'
			ELSE state
		END

--Droping unreadable column 'defaults'
ALTER TABLE KPMG..CustomerDemographic$
DROP COLUMN defaults

--Working area
SELECT *
FROM KPMG..CustomerDemographic$ dem
Join KPMG..CustomerAddress$ adr
	On adr.customer_id = dem.customer_id


SELECT DISTINCT property_valuation
FROM KPMG..CustomerDemographic$ dem
Join KPMG..CustomerAddress$ adr
	On adr.customer_id = dem.customer_id

--Looking at tracsaction data
--Changing 'transaction_date' data type from string to date
UPDATE
	KPMG..tr
SET
	transaction_date = CONVERT(date, transaction_date, 103)
--Removing $ sign and space from 'standard_cost' column values
UPDATE
	KPMG..tr
SET
	standard_cost = REPLACE(standard_cost, '$', '')
UPDATE
	KPMG..tr
SET
	standard_cost = REPLACE(standard_cost, ' ', '')
--Working area

SELECT *
FROM KPMG..tr
Order by transaction_date
