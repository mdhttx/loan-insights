select * from Bank_Loans_Data

-- KPIs 
-----------------------------------------
select * from Bank_Loans_Data
-- 1) Total Loan Applications 
SELECT count(ID) AS [Total_Loan_Applications] FROM BankLoanDB.dbo.Bank_Loans_Data  -- ID is unique for each application

-- For December 

-- 2) MTD (Month_to_Date) Loan Applications
SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM Bank_Loans_Data
WHERE MONTH(issue_date) = 12


-- 3) PMTD (Previous MTD) Loan Applications
SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM Bank_Loans_Data
WHERE MONTH(issue_date) = 11


-----------------------------------------
-- 4) Total Funded Amound (Total Loan Amount)

Select sum(loan_amount) as Total_Funded_Amount from Bank_Loans_Data

-- 5) Total Funded Amount (Month To Date) MTD
Select sum(loan_amount) as MTD_Total_Funded_Amount from Bank_Loans_Data
WHERE Month(issue_date) = 12 and YEAR(issue_date) = 2021 

-- 5) Total Funded Amount (Previous Month To Date) PMTD
Select sum(loan_amount) as PMTD_Total_Funded_Amount from Bank_Loans_Data
WHERE Month(issue_date) = 11 and YEAR(issue_date) = 2021 

-----------------------------------------
-- 6) Total Amount Received 
SELECT SUM(total_payment) AS Total_Amount_Received FROM Bank_Loans_Data

-- 7) Total Month-to-Date Amount Received (MTD)

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM Bank_Loans_Data
WHERE Month(issue_date) = 12 and YEAR(issue_date) = 2021 

-- 7) Previous Month-to-Date Total Amount Received (PMTD)
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM Bank_Loans_Data
WHERE Month(issue_date) = 11 and YEAR(issue_date) = 2021 
-----------------------------------------
-- 8) Average Interest Rate 
SELECT ROUND(AVG(int_rate) * 100 , 2 ) AS Avg_Interest_Rate
FROM Bank_Loans_Data

-- 9) MTD Average Interest Rate 
SELECT ROUND(AVG(int_rate) * 100 , 2 ) AS MTD_Avg_Interest_Rate
FROM Bank_Loans_Data
WHERE Month(issue_date) = 12 and YEAR(issue_date) = 2021 

-- 10) PMTD Average Interest Rate 
SELECT ROUND(AVG(int_rate) * 100 , 2 ) AS PMTD_Avg_Interest_Rate
FROM Bank_Loans_Data
WHERE Month(issue_date) = 11 and YEAR(issue_date) = 2021 

-----------------------------------------
-- 11) Average Debt to Income Ratio (DTI) 
SELECT ROUND(AVG(dti) * 100 , 2) AS AVG_DTI
FROM Bank_Loans_Data

-- 12) MTD Average Debt to Income Ratio (MDT-DTI) 
SELECT ROUND(AVG(dti) * 100 , 2) AS MTD_AVG_DTI
FROM Bank_Loans_Data
WHERE Month(issue_date) = 12 and YEAR(issue_date) = 2021 

-- 13) PMTD Average Debt to Income Ratio (PMTD-DTI) 
SELECT ROUND(AVG(dti) * 100 , 2) AS PMTD_AVG_DTI
FROM Bank_Loans_Data
WHERE Month(issue_date) = 11 and YEAR(issue_date) = 2021 

-----------------------------------------
