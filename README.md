Supermarket Sales Analysis

SQL (MySQL) | Power BI | KPI Modeling | Retail Performance Analytics

Executive Summary

This project analyzes supermarket transactional data to evaluate revenue performance, customer purchasing behavior, product category contribution, and seasonal sales patterns.

Using MySQL for data extraction and KPI modeling, and Power BI for interactive visualization, I developed an executive-ready dashboard that transforms raw sales data into actionable business intelligence.

The goal: identify growth opportunities, optimize inventory decisions, and improve customer retention strategies.

Business Problem

Supermarket leadership required clarity on:

Which product categories drive revenue growth?

What are the seasonal sales patterns?

Who are the highest-value customers?

How can underperforming products be improved?

Where should marketing efforts be focused?

Data Collection & Preparation
Data Source

Retail transaction dataset (orders, products, customers, sales records).

Key Fields Used

ordernumber

productcode

quantityordered

priceeach

orderdate

customername

city / state / country

Data Preparation (MySQL)

Cleaned and structured transactional data

Created derived metrics (Revenue = quantity × price)

Built SQL views for KPI calculations

Aggregated monthly and quarterly summaries

KPI Modeling (MySQL)
1️⃣ Total Sales
SELECT SUM(quantityordered * priceeach) AS total_sales
FROM orders;

Measures overall revenue performance.

2️⃣ Average Order Value (AOV)
SELECT 
    SUM(quantityordered * priceeach) / COUNT(DISTINCT ordernumber) AS AOV
FROM orders;

Indicates customer spending behavior per transaction.

3️⃣ Sales by Product Category
SELECT productcategory,
       SUM(quantityordered * priceeach) AS category_sales
FROM orders
GROUP BY productcategory;

Identifies top-performing and underperforming categories.

4️⃣ Monthly & Quarterly Trends
SELECT 
    DATE_FORMAT(orderdate, '%Y-%m') AS month,
    SUM(quantityordered * priceeach) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

Detects seasonality and growth fluctuations.

5️⃣ Top Customers by Revenue
SELECT customername,
       SUM(quantityordered * priceeach) AS total_spent
FROM orders
GROUP BY customername
ORDER BY total_spent DESC
LIMIT 10;

Highlights high-value customers for retention strategies.

Power BI Dashboard Development

After KPI modeling in MySQL, data was imported into Power BI for visualization.

Dashboards Created
1️⃣ Sales Overview Dashboard

Total Sales

Average Order Value

Revenue by Category

Geographic Revenue Distribution

2️⃣ Time Series Dashboard

Monthly Sales Trend

Quarterly Growth Patterns

Revenue volatility visualization

3️⃣ Customer Analysis Dashboard

Top 10 Customers

Revenue Concentration

Geographic Customer Distribution

Key Insights
Category Performance

Certain product categories contribute disproportionately to revenue, while others show consistent underperformance — indicating pricing or promotion inefficiencies.

Customer Segmentation

A small group of customers accounts for a large share of revenue (Pareto effect). Retention of high-value customers is critical.

Seasonal Trends

Revenue peaks during specific months/quarters, highlighting promotional and stocking opportunities.

Revenue Volatility

Monthly fluctuations indicate inconsistent demand patterns that require proactive planning.

Strategic Recommendations
1️⃣ Targeted Promotions

Run bundle offers and discount campaigns for slow-moving inventory.

2️⃣ Customer Loyalty Programs

Reward repeat and high-value customers to improve lifetime value.

3️⃣ Seasonal Campaign Optimization

Align inventory and marketing with peak seasonal periods.

4️⃣ Inventory Optimization

Increase stock for high-demand categories and reduce overstock of low-performing products.

5️⃣ Data Automation

Automate KPI reporting using SQL views + Power BI refresh schedules to reduce manual errors and improve reporting speed.

Business Impact Potential

Improved inventory turnover

Increased AOV through bundling

Better marketing ROI through segmentation

Reduced revenue volatility

Faster executive reporting through automation

Tools Used

MySQL (Data extraction, KPI modeling)

Power BI (Dashboard visualization)

Excel (Data validation)

Conclusion

This project demonstrates how structured SQL analytics combined with BI visualization can provide supermarkets with actionable performance intelligence.

By converting transactional data into strategic insights, the business can make data-driven decisions to increase revenue, improve customer retention, and optimize operational efficiency.
