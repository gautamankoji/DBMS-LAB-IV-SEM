# Exercise – 2

## Queries

Queries (along with sub Queries) using ANY, ALL, IN, EXISTS, NOTEXISTS, UNION, INTERSET, Constraints. Example:- Select the roll number and name of the student who secured fourth rank in the class.

### Table Creation and Sample Data Insertion

```sql
-- Creating a table to store student information
CREATE TABLE students (
    roll_number INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

-- Inserting sample values into the students table
INSERT INTO students (roll_number, name, marks) VALUES
(1, 'Gautam Ankoji', 100),
(2, 'Abdul Irfan', 92),
(3, 'Nikhil Rathor', 78),
(4, 'Mohammed Afnaan', 88),
(5, 'Rohit Kumar', 95);
```

### Task: Find the Student with Fourth Rank

```sql
SELECT roll_number, name
FROM (
    SELECT roll_number, name, marks,
           DENSE_RANK() OVER (ORDER BY marks DESC) AS student_rank
    FROM students
) AS ranked_students
WHERE student_rank = 4;
```

### Exercise 2: Additional Queries

For further practice, various SQL queries utilizing different constructs such as `ANY`, `ALL`, `IN`, `EXISTS`, `NOT EXISTS`, `UNION`, `INTERSECT`, and constraints can be devised. Here's an example:

**Query**: Select the roll number and name of the student who secured fourth rank in the class using `EXISTS`:

```sql
SELECT roll_number, name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT marks, DENSE_RANK() OVER (ORDER BY marks DESC) AS student_rank
        FROM students
    ) AS ranked_students
    WHERE s.marks = ranked_students.marks
    AND student_rank = 4
);
```
