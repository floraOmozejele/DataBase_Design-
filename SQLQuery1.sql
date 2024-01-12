SELECT * FROM BankChurners

----------- BANK CHURNERS ------
--# - What is the mean and the median  of customer age (central tendencies)
--# - Show the measures of dispersion of atleast 3 numerical variables in the dataset
--# - How many Married people are in the dataset 
--# - What is the average age of each marital status
--# - Is there a relationship between the Credit Limit and transaction amount(Total_Trans_Amt) (visuals)
---Classify the customer age into age classes
--# - What is the average transcation amount for each age class
--# - What is the total of credit limit of all graduates in the dataset
--# - What Gender makes the most transaction amount.
--# - Show the distribution of Gender in the dataset
--# - Blue card is the high class card. Show the distribution of the Card Category accross all gender
--# - What gender is most divorced
--# - What gender has the highest level of education
--# - Does education matter on the amount of credit limit one has ?
--# - What is the average transaction amount for each education level


--- What is the mean and the median  of customer age (central tendencies)
SELECT AVG(Customer_Age) AS mean_median_customer_Age
 FROM Bankchurners
 GROUP BY Customer_Age 


 --# - Show the measures of dispersion of atleast 3 numerical variables in the dataset
SELECT stdev(Customer_Age) as deviation, VAR(Customer_Age) as Variance,
 MAX(Customer_Age), - MIN(Customer_Age) AS customers_range
 FROM Bankchurners


 --# - How many Married people are in the dataset 

SELECT COUNT(*) AS MarriedCount
FROM Bankchurners
WHERE Marital_Status = 'Married';

--# - What is the average age of each marital status

SELECT Marital_Status, AVG(Customer_Age) AS AvgAge
FROM Bankchurners
GROUP BY Marital_Status
 
 ---Classify the customer age into age classes
 --# - What is the average transcation amount for each age class 

 SELECT *,
      case
	      when Customer_Age < 35 then 'Young Adult'
		  when Customer_Age between 35 and 50 then 'Old Adult'
		  when Customer_Age between 50 and 60 then 'Old'
  end as "Age Class"
  From BankChurners

  ---OR

With temp_table as (
Select *,
     case 
	    when Customer_Age < 20 then 'Young'
		when Customer_Age between 20 and 35 then 'Adult'
		when Customer_Age between 35 and 50 then 'Old'
		else 'Senior Cititzen'
  end as "Age Class"
From BankChurners
)
SELECT * From temp_table 

 
 With temp_table as (
Select *,
     case 
	    when Customer_Age < 20 then 'Young'
		when Customer_Age between 20 and 35 then 'Adult'
		when Customer_Age between 35 and 50 then 'Old'
		else 'Senior Cititzen'
  end as "Age Class"
From BankChurners
)

SELECT AVG(Total_Trans_Amt) AS AvgTransactionAmount, "Age Class"
FROM temp_table
GROUP BY "Age Class"
ORDER BY AvgTransactionAmount DESC


   

--# - What is the total of credit limit of all graduates in the dataset
SELECT SUM(Credit_Limit) AS TotalCreditLimit
FROM BankChurners
WHERE Education_Level = 'Doctorate'
Group BY Gender 


--# - What Gender makes the most transaction amount
SELECT top (1) Gender, AVG(Total_Trans_Amt) AS TotalTransactionAmount
FROM Bankchurners
GROUP BY Gender
ORDER BY TotalTransactionAmount 

--# - Show the distribution of Gender in the dataset
SELECT Gender, COUNT(Gender) AS Distribution_of_Gender
FROM Bankchurners
GROUP BY Gender;

--# - Blue card is the high class card. Show the distribution of the Card Category accross all gender
SELECT Gender, COUNT(Card_Category) AS Card_Distribution
FROM Bankchurners
WHERE Card_Category = 'Blue'
GROUP BY Gender

--# - What gender is most divorced
SELECT top (1)Gender, COUNT(Gender) AS Most_Divorced
FROM Bankchurners
WHERE Marital_Status = 'Divorced'
GROUP BY Gender
ORDER BY Most_Divorced DESC

--# - What gender has the highest level of education
SELECT Gender, COUNT(Education_Level) AS HIGHEST_EDUCATION_LEVEL
FROM BankChurners
WHERE Education_Level = 'Doctorate'
GROUP BY Education_Level 

--# - Does education matter on the amount of credit limit one has ?
SELECT Education_Level, AVG(Credit_Limit) AS AvgCreditLimit
FROM Bankchurners
GROUP BY Education_Level

--# - What is the average transaction amount for each education level
SELECT Education_Level, AVG(Total_Trans_Amt) AS AvgTransactionAmount
FROM Bankchurners 
GROUP BY Education_level;

--# - Show the distribution of Gender in the dataset
SELECT Gender, COUNT(*) AS Distribution_Gender
FROM Bankchurners
GROUP BY Gender;

-----Show the distribution of customers according to Attrition
SELECT Attrition_Flag, count(Clientnum) AS Total_attrition
FROM BankChurners 
GROUP BY Attrition_Flag
ORDER BY total_attrition







