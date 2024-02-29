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
