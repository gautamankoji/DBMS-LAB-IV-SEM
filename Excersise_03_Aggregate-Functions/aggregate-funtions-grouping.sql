-- Queries using Aggregate Functions, GROUP BY, and HAVING:
-- Count of Students per Marks Range:
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

-- Average Marks of Students per Name:
SELECT name, AVG(marks) AS average_marks
FROM students
GROUP BY name;

-- Find Students with Maximum and Minimum Marks:
SELECT 
    MAX(marks) AS max_marks,
    MIN(marks) AS min_marks
FROM students;

-- Filter Students by Average Marks Using HAVING:
SELECT name, AVG(marks) AS average_marks
FROM students
GROUP BY name
HAVING AVG(marks) >= 80;


-- Creation and Dropping of Views:
-- Creating a View for Students with Top Marks:
CREATE VIEW top_students AS
SELECT *
FROM students
WHERE marks >= 90;

-- Dropping the View:
DROP VIEW IF EXISTS top_students;
