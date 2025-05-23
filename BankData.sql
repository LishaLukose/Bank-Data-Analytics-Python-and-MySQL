create database bankanalytics;
use bankanalytics;

alter table bankdata rename column`ï»¿Account ID` to AccountID;
alter table bankdata rename column `Age Group` to AgeGroup;
alter table bankdata rename column `Branch Name` to BranchName;
alter table bankdata rename column `Dateof Birth` to DateofBirth;
alter table bankdata rename column `Disbursement Date` to DisbursementDate;
alter table bankdata rename column `Disbursement Date (Years)` to DisbursementYears;
alter table bankdata rename column `Loan Status` to LoanStatus;
alter table bankdata rename column `Purpose Category` to PurposeCategory;
alter table bankdata rename column `Verification Status` to VerificationStatus;
alter table bankdata rename column `State Abbr` to StateAbbr;
alter table bankdata rename column `State Name` to StateName;
alter table bankdata rename column `Is Delinquent Loan` to IsDelinquentLoan;
alter table bankdata rename column `Is Default Loan` to IsDefaultLoan;
alter table bankdata rename column `Loan Amount` to LoanAmount;
alter table bankdata rename column `Funded Amount` to FundedAmount;
alter table bankdata rename column `Int Rate` to IntRate;
alter table bankdata rename column `Total Pymnt` to TotalPymnt;
alter table bankdata rename column `Total Rec Prncp` to TotalRecPrncp;
alter table bankdata rename column `Total Fees` to TotalFees;
alter table bankdata rename column `Total Rrec int` to TotalRrecint;

-- SQL QUERIES

#KPI-1 Total Loan Amount Funded
select replace(DisbursementYears,'FY ','') as Year, concat('₹ ', round(sum(LoanAmount)/1000000), 'M') as Total_Loan_Amount_Funded
from bankdata
group by DisbursementYears
order by sum(LoanAmount) desc;

#KPI-2 Total Loans (Issued)
select replace(DisbursementYears,'FY ','') as Year, count(*) as Total_Loans
from bankdata
group by DisbursementYears
order by Total_Loans desc;

#KPI-3 Total Collection (Principal + Interest)
select replace(DisbursementYears,'FY ','') as Year, concat('₹ ', round(sum(TotalRecPrncp + TotalRrecint)/1000000,2), 'M') as Total_Collection
from bankdata
group by DisbursementYears
order by sum(TotalRecPrncp + TotalRrecint) desc;

#KPI-4 Total Interest Earned
select replace(DisbursementYears,'FY ','') as Year, concat('₹ ', round(sum(TotalRrecint)/1000000,2), 'M') as Total_Interest_Earned
from bankdata
group by DisbursementYears
order by sum(TotalRrecint) desc;

#KPI-5 Branch-Wise Revenue Breakdown
select replace(DisbursementYears,'FY ','') as Year, BranchName,
concat('₹ ', round(sum(TotalRrecint),2)) as Interest_Earned,
concat('₹ ', round(sum(TotalFees),2)) as Fees_Collected,
concat('₹ ', round(sum(TotalRecPrncp + TotalRrecint),2)) as Total_Revenue
from bankdata
group by DisbursementYears,BranchName order by DisbursementYears desc;

#KPI-6 State-Wise Loan
select replace(DisbursementYears,'FY ','') as Year, StateName,concat('₹ ', round(sum(LoanAmount)/1000), 'K') as LoanAmount
from bankdata
group by StateName, DisbursementYears
order by sum(LoanAmount) desc;

#KPI-7 Religion-Wise Loan
select replace(DisbursementYears,'FY ','') as Year, Religion, concat('₹ ', round(sum(LoanAmount)/1000000,2), 'M') as LoanAmount
from bankdata
where Religion is not null and trim(Religion) <> ''
group by Religion,DisbursementYears order by SUM(LoanAmount) desc;

#KPI-8 Product Group-Wise Loan
select replace(DisbursementYears,'FY ','') as Year, PurposeCategory as ProductGroup, concat('₹ ', round(sum(LoanAmount)/1000,2), 'K') as LoanAmount
from bankdata
where PurposeCategory is not null and trim(PurposeCategory) <> ''
group by PurposeCategory,DisbursementYears order by sum(LoanAmount) desc;

#KPI-9 Disbursement Trend
select date_format(str_to_date(DisbursementDate, '%Y-%m-%d'), '%Y-%m') as YearMonth,
concat('₹ ', round(sum(LoanAmount)/1000,2), 'K') as TotalDisbursedAmount
from bankdata
where DisbursementDate is not null
group by date_format(str_to_date(DisbursementDate, '%Y-%m-%d'), '%Y-%m')
order by sum(LoanAmount) desc;

#KPI-10 Grade-Wise Loan
select replace(DisbursementYears,'FY ','') as Year, grade,count(*) as LoanCount
from bankdata
where grade is not null and trim(grade) <> ''
group by grade, DisbursementYears
order by grade;

#KPI-11 Count of Default Loan
select replace(DisbursementYears,'FY ','') as Year, count(*) as DefaultLoanNumber
from bankdata
where IsDefaultLoan = 'Yes'
group by IsDefaultLoan,DisbursementYears;

#KPI-12 Count of Delinquent Clients
select replace(DisbursementYears,'FY ','') as Year, count(*) No_of_DelinquentClients
from bankdata
where IsDelinquentLoan = 'Yes'
group by IsDelinquentLoan,DisbursementYears;

#KPI-13 Delinquent Loans Rate
select replace(DisbursementYears,'FY ','') as Year, concat(round(
(sum(case when IsDelinquentLoan = 'Yes' then 1 else 0 end) / count(*)) * 100, 2), ' %') 
as IsDelinquentLoanRate
from bankdata
group by DisbursementYears;

#KPI-14 Default Loan Rate
select replace(DisbursementYears,'FY ','') as Year, concat(round(
(sum(case when IsDefaultLoan = 'Yes' then 1 else 0 end) / count(*)) * 100, 2), ' %') 
as IsDefaultLoanRate
from bankdata
group by DisbursementYears;

#KPI-15 Loan Status-Wise Loan
select replace(DisbursementYears,'FY ','') as Year, LoanStatus, count(*) as Loan_Count
from bankdata
group by LoanStatus,DisbursementYears order by Loan_Count desc;

#KPI-16 Age Group-Wise Loan
select replace(DisbursementYears,'FY ','') as Year, AgeGroup, count(*) as Loan_Count
from bankdata
group by AgeGroup,DisbursementYears order by Loan_Count desc;

#KPI-17 No Verified Loan
select replace(DisbursementYears,'FY ','') as Year, count(*) as No_Verified_Loan_Count
from bankdata
where VerificationStatus= 'Not Verified'
group by DisbursementYears;

#KPI-18 Loan Maturity
select replace(DisbursementYears,'FY ','') as Year, Term as LoanMaturity, count(*) AS Loan_Count
from bankdata
group by Term, DisbursementYears;







