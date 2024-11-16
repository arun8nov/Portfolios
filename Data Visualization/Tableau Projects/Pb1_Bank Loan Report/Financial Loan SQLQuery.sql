--Dash Board 1
--1.
--Total Loan Applications: 

select distinct count(id) as Total_Applications from financial_loan

--MTD(Month to Date) Applications

select distinct count(id) as MTD_Total_Applications from financial_loan
where month(issue_date) = 12 and year(issue_date) =2021

--MOM(Month on Month) Total Apllications

select distinct count(id) as PMTD_Total_Applications from financial_loan
where month(issue_date) = 11 and year(issue_date) =2021

--2.	
--Total Funded Amount:

select sum(loan_amount) as Total_Funded_Amount from financial_loan 

--MTD(Month to Date)

select sum(loan_amount) as MTD_Total_Funded_Amount from financial_loan 
where month(issue_date) = 12 and year(issue_date) =2021

--MOM(Month on Month)

select sum(loan_amount) as PMTD_Total_Funded_Amount from financial_loan 
where month(issue_date) = 11 and year(issue_date) =2021

--3.	
--Total Amount Received: 

select sum(total_payment) as Total_Amount_Received from financial_loan 

--MTD(Month to Date)

select sum(total_payment) as MTD_Total_Amount_Received from financial_loan 
where month(issue_date) = 12 and year(issue_date) =2021

--MOM(Month on Month)

select sum(total_payment) as PMTD_Total_Amount_Received from financial_loan 
WHERE month(issue_date) = 11 and year(issue_date) =2021

--4.	
--Average Interest Rate

select round((avg(int_rate)*100),2) as Avg_int_rate from financial_loan

--MTD(Month to Date)

select round((avg(int_rate)*100),2) as MTD_Avg_int_rate from financial_loan
WHERE month(issue_date) = 12 and year(issue_date) =2021

--MOM(Month on Month)

select round((avg(int_rate)*100),2) as PMTD_Avg_int_rate from financial_loan
WHERE month(issue_date) = 11 and year(issue_date) =2021

--5.	
--Average Debt-to-Income Ratio (DTI)

select round((avg(dti)*100),2) as Avg_DTI from financial_loan

--MTD(Month to Date)
select round((avg(dti)*100),2) as MTD_Avg_DTI from financial_loan
WHERE month(issue_date) = 12 and year(issue_date) =2021

--MOM(Month on Month)
select round((avg(dti)*100),2) as PMTD_Avg_DTI from financial_loan
WHERE month(issue_date) = 11 and year(issue_date) =2021


--Good Loan KPIs:
--2.Good Loan Application 

select distinct count(id) as Good_Loan_Application  from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current'

--1.Good Loan Application Percentage: 

select 
	((count(case when loan_status = 'Fully Paid' or loan_status = 'current' then id end)*100)
	/
	count(id)) as Good_Loan_Application_Percentage
from financial_loan

--3.Good Loan Funded Amount: 

select sum(loan_amount) as Good_Loan_Funded_Amount  from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current'

--4.Good Loan Total Received Amount

select sum(total_payment) as Good_Loan_Total_Received_Amount  from financial_loan
where loan_status = 'Fully Paid' or loan_status = 'current'

--Bad Loan KPIs:
--2.Bad Loan Applications: 

select distinct count(id) as Bad_Loan_Application  from financial_loan
where loan_status = 'Charged Off' 

--1.Bad Loan Application Percentage: 

select 
	((count(case when loan_status = 'Charged Off' then id end )*100)
	/
	count(id)) as Bad_Loan_Application_Percentage
from financial_loan

--3.Bad Loan Funded Amount

select sum(loan_amount) as Bad_Loan_Funded_Amount  from financial_loan
where loan_status = 'Charged Off' 

--4.Bad Loan Total Received Amount

select sum(total_payment) as Bad_Loan_Received_Amount  from financial_loan
where loan_status = 'Charged Off' 

-- Loan Status 

select
	loan_status,
	count(id) as Total_Loan_Application,
	sum(loan_amount) as Total_Loan_Amount,
	sum(total_payment) as Total_Amount_Received,
	round(avg(int_rate*100),2) as Int_Rate,
	round(avg(dti*100),2) as DTI
from financial_loan
group by loan_status

-- Loan Status  MTD

select
	loan_status,
	count(id) as Total_Loan_Application,
	sum(loan_amount) as Total_Loan_Amount,
	sum(total_payment) as Total_Amount_Received,
	round(avg(int_rate*100),2) as Int_Rate,
	round(avg(dti*100),2) as DTI
from financial_loan
where month(issue_date) = 12 
group by loan_status



--Dashboard 2

--1.Monthly Trends by Issue Date 

select 
	month(issue_date) as month_num,
	datename(month,issue_date) as Month_issued,
	count(id) as Total_Applications,
	sum(loan_Amount) as Total_Loan_Amount,
	sum(total_payment) as Total_Amount_Received
from financial_loan 
group by month(issue_date),datename(month,issue_date)
order by month(issue_date)

--2.Regional Analysis by State 

select
	address_state as state_Name,
	count(id) as Total_Applications,
	sum(loan_Amount) as Total_Loan_Amount,
	sum(total_payment) as Total_Amount_Received
from financial_loan 
group by address_state
order by sum(loan_Amount) desc

--3.Loan Term Analysis 

select 
	term as Term,
	count(id) as Total_Applications,
	sum(loan_amount) as Total_Loan_Amont,
	sum(total_payment) as Total_Amount_Received
from financial_loan
group by term

--4. Employee Length Analysis 

select 
	emp_length as Emp_length,
	count(id) as Total_Applications,
	sum(loan_amount) as Total_Loan_Amont,
	sum(total_payment) as Total_Amount_Received
from financial_loan
group by emp_length

--Loan Purpose Breakdown 

select 
	purpose as Purpose,
	count(id) as Total_Applications,
	sum(loan_amount) as Total_Loan_Amont,
	sum(total_payment) as Total_Amount_Received
from financial_loan
group by purpose

--Home Ownership Analysis

select 
	home_ownership as Home_ownership,
	count(id) as Total_Applications,
	sum(loan_amount) as Total_Loan_Amont,
	sum(total_payment) as Total_Amount_Received
from financial_loan
group by home_ownership

select * from financial_loan
