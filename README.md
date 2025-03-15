# Banking Loans Data Analysis (2021) - USA

This project focuses on analyzing and visualizing banking loans data from 2021 in the USA. The final dashboard is interactive and contains three main pages: **Summary Page, Overview, and Details**.

## Summary Page
![Picture_1](https://github.com/user-attachments/assets/201057be-9f55-4c8f-80d5-4640d64b0f43)


The **Summary Page** provides key performance indicators (KPIs) to track loan metrics:

- **KPIs Tracked:**
  - Total Loan Applications
  - Total Funded Amount
  - Total Amount Received
  - Average Interest Rate
  - Average Debt-to-Income Ratio (DTI)
  - Month-to-Date (MTD) and Month-Over-Month (MoM) comparisons

- **Loan Classification:**
  - Loans are categorized into **Good Loans** and **Bad Loans**, with the following insights:
    1. Loan Application Percentage
    2. Loan Applications Count
    3. Loan Funded Amount
    4. Total Received Amount

- **Loan Status Grid View:**
  - Categorized by **Loan Status**
  - Provides insights into:
    - Total Loan Applications
    - Total Funded Amount
    - Total Amount Received
    - MTD Funded Amount
    - MTD Amount Received
    - Average Interest Rate
    - Average Debt-to-Income Ratio (DTI)

## Overview Page
![Picture_2](https://github.com/user-attachments/assets/93243bb1-c2a9-47fb-9e72-16a702555046)

The **Overview Page** presents various visualizations to analyze lending patterns:

- **Charts:**
  - **Monthly Trends by Issue Date (Line Chart):** Identifies seasonality and long-term trends.
  - **Regional Analysis by State (Filled Map):** Highlights lending activity by region.
  - **Loan Term Analysis (Donut Chart):** Shows loan distribution across term lengths.
  - **Employee Length Analysis (Bar Chart):** Assesses how employment history impacts loan applications.
  - **Loan Purpose Breakdown (Bar Chart):** Visualizes loan distribution based on purpose.
  - **Home Ownership Analysis (Tree Map):** Examines how home ownership influences loan applications.

- **Key Metrics Displayed:**
  - Total Loan Applications
  - Total Funded Amount
  - Total Amount Received

## Details Page
![Picture_3](https://github.com/user-attachments/assets/4390fe25-4d50-4900-99a5-73738ecee420)

The **Details Page** provides a **comprehensive and user-friendly interface** for accessing loan data. It serves as a **one-stop solution** for detailed insights into:

- Loan portfolio
- Borrower profiles
- Loan performance

## Data Validation

- A **Data Description File** is included to explain the dataset fields.
- **Cross-validation** was performed using **SQL Server** to ensure the accuracy of **DAX measures in Power BI**.
- The SQL queries used for validation are attached in a separate file. [Cross Validation SQL Queries](Financial_Loans/KPIs_Validation.sql)


---

🔹 **Tech Stack:** Power BI, SQL Server, DAX  
📊 **Dataset:** Banking loans data (USA, 2021)  


SQL Server – Data validation and cross-checking accuracy

DAX (Data Analysis Expressions) – Custom calculations for Power BI

## Installation & Usage

Open the Power BI file.

Load the dataset.

Explore insights via interactive visualizations.

## Credits & Acknowledgments

This project idea was inspired by the following YouTube video:  
[Power BI Complete Tutorial | Power BI Project | Bank Loan Analysis | Finance Domain - Data Tutorials](https://youtu.be/3I8wd1AShXs?si=AxiEjX9qXuXvTVZF)

Special thanks to the original creator for sharing valuable insights on banking loan data analysis!  

