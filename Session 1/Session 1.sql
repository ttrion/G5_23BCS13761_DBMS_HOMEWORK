--G2_23BCS13761_Tanay Manish Nesari_session1--

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name TEXT NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(10,2)
);

INSERT INTO departments (department_name) VALUES
('Engineering'),
('HR'),
('Finance');

INSERT INTO employees (first_name, last_name, department_id, salary) VALUES
('Alice', 'Kim', 1, 90000),
('Bob', 'Singh', 1, 95000),
('Clara', 'Roy', 2, 60000),
('David', 'Fernandes', 3, 75000);

CREATE OR REPLACE VIEW Employee_View AS
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

--G2_23BCS13761_Tanay Manish Nesari_session1--

CREATE ROLE Analyst;

GRANT SELECT ON Employee_View TO Analyst;