# Exercise 1:

Creation, altering and dropping of tables and inserting rows into a table (use constraints while creating tables) examples using SELECT command.

Create a table named `employees` with the following columns:

1. `employee_id` (Primary Key)
2. `name`
3. `age`
4. `department`

Here's how you can achieve this in SQL:

```sql
-- Create the employees table with constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 24),
    department VARCHAR(50) CHECK (department IN ('IT', 'HR', 'Finance', 'Marketing')),
    UNIQUE (employee_id)
);
```

<details>
<summary> <code>SQL> DESC employees;</code></summary>
</br>

```sql
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| employee_id | int           | NO   | PRI | NULL    |       |
| name        | varchar(50)   | NO   |     | NULL    |       |
| age         | int           | YES  |     | NULL    |       |
| department  | varchar(50)   | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
```

</details>

Now, let's alter the table to add a new column for `salary`:

```sql
-- Alter table to add a new column for salary
ALTER TABLE employees
ADD salary DECIMAL(10, 2) NOT NULL;
```

<details>
<summary> <code>SQL> DESC employees; </code></summary>
</br>

```sql
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| employee_id | int           | NO   | PRI | NULL    |       |
| name        | varchar(50)   | NO   |     | NULL    |       |
| age         | int           | YES  |     | NULL    |       |
| department  | varchar(50)   | YES  |     | NULL    |       |
| salary      | decimal(10,2) | NO   |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
```

</details>

After creating and altering the table, let's insert some rows into it with constraints:

```sql
-- Inserting rows into the employees table
INSERT INTO employees (employee_id, name, age, department, salary) VALUES
(1, 'Sujata Sain', 30, 'IT', 50000.00),
(2, 'Raghuvaran Rao', 35, 'HR', 55000.00),
(3, 'Preeti Singh', 40, 'Finance', 60000.00);

-- Inserting a row with constraint violations & duplicate employee_id (age < 24, department not in specified list)
INSERT INTO employees (employee_id, name, age, department, salary) VALUES
(1, 'Rohit Sinha', 20, 'Marketing', 45000.00),
(4, 'Rohit Sharma', 20, 'Marketing', 45000.00),
(5, 'Rakesh Kumar', 22, 'Marketing', 48000.00);
```

<details open>
<summary> <code>SQL> SELECT * FROM employees; </code></summary>
</br>

```sql
+-------------+----------------+------+------------+----------+
| employee_id | name           | age  | department | salary   |
+-------------+----------------+------+------------+----------+
|           1 | Sujata Sain    |   30 | IT         | 50000.00 |
|           2 | Raghuvaran Rao |   35 | HR         | 55000.00 |
|           3 | Preeti Singh   |   40 | Finance    | 60000.00 |
+-------------+----------------+------+------------+----------+
```

</details>

In the above example, we've inserted rows into the `employees` table. However, the last insert operation violates a constraint where the age of the employee is less than 18. This will result in an error.

Now, let's drop the `employees` table:

```sql
-- Drop the employees table
DROP TABLE employees;
```
