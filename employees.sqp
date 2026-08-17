CREATE TABLE Department (
    dept_id     INT PRIMARY KEY,
    dept_name   VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Employee (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50) NOT NULL,
    dept_id     INT NOT NULL,
    salary      DECIMAL(10,2) NOT NULL,
    hire_date   DATE NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO Employee (emp_id, emp_name, dept_id, salary, hire_date) VALUES
(101, 'Arjun',       1, 65000.00, '2021-03-15'),
(102, 'Sneha',  2, 42000.00, '2020-07-01'),
(103, 'Rahul ',    1, 58000.00, '2019-11-20'),
(104, 'Divya ',       3, 75000.00, '2022-01-10'),
(105, 'Kiran ',      4, 39000.00, '2021-06-05'),
(106, 'Meera ',      3, 52000.00, '2020-09-30'),
(107, 'Suresh ',   2, 48000.00, '2018-04-12'),
(108, 'Anjali ',   4, 61000.00, '2023-02-18'),
(109, 'Vikram ',  1, 90000.00, '2017-08-25'),
(110, 'Pooja ',     3, 55000.00, '2022-10-01');

SELECT * FROM Employee;

SELECT DISTINCT dept_name FROM Department;

SELECT * FROM Employee
WHERE salary > 50000;

SELECT * FROM Employee
WHERE dept_id = 1;

SELECT * FROM Employee
WHERE salary BETWEEN 45000 AND 70000;

SELECT * FROM Employee
WHERE dept_id IN (1, 3);

SELECT * FROM Employee
ORDER BY salary DESC;

SELECT * FROM Employee
WHERE dept_id = 1 AND salary > 60000;

SELECT * FROM Employee
WHERE dept_id = 2 OR dept_id = 4;

SELECT * FROM Employee
WHERE NOT dept_id = 3;
