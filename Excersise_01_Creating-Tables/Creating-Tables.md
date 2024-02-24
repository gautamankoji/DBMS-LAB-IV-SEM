To illustrate the creation, alteration, and dropping of tables, as well as inserting rows into a table with constraints, this SQL script demonstrates creating, altering, and dropping tables, as well as inserting rows into a table with constraints using the SELECT command.

Let's assume we want to create a table named `employees` with the following columns:

1. `employee_id` (Primary Key)
2. `name`
3. `age`
4. `department`

Here's how you can achieve this in SQL:

```sql
-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);
```

Now, let's alter the table to add a new column for `salary`:

```sql
-- Alter table to add a new column for salary
ALTER TABLE employees
ADD salary DECIMAL(10, 2);
```

After creating and altering the table, let's insert some rows into it with constraints:

```sql
-- Inserting rows into the employees table
INSERT INTO employees (employee_id, name, age, department, salary) VALUES
(1, 'John Doe', 30, 'IT', 50000.00),
(2, 'Jane Smith', 35, 'HR', 55000.00),
(3, 'Michael Johnson', 40, 'Finance', 60000.00);

-- Inserting a row with constraint violation (age < 18)
INSERT INTO employees (employee_id, name, age, department, salary) VALUES
(4, 'Emma Watson', 16, 'Marketing', 45000.00);
```

In the above example, we've inserted rows into the `employees` table. However, the last insert operation violates a constraint where the age of the employee is less than 18. This will result in an error.

Now, let's drop the `employees` table:

```sql
-- Drop the employees table
DROP TABLE employees;
```
