# 📊 SQL Server Sales Analytics Project  

Business-focused analytics project built using Microsoft SQL Server and the AdventureWorksDW data warehouse.

This project demonstrates advanced SQL skills, window functions, time-series analysis, and KPI modeling commonly used in Data Engineering and Analytics roles.

---

## 📂 Project Structure

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

---

## 📊 Business Analysis Queries

These queries generate decision-level insights from sales data.

### 1. Customer Purchase Gaps  
Measures time between purchases to analyze customer behavior and retention signals.

### 2. Customer Revenue Ranking  
Ranks customers by total revenue contribution to identify high-value segments.

### 3. Top 10% Customers (Pareto Analysis)  
Identifies revenue concentration using percentile-based segmentation.

### 4. Month-over-Month Growth (MoM)  
Tracks short-term revenue trends and performance momentum.

### 5. Year-over-Year Growth (YoY)  
Evaluates long-term revenue performance and strategic growth.

### 6. Top 3 Products per Category  
Ranks top-performing products within each category.

---

## 🧪 Analytical Scripts

Focused on advanced SQL mechanics and reusable analytical patterns.

### Rolling 7-Day Revenue  
Implements moving window aggregation for short-term trend smoothing.

### Running Totals and Moving Averages  
Demonstrates cumulative metrics and rolling calculations.

---

## 🗂 Dataset

Built using the AdventureWorksDW schema in Microsoft SQL Server.

### Key Tables Used

- FactInternetSales  
- DimDate  
- DimCustomer  
- DimProduct  
- DimProductSubcategory  
- DimProductCategory  

Schema reference available in:

Docs/schema_diagram.png

---

## 🛠 Skills Demonstrated

- Advanced SQL  
- Window Functions  
- Time-Series Analysis  
- Customer Segmentation  
- Revenue KPI Modeling  
- Structured CTE Design  

---

## 🎯 Project Goal

To simulate how raw transactional data can be transformed into business-ready metrics and insights using structured, production-style SQL patterns.
