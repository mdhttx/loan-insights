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
-----------------------------------------
-- ISSUING GOOD LOANS
-- 14) percentage of good loans to total loans 

SELECT CAST(ROUND((SUM(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN 1 END) * 100.0) / COUNT(id), 2) AS DECIMAL(10,2)) 
       AS Good_Loan_Percentage
FROM Bank_Loans_Data;

-- 15) Good Loan Applications	
SELECT COUNT(id) AS Good_Loan_Applications 
FROM Bank_Loans_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- 16) Good Loan Funded Amound

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM Bank_Loans_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- 17) Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Received_Amount
FROM Bank_Loans_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current' -- Notice that by comparing the result with the previous query it's pretty clear the bank is profiting from those good loans


-----------------------------------------
-----------------------------------------
-- ISSUING BAD LOANS
-- 18) percentage of bad loans to total loans 

SELECT CAST(ROUND((SUM(CASE WHEN loan_status = 'Charged Off' THEN 1 END) * 100.0) / COUNT(id), 2) AS DECIMAL(10,2)) 
       AS Bad_Loan_Percentage
FROM Bank_Loans_Data;


-- 19) Bad Loan Applications	
SELECT COUNT(id) AS Bad_Loan_Applications 
FROM Bank_Loans_Data
WHERE loan_status = 'Charged Off'

-- 20) Bad Loan Funded Amound

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM Bank_Loans_Data
WHERE loan_status = 'Charged Off' 

-- 21) Bad Loan Total Received Amount
SELECT SUM(total_payment) AS Bad_Loan_Received_Amount
FROM Bank_Loans_Data
WHERE loan_status = 'Charged Off' -- Notice that by comparing the result with the previous query it's pretty clear the bank is losing from those bad loans
								-- That's one of the reasons why banks do care about things like credit scores and debt history

-----------------------------------------------------------
-----------------------------------------------------------
-- LOAN SATUS GRID VIEW

SELECT loan_status,
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(total_payment) AS Total_Amount_Received,
	   SUM(loan_amount) AS Total_Funded_Amount, 
	   ROUND(AVG(int_rate * 100) , 2) AS Interest_Rate,
	   ROUND(AVG(dti * 100) , 2) AS Debt_To_Income
FROM Bank_Loans_Data
GROUP BY loan_status

-- LOAN STATUS GRID VIEW - MTD 

SELECT loan_status,
	   SUM(total_payment) AS MTD_Total_Amount_Received,
	   SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM Bank_Loans_Data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status


-------------------------------------------------
-------------------------------------------------
-- BANK LOAN REPORT 
-- MONTHLY TREND

SELECT MONTH(issue_date) AS Month_Number,
	   DATENAME(MONTH , issue_date) AS Month_Name, 
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(loan_amount) AS Total_Funded_Amount,
	   SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loans_Data
GROUP BY MONTH(issue_date) , DATENAME(MONTH , issue_date)
ORDER BY MONTH(issue_date)

-- REGIONAL ANALYSIS BY STATE

SELECT address_state AS State,
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(loan_amount) AS Total_Funded_Amount,
	   SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loans_Data
GROUP BY address_state
order by address_state

-- LOAN TERM ANALYSIS (DONUT CHART)
SELECT term AS Term,
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(loan_amount) AS Total_Funded_Amount,
	   SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loans_Data
GROUP BY term
order by term

-- Employee Length Analysis (BAR CHART)
SELECT emp_length AS Employee_Length
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(loan_amount) AS Total_Funded_Amount,
	   SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loans_Data
GROUP BY emp_length
ORDER BY emp_length


-- LOAN PURPOSE BREAKDOWN (BAR CHART)
SELECT purpose AS Loan_Purpose ,
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(loan_amount) AS Total_Funded_Amount,
	   SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loans_Data
GROUP BY purpose
ORDER BY COUNT(id) DESC

-- HOME OWNERSHIP ANALYSIS (TREE MAP) 
SELECT home_ownership AS Home_Ownership,
	   COUNT(id) AS Total_Loan_Applications,
	   SUM(loan_amount) AS Total_Funded_Amount,
	   SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loans_Data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC