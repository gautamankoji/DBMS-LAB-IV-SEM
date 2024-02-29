DECLARE
    -- User-defined exception
    insufficient_funds EXCEPTION;
    
    -- Variables
    v_balance NUMBER := 1000;
    v_amount_to_withdraw NUMBER := 1500;
BEGIN
    -- Numeric FOR loop
    DBMS_OUTPUT.PUT_LINE('Numeric FOR Loop:');
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration ' || i);
    END LOOP;
    
    -- WHILE loop
    DBMS_OUTPUT.PUT_LINE('WHILE Loop:');
    WHILE v_balance > 0 LOOP
        DBMS_OUTPUT.PUT_LINE('Current Balance: ' || v_balance);
        v_balance := v_balance - 200; -- Simulating a withdrawal
    END LOOP;
    
    -- Nested loops with error handling
    DBMS_OUTPUT.PUT_LINE('Nested Loops with Error Handling:');
    FOR i IN 1..3 LOOP
        FOR j IN 1..3 LOOP
            BEGIN
                IF i * j = 9 THEN
                    RAISE insufficient_funds;
                ELSE
                    DBMS_OUTPUT.PUT_LINE('i=' || i || ', j=' || j);
                END IF;
            EXCEPTION
                WHEN insufficient_funds THEN
                    DBMS_OUTPUT.PUT_LINE('Insufficient funds! Exiting nested loop.');
                    EXIT; -- Exit the inner loop
            END;
        END LOOP;
    END LOOP;
    
EXCEPTION
    -- Built-in exception handling
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero occurred.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        RAISE; -- Reraise the exception
END;
/
