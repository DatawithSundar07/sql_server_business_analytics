📊 SQL Server Sales Analytics Project

Business-focused analytics project built using Microsoft SQL Server and the AdventureWorksDW data warehouse.

This project demonstrates advanced SQL skills, window functions, time-series analysis, and KPI modeling commonly used in Data Engineering and Analytics roles.

📂 Project Structure
Business_analysis/
  ├── customer_purchase_gaps.sql
  ├── customer_revenue_ranking.sql
  ├── month_over_month_growth.sql
  ├── top_10_percent_customers_part.sql
  ├── top_3_products_per_category.sql
  └── yoy_growth_analysis.sql

Docs/
  └── schema_diagram.png

scripts/
  ├── rolling_7_day_revenue.sql
  └── running_totals_and_moving_averages.sql
📊 Business Analysis Queries

These queries generate decision-level insights from sales data:

Customer Purchase Gaps – Measures time between purchases (retention signal)

Customer Revenue Ranking – Identifies high-value customers

Top 10% Customers (Pareto Analysis) – Revenue concentration analysis

Month-over-Month Growth (MoM) – Short-term revenue trends

Year-over-Year Growth (YoY) – Long-term performance analysis

Top 3 Products per Category – Product performance ranking

🧪 Analytical Scripts

Focused on advanced SQL mechanics:

Rolling 7-Day Revenue

Running Totals

Moving Averages

Demonstrates strong understanding of:

LAG() / LEAD()

RANK() / DENSE_RANK()

NTILE()

Window aggregations

Time-series calculations

🗂 Dataset

Built using the AdventureWorksDW schema in Microsoft SQL Server.

Key tables:

FactInternetSales

DimDate

DimCustomer

DimProduct

DimProductSubcategory

DimProductCategory

Schema diagram available in:

Docs/schema_diagram.png
🛠 Skills Demonstrated

Advanced SQL

Window Functions

Time-Series Analysis

Customer Segmentation

Revenue KPI Modeling

Structured CTE Design

🎯 Project Goal

To simulate how raw transactional data can be transformed into business-ready metrics and insights using production-style SQL patterns.
