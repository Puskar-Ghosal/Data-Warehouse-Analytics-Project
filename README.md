# 📊 DATA WAREHOUSE ANALYTICS PROJECT

## 📌 Project Overview

This project is part of a complete **Data Warehouse and Analytics Pipeline** built using SQL Server.

This is **not just a standalone analytics project**.  
Before performing analytics, I first designed and built a **Data Warehouse Architecture using the Medallion Architecture approach (Bronze → Silver → Gold layers)**.

After building and transforming the warehouse layers, I used the **Gold Layer** as the analytical layer to perform business analysis and generate reporting datasets.

The final goal of this project is to transform raw data into:
- Business-ready analytical datasets
- Customer and product reports
- Interactive Power BI dashboards for visualization and decision-making

---

# 🏗️ Data Warehouse Architecture

The project follows a layered data warehouse architecture:

```text
Raw Source Data
        ↓
Bronze Layer (Raw Ingestion)
        ↓
Silver Layer (Data Cleaning & Transformation)
        ↓
Gold Layer (Business Ready Data Model)
        ↓
SQL Analytics & Reporting
        ↓
Customer Report & Product Report
        ↓
Power BI Dashboard (Planned)
```

---

# 📂 Project Structure

```bash
DATA-WAREHOUSE-ANALYTICS/
│
├── 00.initi_database.sql
├── 01.data base exploration.sql
├── 02.Dimension Exploration.sql
├── 03.date exploration.sql
├── 04.Measures Exploration.sql
├── 05.Magnitude Analysis.sql
├── 06.Ranking Analysis.sql
├── 07.Change Over Time.sql
├── 08.Cumulative Analysis.sql
├── 09.performance analysis.sql
├── 10.Data Segmentation.sql
│
├── customer_report.sql
├── product_report.sql
│
└── README.md
```

---

# 🎯 Objectives

The main objectives of this project are:

- Build a complete SQL-based Data Warehouse
- Implement Bronze, Silver, and Gold layers
- Transform raw data into analytics-ready datasets
- Perform advanced business analysis using SQL
- Create reusable reporting queries
- Generate customer and product analytical reports
- Prepare clean datasets for Power BI visualization

---

# 🧱 Data Warehouse Layers

## 🥉 Bronze Layer
- Raw data ingestion layer
- Stores source data without transformation
- Used as the base storage layer

## 🥈 Silver Layer
- Data cleaning and transformation layer
- Removed inconsistencies and null issues
- Standardized and prepared datasets

## 🥇 Gold Layer
- Business-ready analytical layer
- Optimized for reporting and analytics
- Used for all analytical SQL queries in this project

---

# 📈 Analysis Performed

## 1️⃣ Database Initialization
- Created and initialized database objects
- Set up schemas and tables

## 2️⃣ Data Exploration
- Explored datasets
- Checked null values and data quality
- Understood table relationships

## 3️⃣ Dimension Exploration
- Analyzed dimensions such as:
  - Customers
  - Products
  - Categories

## 4️⃣ Date Exploration
- Performed year-wise and time-based analysis

## 5️⃣ Measures Exploration
Calculated KPIs including:
- Total Sales
- Total Orders
- Total Customers
- Average Sales

## 6️⃣ Magnitude Analysis
- Analyzed sales contribution by customers and products

## 7️⃣ Ranking Analysis
Identified:
- Top-performing products
- Worst-performing products
- High-value customers

## 8️⃣ Change Over Time Analysis
- Compared yearly growth and trends

## 9️⃣ Cumulative Analysis
- Built running totals and cumulative metrics using window functions

## 🔟 Performance Analysis
- Compared yearly and product performance

## 1️⃣1️⃣ Data Segmentation
- Segmented customers and products using business rules

---

# 📊 Final Analytical Reports

## 👤 Customer Report
The customer report includes:
- Customer-wise sales
- Order frequency
- Customer rankings
- Customer segmentation
- Revenue contribution analysis

## 📦 Product Report
The product report includes:
- Product-wise sales analysis
- Product rankings
- Category performance
- Profitability insights
- Sales contribution analysis

These reports are designed to serve as the foundation for future dashboard development.

---

# 🛠️ Technologies Used

- SQL Server
- Analytical Queries
- Data Warehouse Modeling

---

# 📚 SQL Concepts Practiced

- GROUP BY
- HAVING
- CASE WHEN
- Common Table Expressions (CTEs)
- Window Functions
- PARTITION BY
- RANK / DENSE_RANK
- Running Totals
- Aggregate Functions
- Joins
- Views
- CTEs
- Data Segmentation Logic

---

# 🚀 Future Plans

The next phase of this project includes:

- Building an interactive **Power BI Dashboard**
- Creating customer analytics dashboards
- Creating product performance dashboards
- Adding KPI cards and trend analysis
- Implementing drill-down reports
- Building interactive business visualizations

---

# 📌 Project Status

✅ Data Warehouse Built  
✅ Bronze Layer Completed  
✅ Silver Layer Completed  
✅ Gold Layer Completed  
✅ SQL Analytics Completed  
✅ Customer Report Ready  
✅ Product Report Ready  
🚧 Power BI Dashboard In Progress

---

# 🤝 Connect With Me

If you liked this project or want to collaborate, feel free to connect with me on # 🤝 Connect With Me

<p align="left">
  <a href="https://www.linkedin.com/in/puskar-ghosal-2565a7254/" target="_blank">
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linkedin/linkedin-original.svg" 
         alt="LinkedIn" width="40" height="40"/>
  </a>
</p>


---
