
SELECT DB_NAME() AS CurrentDatabase;

SELECT name FROM sys.databases;

USE "Bank Loan DB";
GO

SELECT DB_NAME() AS CurrentDatabase;

SELECT * FROM bank_loan_data

# 1)Total loan applications
SELECT COUNT(id) AS TOTAL_LOAN_APPLICATIONS FROM bank_loan_data

SELECT COUNT(id) AS MTD_TOTAL_LOAN_APPLICATIONS FROM bank_loan_data 
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

SELECT COUNT(id) AS PMTD_TOTAL_LOAN_APPLICATIONS FROM bank_loan_data 
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

# 2) Total Funded Amount
SELECT SUM(loan_amount) AS TOTAL_FUNDED_AMOUNT FROM bank_loan_data

SELECT SUM(loan_amount) AS MTD_TOTAL_FUNDED_AMOUNT FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

SELECT SUM(loan_amount) AS PMTD_TOTAL_FUNDED_AMOUNT FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

# 3) Total Amount Received
SELECT SUM(total_payment) AS TOTAL_AMOUNT_RECEIVED FROM bank_loan_data

SELECT SUM(total_payment) AS MTD_TOTAL_AMOUNT_RECEIVED FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

SELECT SUM(total_payment) AS PMTD_TOTAL_AMOUNT_RECEIVED FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

# 4) Average Interest Rate
SELECT ROUND(AVG(int_rate*100),2) AS AVG_INTEREST_RATE FROM bank_loan_data

SELECT ROUND(AVG(int_rate*100),1) AS MTD_AVG_INTEREST_RATE FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

SELECT ROUND(AVG(int_rate*100),1) AS PMTD_AVG_INTEREST_RATE FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

# 5) Average DTI
SELECT ROUND(AVG(dti*100),2) AS AVG_INTEREST_RATE FROM bank_loan_data

SELECT ROUND(AVG(dti*100),1) AS MTD_AVG_INTEREST_RATE FROM bank_loan_data
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021

SELECT ROUND(AVG(dti*100),1) AS PMTD_AVG_INTEREST_RATE FROM bank_loan_data
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021

SELECT loan_status FROM bank_loan_data

# 6)good loan 
SELECT
   (COUNT(CASE WHEN loan_status='Fully Paid' OR loan_status='Current' THEN id ELSE NULL END)*100)/
   COUNT(id) AS GOOD_LOAN_PERCENTAGE
FROM bank_loan_data

SELECT
   COUNT(CASE WHEN loan_status='Fully Paid' OR loan_status='Current' THEN id ELSE NULL END)
   AS TOTAL_GOOD_LOAN_APPLICATIONS
FROM bank_loan_data

SELECT COUNT(id) AS TOTAL_GOOD_LOAN_APPLICATIONS FROM bank_loan_data WHERE loan_status='Fully Paid' OR loan_status='Current'

SELECT SUM(loan_amount) AS GOOD_LOAN_FUNDED_AMOUNT FROM bank_loan_data WHERE loan_status='Fully Paid' OR loan_status='Current'

SELECT
   SUM(CASE WHEN loan_status='Fully Paid' OR loan_status='Current' THEN loan_amount END)
   AS GOOD_LOAN_FUNDED_AMOUNT
FROM bank_loan_data

SELECT SUM(total_payment) AS GOOD_LOAN_TOTAL_RECEIVED FROM bank_loan_data WHERE loan_status='Fully Paid' OR loan_status='Current'

SELECT
   SUM(CASE WHEN loan_status='Fully Paid' OR loan_status='Current' THEN total_payment END)
   AS GOOD_LOAN_TOTAL_RECEIVED
FROM bank_loan_data

7)Bad Loan
SELECT
   (COUNT(CASE WHEN loan_status='Charged Off' THEN id ELSE NULL  END)*100)/
   COUNT(id) AS BAD_LOAN_PERCENTAGE
FROM bank_loan_data

SELECT COUNT(id) AS BAD_LOAN_APPLICATIONS FROM bank_loan_data WHERE loan_status='Charged Off' 

SELECT
   (COUNT(CASE WHEN loan_status='Charged Off' THEN id ELSE NULL  END))
   AS BAD_LOAN_APPLICATIONS
FROM bank_loan_data

SELECT SUM(loan_amount) AS BAD_LOAN_FUNDED_AMOUNT FROM bank_loan_data WHERE loan_status='Charged Off'

SELECT
   SUM(CASE WHEN loan_status='Charged Off' THEN loan_amount ELSE NULL END)
   AS BAD_LOAN_FUNDED_AMOUNT
FROM bank_loan_data

SELECT SUM(total_payment) AS BAD_LOAN_TOTAL_RECEIVED FROM bank_loan_data WHERE loan_status='Charged Off'

SELECT
   SUM(CASE WHEN loan_status='Charged Off' THEN total_payment ELSE NULL END)
   AS BAD_LOAN_TOTAL_RECEIVED
FROM bank_loan_data

# 8) Loan Status
SELECT
     loan_status,
     COUNT(id) AS loan_count,
     SUM(total_payment) AS total_amount_received,
     SUM(loan_amount)AS total_funded_amount,
     AVG(int_rate*100.0)AS interest_rate,
     AVG(dti*100.0)AS DTI
     FROM bank_loan_data 
     GROUP BY loan_status;


SELECT 
    loan_status,
    SUM(total_payment)AS MTD_total_amount_received,
    SUM(loan_amount)AS MTD_total_funded_amount
    FROM bank_loan_data 
    WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021
    GROUP BY loan_status;

SELECT 
    loan_status,
    SUM(total_payment)AS MTD_total_amount_received,
    SUM(loan_amount)AS MTD_total_funded_amount,
    AVG(int_rate*100.0)AS MTD_interest_rate,
    AVG(dti*100.0)AS MTD_DTI
    FROM bank_loan_data 
    WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021
    GROUP BY loan_status;


SELECT 
    loan_status,
    SUM(total_payment)AS PMTD_total_amount_received,
    SUM(loan_amount)AS PMTD_total_funded_amount,
    AVG(int_rate*100.0)AS PMTD_interest_rate,
    AVG(dti*100.0)AS PMTD_DTI
    FROM bank_loan_data 
    WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021
    GROUP BY loan_status;

    
  






















