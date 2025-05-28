# Bank-Data-Analytics-Python-and-MySQL

An analytical project focused on exploring and extracting insights from bank loan data using SQL and Python. This project showcases data preprocessing using Python and business KPI 
derivation using SQL queries.

## Project Objective

- To analyze bank loan data for actionable business insights using SQL and Python. The goal is to:
      - Identify trends in loan disbursement and repayments
      - Evaluate loan portfolio performance by demographics and product
      - Measure risk indicators like default and delinquency rates

## Dataset

- **Raw Excel Data**: `Bank Data Analytics.xlsx`

## Tools & Technologies

- **Database:** MySQL 8.x
- **Client:** MySQL Workbench, Jupyter Notebook
- **Language:** SQL, Python (Pandas) for preprocessing

## Key Features

- Data preprocessing and cleaning using Python
- Top KPIs Displayed: Total Loan Funded, Total Loans, Total Collection, Interest Earned, and Unverified Loans.
- Loan Breakdown: Categorized by product type, religion, state, age group, and loan status.
- Risk Metrics: Shows default and delinquent loan counts and rates.
- Visual Insights: Includes disbursement trends over years, loan maturity distribution, and region-wise funding via map.
- Interactive Filters: Slicers for religion and loan status to dynamically analyze data.
- Clear Segmentation: Enables granular insights across borrower profiles and loan products.

## Key Takeaways

- Total Loan Funded stands at ₹750.97M across 65,535 loans, indicating high financial outreach.
- Home Loans dominate the product categories with ₹278.25K, followed by Services and Business loans.
- Religion-wise Distribution shows Hindu borrowers hold the highest loan value (₹563.05K), significantly ahead of other groups.
- State-wise Loan Concentration reveals Uttar Pradesh as a major borrower region, with ₹119.10K in loan value.
- Delinquency Rate is relatively high at 10.84%, signaling potential risk in repayments.
- Default Loan Rate is much lower at 1.56%, suggesting most delinquent loans may eventually recover.
- Loan Status Analysis indicates over 55% of loans are active, while only a small portion falls under NPA or cancelled.
- Age Group 26–35 has the highest loan disbursement, showing young borrowers are the key segment.
- Loan Maturity Trend shows 60-month loans are more common, indicating a preference for longer repayment terms.
- Disbursement Trend peaked in 2019 at ₹288.61M but declined in 2020, possibly due to pandemic effects.
