# Zepto SQL Data Analysis

## Project Overview

This project analyzes a Zepto product dataset using SQL and PostgreSQL.

The objective of the project is to explore product, pricing, discount, inventory, and stock information and answer business-oriented questions using SQL.

The project covers data exploration, data cleaning, and analytical queries to derive useful insights from the dataset.

---

## Dataset

The dataset contains product-level information, including:

- Product SKU
- Category
- Product Name
- MRP
- Discount Percentage
- Available Quantity
- Discount Selling Price
- Product Weight
- Stock Status
- Quantity

The original price values were converted from paise to Indian Rupees during data cleaning.

---

## Tools & Technologies

- PostgreSQL
- SQL
- GitHub
- CSV Dataset

### SQL Concepts Used

- `SELECT`
- `WHERE`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`
- `IS NULL`
- `GROUP BY`
- `HAVING`
- Aggregate Functions
- `CASE WHEN`
- `UPDATE`
- `DELETE`
- Data Cleaning
- Business Analysis

---

## Project Workflow

### 1. Data Exploration

The dataset was initially explored to understand its structure and identify potential data quality issues.

The following checks were performed:

- Total number of records
- Sample records
- NULL value checking
- Unique product categories
- In-stock vs. out-of-stock products
- Products appearing multiple times

### 2. Data Cleaning

The following data cleaning operations were performed:

- Identified products with zero MRP or selling price
- Removed products with zero MRP
- Converted MRP and selling prices from paise to Indian Rupees
- Checked duplicate product names
- Investigated missing values

### 3. Business Analysis

SQL queries were created to answer business-oriented questions such as:

1. What are the top 10 products based on discount percentage?
2. Which high-MRP products are currently out of stock?
3. What is the estimated revenue by category?
4. Which products have an MRP greater than ₹500 and a discount below 10%?
5. Which categories offer the highest average discount?
6. What is the price per gram for products weighing at least 100g?
7. How can products be grouped based on their weight?
8. What is the total inventory weight for each category?

---

## Key SQL Analysis

### Top Discounted Products

Products were ranked based on their discount percentage to identify products offering the highest discounts.

### High-MRP Out-of-Stock Products

Products with high MRP values and an out-of-stock status were identified to understand potentially important inventory gaps.

### Estimated Revenue by Category

Estimated revenue was calculated using:

```sql
discountSellingPrice * availableQuantity
```

The results were grouped by category and sorted to compare estimated revenue across categories.

### Price Per Gram

For products weighing at least 100 grams, price per gram was calculated using:

```sql
discountSellingPrice / weightInGms
```

This helps compare the relative value of products with different weights.

### Weight Categorization

Products were categorized using `CASE WHEN`:

- Less than 1000g → Low
- 1000g to less than 5000g → Medium
- 5000g and above → Bulk

### Inventory Weight

Total inventory weight was calculated for each category using:

```sql
SUM(weightInGms * availableQuantity)
```

---

## SQL Skills Demonstrated

This project demonstrates practical use of:

- Data exploration
- Data cleaning
- Filtering and sorting
- Aggregate functions
- `GROUP BY` and `HAVING`
- `DISTINCT`
- Conditional logic using `CASE`
- Data modification using `UPDATE` and `DELETE`
- Business-oriented SQL analysis
- Calculated metrics
- Inventory analysis

---

## Project Structure

```text
zepto-sql-data-analysis/
│
├── README.md
├── zepto_analysis.sql
│
└── data/
    └── zepto_v2.csv
```

---

## How to Run the Project

1. Download or clone this repository.
2. Open PostgreSQL or pgAdmin.
3. Create a PostgreSQL database.
4. Open `zepto_analysis.sql`.
5. Execute the table creation and analysis queries.
6. Load the `zepto_v2.csv` dataset into the `zepto` table.
7. Run the queries to reproduce the analysis.

---

## Learning Outcome

Through this project, I practiced using SQL to move from raw product data to structured business analysis.

The project helped strengthen my understanding of:

- SQL querying
- Data cleaning
- Aggregation
- Conditional logic
- Inventory analysis
- Pricing and discount analysis
- Translating business questions into SQL queries

---

## Author

**Sandip Parmar**  
Aspiring Data Analyst | SQL | Excel | Data Analytics
