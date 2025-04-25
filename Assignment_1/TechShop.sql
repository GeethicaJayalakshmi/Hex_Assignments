CREATE DATABASE TechShop
USE TechShop

CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)
)

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    CONSTRAINT PK_Products PRIMARY KEY (ProductID)
)

CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
)

CREATE TABLE OrderDetails (
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderDetailID)
)

CREATE TABLE Inventory (
    InventoryID INT,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    CONSTRAINT PK_Inventory PRIMARY KEY (InventoryID)
)


INSERT INTO Customers
VALUES (1, 'Geethica', 'Jayalakshmi', 'geethica.com', '1234567890', 'Chennai')

INSERT INTO Customers
VALUES (2, 'Valar', 'Mathi', 'valarmathi.com', '0987654321', 'Coimbatore')

INSERT INTO Customers
VALUES (3, 'Saravanan', 'A', 'saravanan.com', '7347654423', 'Banglore')

INSERT INTO Customers
VALUES (4, 'Karthik', 'Rajan', 'karthikrajan.com', '9845123456', 'Mumbai');

INSERT INTO Customers
VALUES (5, 'Meera', 'Nair', 'meeranair.com', '8976543210', 'Kochi');

INSERT INTO Customers
VALUES (6, 'Rahul', 'Verma', 'rahulverma.com', '9123456789', 'Delhi');

INSERT INTO Customers
VALUES (7, 'Sneha', 'Kapoor', 'snehakapoor.com', '9784561230', 'Pune');

INSERT INTO Customers
VALUES (8, 'Arjun', 'Menon', 'arjunmenon.com', '8901234567', 'Hyderabad');

INSERT INTO Customers
VALUES (9, 'Priya', 'Singh', 'priyasingh.com', '9988776655', 'Kolkata');

INSERT INTO Customers
VALUES (10, 'Vikram', 'Chauhan', 'vikramchauhan.com', '8765432109', 'Ahmedabad');

INSERT INTO Customers
VALUES (11, 'Divya', 'Sharma', 'divyasharma.com', '9012345678', 'Jaipur');

INSERT INTO Customers
VALUES (12, 'Neha', 'Joshi', 'nehajoshi.com', '7890123456', 'Surat');

INSERT INTO Customers
VALUES (13, 'Sandeep', 'Patel', 'sandeeppatel.com', '8909876543', 'Vadodara');

SELECT * FROM Customers

INSERT INTO Products
VALUES (3, 'Tablet', 'High-resolution display', 499.99);

INSERT INTO Products
VALUES (4, 'Smartwatch', 'Fitness and notifications', 199.99);

INSERT INTO Products
VALUES (5, 'Headphones', 'Noise-cancelling over-ear', 149.99);

INSERT INTO Products
VALUES (6, 'Bluetooth Speaker', 'Portable and waterproof', 89.99);

INSERT INTO Products
VALUES (7, 'Camera', 'DSLR with 24MP resolution', 799.99);

INSERT INTO Products
VALUES (8, 'Gaming Console', '4K gaming support', 399.99);

INSERT INTO Products
VALUES (9, 'VR Headset', 'Immersive 360-degree experience', 299.99);

INSERT INTO Products
VALUES (10, 'Smart TV', '4K UHD with HDR', 999.99);

INSERT INTO Products
VALUES (11, 'Router', 'Dual-band Wi-Fi 6', 129.99);

INSERT INTO Products
VALUES (12, 'Wireless Earbuds', 'True wireless with ANC', 79.99);

INSERT INTO Products
VALUES (13, 'Fitness Tracker', 'Heart rate and sleep monitoring', 49.99);

INSERT INTO Products
VALUES (14, 'Smart Home Hub', 'Voice control and automation', 129.99);

INSERT INTO Products
VALUES (15, 'Gaming Keyboard', 'Mechanical RGB backlit', 89.99);

SELECT * FROM Products

INSERT INTO Orders
VALUES (1, 1, '2025-03-17', 699.99);

INSERT INTO Orders
VALUES (2, 2, '2025-03-18', 1299.99);

INSERT INTO Orders
VALUES (3, 3, '2025-03-19', 499.50);

INSERT INTO Orders
VALUES (4, 4, '2025-03-20', 899.00);

INSERT INTO Orders
VALUES (5, 1, '2025-03-21', 1599.99);

INSERT INTO Orders
VALUES (6, 2, '2025-03-22', 1099.75);

INSERT INTO Orders
VALUES (7, 3, '2025-03-23', 350.25);

INSERT INTO Orders
VALUES (8, 4, '2025-03-24', 765.90);

SELECT * FROM Orders

INSERT INTO OrderDetails
VALUES (1, 1, 1, 1);

INSERT INTO OrderDetails
VALUES (2, 2, 2, 1);

INSERT INTO OrderDetails
VALUES (3, 1, 3, 2);

INSERT INTO OrderDetails
VALUES (4, 2, 4, 1);

INSERT INTO OrderDetails
VALUES (5, 3, 1, 3);

INSERT INTO OrderDetails
VALUES (6, 4, 2, 2);

INSERT INTO OrderDetails
VALUES (7, 1, 5, 1);

INSERT INTO OrderDetails
VALUES (8, 2, 3, 4);

SELECT * FROM OrderDetails

INSERT INTO Inventory
VALUES (1, 1, 50, '2025-03-01');

INSERT INTO Inventory
VALUES (2, 2, 30, '2025-03-05');

INSERT INTO Inventory
VALUES (3, 3, 75, '2025-03-10');

INSERT INTO Inventory
VALUES (4, 4, 100, '2025-03-12');

INSERT INTO Inventory
VALUES (5, 1, 200, '2025-03-15');

INSERT INTO Inventory
VALUES (6, 2, 150, '2025-03-18');

INSERT INTO Inventory
VALUES (7, 3, 50, '2025-03-20');

INSERT INTO Inventory
VALUES (8, 4, 120, '2025-03-22');

SELECT * FROM Inventory

--TASK 2

SELECT FirstName, LastName, Email FROM Customers;

SELECT OrderID, OrderDate FROM Orders;

UPDATE Products
SET Price = Price * 1.10;

DELETE FROM OrderDetails WHERE OrderID = 1;
DELETE FROM Orders WHERE OrderID = 1;

UPDATE Customers
SET Email = 'newemail@gmail.com', Address = 'Singapore'
WHERE CustomerID = 1;

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Quantity * Price)
    FROM OrderDetails, Products
    WHERE OrderDetails.ProductID = Products.ProductID
    AND OrderDetails.OrderID = Orders.OrderID
);

DELETE FROM Orders WHERE CustomerID = 1;
DELETE FROM OrderDetails WHERE OrderID NOT IN (SELECT OrderID FROM Orders);

UPDATE Orders
SET TotalAmount = 0.00
WHERE OrderID = 1;

SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID;

--TASK 3

SELECT o.OrderID, c.FirstName, c.LastName, o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;


SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantityOrdered DESC;

SELECT p.ProductName, p.Description
FROM Products p;

SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName;

SELECT TOP 1 o.OrderID, c.FirstName, c.LastName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

SELECT p.ProductName, COUNT(od.OrderDetailID) AS TimesOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

SELECT c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Tablet';

SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
WHERE o.OrderDate BETWEEN '2025-01-01' AND '2025-12-31';


--Task 4
SELECT FirstName, LastName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

SELECT COUNT(*) AS TotalProducts
FROM Products;

SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o;

SELECT DISTINCT Description
FROM Products;

SELECT AVG(od.Quantity) AS AverageQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Description = 'latest model';

SELECT SUM(o.TotalAmount) AS CustomerRevenue
FROM Orders o
WHERE o.CustomerID = 2;

SELECT TOP 1 c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY OrderCount DESC;

SELECT TOP 1 p.Description, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Description
ORDER BY TotalQuantity DESC;

SELECT TOP 1 c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpending DESC;

SELECT AVG(o.TotalAmount) AS AverageOrderValue
FROM Orders o;

SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

























