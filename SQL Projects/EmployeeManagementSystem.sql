-- 1. Create Departments Table

CREATE DATABASE EmployeeManagementSystem;

USE  EmployeeManagementSystem;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);

-- 2. Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    HireDate DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 3. Create Salaries Table
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    BaseSalary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 4. Create Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    Date DATE,
    Status ENUM('Present', 'Absent', 'Leave'),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Sample Data Insertion

-- Insert Departments
INSERT INTO Departments (DepartmentName) VALUES
('Human Resources'),
('Finance'),
('IT'),
('Marketing');

-- Insert Employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, HireDate, Email, Phone) VALUES
('Amit', 'kumar', 1, '2023-04-01', 'amitkumar@gmail.com', '9876543210'),
('Karan', 'Chaudhary', 2, '2022-11-15', 'karanchaudhary@gmail.com', '9876543211'),
('Raj', 'Verma', 3, '2021-07-10', 'rajverma@gmail.com', '9876543212');

-- Insert Salaries
INSERT INTO Salaries (EmployeeID, BaseSalary, Bonus, EffectiveDate) VALUES
(1, 50000, 5000, '2024-01-01'),
(2, 60000, 4500, '2024-01-01'),
(3, 55000, 4000, '2024-01-01');

-- Insert Attendance
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES
(1, '2025-04-01', 'Present'),
(1, '2025-04-02', 'Absent'),
(2, '2025-04-01', 'Present'),
(3, '2025-04-01', 'Leave');

-- Useful Queries

-- 1. List employees with department names
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- 2. Department-wise employee count
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- 3. Salary report for latest effective date per employee
SELECT e.FirstName, e.LastName, s.BaseSalary, s.Bonus
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.EffectiveDate = (
    SELECT MAX(EffectiveDate)
    FROM Salaries s2
    WHERE s2.EmployeeID = s.EmployeeID
);

-- 4. Monthly attendance summary for an employee (example for EmployeeID = 1)
SELECT 
    MONTH(Date) AS Month,
    SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) AS PresentDays,
    SUM(CASE WHEN Status = 'Absent' THEN 1 ELSE 0 END) AS AbsentDays,
    SUM(CASE WHEN Status = 'Leave' THEN 1 ELSE 0 END) AS LeaveDays
FROM Attendance
WHERE EmployeeID = 1
GROUP BY MONTH(Date);


