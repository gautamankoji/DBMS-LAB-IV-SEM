-- Creating a package specification
CREATE OR REPLACE PACKAGE employee_package AS
    -- Public procedures and functions
    PROCEDURE get_employee_details(p_emp_id IN NUMBER);
END employee_package;
/

-- Creating a package body
CREATE OR REPLACE PACKAGE BODY employee_package AS
    -- Private cursor declaration
    CURSOR employee_cursor IS
        SELECT emp_id, emp_name, emp_salary
        FROM employee
        WHERE emp_id = get_employee_details.emp_id;
    
    -- Private variables
    v_emp_id employee.emp_id%TYPE;
    v_emp_name employee.emp_name%TYPE;
    v_emp_salary employee.emp_salary%TYPE;
    
    -- Public procedure implementation
    PROCEDURE get_employee_details(p_emp_id IN NUMBER) IS
    BEGIN
        -- Opening the cursor and fetching employee details
        OPEN employee_cursor;
        FETCH employee_cursor INTO v_emp_id, v_emp_name, v_emp_salary;
        
        -- Displaying employee details
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp_id);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name);
        DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_emp_salary);
        
        -- Closing the cursor
        CLOSE employee_cursor;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee with ID ' || p_emp_id || ' not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
    END get_employee_details;
END employee_package;
/

-- Calling the stored package procedure
BEGIN
    employee_package.get_employee_details(1); -- Calling the procedure with employee ID 1
END;
/
