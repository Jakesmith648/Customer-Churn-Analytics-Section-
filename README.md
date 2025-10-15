### Customer Churn Insights (Analyst Perspective)

Tools Used: SQL | Tableau | Excel
Status: SQL Analysis Complete | Tableau Dashboard In Progress
Expected Completion: December 2025

### Overview

This project analyzes customer churn from an analytical and business perspective. The objective is to identify the key factors influencing customer attrition and to provide actionable insights that can support retention strategies.

The analysis integrates SQL for data extraction and preparation with Tableau for visualization, illustrating how technical and business-oriented tools combine to drive insight.

Churn analysis is a critical business problem for organizations with subscription or recurring-revenue models. Understanding who leaves and why allows companies to take targeted actions to improve retention, increase revenue, and strengthen customer relationships.

### Objectives

Clean and prepare raw customer data for analysis.

Calculate churn rates across various customer segments.

Identify key churn drivers such as plan type, tenure, and engagement.

Develop visual dashboards to communicate findings clearly to stakeholders.

### Data and Methodology
### Data Source

The dataset is stored in a relational SQLite database (customer_data.db) containing customer profiles, subscription details, and churn indicators.

### SQL Analysis

The analysis workflow was designed to replicate a real-world analytics process.
The SQL file (churn_analysis.sql) includes the following steps:

### Data Cleaning and Validation – Identified nulls, duplicates, and inconsistent entries.

### Data Integration – Joined multiple tables to create a consolidated customer dataset.

### Churn Calculation – Used conditional aggregation to compute churn rates per group.

### Segmentation – Categorized customers by plan, tenure, and region for pattern discovery.

### Trend Analysis – Analyzed churn trends over time to highlight emerging issues.

All SQL logic and results are available in the file churn_analysis.sql
.

### Tableau Dashboard (In Progress)

The Tableau dashboard is being developed to visualize and communicate the findings from the SQL analysis.
When complete, it will include interactive views and summaries such as:

Churn Rate by Segment: Customer type, region, and plan.

Tenure and Churn: Relationship between customer longevity and churn behavior.

Revenue Impact: Effect of churn on revenue by plan category.

Retention Focus Areas: Visual indicators for high-risk customer groups.

Current version available here: Customer_Churn_Dashboard (in-progress).twb

###  Insights (Preliminary)

Early insights from the SQL analysis show several important trends:

Customers with shorter tenure and lower engagement have the highest churn rates.

High-value plans show lower churn but higher financial impact when customers leave.

Certain regions experience consistently higher churn, suggesting potential service or pricing issues.

Re-engagement efforts may be most effective when targeted toward mid-tenure customers with declining activity.

These preliminary insights will be expanded and visually represented once the Tableau dashboard is complete.

### Next Steps

Complete Tableau dashboard design and publish to Tableau Public.

Add KPI summaries and data exports for reproducibility.

Refine insights based on visual exploration.

Incorporate business recommendations and commentary into the final version.

### Business Impact

This project demonstrates a structured analyst workflow — from data extraction and cleaning in SQL to business insight generation and visualization in Tableau.
It reflects a practical approach used in real analytics teams: identify the problem, analyze the data, and communicate actionable findings clearly to decision-makers.

### Files Included
File	Description
churn_analysis.sql	SQL script containing all data cleaning, transformations, and analysis queries.
customer_data.db	SQLite database used for the analysis.
Customer_Churn_Dashboard (in-progress).twb	Tableau workbook currently under development.
README.md	Project overview and documentation.

### Jake Smith
MSc in Applied Economics | BA in Psychology 
Email:[jakesmith648@gmail.com]

LinkedIn: [https://www.linkedin.com/in/jacob-smith-a46318153/]
