USE SuperStoreDB;
GO

SELECT *
FROM dbo.orders;

------------------------

select COUNT(*) AS Total_orders
from dbo.orders;
--------------------
select order_id,order_date,customer_Name,category,sales,profit
from dbo.orders;
---------------------
--Show only Technology category
SELECT *
FROM dbo.orders
WHERE Category = 'Technology';
-------------------------------
--Show orders from the West region
SELECT *
FROM dbo.orders
WHERE Region = 'West';
-----------------------------
--Show orders where Sales are greater than 1000
SELECT *
FROM dbo.orders
WHERE Sales > 1000;
-----------------------------
--Show orders where Profit is less than 0 (Loss-making orders)
SELECT *
FROM dbo.orders
WHERE Profit < 0;
--------------------------
--Show Furniture orders from the West region
SELECT *
FROM dbo.orders
WHERE Category = 'Furniture'
  AND Region = 'West';
  -----------------------------
  --Show Technology or Office Supplies orders
  SELECT *
FROM dbo.orders
WHERE Category = 'Technology'
   OR Category = 'Office Supplies';
   ------------------------------
   --Show orders with Discount between 0.2 and 0.5
   SELECT *
FROM dbo.orders
WHERE Discount BETWEEN 0.2 AND 0.5;
-------------------------------------
--Show orders from South or East region
SELECT *
FROM dbo.orders
WHERE Region IN ('South', 'East');
-----------------------------------
--Show customers whose names start with "A"
SELECT *
FROM dbo.orders
WHERE Customer_Name LIKE 'A%';
------------------------------------------
--Show orders placed in the year 2017
SELECT *
FROM dbo.orders
WHERE YEAR(Order_Date) = 2017;
---------------------------------
--Sort Sales (Lowest to Highest)
SELECT Order_ID, Customer_Name, Sales
FROM dbo.orders
ORDER BY Sales ASC;
-----------------------------
--Sort Sales (Highest to Lowest)
SELECT Order_ID, Customer_Name, Sales
FROM dbo.orders
ORDER BY Sales DESC;
------------------------
--Sort Profit (Highest to Lowest)
SELECT Order_ID, Customer_Name, Profit
FROM dbo.orders
ORDER BY Profit DESC;
---------------------------
--Sort Customer Names (A to Z)
SELECT Customer_Name, Sales
FROM dbo.orders
ORDER BY Customer_Name ASC;
---------------------------
--Sort by Category, then Sales
SELECT Category, Product_Name, Sales
FROM dbo.orders
ORDER BY Category ASC, Sales DESC;
--First, data is grouped alphabetically by Category.
--Within each category, products are sorted by Sales (highest first).
-------------------------------
--Top 10 Highest Sales
SELECT TOP 10
    Customer_Name,
    Product_Name,
    Sales
FROM dbo.orders
ORDER BY Sales DESC;
---------------------------
--Top 10 Highest Profit
SELECT TOP 10
    Customer_Name,
    Product_Name,
    Profit
FROM dbo.orders
ORDER BY Profit DESC;
-----------------------------
--
SELECT Customer_Name, Region, Sales
FROM dbo.orders
ORDER BY Region ASC, Sales DESC;
------------------------------
--Count Total Orders
SELECT COUNT(*) AS Total_Orders
FROM dbo.orders;
--------------------------------
--Total Sales
SELECT SUM(Sales) AS Total_Sales
FROM dbo.orders;
--------------------------------
--Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM dbo.orders;
---------------------------
--Average Sales
SELECT AVG(Sales) AS Average_Sales
FROM dbo.orders;
-------------------------------
--Average Profit
SELECT AVG(Profit) AS Average_Profit
FROM dbo.orders;
---------------------------
--Minimum Sales
SELECT MIN(Sales) AS Lowest_Sale
FROM dbo.orders;
------------------------------
--Maximum Sales
SELECT MAX(Sales) AS Highest_Sale
FROM dbo.orders;
---------------------------------
--Minimum Profit
SELECT MIN(Profit) AS Lowest_Profit
FROM dbo.orders;
-------------------------------
--: Maximum Profit
SELECT MAX(Profit) AS Highest_Profit
FROM dbo.orders;
------------------------------
--: Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity
FROM dbo.orders;
------------------------------
SELECT
    SUM(Discount) AS Total_Discount,
    AVG(Discount) AS Average_Discount
FROM dbo.orders;
-----------------------------------
--Which category generates the highest revenue?

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Category
ORDER BY Total_Sales DESC;
--------------------------------------
--Revenue by Region
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Region
ORDER BY Total_Sales DESC;
-------------------------------
--Revenue by Segment
SELECT
    Segment,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Segment
ORDER BY Total_Sales DESC;
----------------------------
--Profit by Category
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM dbo.orders
GROUP BY Category
ORDER BY Total_Profit DESC;
----------------------------
--Profit by Region
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM dbo.orders
GROUP BY Region
ORDER BY Total_Profit DESC;
---------------------------------
--Average Discount by Category
SELECT
    Category,
    AVG(Discount) AS Average_Discount
FROM dbo.orders
GROUP BY Category
ORDER BY Average_Discount DESC;
-------------------------------------
--Number of Orders by Ship Mode
SELECT
    Ship_Mode,
    COUNT(Order_ID) AS Total_Orders
FROM dbo.orders
GROUP BY Ship_Mode
ORDER BY Total_Orders DESC;
---------------------------------------
--Top 10 Customers by Revenue
SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
-----------------------------
--Top 10 Products by Revenue
SELECT TOP 10
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC;
---------------------------------
--Yearly Revenue Trend
SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;
---------------------------
--Monthly Revenue Trend
SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;
    --------------------------
    --Which categories generated more than ₹750,000 in sales?

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Category
HAVING SUM(Sales) > 750000
ORDER BY Total_Sales DESC;
-----------------------------------------
--Regions with Profit > 50000
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM dbo.orders
GROUP BY Region
HAVING SUM(Profit) > 50000
ORDER BY Total_Profit DESC;
-----------------------------------
--Which customers purchased more than ₹10,000?

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Customer_Name
HAVING SUM(Sales) > 10000
ORDER BY Total_Sales DESC;
---------------------------------
--Products with Profit > 5000
SELECT
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM dbo.orders
GROUP BY Product_Name
HAVING SUM(Profit) > 5000
ORDER BY Total_Profit DESC;
---------------------------------------
--Segments with Average Discount > 0.15
SELECT
    Segment,
    AVG(Discount) AS Avg_Discount
FROM dbo.orders
GROUP BY Segment
HAVING AVG(Discount) > 0.15
ORDER BY Avg_Discount DESC;
--------------------------------------
--Ship Modes with More Than 2000 Orders
SELECT
    Ship_Mode,
    COUNT(Order_ID) AS Total_Orders
FROM dbo.orders
GROUP BY Ship_Mode
HAVING COUNT(Order_ID) > 2000
ORDER BY Total_Orders DESC;
---------------------------------
--Years with Sales > 500000
SELECT
    YEAR(Order_Date) AS Order_Year,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY YEAR(Order_Date)
HAVING SUM(Sales) > 500000
ORDER BY Order_Year;
--------------------------------
--Classify each order based on Sales.

SELECT
    Order_ID,
    Sales,
    CASE
        WHEN Sales >= 1000 THEN 'High Sales'
        WHEN Sales >= 500 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM dbo.orders;
--------------------------------------
--Profit Status
SELECT
    Order_ID,
    Profit,
    CASE
        WHEN Profit > 0 THEN 'Profit'
        WHEN Profit = 0 THEN 'Break Even'
        ELSE 'Loss'
    END AS Profit_Status
FROM dbo.orders;
-----------------------------------
--Discount Level
SELECT
    Order_ID,
    Discount,
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS Discount_Level
FROM dbo.orders;
-------------------------------------------
--Identify High Value Customers.

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN SUM(Sales) >= 10000 THEN 'High Value'
        WHEN SUM(Sales) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Type
FROM dbo.orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
---------------------------------------------
--Shipping Speed Category
SELECT
    Ship_Mode,
    CASE
        WHEN Ship_Mode = 'Same Day' THEN 'Fast'
        WHEN Ship_Mode = 'First Class' THEN 'Fast'
        WHEN Ship_Mode = 'Second Class' THEN 'Medium'
        ELSE 'Slow'
    END AS Shipping_Speed
FROM dbo.orders;
------------------------------------------
--Region Code
SELECT
    Region,
    CASE
        WHEN Region = 'West' THEN 'W'
        WHEN Region = 'East' THEN 'E'
        WHEN Region = 'South' THEN 'S'
        ELSE 'C'
    END AS Region_Code
FROM dbo.orders;
---------------------------------
--Imagine sales employees receive a bonus based on Sales.

SELECT
    Order_ID,
    Sales,
    CASE
        WHEN Sales >= 1000 THEN '20%'
        WHEN Sales >= 500 THEN '10%'
        ELSE '5%'
    END AS Bonus
FROM dbo.orders;
-------------------------------------------
--Which orders have sales greater than the company's average sales?

SELECT
    Order_ID,
    Customer_Name,
    Sales
FROM dbo.orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM dbo.orders
);
-----------------------------------
--Customer with Maximum Sales
SELECT
    Customer_Name,
    Sales
FROM dbo.orders
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM dbo.orders
);
----------------------------
--Customer with Maximum Sales
SELECT
    Customer_Name,
    Sales
FROM dbo.orders
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM dbo.orders
);
-------------------------------
--Product with Maximum Profit
SELECT
    Product_Name,
    Profit
FROM dbo.orders
WHERE Profit =
(
    SELECT MAX(Profit)
    FROM dbo.orders
);
--------------------------------
--Products Sold Below Average Profit
SELECT
    Product_Name,
    Profit
FROM dbo.orders
WHERE Profit <
(
    SELECT AVG(Profit)
    FROM dbo.orders
);
----------------------------------
--Customers with Above Average Total Sales
SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM dbo.orders
GROUP BY Customer_Name
HAVING SUM(Sales) >
(
    SELECT AVG(CustomerSales)
    FROM
    (
        SELECT
            Customer_Name,
            SUM(Sales) AS CustomerSales
        FROM dbo.orders
        GROUP BY Customer_Name
    ) AS AvgSales
);
-----------------------------------
--Orders from the Latest Order Date
SELECT *
FROM dbo.orders
WHERE Order_Date =
(
    SELECT MAX(Order_Date)
    FROM dbo.orders
);
--------------------------------------------
--Products with Sales Greater Than the Average Product Sales
SELECT
    Product_Name,
    Sales
FROM dbo.orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM dbo.orders
);
-----------------------------------------
--Find each customer's total sales using a CTE.

WITH CustomerSales AS
(
    SELECT
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY Customer_Name
)

SELECT *
FROM CustomerSales
ORDER BY Total_Sales DESC;
---------------------------------------
--High Value Customers
WITH CustomerSales AS
(
    SELECT
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY Customer_Name
)

SELECT *
FROM CustomerSales
WHERE Total_Sales > 10000
ORDER BY Total_Sales DESC;
--------------------------------
--Category Profit
WITH CategoryProfit AS
(
    SELECT
        Category,
        SUM(Profit) AS Total_Profit
    FROM dbo.orders
    GROUP BY Category
)

SELECT *
FROM CategoryProfit
ORDER BY Total_Profit DESC;
---------------------------------------
--Region Revenue
WITH RegionRevenue AS
(
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY Region
)

SELECT *
FROM RegionRevenue
ORDER BY Total_Sales DESC;
----------------------------------
--Monthly Sales Trend
WITH MonthlySales AS
(
    SELECT
        YEAR(Order_Date) AS Order_Year,
        MONTH(Order_Date) AS Order_Month,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)

SELECT *
FROM MonthlySales
ORDER BY Order_Year, Order_Month;
--------------------------------------------
--Top 10 Products
WITH ProductSales AS
(
    SELECT
        Product_Name,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY Product_Name
)

SELECT TOP 10 *
FROM ProductSales
ORDER BY Total_Sales DESC;
---------------------------------------------
--Top 10 Customers
WITH CustomerSales AS
(
    SELECT
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY Customer_Name
)

SELECT TOP 10 *
FROM CustomerSales
ORDER BY Total_Sales DESC;
-------------------------------------
--Average Customer Sales
WITH CustomerSales AS
(
    SELECT
        Customer_Name,
        SUM(Sales) AS Total_Sales
    FROM dbo.orders
    GROUP BY Customer_Name
)

SELECT
    AVG(Total_Sales) AS Average_Customer_Sales
FROM CustomerSales;
-----------------------------------------
--Assign a unique rank to every customer based on Total Sales.

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS Row_Num
FROM dbo.orders
GROUP BY Customer_Name;
--------------------------------------------
--Rank customers by Total Sales.

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM dbo.orders
GROUP BY Customer_Name;
-------------------------------------------
--DENSE_RANK()
SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    DENSE_RANK() OVER (ORDER BY SUM(Sales) DESC) AS Dense_Rank
FROM dbo.orders
GROUP BY Customer_Name;
------------------------------------------------
--Calculate cumulative sales over time.

SELECT
    Order_Date,
    Sales,
    SUM(Sales) OVER (
        ORDER BY Order_Date
    ) AS Running_Total
FROM dbo.orders;
-----------------------------------
--LAG()


--Compare today's sales with the previous order's sales.

SELECT
    Order_Date,
    Sales,
    LAG(Sales) OVER (
        ORDER BY Order_Date
    ) AS Previous_Sales
FROM dbo.orders;
-------------------------------------------
--LEAD()

--Compare today's sales with the next order's sales.

SELECT
    Order_Date,
    Sales,
    LEAD(Sales) OVER (
        ORDER BY Order_Date
    ) AS Next_Sales
FROM dbo.orders;
--------------------------------------
--PARTITION BY


--Rank customers within each Region.

SELECT
    Region,
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY SUM(Sales) DESC
    ) AS Region_Rank
FROM dbo.orders
GROUP BY Region, Customer_Name;
-------------------------------------------
--Top 3 Customers in Each Region
WITH CustomerRank AS
(
    SELECT
        Region,
        Customer_Name,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS RN
    FROM dbo.orders
    GROUP BY Region, Customer_Name
)

SELECT *
FROM CustomerRank
WHERE RN <= 3;
--------------------------------
--