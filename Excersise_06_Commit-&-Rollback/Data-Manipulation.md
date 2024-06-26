# Exercise – 6

## Insert data into student table and use COMMIT, ROLLBACK and SAVEPOINT in PL/SQL block.

```sql
-- Creating a hypothetical student table
CREATE TABLE student (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100),
    marks NUMBER
);

-- PL/SQL Block to insert data and demonstrate COMMIT, ROLLBACK, and SAVEPOINT
DECLARE
    v_student_id NUMBER;
    v_student_name VARCHAR2(100);
    v_marks NUMBER;
    savepoint_before_insert SAVEPOINT;
BEGIN
    -- Inserting data into student table
    SAVEPOINT savepoint_before_insert; -- Creating a savepoint before insertion
    
    INSERT INTO student (student_id, student_name, marks) VALUES (1, 'John', 85);
    INSERT INTO student (student_id, student_name, marks) VALUES (2, 'Alice', 75);
    INSERT INTO student (student_id, student_name, marks) VALUES (3, 'Bob', 90);
    
    -- Displaying inserted data
    DBMS_OUTPUT.PUT_LINE('Data inserted successfully.');
    
    -- Committing the transaction
    COMMIT;
    
    -- Updating one of the records (assuming a mistake)
    UPDATE student SET marks = 95 WHERE student_id = 2;
    
    -- Displaying updated data
    DBMS_OUTPUT.PUT_LINE('Data updated successfully.');
    
    -- Rolling back to the savepoint to undo the update
    ROLLBACK TO SAVEPOINT savepoint_before_insert;
    
    -- Displaying data after rollback
    DBMS_OUTPUT.PUT_LINE('Data after rollback:');
    FOR rec IN (SELECT * FROM student) LOOP
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || rec.student_id || ', Name: ' || rec.student_name || ', Marks: ' || rec.marks);
    END LOOP;
    
    -- Committing the final changes
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Final changes committed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
```

In this PL/SQL block:

- We create a hypothetical `student` table with columns `student_id`, `student_name`, and `marks`.
- Inside the PL/SQL block:
  - We use a savepoint (`savepoint_before_insert`) before inserting data.
  - We insert data into the `student` table.
  - We display a message confirming successful insertion.
  - We commit the transaction to make the changes permanent.
  - We then mistakenly update one of the records.
  - We rollback to the savepoint to undo the update.
  - We display the data after rollback.
  - Finally, we commit the final changes.
