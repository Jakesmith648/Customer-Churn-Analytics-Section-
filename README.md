Customer Churn Insights (Analyst Perspective)
Tools: SQL | Tableau | Excel
Project Overview

This project explores customer churn from a business and data analytics perspective. The primary goal is to identify which customer segments are most at risk of churning and to provide clear, data-driven insights that support retention strategies. The analysis integrates SQL-based exploration with Tableau visualization to demonstrate an end-to-end analytical workflow.

Churn analysis is a key focus for organizations that rely on recurring revenue or subscription models. By understanding why customers leave, businesses can develop targeted actions to reduce churn and improve overall customer lifetime value.

Objectives

Clean and prepare raw customer data for analysis.

Calculate churn rates by customer type, plan, and region.

Identify key churn drivers such as tenure, plan type, and engagement level.

Build visual dashboards to communicate findings and trends.

Data and Methodology
Data Source

The dataset is stored in a relational SQLite database (customer_data.db) that contains customer information, subscription details, and churn indicators.

SQL Analysis

All analytical preparation was performed in SQL to ensure accurate data validation and calculation before visualization.
Key steps in the analysis include:

Data Cleaning – Identified and removed missing or inconsistent records.

Data Integration – Joined customer and subscription tables to create a unified dataset.

Churn Calculation – Used aggregation and conditional logic to determine churn rate by group.

Segmentation – Categorized customers based on tenure, plan, and region.

Trend Analysis – Evaluated churn trends over time to identify emerging patterns.

The full query workflow can be viewed in churn_analysis.sql
.

Tableau Dashboard (In Progress)

The Tableau dashboard is currently being developed to visualize the results from the SQL analysis.
Once complete, it will include:

Churn rate by customer type and region.

Tenure versus churn analysis.

Plan performance and retention metrics.

Revenue impact of churn for high-value segments.

The current version of the Tableau workbook is available in
Customer_Churn_Dashboard (in-progress).twb
.
A final dashboard will be published upon completion.

Key Insights (Preliminary Findings)

Customers with shorter tenure and lower engagement exhibit the highest churn rates.

Higher-value plans experience lower churn but greater revenue loss when churn occurs.

Certain regions show consistently higher churn, indicating potential service or pricing challenges.

Retention strategies should focus on improving engagement among newer and low-activity customers.

These initial findings will be expanded and refined in Tableau once the visualization phase is complete.

Next Steps

Finalize Tableau dashboard and publish on Tableau Public.

Add summary metrics and downloadable outputs (CSV/PNG).

Document full retention recommendations based on final results.

Business Impact

This project demonstrates how SQL and Tableau can be used together to translate raw operational data into meaningful business intelligence.
The workflow reflects a typical analyst’s process — extracting, cleaning, and analyzing data, then converting findings into actionable insights for decision-makers.

Files Included
File	Description
churn_analysis.sql	SQL file containing all analytical queries and calculations.
customer_data.db	Database used for the SQL analysis.
Customer_Churn_Dashboard (in-progress).twb	Tableau workbook currently under development.
README.md	Project documentation and overview.
Project Status

SQL Analysis: Complete
Tableau Dashboard: In progress
Expected Completion: December 2025

Jake Smith
MSc in Applied Economics | Data Analyst
Email: [your.email@example.com
]
LinkedIn: linkedin.com/in/your-profile
