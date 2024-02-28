# Exercise – 3

## Queries

Queries using Aggregate functions (COUNT, SUM, AVG, MAX and MIN), GROUP BY, HAVING and Creation and dropping of Views.

Certainly! Below are SQL queries demonstrating the use of aggregate functions (`COUNT`, `SUM`, `AVG`, `MAX`, and `MIN`), along with `GROUP BY`, `HAVING`, and the creation and dropping of views:

### Queries using Aggregate Functions, GROUP BY, and HAVING

1. **Count of Students per Marks Range**:

```sql
SELECT 
    CASE 
        WHEN marks BETWEEN 90 AND 100 THEN '90-100'
        WHEN marks BETWEEN 80 AND 89 THEN '80-89'
        WHEN marks BETWEEN 70 AND 79 THEN '70-79'
        ELSE 'Below 70'
    END AS marks_range,
    COUNT(*) AS student_count
FROM students
GROUP BY marks_range
ORDER BY marks_range;
```

2. **Average Marks of Students per Name**:

```sql
SELECT name, AVG(marks) AS average_marks
FROM students
GROUP BY name;
```

3. **Find Students with Maximum and Minimum Marks**:

```sql
SELECT 
    MAX(marks) AS max_marks,
    MIN(marks) AS min_marks
FROM students;
```

4. **Filter Students by Average Marks Using HAVING**:

```sql
SELECT name, AVG(marks) AS average_marks
FROM students
GROUP BY name
HAVING AVG(marks) >= 80;
```

### Creation and Dropping of Views

1. **Creating a View for Students with Top Marks**:

```sql
CREATE VIEW top_students AS
SELECT *
FROM students
WHERE marks >= 90;
```

2. **Dropping the View**:

```sql
DROP VIEW IF EXISTS top_students;
```
