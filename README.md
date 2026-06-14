# Northwind Data Cleaning and SQL Analysis

## Project Overview

This project focuses on cleaning, transforming, modeling, and analyzing retail sales data using the Northwind dataset. The dataset was first cleaned and standardized using Excel Power Query, then imported into MySQL for database design, relationship modeling, and business analysis.

The project demonstrates the complete data analysis workflow, including:

- Data cleaning and transformation
- Data type standardization
- Database schema design
- Primary Key and Foreign Key implementation
- Entity Relationship (ER) Modeling
- Business analysis using SQL queries
- Insight generation from retail sales data

---

## Dataset Source

Original Northwind Dataset:

https://www.kaggle.com/datasets/matthuan/northwind-dataset

Note:
The original dataset was cleaned and transformed before analysis. Only the relevant tables required for retail sales analysis were used in this project.

---

## Tools Used

### Excel Power Query

Used for:

- Importing raw CSV files
- Handling missing values
- Removing unnecessary columns
- Standardizing column names
- Cleaning data inconsistencies
- Preparing data for database import

### MySQL Workbench

Used for:

- Database creation
- Data type conversion
- Schema design
- Primary Key implementation
- Foreign Key implementation
- ER Diagram generation
- Business analysis using SQL

### GitHub

Used for:

- Project documentation
- Portfolio presentation
- Project hosting and sharing

---

## Database Tables Used

The following tables were selected from the Northwind dataset:

1. Categories
2. Customers
3. Employee
4. Orders
5. Order_Details
6. Products
7. Shippers
8. Suppliers

---

## Data Cleaning Process

### Step 1: Dataset Selection

Selected only the tables relevant to retail sales analysis.

### Step 2: Data Cleaning in Excel Power Query

Performed:

- Removal of unwanted records
- Standardization of column names
- Data quality checks
- Handling of null values where necessary
- Export of cleaned datasets

### Step 3: Import into MySQL

Imported cleaned CSV files into MySQL Workbench.

### Step 4: Data Type Conversion

Several columns were imported with incorrect data types and were converted appropriately.

Examples:

- CustomerID → VARCHAR
- OrderDate → DATE
- RequiredDate → DATE
- ShippedDate → DATE

### Step 5: Primary Key Creation

Primary Keys were implemented to uniquely identify records.

Examples:

- CategoryID
- CustomerID
- EmployeeID
- OrderID
- ProductID
- ShipperID
- SupplierID

Composite Primary Key:

- Order_Details(OrderID, ProductID)

### Step 6: Foreign Key Relationships

Relationships were created between tables to maintain referential integrity.

Examples:

- Products → Categories
- Products → Suppliers
- Orders → Customers
- Orders → Employee
- Orders → Shippers
- Order_Details → Orders
- Order_Details → Products

### Step 7: ER Diagram Creation

Generated an Entity Relationship Diagram (ERD) to visualize table relationships and database structure.

---

## Database Schema

The database was designed using a relational model.

Key Features:

- Primary Key constraints
- Foreign Key constraints
- One-to-Many relationships
- Composite Key implementation

---

## ER Diagram

Refer to:

ER_diagram.png

---

## Business Questions Analyzed

### Customer Analysis

1. Which customers placed the highest number of orders?
2. Which customers generate the highest revenue?

### Employee Analysis

3. Which employees processed the most orders?
4. Which employees generate the highest sales revenue?

### Shipping Analysis

5. Which shipping company handled the most orders?
6. What is the average delivery time for orders?

### Product Analysis

7. Which categories contain the most products?
8. What are the top 10 best-selling products by quantity sold?
9. What are the top 10 products by revenue generated?
10. Which products are ordered most frequently?

### Category Analysis

11. Which product categories generate the highest revenue?

### Supplier Analysis

12. Which supplier contributes the highest revenue?

### Sales Analysis

13. What is the monthly sales trend over time?
14. What are the top 5 busiest months by order volume?

### Geographic Analysis

15. Which countries have the highest number of customers?

---

## Key Insights

Some notable findings from the analysis include:

- Identification of top-performing customers
- Recognition of high-performing employees
- Best-selling products by quantity and revenue
- Revenue contribution by suppliers and categories
- Monthly sales patterns and trends
- Peak business periods based on order volume
- Customer distribution across countries
- Average order delivery performance

---

## Project Structure

```
Northwind-Data-Cleaning-and-SQL-Analysis
│
├── README.md
├── northwind_analysis_queries.sql
├── ER_diagram.png
│
└── cleaned_dataset
    ├── categories.csv
    ├── customers.csv
    ├── employee.csv
    ├── order_details.csv
    ├── orders.csv
    ├── products.csv
    ├── shippers.csv
    └── suppliers.csv
```

---

## Skills Demonstrated

- SQL Query Writing
- Data Cleaning
- Excel Power Query
- Relational Database Design
- Primary Keys & Foreign Keys
- Data Transformation
- Data Analysis
- Business Intelligence Concepts
- ER Modeling
- GitHub Documentation
