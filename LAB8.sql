USE CSE_3A_261;

CREATE TABLE SalesData (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

INSERT INTO SalesData (Region, Product, Sales_Amount, Year) VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024);

SELECT * FROM SalesData;

--Part � A:
--1.Display Total Sales Amount by Region.
SELECT REGION,SUM(Sales_Amount) FROM SalesData GROUP BY Region

--2.Display Average Sales Amount by Product
SELECT Product,AVG(Sales_Amount) FROM SalesData GROUP BY Product;

--3.Display Maximum Sales Amount by Year
SELECT Year,MAX(Sales_Amount) FROM SalesData GROUP BY Year

--4.Display Minimum Sales Amount by Region and Year
SELECT REGION,YEAR,MIN(Sales_Amount) AS MIN_SALE FROM SalesData GROUP BY Region,YEAR

--5.Count of Products Sold by Region
SELECT REGION,COUNT(Product) AS SOLD_PRODUCT FROM SalesData GROUP BY Region;

--6.Display Sales Amount by Year and Product
SELECT Product,YEAR,SUM(Sales_Amount) AS TOTAL FROM SalesData GROUP BY Product,YEAR;

--7.Display Regions with Total Sales Greater Than 5000
SELECT REGION,SUM(Sales_Amount) AS SALES FROM SalesData GROUP BY Region HAVING SUM(Sales_Amount)>5000;

--8.Display Products with Average Sales Less Than 10000
SELECT Product,AVG(Sales_Amount) AS SALES FROM SalesData GROUP BY Product HAVING SUM(Sales_Amount)<10000;

--9.Display Years with Maximum Sales Exceeding 500
SELECT Year,MAX(Sales_Amount) AS SALES FROM SalesData GROUP BY Year HAVING SUM(Sales_Amount)>500;

--10.Display Regions with at Least 3 Distinct Products Sold.
SELECT REGION,COUNT(DISTINCT Product) AS SALES FROM SalesData GROUP BY Region HAVING COUNT(DISTINCT Product)>=3;

--11.Display Years with Minimum Sales Less Than 1000
SELECT Year,MIN(Sales_Amount) AS SALES FROM SalesData GROUP BY Year HAVING MIN(Sales_Amount)<1000;

--12.Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
SELECT REGION,YEAR,SUM(Sales_Amount) AS SALES FROM SalesData GROUP BY Region,Year HAVING Year=2023;

--13.Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
SELECT TOP 1 REGION,SUM(SALES_AMOUNT) AS SALES FROM SalesData GROUP BY Region ORDER BY SALES;

--14.Find the Product with the Highest Sales Across All Regions in 2023.
SELECT TOP 1 Product,SUM(SALES_AMOUNT) AS SALES FROM SalesData GROUP BY Product ORDER BY SALES DESC;

--15.Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.
SELECT TOP 1 Product,SUM(SALES_AMOUNT) AS SALES FROM SalesData WHERE YEAR=2023 
GROUP BY Product HAVING PRODUCT = 'TV' AND SUM(SALES_AMOUNT)>1000;


--Part � B:

--1.Display Count of Orders by Year and Region, Sorted by Year and Region
SELECT YEAR,REGION, COUNT(*) AS Y FROM SalesData GROUP BY YEAR,REGION ORDER BY YEAR,REGION;

--2.Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
SELECT REGION, MAX(Sales_Amount) AS AMOUNT FROM SalesData GROUP BY REGION HAVING MAX(Sales_Amount)>1000 ORDER BY REGION;

--3.Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending
SELECT YEAR,SUM(SALES_AMOUNT) AS SALES FROM SalesData GROUP BY YEAR HAVING SUM(SALES_AMOUNT)<10000 ORDER BY YEAR DESC;

--4.Display Top 3 Regions by Total Sales Amount in Year 2024
SELECT TOP 3 REGION ,SUM(SALES_AMOUNT) AS SALES FROM SalesData WHERE YEAR = 2024 GROUP BY REGION ;

--5.Find the Year with the Lowest Total Sales Across All Regions.
SELECT TOP 1 YEAR , SUM(SALES_AMOUNT) AS SALES FROM SalesData GROUP BY YEAR ORDER BY SALES;

--Part � C:

--1.Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
SELECT PRODUCT ,AVG(SALES_AMOUNT) AS PROD_NAME FROM SalesData GROUP BY PRODUCT 
HAVING AVG(SALES_AMOUNT) BETWEEN 1000 AND 2000 ORDER BY PROD_NAME;

--2.Display Years with More Than 1 Orders from Each Region
SELECT YEAR,Region , COUNT(Product) AS SALES FROM SalesData GROUP BY YEAR,Region HAVING COUNT(Product)>1;

--3.Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
SELECT Region,AVG(Sales_Amount) AS SALES FROM SalesData WHERE YEAR = 2023
GROUP BY Region HAVING AVG(Sales_Amount)>1500 ORDER BY SALES DESC;

--4.Find out region wise duplicate product.
SELECT REGION,PRODUCT AS PRO FROM SALESDATA GROUP BY REGION,Product
HAVING COUNT(*) > 1

--5.Find out year wise duplicate product.
SELECT YEAR,PRODUCT AS PRO FROM SALESDATA GROUP BY YEAR,Product
HAVING COUNT(*) > 1