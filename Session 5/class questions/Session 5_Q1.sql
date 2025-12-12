-- Create Department table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

--Insert values into Department
INSERT INTO Department (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

--Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

--Insert values into Employees
INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);

--Query to get Department Name, Employee count, Average Salary, and Salary Category
SELECT 
    d.DeptName,
    COUNT(e.EmpID) AS NumEmployees,
    ROUND(AVG(e.Salary), 2) AS AvgSalary,
    CASE 
        WHEN COUNT(e.EmpID) = 0 THEN 'No Employees'
        WHEN AVG(e.Salary) >= 60000 THEN 'High Avg'
        WHEN AVG(e.Salary) BETWEEN 50000 AND 59999 THEN 'Medium Avg'
        ELSE 'Low Avg'
    END AS SalaryCategory
FROM 
    Department d
LEFT JOIN 
    Employees e ON d.DeptID = e.DeptID
GROUP BY 
    d.DeptName
ORDER BY
    d.DeptName;