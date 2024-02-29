-- Declaration Section
DECLARE
    -- Declare variables to store student details
    v_student_name VARCHAR2(50);
    v_student_marks NUMBER;
    
    -- Declare a cursor to fetch student marks
    CURSOR c_student_marks IS
        SELECT name, marks
        FROM student_table;
        
    -- Declare an exception for no records found
    NoRecordsFound EXCEPTION;
BEGIN
    -- Executable Section
    
    -- Open cursor
    OPEN c_student_marks;
    
    -- Fetch student marks
    LOOP
        FETCH c_student_marks INTO v_student_name, v_student_marks;
        EXIT WHEN c_student_marks%NOTFOUND;
        
        -- Check if student secured first class
        IF v_student_marks >= 60 THEN
            -- Print student details
            DBMS_OUTPUT.PUT_LINE('Name: ' || v_student_name || ', Marks: ' || v_student_marks);
        END IF;
    END LOOP;
    
    -- Close cursor
    CLOSE c_student_marks;
    
    -- Raise exception if no records found
    IF c_student_marks%NOTFOUND THEN
        RAISE NoRecordsFound;
    END IF;
    
EXCEPTION
    -- Exception Handling Section
    
    -- Handle no records found exception
    WHEN NoRecordsFound THEN
        DBMS_OUTPUT.PUT_LINE('No records found in the student table.');
    
    -- Handle other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
