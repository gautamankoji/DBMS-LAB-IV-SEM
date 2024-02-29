-- Creating a hypothetical employee table
CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    emp_salary NUMBER
);

-- Inserting some sample data into the employee table
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES (1, 'John', 50000);
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES (2, 'Alice', 60000);
INSERT INTO employee (emp_id, emp_name, emp_salary) VALUES (3, 'Bob', 55000);

-- Creating a procedure to update employee salary based on employee ID
CREATE OR REPLACE PROCEDURE update_salary(
    p_emp_id IN employee.emp_id%TYPE,
    p_new_salary IN NUMBER,
    p_old_salary OUT NUMBER
)
IS
BEGIN
    -- Retrieving the current salary of the employee
    SELECT emp_salary INTO p_old_salary FROM employee WHERE emp_id = p_emp_id;
    
    -- Updating the salary of the employee
    UPDATE employee SET emp_salary = p_new_salary WHERE emp_id = p_emp_id;
    
    -- Committing the transaction
    COMMIT;
END;
/

-- Executing the procedure
DECLARE
    v_emp_id employee.emp_id%TYPE := 1;
    v_new_salary NUMBER := 55000;
    v_old_salary NUMBER;
BEGIN
    -- Calling the procedure
    update_salary(v_emp_id, v_new_salary, v_old_salary);
    
    -- Displaying the old and new salaries
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp_id);
    DBMS_OUTPUT.PUT_LINE('Old Salary: ' || v_old_salary);
    DBMS_OUTPUT.PUT_LINE('New Salary: ' || v_new_salary);
END;
/
