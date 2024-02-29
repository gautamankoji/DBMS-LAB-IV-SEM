# Exercise – 5

## PL/SQL Program: Student Marks Retrieval with Exception Handling:

Creation of a simple PL/SQL program which includes declaration section, executable section and exception –Handling section (Ex. Student marks can be selected from the table and printed for those who secured first class and an exception can be raised if no records were found).

```sql
-- PL/SQL Program to select and print marks of students who secured first class

DECLARE
    -- Declaration Section
    v_student_name VARCHAR2(100);
    v_student_marks NUMBER;
    v_first_class_threshold NUMBER := 60; -- Assuming first class threshold as 60
    
    -- Exception Handling Section
    no_records_found EXCEPTION;
BEGIN
    -- Executable Section
    -- Selecting student marks who secured first class
    FOR student_rec IN (SELECT student_name, marks FROM student_marks WHERE marks >= v_first_class_threshold) LOOP
        v_student_name := student_rec.student_name;
        v_student_marks := student_rec.marks;
        
        -- Printing student details who secured first class
        DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student_name || ', Marks: ' || v_student_marks);
    END LOOP;
    
    -- Raise exception if no records found
    IF SQL%NOTFOUND THEN
        RAISE no_records_found;
    END IF;
    
EXCEPTION
    -- Exception Handling Section
    WHEN no_records_found THEN
        DBMS_OUTPUT.PUT_LINE('No records found for students who secured first class.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
```

In this program:

- **Declaration Section:** We declare variables to store student name, marks, and the threshold for first class. We also declare a custom exception `no_records_found`.
  
- **Executable Section:** We use a cursor to iterate through the records of students who secured first class (marks >= 60) and print their details.
  
- **Exception Handling Section:** If no records are found, it raises a custom exception `no_records_found`. It also handles any other exceptions that might occur during execution.
