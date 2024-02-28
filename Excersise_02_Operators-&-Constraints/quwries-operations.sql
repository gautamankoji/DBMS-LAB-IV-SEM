-- Creating strucent table with roll_number, name, marks 
CREATE TABLE students (
    roll_number INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);


-- Inserting sample values to the students table
INSERT INTO students (roll_number, name, marks) VALUES
(1, 'Gautam Ankoji', 100),
(2, 'Abdul Irfan', 92),
(3, 'Nikhil Rathor', 78),
(4, 'Mohammed Afnaan', 88),
(5, 'Rohit Kumar', 95);


-- Select the roll number and name of the student who secured fourth rank in the class.
SELECT roll_number, name
FROM (
    SELECT roll_number, name, marks,
           DENSE_RANK() OVER (ORDER BY marks DESC) AS student_rank
    FROM students
) AS ranked_students
WHERE student_rank = 4;


-- Select the roll number and name of the student who secured fourth rank in the class using EXISTS:
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
