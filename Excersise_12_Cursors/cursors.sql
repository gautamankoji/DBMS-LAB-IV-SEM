-- Creating a hypothetical employee table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    emp_salary NUMBER
);

-- Inserting some sample data into the employees table
INSERT INTO employees (emp_id, emp_name, emp_salary) VALUES (1, 'John', 50000);
INSERT INTO employees (emp_id, emp_name, emp_salary) VALUES (2, 'Alice', 60000);
INSERT INTO employees (emp_id, emp_name, emp_salary) VALUES (3, 'Bob', 55000);

-- Creating a procedure to update employee salary
CREATE OR REPLACE PROCEDURE update_employee_salary(
    p_emp_id IN employees.emp_id%TYPE,
    p_new_salary IN NUMBER
)
IS
    -- Cursor declaration with parameter
    CURSOR emp_cursor (emp_id_param NUMBER) IS
        SELECT emp_id, emp_name, emp_salary
        FROM employees
        WHERE emp_id = emp_id_param
        FOR UPDATE;
    
    -- Cursor variable
    emp_rec emp_cursor%ROWTYPE;
BEGIN
    -- Opening the cursor
    OPEN emp_cursor(p_emp_id);
    
    -- Fetching the record
    FETCH emp_cursor INTO emp_rec;
    
    -- Checking if record found
    IF emp_cursor%FOUND THEN
        -- Updating the salary
        UPDATE employees
        SET emp_salary = p_new_salary
        WHERE CURRENT OF emp_cursor;
        
        -- Committing the transaction
        COMMIT;
        
        DBMS_OUTPUT.PUT_LINE('Employee ' || emp_rec.emp_name || ' with ID ' || emp_rec.emp_id || ' salary updated to ' || p_new_salary);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee with ID ' || p_emp_id || ' not found.');
    END IF;
    
    -- Closing the cursor
    CLOSE emp_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

-- Calling the procedure to update employee salary
BEGIN
    update_employee_salary(1, 55000); -- Update salary of employee with ID 1
END;
/
