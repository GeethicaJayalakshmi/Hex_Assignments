--Task 1

CREATE DATABASE HMBank;
GO
USE HMBank;
GO

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(255)
);
GO

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    account_type VARCHAR(20) CHECK (account_type IN ('savings', 'current', 'zero_balance')) NOT NULL,
    balance DECIMAL(18, 2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
GO

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY IDENTITY(1,1),
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')) NOT NULL,
    amount DECIMAL(18, 2) CHECK (amount > 0),
    transaction_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
GO

-- TASK 2

--1. Insert at least 10 sample records into each of the following tables.   • Customers  • Accounts • Transactions 

INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) 
VALUES 
('Geethica', 'Jayalakshmi', '1990-01-15', 'geethica@mail.com', '9876543210', '123 MG Road, Mumbai'),
('Valar', 'MAthi', '1985-06-20', 'valarmathi@mail.com', '9123456789', '456 Residency Road, Bangalore'),
('Saravanan', 'A', '1992-03-05', 'saravanan@mail.com', '9988776655', '789 Civil Lines, Delhi'),
('Sneha', 'Reddy', '1988-09-22', 'sneha.reddy@mail.com', '8877665544', '321 Banjara Hills, Hyderabad'),
('Kiran', 'Mehta', '1995-12-01', 'kiran.mehta@mail.com', '9123456780', '654 SG Highway, Ahmedabad'),
('Ravi', 'Kumar', '1980-05-30', 'ravi.kumar@mail.com', '9876541234', '987 Anna Salai, Chennai'),
('Neha', 'Desai', '1997-11-10', 'neha.desai@mail.com', '8765432109', '852 FC Road, Pune'),
('Vikram', 'Verma', '1991-08-14', 'vikram.verma@mail.com', '9988771122', '159 Sector 17, Chandigarh'),
('Pooja', 'Gupta', '1983-07-19', 'pooja.gupta@mail.com', '9123004455', '753 Gariahat Road, Kolkata'),
('Arjun', 'Nair', '1986-02-28', 'arjun.nair@mail.com', '8765432234', '963 Marine Drive, Kochi');
GO

INSERT INTO Accounts (customer_id, account_type, balance) 
VALUES 
(1, 'savings', 1500.00),
(2, 'current', 8000.00),
(3, 'zero_balance', 0.00),
(4, 'savings', 2500.00),
(5, 'current', 3000.00),
(6, 'zero_balance', 0.00),
(7, 'savings', 5000.00),
(8, 'current', 10000.00),
(9, 'zero_balance', 0.00),
(10, 'savings', 2000.00);
GO

INSERT INTO Transactions (account_id, transaction_type, amount) 
VALUES 
(1, 'deposit', 5000.00),
(2, 'withdrawal', 2000.00),
(3, 'transfer', 1500.00),
(4, 'deposit', 3000.00),
(5, 'withdrawal', 1000.00),
(6, 'deposit', 2500.00),
(7, 'transfer', 800.00),
(8, 'withdrawal', 1200.00),
(9, 'deposit', 4000.00),
(10, 'transfer', 900.00);
GO

SELECT * From Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;


--1. Write a SQL query to retrieve the name, account type and email of all customers.   
SELECT C.first_name, C.last_name, A.account_type, C.email
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id;
GO

--2. Write a SQL query to list all transaction corresponding customer. 
SELECT C.first_name, C.last_name, T.transaction_type, T.amount, T.transaction_date
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
JOIN Transactions T ON A.account_id = T.account_id;
GO

--3. Write a SQL query to increase the balance of a specific account by a certain amount. 
UPDATE Accounts
SET balance = balance + 1000.00
WHERE account_id = 1;
GO

--4. Write a SQL query to Combine first and last names of customers as a full_name. 
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers;
GO

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings. 
DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings';
GO

--6. Write a SQL query to Find customers living in a specific city. 
SELECT first_name, last_name, address
FROM Customers
WHERE address LIKE '%Mumbai%';
GO

--7. Write a SQL query to Get the account balance for a specific account. 
SELECT balance
FROM Accounts
WHERE account_id = 1;
GO

--8. Write a SQL query to List all current accounts with a balance greater than $1,000. 
SELECT account_id, customer_id, balance
FROM Accounts
WHERE account_type = 'current' AND balance > 1000;
GO

--9. Write a SQL query to Retrieve all transactions for a specific account. 
SELECT transaction_type, amount, transaction_date
FROM Transactions
WHERE account_id = 2;
GO

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate. 
SELECT account_id, balance, balance * 0.05 AS interest
FROM Accounts
WHERE account_type = 'savings';
GO

--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit. 
SELECT account_id, balance
FROM Accounts
WHERE balance < -100;
GO

--12. Write a SQL query to Find customers not living in a specific city. 
SELECT first_name, last_name, address
FROM Customers
WHERE address NOT LIKE '%456 Residency Road, Bangalore%';
GO

--TASK 3

--1. Write a SQL query to Find the average account balance for all customers.   
SELECT AVG(balance) AS average_balance
FROM Accounts;
GO

--2. Write a SQL query to Retrieve the top 10 highest account balances.  
SELECT TOP 10 account_id, balance
FROM Accounts
ORDER BY balance DESC;
GO

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date. 
SELECT SUM(amount) AS total_deposits
FROM Transactions
WHERE transaction_type = 'deposit' 
  AND CONVERT(DATE, transaction_date) = '2025-03-22';
GO

--4. Write a SQL query to Find the Oldest and Newest Customers. 
SELECT first_name, last_name, DOB
FROM Customers
ORDER BY DOB ASC;  

SELECT first_name, last_name, DOB
FROM Customers
ORDER BY DOB DESC; 
GO

--5. Write a SQL query to Retrieve transaction details along with the account type. 
SELECT T.transaction_id, T.transaction_type, T.amount, T.transaction_date, A.account_type
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id;
GO

--6. Write a SQL query to Get a list of customers along with their account details. 
SELECT C.first_name, C.last_name, A.account_type, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id;
GO

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account. 
SELECT C.first_name, C.last_name, T.transaction_type, T.amount, T.transaction_date
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
JOIN Customers C ON A.customer_id = C.customer_id
WHERE T.account_id = 6;
GO

--8. Write a SQL query to Identify customers who have more than one account. 
SELECT C.first_name, C.last_name, COUNT(A.account_id) AS account_count
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.first_name, C.last_name
HAVING COUNT(A.account_id) > 1;
GO

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals. 
SELECT 
    (SELECT COALESCE(SUM(amount), 0) FROM Transactions WHERE transaction_type = 'deposit') - 
    (SELECT COALESCE(SUM(amount), 0) FROM Transactions WHERE transaction_type = 'withdrawal') AS difference;
GO

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period. 
SELECT T.account_id, AVG(T.amount) AS average_daily_balance
FROM Transactions T
WHERE T.transaction_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY T.account_id;
GO

--11. Calculate the total balance for each account type. 
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;
GO

--12. Identify accounts with the highest number of transactions order by descending order. 
SELECT A.account_id, A.account_type, COUNT(T.transaction_id) AS transaction_count
FROM Accounts A
JOIN Transactions T ON A.account_id = T.account_id
GROUP BY A.account_id, A.account_type
ORDER BY COUNT(T.transaction_id) DESC;
GO

--13. List customers with high aggregate account balances, along with their account types. 
SELECT C.first_name, C.last_name, A.account_type, SUM(A.balance) AS total_balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.first_name, C.last_name, A.account_type
HAVING SUM(A.balance) > 10000;  -- Customize the threshold as needed
GO

--14. Identify and list duplicate transactions based on transaction amount, date, and account. 
SELECT account_id, transaction_type, amount, transaction_date, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, transaction_type, amount, transaction_date
HAVING COUNT(*) > 1;
GO

--TASK 4

--1. Retrieve the customer(s) with the highest account balance. 
SELECT C.first_name, C.last_name, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
WHERE A.balance = (SELECT MAX(balance) FROM Accounts);
GO

--2. Calculate the average account balance for customers who have more than one account. 
SELECT AVG(A.balance) AS average_balance
FROM Accounts A
JOIN (
    SELECT customer_id
    FROM Accounts
    GROUP BY customer_id
    HAVING COUNT(account_id) > 1
) AS MultipleAccounts ON A.customer_id = MultipleAccounts.customer_id;
GO

--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount. 
SELECT T.account_id, T.transaction_type, T.amount, T.transaction_date
FROM Transactions T
WHERE T.amount > (SELECT AVG(amount) FROM Transactions);
GO

--4. Identify customers who have no recorded transactions. 
SELECT C.first_name, C.last_name
FROM Customers C
LEFT JOIN Accounts A ON C.customer_id = A.customer_id
LEFT JOIN Transactions T ON A.account_id = T.account_id
WHERE T.transaction_id IS NULL;
GO

--5. Calculate the total balance of accounts with no recorded transactions. 
SELECT SUM(A.balance) AS total_balance
FROM Accounts A
LEFT JOIN Transactions T ON A.account_id = T.account_id
WHERE T.transaction_id IS NULL;
GO

--6. Retrieve transactions for accounts with the lowest balance. 
SELECT T.transaction_id, T.account_id, T.transaction_type, T.amount, T.transaction_date
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
WHERE A.balance = (SELECT MIN(balance) FROM Accounts);
GO

--7. Identify customers who have accounts of multiple types. 
SELECT C.first_name, C.last_name, COUNT(DISTINCT A.account_type) AS type_count
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.first_name, C.last_name
HAVING COUNT(DISTINCT A.account_type) > 1;
GO

--8. Calculate the percentage of each account type out of the total number of accounts. 
SELECT A.account_type, 
       COUNT(*) AS account_count,
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage
FROM Accounts A
GROUP BY A.account_type;
GO

--9. Retrieve all transactions for a customer with a given customer_id. 
SELECT T.transaction_id, T.account_id, T.transaction_type, T.amount, T.transaction_date
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
WHERE A.customer_id = 1;
GO

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause.
SELECT A.account_type,
       (SELECT SUM(balance) FROM Accounts WHERE account_type = A.account_type) AS total_balance
FROM Accounts A
GROUP BY A.account_type;
GO
