CREATE DATABASE CourierManagement;
GO

USE CourierManagement;
GO
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Address TEXT NOT NULL
);
GO

CREATE TABLE Couriers (
    CourierID INT PRIMARY KEY IDENTITY(1,1),
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    Weight DECIMAL(5, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    DeliveryDate DATE
);
GO

CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    ServiceName VARCHAR(100) NOT NULL,
    Cost DECIMAL(8, 2) NOT NULL
);
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);
GO

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    LocationName VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL
);
GO

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);
GO

INSERT INTO Users (Name, Email, Password, ContactNumber, Address) 
VALUES 
('Ravi Kumar', 'ravi.kumar@mail.com', 'ravi123', '9876543210', '123 MG Road, Bengaluru'),
('Priya Sharma', 'priya.sharma@mail.com', 'priya456', '9123456789', '456 Park Street, Kolkata'),
('Amit Singh', 'amit.singh@mail.com', 'amit789', '8765432109', '789 Sector 21, Chandigarh'),
('Neha Verma', 'neha.verma@mail.com', 'neha123', '9898989898', '12 Green Avenue, Delhi'),
('Rajesh Gupta', 'rajesh.gupta@mail.com', 'rajesh456', '9988776655', '10 Connaught Place, Delhi'),
('Suman Reddy', 'suman.reddy@mail.com', 'suman789', '9123451234', '90 Jubilee Hills, Hyderabad'),
('Deepa Patil', 'deepa.patil@mail.com', 'deepa111', '9543217865', '56 FC Road, Pune'),
('Anil Mehta', 'anil.mehta@mail.com', 'anil321', '9223378901', '45 Marine Drive, Mumbai'),
('Pooja Joshi', 'pooja.joshi@mail.com', 'pooja987', '9000123456', '23 Race Course, Coimbatore'),
('Rakesh Yadav', 'rakesh.yadav@mail.com', 'rakesh555', '9823456789', '67 Anna Salai, Chennai');
GO

INSERT INTO Couriers (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) 
VALUES 
('Ravi Kumar', '123 MG Road, Bengaluru', 'Priya Sharma', '456 Park Street, Kolkata', 5.75, 'In Transit', 'TRK1001', '2025-03-25'),
('Amit Singh', '789 Sector 21, Chandigarh', 'Neha Verma', '12 Green Avenue, Delhi', 3.20, 'Delivered', 'TRK1002', '2025-03-20'),
('Rajesh Gupta', '10 Connaught Place, Delhi', 'Suman Reddy', '90 Jubilee Hills, Hyderabad', 7.50, 'Pending', 'TRK1003', '2025-03-22'),
('Deepa Patil', '56 FC Road, Pune', 'Anil Mehta', '45 Marine Drive, Mumbai', 4.25, 'In Transit', 'TRK1004', '2025-03-24'),
('Anil Mehta', '45 Marine Drive, Mumbai', 'Pooja Joshi', '23 Race Course, Coimbatore', 6.50, 'Delivered', 'TRK1005', '2025-03-18'),
('Rakesh Yadav', '67 Anna Salai, Chennai', 'Deepa Patil', '56 FC Road, Pune', 5.00, 'Pending', 'TRK1006', '2025-03-23'),
('Suman Reddy', '90 Jubilee Hills, Hyderabad', 'Rakesh Yadav', '67 Anna Salai, Chennai', 3.90, 'Delivered', 'TRK1007', '2025-03-19'),
('Priya Sharma', '456 Park Street, Kolkata', 'Ravi Kumar', '123 MG Road, Bengaluru', 4.80, 'In Transit', 'TRK1008', '2025-03-27'),
('Neha Verma', '12 Green Avenue, Delhi', 'Rajesh Gupta', '10 Connaught Place, Delhi', 2.50, 'Delivered', 'TRK1009', '2025-03-21'),
('Pooja Joshi', '23 Race Course, Coimbatore', 'Amit Singh', '789 Sector 21, Chandigarh', 6.00, 'In Transit', 'TRK1010', '2025-03-26');
GO

INSERT INTO CourierServices (ServiceName, Cost) 
VALUES 
('Standard Delivery', 50.00),
('Express Delivery', 100.00),
('Same Day Delivery', 150.00),
('Overnight Delivery', 200.00),
('Economy Delivery', 30.00),
('Premium Express', 250.00),
('Local Courier', 20.00),
('Bulk Shipment', 500.00),
('Document Delivery', 40.00),
('International Delivery', 1000.00);
GO

INSERT INTO Employees (Name, Email, ContactNumber, Role, Salary) 
VALUES 
('Manoj Desai', 'manoj.desai@mail.com', '9876123450', 'Courier Manager', 55000.00),
('Seema Nair', 'seema.nair@mail.com', '9123432109', 'Delivery Executive', 32000.00),
('Rohit Khanna', 'rohit.khanna@mail.com', '9765432101', 'Logistics Manager', 60000.00),
('Asha Rao', 'asha.rao@mail.com', '9654321789', 'Customer Support', 30000.00),
('Vikram Sethi', 'vikram.sethi@mail.com', '9870012345', 'Branch Manager', 70000.00),
('Nisha Pandey', 'nisha.pandey@mail.com', '9654321976', 'Dispatcher', 28000.00),
('Arjun Iyer', 'arjun.iyer@mail.com', '9987123456', 'Courier Executive', 31000.00),
('Meena Kapoor', 'meena.kapoor@mail.com', '9123412345', 'Sorting Staff', 25000.00),
('Ravi Tiwari', 'ravi.tiwari@mail.com', '9123478123', 'Delivery Executive', 32000.00),
('Kiran Patil', 'kiran.patil@mail.com', '9823456781', 'Inventory Manager', 65000.00);
GO

INSERT INTO Locations (LocationName, Address) 
VALUES 
('Bengaluru Hub', '123 MG Road, Bengaluru'),
('Kolkata Branch', '456 Park Street, Kolkata'),
('Delhi Depot', '12 Green Avenue, Delhi'),
('Mumbai Center', '45 Marine Drive, Mumbai'),
('Chennai Warehouse', '67 Anna Salai, Chennai'),
('Hyderabad Hub', '90 Jubilee Hills, Hyderabad'),
('Pune Sorting Facility', '56 FC Road, Pune'),
('Chandigarh Office', '789 Sector 21, Chandigarh'),
('Coimbatore Center', '23 Race Course, Coimbatore'),
('Ahmedabad Depot', '100 SG Highway, Ahmedabad');
GO

INSERT INTO Payments (CourierID, LocationID, Amount, PaymentDate) 
VALUES 
(1, 1, 50.00, '2025-03-25'),
(2, 2, 100.00, '2025-03-20'),
(3, 3, 150.00, '2025-03-22'),
(4, 4, 200.00, '2025-03-24'),
(5, 5, 75.00, '2025-03-18'),
(6, 6, 120.00, '2025-03-23'),
(7, 7, 90.00, '2025-03-19'),
(8, 8, 60.00, '2025-03-27'),
(9, 9, 80.00, '2025-03-21'),
(10, 10, 110.00, '2025-03-26');
GO

--1. List all customers:  
SELECT * 
FROM Users;
GO

--2. List all orders for a specific customer:  
SELECT * 
FROM Couriers
WHERE SenderName = (
    SELECT Name 
    FROM Users 
    WHERE UserID = 1
);
GO

--3. List all couriers:  
SELECT * 
FROM Couriers;
GO

--4. List all packages for a specific order:  
SELECT * 
FROM Couriers
WHERE TrackingNumber = 'TRK1001';
GO

--5. List all deliveries for a specific courier:  
SELECT * 
FROM Couriers
WHERE CourierID = 1;
GO

--6. List all undelivered packages:  
SELECT * 
FROM Couriers
WHERE Status <> 'Delivered';
GO

--7. List all packages that are scheduled for delivery today:  
SELECT * 
FROM Couriers
WHERE DeliveryDate = CAST(GETDATE() AS DATE);
GO

--8. List all packages with a specific status:  
SELECT * 
FROM Couriers
WHERE Status = 'In Transit';
GO

--9. Calculate the total number of packages for each courier.  
SELECT SenderName, COUNT(*) AS TotalPackages
FROM Couriers
GROUP BY SenderName;
GO

--10. Find the average delivery time for each courier  
SELECT SenderName, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM Couriers
GROUP BY SenderName;
GO

--11. List all packages with a specific weight range:  
SELECT * 
FROM Couriers
WHERE Weight BETWEEN 3.0 AND 7.0;
GO

--12. Retrieve employees whose names contain 'John'  
SELECT * 
FROM Employees
WHERE Name LIKE '%Manoj%';
GO

--13. Retrieve all courier records with payments greater than $50.
SELECT c.CourierID, c.SenderName, p.Amount, p.PaymentDate
FROM Couriers AS c
JOIN Payments AS p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;
GO

--TASK 3

--14. Find the total number of couriers handled by each employee.  
SELECT e.Name AS EmployeeName, COUNT(c.CourierID) AS TotalCouriersHandled
FROM Employees e
JOIN Couriers c ON e.EmployeeID = c.CourierID  
GROUP BY e.Name;
GO

--15. Calculate the total revenue generated by each location  
SELECT l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName;
GO

--16. Find the total number of couriers delivered to each location.  
SELECT l.LocationName, COUNT(c.CourierID) AS TotalCouriersDelivered
FROM Locations l
JOIN Couriers c ON l.LocationID = c.CourierID  -- Assuming location assigned to Courier via LocationID, adjust if needed
WHERE c.Status = 'Delivered'
GROUP BY l.LocationName;
GO

--17. Find the courier with the highest average delivery time:  
SELECT TOP 1 c.SenderName, AVG(DATEDIFF(DAY, GETDATE(), c.DeliveryDate)) AS AvgDeliveryTime
FROM Couriers c
GROUP BY c.SenderName
ORDER BY AvgDeliveryTime DESC;
GO

--18. Find Locations with Total Payments Less Than a Certain Amount  
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName
HAVING SUM(p.Amount) < 500;
GO

--19. Calculate Total Payments per Location  
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName;
GO

--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):  
SELECT c.CourierID, c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Couriers c
JOIN Payments p ON c.CourierID = p.CourierID
WHERE p.LocationID = 1
GROUP BY c.CourierID, c.SenderName
HAVING SUM(p.Amount) > 1000;
GO

--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'):  
SELECT c.CourierID, c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Couriers c
JOIN Payments p ON c.CourierID = p.CourierID
WHERE p.PaymentDate > '2025-03-22'
GROUP BY c.CourierID, c.SenderName
HAVING SUM(p.Amount) > 1000;
GO

--22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD') 
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
WHERE p.PaymentDate < '2024-03-22'
GROUP BY l.LocationName
HAVING SUM(p.Amount) > 5000;
GO


--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join  

--23. Retrieve Payments with Courier Information  
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.SenderName, c.ReceiverName, c.TrackingNumber
FROM Payments p
INNER JOIN Couriers c ON p.CourierID = c.CourierID;
GO

--24. Retrieve Payments with Location Information  
SELECT p.PaymentID, p.Amount, p.PaymentDate, l.LocationName, l.Address
FROM Payments p
INNER JOIN Locations l ON p.LocationID = l.LocationID;
GO

--25. Retrieve Payments with Courier and Location Information  
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.SenderName, c.ReceiverName, c.TrackingNumber, l.LocationName
FROM Payments p
INNER JOIN Couriers c ON p.CourierID = c.CourierID
INNER JOIN Locations l ON p.LocationID = l.LocationID;
GO

--26. List all payments with courier details  
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.SenderName, c.ReceiverName
FROM Payments p
LEFT OUTER JOIN Couriers c ON p.CourierID = c.CourierID;
GO

--27. Total payments received for each courier  
SELECT c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Payments p
INNER JOIN Couriers c ON p.CourierID = c.CourierID
GROUP BY c.SenderName;
GO

--28. List payments made on a specific date  
SELECT * 
FROM Payments
WHERE PaymentDate = '2025-03-01';
GO

--29. Get Courier Information for Each Payment  
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.SenderName, c.ReceiverName
FROM Payments p
INNER JOIN Couriers c ON p.CourierID = c.CourierID;
GO

--30. Get Payment Details with Location  
SELECT p.PaymentID, p.Amount, p.PaymentDate, l.LocationName
FROM Payments p
INNER JOIN Locations l ON p.LocationID = l.LocationID;
GO

--31. Calculating Total Payments for Each Courier  
SELECT c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Payments p
INNER JOIN Couriers c ON p.CourierID = c.CourierID
GROUP BY c.SenderName;
GO

--32. List Payments Within a Date Range  
SELECT * 
FROM Payments
WHERE PaymentDate BETWEEN '2025-01-01' AND '2025-03-01';
GO

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side  
SELECT u.Name AS UserName, c.SenderName AS CourierSender
FROM Users u
FULL OUTER JOIN Couriers c ON u.UserID = c.CourierID;
GO

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side  
SELECT c.SenderName, s.ServiceName
FROM Couriers c
FULL OUTER JOIN CourierServices s ON c.CourierID = s.ServiceID;
GO

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side  
SELECT e.Name AS EmployeeName, p.Amount AS PaymentAmount
FROM Employees e
FULL OUTER JOIN Payments p ON e.EmployeeID = p.CourierID;
GO

--36. List all users and all courier services, showing all possible combinations.  
SELECT u.Name AS UserName, s.ServiceName
FROM Users u
CROSS JOIN CourierServices s;
GO

--37. List all employees and all locations, showing all possible combinations:  
SELECT e.Name AS EmployeeName, l.LocationName
FROM Employees e
CROSS JOIN Locations l;
GO

--38. Retrieve a list of couriers and their corresponding sender information (if available)  
SELECT c.TrackingNumber, c.SenderName, c.SenderAddress
FROM Couriers c;
GO

--39. Retrieve a list of couriers and their corresponding receiver information (if available):  
SELECT c.TrackingNumber, c.ReceiverName, c.ReceiverAddress
FROM Couriers c;
GO

--40. Retrieve a list of couriers along with the courier service details (if available):  
SELECT c.TrackingNumber, c.SenderName, cs.ServiceName
FROM Couriers c
LEFT JOIN CourierServices cs ON c.CourierID = cs.ServiceID;
GO

--41. Retrieve a list of employees and the number of couriers assigned to each employee:  
SELECT e.Name AS EmployeeName, COUNT(c.CourierID) AS NumberOfCouriers
FROM Employees e
LEFT JOIN Couriers c ON e.EmployeeID = c.CourierID
GROUP BY e.Name;
GO

--42. Retrieve a list of locations and the total payment amount received at each location:  
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
GROUP BY l.LocationName;
GO

--43. Retrieve all couriers sent by the same sender (based on SenderName).  
SELECT *
FROM Couriers
WHERE SenderName = 'John Doe'; 
GO

--44. List all employees who share the same role.  
SELECT e.Name, e.Role
FROM Employees e
WHERE e.Role = 'Delivery Executive'; 
GO

--45. Retrieve all payments made for couriers sent from the same location.  
SELECT p.PaymentID, p.Amount, p.PaymentDate
FROM Payments p
JOIN Couriers c ON p.CourierID = c.CourierID
WHERE CAST(c.SenderAddress AS VARCHAR(MAX)) = '123 MG Road, Bengaluru';
GO


--46. Retrieve all couriers sent from the same location (based on SenderAddress).  
SELECT *
FROM Couriers
WHERE CAST(SenderAddress AS VARCHAR(MAX)) = '123 MG Road, Bengaluru';
GO

--47. List employees and the number of couriers they have delivered:  
SELECT e.Name AS EmployeeName, COUNT(c.CourierID) AS DeliveredCouriers
FROM Employees e
LEFT JOIN Couriers c ON e.EmployeeID = c.CourierID
WHERE c.Status = 'Delivered'
GROUP BY e.Name;
GO

--48. Find couriers that were paid an amount greater than the cost of their respective courier services  
SELECT c.TrackingNumber, p.Amount AS PaymentAmount, cs.Cost AS ServiceCost
FROM Couriers c
JOIN Payments p ON c.CourierID = p.CourierID
JOIN CourierServices cs ON c.CourierID = cs.ServiceID
WHERE p.Amount > cs.Cost;
GO

--Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All  

--49. Find couriers that have a weight greater than the average weight of all couriers  
SELECT *
FROM Couriers
WHERE Weight > (SELECT AVG(Weight) FROM Couriers);
GO

--50. Find the names of all employees who have a salary greater than the average salary:  
SELECT Name
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
GO

--51. Find the total cost of all courier services where the cost is less than the maximum cost  
SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);
GO

--52. Find all couriers that have been paid for  
SELECT c.*
FROM Couriers c
JOIN Payments p ON c.CourierID = p.CourierID;
GO

--53. Find the locations where the maximum payment amount was made  
SELECT l.LocationName
FROM Locations l
JOIN Payments p ON l.LocationID = p.LocationID
WHERE p.Amount = (SELECT MAX(Amount) FROM Payments);
GO

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):  
SELECT c.*
FROM Couriers c
WHERE Weight > ALL (SELECT Weight FROM Couriers WHERE SenderName = 'Rahul Mehta');  -- Replace 'Rahul Mehta' with the specific sender name
GO






