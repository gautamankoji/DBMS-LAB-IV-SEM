# Exercise – 11

## Program development using creation of package specification, package bodies, private objects, package variables and cursors and calling stored packages

```sql
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
```

Explanation:

- **Package Specification**: The package `employee_package` is created with a single public procedure `get_employee_details`.
- **Package Body**: The package body contains the implementation of the public procedure and private objects.
- **Private Cursor**: A private cursor `employee_cursor` is declared to fetch employee details.
- **Private Variables**: Private variables `v_emp_id`, `v_emp_name`, and `v_emp_salary` are declared to store employee details fetched by the cursor.
- **Public Procedure Implementation**: The `get_employee_details` procedure is implemented to fetch and display employee details.
- **Error Handling**: Error handling is implemented to catch exceptions like `NO_DATA_FOUND` and any other exceptions.
- **Calling the Stored Package Procedure**: The procedure `get_employee_details` is called with an employee ID to fetch and display details of a specific employee.
