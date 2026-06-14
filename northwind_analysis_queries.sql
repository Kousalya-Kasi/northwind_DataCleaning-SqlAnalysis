CREATE DATABASE northwind_retail;
USE northwind_retail;

-- PRIMARY KEYS 

ALTER TABLE categories
ADD PRIMARY KEY (CategoryID);
ALTER TABLE customers
ADD PRIMARY KEY (CustomerID);
ALTER TABLE employee
ADD PRIMARY KEY (EmployeeID);
ALTER TABLE orders
ADD PRIMARY KEY (OrderID);
ALTER TABLE products
ADD PRIMARY KEY (ProductID);
ALTER TABLE shippers
ADD PRIMARY KEY (ShipperID);
ALTER TABLE suppliers
ADD PRIMARY KEY (SupplierID);
ALTER TABLE order_details
ADD PRIMARY KEY (OrderID, ProductID);


-- FOREIGN KEYS

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (CategoryID)
REFERENCES categories(CategoryID);

ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (SupplierID)
REFERENCES suppliers(SupplierID);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (CustomerID)
REFERENCES customers(CustomerID);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_employee
FOREIGN KEY (EmployeeID)
REFERENCES employee(EmployeeID);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_shippers
FOREIGN KEY (ShipVia)
REFERENCES shippers(ShipperID);

ALTER TABLE order_details
ADD CONSTRAINT fk_orderdetails_orders
FOREIGN KEY (OrderID)
REFERENCES orders(OrderID);

ALTER TABLE order_details
ADD CONSTRAINT fk_orderdetails_products
FOREIGN KEY (ProductID)
REFERENCES products(ProductID);

-- ANALYSIS QUERIES
-- Which customers placed the highest number of orders?
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS TotalOrders
FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalOrders DESC
LIMIT 5;

-- Which employees processed the most orders?
SELECT e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, COUNT(o.OrderID) AS TotalOrders
FROM employee e JOIN orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, EmployeeName
ORDER BY TotalOrders DESC;

-- Which shipping company handled the most orders?
SELECT s.CompanyName, COUNT(o.OrderID) AS TotalOrders
FROM shippers s JOIN orders o ON s.ShipperID = o.ShipVia
GROUP BY s.CompanyName
ORDER BY TotalOrders DESC;

-- Which countries have the highest number of customers?
SELECT Country, COUNT(CustomerID) AS TotalCustomers
FROM customers
GROUP BY Country
ORDER BY TotalCustomers DESC
LIMIT 5;

-- Which categories contain the most products?
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM categories c JOIN products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalProducts DESC;

-- What are the Top 10 Best-Selling Products by Quantity Sold?
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantitySold
FROM products p JOIN order_details od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 10;

-- What are the Top 10 Products by Revenue Generated?
SELECT p.ProductName, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM products p JOIN order_details od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC
LIMIT 10;

-- Which Product Categories Generate the Highest Revenue?
SELECT c.CategoryName, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM categories c JOIN products p ON c.CategoryID = p.CategoryID
JOIN order_details od ON p.ProductID = od.ProductID
GROUP BY c.CategoryName
ORDER BY Revenue DESC;

-- Which Customers Generate the Highest Revenue?
SELECT c.CompanyName, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM customers c JOIN orders o ON c.CustomerID = o.CustomerID
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY Revenue DESC
LIMIT 5;

-- What is the Monthly Sales Trend Over Time?
SELECT YEAR(o.OrderDate) AS SalesYear, MONTH(o.OrderDate) AS SalesMonth, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM orders o JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY SalesYear, SalesMonth;

-- Which Supplier Contributes the Highest Revenue?
SELECT s.CompanyName, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM suppliers s JOIN products p ON s.SupplierID = p.SupplierID
JOIN order_details od ON p.ProductID = od.ProductID
GROUP BY s.CompanyName
ORDER BY Revenue DESC
LIMIT 5;

-- What are the Top 5 Busiest Months by Order Volume?
SELECT MONTHNAME(OrderDate) AS MonthName, COUNT(OrderID) AS TotalOrders
FROM orders
GROUP BY MONTH(OrderDate), MONTHNAME(OrderDate)
ORDER BY TotalOrders DESC
LIMIT 5;

-- Which Products Are Ordered Most Frequently?
SELECT p.ProductName, COUNT(od.OrderID) AS OrderFrequency
FROM products p JOIN order_details od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY OrderFrequency DESC
LIMIT 5;

-- What is the Average Delivery Time for Orders?
SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate)), 2) AS AvgDeliveryDays
FROM orders
WHERE ShippedDate IS NOT NULL;

-- Which Employees Generate the Highest Sales Revenue?
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS Revenue
FROM employee e JOIN orders o ON e.EmployeeID = o.EmployeeID
JOIN order_details od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, EmployeeName
ORDER BY Revenue DESC
LIMIT 5;
