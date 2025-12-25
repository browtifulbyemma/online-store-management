-- Query to list all products sold with their total quantities and revenues
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;

-- Query to calculate total revenue per user grouped by user
SELECT
    u.UserID,
    u.UserName,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenuePerUser
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY u.UserID, u.UserName
ORDER BY TotalRevenuePerUser DESC;

-- Query to find the top-selling products
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 10;