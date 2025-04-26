--TASK 1

--1. Create the database named "SISDB" 

CREATE DATABASE SISDB;
USE SISDB;

--2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships.  
--a. Students  b. Courses c. Enrollments  d. Teacher  e. Payments 

--3. Create appropriate Primary Key and Foreign Key constraints for referential integrity. 
CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);
GO

CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(101,1),
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT
);
GO

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY IDENTITY(201,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
GO

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(301,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
GO

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(401,1),
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
GO

--4. Insert at least 10 sample records into each of the following tables. 
--Students  Courses Enrollments  Teacher  Payments

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Valar', 'Mathi', '1995-08-15', 'valarmathi@mail.com', '9876543210'),
('Geethica', 'Jayalakshmi', '1998-05-20', 'geethicaj@mail.com', '8765432109'),
('Amit', 'Patel', '2000-11-25', 'amit.patel@mail.com', '7654321098'),
('Neha', 'Singh', '1997-02-17', 'neha.singh@mail.com', '6543210987'),
('Vikram', 'Reddy', '1996-06-10', 'vikram.reddy@mail.com', '5432109876'),
('Anjali', 'Mehta', '1999-03-05', 'anjali.mehta@mail.com', '4321098765'),
('Ravi', 'Nair', '1994-09-12', 'ravi.nair@mail.com', '3210987654'),
('Sneha', 'Kulkarni', '2001-04-18', 'sneha.kulkarni@mail.com', '2109876543'),
('Karan', 'Gupta', '1993-12-30', 'karan.gupta@mail.com', '1098765432'),
('Pooja', 'Joshi', '1998-07-25', 'pooja.joshi@mail.com', '0987654321');
GO

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics 101', 4, 201),
('Physics 101', 3, 202),
('Chemistry 101', 4, 203),
('Biology 101', 3, 204),
('Computer Science 101', 5, 205),
('English Literature', 3, 206),
('History 101', 3, 207),
('Economics 101', 4, 208),
('Advanced Programming', 5, 209),
('Database Systems', 4, 210);
GO

INSERT INTO Teachers (first_name, last_name, email) VALUES
('Sarah', 'J', 'sarah.johnson@mail.com'),
('Matthew', 'Lee', 'matthew.lee@mail.com'),
('Anna', 'Kim', 'anna.kim@mail.com'),
('Peter', 'Clark', 'peter.clark@mail.com'),
('Linda', 'Evans', 'linda.evans@mail.com'),
('William', 'Scott', 'william.scott@mail.com'),
('Grace', 'Harris', 'grace.harris@mail.com'),
('Thomas', 'Moore', 'thomas.moore@mail.com'),
('Nancy', 'Allen', 'nancy.allen@mail.com'),
('Daniel', 'B', 'daniel.brown@mail.com');
GO

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 101, '2025-01-10'),
(2, 102, '2025-01-15'),
(3, 103, '2025-02-05'),
(4, 104, '2025-02-20'),
(5, 105, '2025-03-10'),
(6, 106, '2025-03-15'),
(7, 107, '2025-04-01'),
(8, 108, '2025-04-05'),
(9, 109, '2025-04-20'),
(10, 110, '2025-05-01');
GO

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 500.00, '2025-01-11'),
(2, 450.00, '2025-01-16'),
(3, 600.00, '2025-02-06'),
(4, 700.00, '2025-02-21'),
(5, 550.00, '2025-03-11'),
(6, 400.00, '2025-03-16'),
(7, 350.00, '2025-04-02'),
(8, 480.00, '2025-04-06'),
(9, 520.00, '2025-04-21'),
(10, 600.00, '2025-05-02');
GO
 SELECT * FROM Students;
 SELECT * FROM Courses;
 SELECT * FROM Teachers;
 SELECT * FROM Enrollments;
 SELECT * FROM Payments;

 --TASK 2
   
--1. Write an SQL query to insert a new student into the "Students" table with the following details: a. First Name: John b. Last Name: Doe c. Date of Birth: 1995-08-15 d. Email: john.doe@example.com e. Phone Number: 1234567890 
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');


--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date. 
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 101, GETDATE());


--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address. 
UPDATE Teachers
SET email = 'updatedemail@mail.com'
WHERE teacher_id = 5;


--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course. 

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 101;

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables. 
UPDATE Courses
SET teacher_id = 5
WHERE course_id = 101;

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity. 
DELETE FROM Enrollments
WHERE student_id = 3;

DELETE FROM Payments
WHERE student_id = 3;

DELETE FROM Students
WHERE student_id = 3;


--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount. 
UPDATE Payments
SET amount = 1500.00
WHERE payment_id =410;


--TASK 3

--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID. 
SELECT S.first_name, S.last_name, SUM(P.amount) AS TotalPayments
FROM Students AS S
JOIN Payments AS P ON S.student_id = P.student_id
WHERE S.student_id = 2  
GROUP BY S.first_name, S.last_name;

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table. 
SELECT C.course_name, COUNT(E.student_id) AS StudentCount
FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id = E.course_id
GROUP BY C.course_name;


--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments. 
SELECT S.first_name, S.last_name
FROM Students AS S
LEFT JOIN Enrollments AS E ON S.student_id = E.student_id
WHERE E.enrollment_id IS NULL;

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables. 
SELECT S.first_name, S.last_name, C.course_name
FROM Students AS S
JOIN Enrollments AS E ON S.student_id = E.student_id
JOIN Courses AS C ON E.course_id = C.course_id
ORDER BY S.first_name, S.last_name;

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table. 

SELECT T.first_name, T.last_name, C.course_name
FROM Teachers AS T
LEFT JOIN Courses AS C ON T.teacher_id = C.teacher_id;


--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables. 

SELECT S.first_name, S.last_name, E.enrollment_date
FROM Students AS S
JOIN Enrollments AS E ON S.student_id = E.student_id
JOIN Courses AS C ON E.course_id = C.course_id
WHERE C.course_id = 110;  


--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records. 

SELECT S.first_name, S.last_name
FROM Students AS S
LEFT JOIN Payments AS P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records. 

SELECT C.course_name
FROM Courses AS C
LEFT JOIN Enrollments AS E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records. 

SELECT S.first_name, S.last_name, COUNT(E.course_id) AS CourseCount
FROM Students AS S
JOIN Enrollments AS E ON S.student_id = E.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(E.course_id) > 1;

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments. 
SELECT T.first_name, T.last_name
FROM Teachers AS T
LEFT JOIN Courses AS C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL;

--Task 4

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this. 
SELECT AVG(1.0*StudentCount) AS AvgEnrollment
FROM (
    SELECT COUNT(E.student_id) AS StudentCount
    FROM Courses AS C
    LEFT JOIN Enrollments AS E ON C.course_id = E.course_id
    GROUP BY C.course_id
) AS CourseEnrollment;


--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount. 

SELECT S.first_name, S.last_name, P.amount
FROM Students AS S
JOIN Payments AS P ON S.student_id = P.student_id
WHERE P.amount = (SELECT MAX(amount) FROM Payments);

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count. 

Select top 1 with ties Courses.course_name,(Select (count(Enrollments.course_id)) 
											from Enrollments
											where Enrollments.course_id = Courses.course_id
											group by Enrollments.course_id) as MaxEnroll
from Courses
order by MaxEnroll desc

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses. 
SELECT T.first_name, T.last_name, 
       (SELECT SUM(P.amount)
        FROM Payments AS P
        JOIN Enrollments AS E ON P.student_id = E.student_id
        JOIN Courses AS C ON E.course_id = C.course_id
        WHERE C.teacher_id = T.teacher_id) AS TotalPayments
FROM Teachers AS T;


--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses. 
SELECT S.first_name, S.last_name
FROM Students AS S
WHERE (SELECT COUNT(course_id) FROM Enrollments WHERE student_id = S.student_id) = 
      (SELECT COUNT(course_id) FROM Courses);

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments. 

SELECT first_name, last_name
FROM Teachers
WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id
    FROM Courses
);

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth. 
SELECT AVG(DATEDIFF(year, date_of_birth, GETDATE())) AS AverageAge
FROM Students;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records. 
SELECT course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM Enrollments
);

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments. 
SELECT S.first_name, S.last_name, C.course_name, 
       (SELECT SUM(P.amount) 
        FROM Payments AS P
        WHERE P.student_id = S.student_id) AS TotalPayment
FROM Students AS S
JOIN Enrollments AS E ON S.student_id = E.student_id
JOIN Courses AS C ON E.course_id = C.course_id;

--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one. 
SELECT S.first_name, S.last_name, COUNT(P.payment_id) AS PaymentCount
FROM Students AS S
JOIN Payments AS P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(P.payment_id) > 1;

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student. 
Select Students.first_name, Students.last_name, (Select sum(amount) from Payments where student_id = Students.student_id) as TotalPay
from Students
group by Students.first_name, Students.last_name, Students.student_id

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments. 
Select Courses.course_name, (Select count(student_id) from Enrollments
							where course_id = Courses.course_id) as CountOfStudents
from Courses
group by Courses.course_name, Courses.course_id

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average. 
SELECT S.first_name, S.last_name, AVG(P.amount) AS AvgPayment
FROM Students AS S
JOIN Payments AS P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;
