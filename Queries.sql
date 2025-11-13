-- database_queries.sql
-- Author: Divya Bhargavi
-- Description: SQL queries demonstrating data filtering, table creation, and schema modification.

-- View available tables
SHOW TABLES;

-- Fetch first 5 rows from sales
SELECT SaleDate, Amount, Customers FROM sales LIMIT 5;

-- Get sales amount greater than 10000
SELECT * FROM sales WHERE Amount > 10000;

-- Order results by amount (descending)
SELECT * FROM sales WHERE Amount > 10000 ORDER BY Amount DESC;

-- Filter by GeoID
SELECT * FROM sales WHERE GeoID = 'G1' ORDER BY PID;

-- Sales from 2022
SELECT * FROM sales WHERE Amount > 10000 AND SaleDate LIKE '2022%';
-- OR
-- SELECT * FROM sales WHERE YEAR(SaleDate) = 2022;

-- Range-based condition
SELECT * FROM sales WHERE Boxes BETWEEN 0 AND 50;

-- Sales on Friday
SELECT SaleDate, Amount, Boxes, WEEKDAY(SaleDate) AS Day_of_Week 
FROM sales WHERE WEEKDAY(SaleDate) = 4;

-- View people table
SELECT * FROM people;

-- Filter specific teams
SELECT * FROM people WHERE Team IN ('Delish', 'Jucies');
-- OR
SELECT * FROM people WHERE Team = 'Delish' OR Team = 'Jucies';

-- Pattern matching
SELECT * FROM people WHERE Salesperson LIKE 'B%';

-- Categorize sales by amount
SELECT SaleDate, Amount, 
    CASE  
        WHEN Amount < 1000 THEN 'Under 1k'
        WHEN Amount < 5000 THEN 'Under 5k'
        ELSE '5k or more'
    END AS Amount_Category 
FROM sales;

-- Table creation examples
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Altering table structure
ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);
DESC Employees;

-- Modify column precision
ALTER TABLE Employees MODIFY Salary DECIMAL(12, 2);

-- Rename a column
ALTER TABLE Employees CHANGE COLUMN Email WorkMail VARCHAR(100);

-- Add a unique constraint
ALTER TABLE Employees ADD CONSTRAINT unique_workmail UNIQUE (WorkMail);

-- Remove a column
ALTER TABLE Employees DROP COLUMN HireDate;

DESC Employees;
