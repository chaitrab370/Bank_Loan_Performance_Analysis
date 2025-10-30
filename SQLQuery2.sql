
SELECT DB_NAME() AS CurrentDatabase;

SELECT name FROM sys.databases;

USE "Bank Loan DB";
GO

SELECT DB_NAME() AS CurrentDatabase;


SELECT * FROM bank_loan_data

# 1)monthly trends byissue
SELECT
    MONTH(issue_date) AS month_number,
    DATENAME(MONTH,issue_date) AS month_name,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment)AS total_amount_received
    FROM bank_loan_data 
    GROUP BY MONTH(issue_date), DATENAME(MONTH,issue_date)
    ORDER BY MONTH(issue_date);

# 2)regional analysis bystate
SELECT 
    address_state AS state,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment)AS total_amount_received
    FROM bank_loan_data 
    GROUP BY address_state
    ORDER BY address_state;

SELECT 
    address_state AS state,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment)AS total_amount_received
    FROM bank_loan_data 
    GROUP BY address_state
    ORDER BY SUM(loan_amount) DESC;

# 4)loan term analysis
SELECT
     term AS Term,
     COUNT(id) AS total_loan_applications,
     SUM(loan_amount) AS total_funded_amount,
     SUM(total_payment) AS total_amount_received
     FROM bank_loan_data 
     GROUP BY term
     ORDER BY term;

# 5) employee length analysis
SELECT 
    emp_length AS employee_length,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
    FROM bank_loan_data 
    GROUP BY emp_length
    ORDER BY emp_length;

SELECT 
    emp_length AS employee_length,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
    FROM bank_loan_data 
    GROUP BY emp_length
    ORDER BY COUNT(id)DESC;

# 5)loan purpose breakdown
SELECT 
    purpose AS loan_purpose,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
    FROM bank_loan_data 
    GROUP BY purpose
    ORDER BY purpose;

SELECT 
    purpose AS loan_purpose,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
    FROM bank_loan_data 
    GROUP BY purpose
    ORDER BY COUNT(id)DESC;

# 6) home ownership analysis 
SELECT 
    home_ownership AS Home_ownership,
    COUNT(id) AS total_loan_applications,
    SUM(loan_amount) AS total_funded_amount,
    SUM(total_payment) AS total_amount_received
    FROM bank_loan_data 
    GROUP BY home_ownership
    ORDER BY home_ownership;

# 7) now using lot of filters
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'B'
GROUP BY purpose
ORDER BY purpose

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A' AND address_state='CA'
GROUP BY purpose
ORDER BY COUNT(id)DESC;


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'C' AND address_state='CA' AND home_ownership='RENT'
GROUP BY purpose
ORDER BY COUNT(id)DESC;


SELECT 
    annual_income AS income,
    COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received,
    AVG(int_rate*100.0)AS interest_rate,
    AVG(dti*100.0)AS DTI
FROM bank_loan_data 
WHERE annual_income > 1000000
GROUP BY annual_income
ORDER BY COUNT(id) DESC, annual_income DESC;




