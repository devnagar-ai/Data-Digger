-- Data Digger query examples. Run after schema.sql and sample_data.sql.
USE DataDigger;

-- READ: list all rows from each table
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

-- Filter, compare, and sort
SELECT * FROM Customers WHERE Name = 'Alice Johnson';
SELECT * FROM Customers WHERE Name LIKE '%Alice%';
SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000 ORDER BY Price;
SELECT * FROM Orders WHERE TotalAmount >= 1000 ORDER BY OrderDate DESC;
SELECT * FROM Orders WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
SELECT * FROM Products ORDER BY Price DESC LIMIT 3;

-- INNER JOIN: order details with product names
SELECT o.OrderID, o.OrderDate, p.ProductName, od.Quantity, od.SubTotal
FROM OrderDetails AS od
JOIN Orders AS o ON o.OrderID = od.OrderID
JOIN Products AS p ON p.ProductID = od.ProductID
ORDER BY o.OrderID, p.ProductName;

-- LEFT JOIN: customers who have not placed an order
SELECT c.CustomerID, c.Name
FROM Customers AS c
LEFT JOIN Orders AS o ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL;

-- Aggregates
SELECT MAX(TotalAmount) AS HighestOrderAmount,
       MIN(TotalAmount) AS LowestOrderAmount,
       ROUND(AVG(TotalAmount), 2) AS AverageOrderAmount,
       SUM(TotalAmount) AS TotalOrderAmount,
       COUNT(*) AS NumberOfOrders
FROM Orders;

SELECT SUM(SubTotal) AS RevenueFromOrderDetails FROM OrderDetails;

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalUnitsOrdered
FROM OrderDetails AS od
JOIN Products AS p ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalUnitsOrdered DESC
LIMIT 3;

-- CREATE: add one customer (email must remain unique)
-- INSERT INTO Customers (Name, Email, Address)
-- VALUES ('Riya Shah', 'riya.shah@example.com', '10 Park Road, Pune, MH 411001');

-- UPDATE: update a customer's address
-- UPDATE Customers
-- SET Address = '999 New Street, Gurugram, HR 122001'
-- WHERE CustomerID = 2;

-- DELETE: remove an order; its OrderDetails are removed by ON DELETE CASCADE
-- DELETE FROM Orders WHERE OrderID = 4;

-- DELETE: remove a customer; related orders and details cascade
-- DELETE FROM Customers WHERE CustomerID = 5;
