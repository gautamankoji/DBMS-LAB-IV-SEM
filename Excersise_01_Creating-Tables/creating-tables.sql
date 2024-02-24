-- DROP TABLE employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 24),
    department VARCHAR(50) CHECK (department IN ('IT', 'HR', 'Finance', 'Marketing')),
    UNIQUE (employee_id)
);

ALTER TABLE employees
ADD salary DECIMAL(10, 2) NOT NULL;

INSERT INTO employees (employee_id, name, age, department, salary) VALUES
(1, 'Sujata Sain', 30, 'IT', 50000.00),
(2, 'Raghuvaran Rao', 35, 'HR', 55000.00),
(3, 'Preeti Singh', 40, 'Finance', 60000.00);

-- -- Error: constraint violations & duplicate employee_id
-- INSERT INTO employees (employee_id, name, age, department, salary) VALUES
-- (1, 'Rohit Sinha', 20, 'Marketing', 45000.00),
-- (4, 'Rohit Sharma', 20, 'Marketing', 45000.00),
-- (5, 'Rakesh Kumar', 22, 'Marketing', 48000.00);

-- SELECT * FROM employees;

-- DROP TABLE employees;