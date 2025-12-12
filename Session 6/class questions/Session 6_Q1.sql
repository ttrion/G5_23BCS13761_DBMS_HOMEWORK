--Create Tables
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

--Insert Data
INSERT INTO Employees (emp_id, name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

--SQL Query to Find Closest Employee using Subqueries
SELECT
    D.dept_name,
    E.name AS emp_name,
    E.salary,
    DA.dept_avg_salary
FROM
    Employees E
JOIN
    Departments D ON E.dept_id = D.dept_id
JOIN
    (
        SELECT
            dept_id,
            AVG(salary) AS dept_avg_salary
        FROM
            Employees
        GROUP BY
            dept_id
    ) AS DA ON E.dept_id = DA.dept_id
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Employees E2
        WHERE
            E2.dept_id = E.dept_id 
            AND (
                ABS(E2.salary - DA.dept_avg_salary) < ABS(E.salary - DA.dept_avg_salary)
                OR
                (
                    ABS(E2.salary - DA.dept_avg_salary) = ABS(E.salary - DA.dept_avg_salary)
                    AND E2.salary > E.salary
                )
            )
    )
ORDER BY
    D.dept_name;