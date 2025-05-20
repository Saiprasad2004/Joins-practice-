-- 1. Create 'employees' table
CREATE TABLE IF NOT EXISTS employees (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(20)
);

-- 2. Create 'salaries' table
CREATE TABLE IF NOT EXISTS salaries (
    emp_id INT PRIMARY KEY,
    salary INT
);

-- 3. Insert minimal sample data into 'employees'
INSERT INTO employees (emp_id, emp_name, department) VALUES
    (101, 'David',   'HR'),
    (102, 'Emma',    'IT'),
    (103, 'Frank',   'Finance');

-- 4. Insert minimal sample data into 'salaries'
INSERT INTO salaries (emp_id, salary) VALUES
    (101, 55000),
    (102, 60000),
    (104, 52000);

-- 5. INNER JOIN: combine only matching rows (employees.emp_id = salaries.emp_id)
SELECT
    e.emp_id     AS employee_id,
    e.emp_name   AS employee_name,
    e.department AS dept_name,
    s.salary     AS emp_salary
FROM
    employees e
    INNER JOIN salaries s ON e.emp_id = s.emp_id;
-- Expected output: (101, 'David', 'HR', 55000), (102, 'Emma', 'IT', 60000)

-- 6. LEFT JOIN: All rows from 'employees', and matching from 'salaries'
SELECT
    e.emp_id     AS employee_id,
    e.emp_name   AS employee_name,
    e.department AS dept_name,
    s.salary     AS emp_salary
FROM
    employees e
    LEFT JOIN salaries s ON e.emp_id = s.emp_id;
-- Expected output: (101, 'David', 'HR', 55000), (102, 'Emma', 'IT', 60000), (103, 'Frank', 'Finance', NULL)

-- 7. RIGHT JOIN: All rows from 'salaries', and matching from 'employees'
SELECT
    e.emp_id     AS employee_id,
    e.emp_name   AS employee_name,
    e.department AS dept_name,
    s.salary     AS emp_salary
FROM
    employees e
    RIGHT JOIN salaries s ON e.emp_id = s.emp_id;

-- 8. FULL OUTER JOIN simulation using UNION
SELECT
    e.emp_id     AS employee_id,
    e.emp_name   AS employee_name,
    e.department AS dept_name,
    s.salary     AS emp_salary
FROM
    employees e
    LEFT JOIN salaries s ON e.emp_id = s.emp_id

UNION

SELECT
    e.emp_id     AS employee_id,
    e.emp_name   AS employee_name,
    e.department AS dept_name,
    s.salary     AS emp_salary
FROM
    employees e
    RIGHT JOIN salaries s ON e.emp_id = s.emp_id;
