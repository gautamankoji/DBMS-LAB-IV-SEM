# Exercise – 8

## Program development using WHILE LOOPS, numeric FOR LOOPS, nested loops using ERROR Handling, BUILT –IN Exceptions, USE defined Exceptions, RAISE- APPLICATION ERROR

```sql
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
```

Explanation:

- **Numeric FOR Loop:** It iterates from 1 to 5 and prints each iteration.
- **WHILE Loop:** It simulates a withdrawal from an account until the balance reaches 0.
- **Nested Loops with Error Handling:** It contains nested FOR loops. If the product of `i` and `j` is 9, it raises a user-defined exception `insufficient_funds`. Error handling is done inside the nested loop, and when the exception is caught, it exits the inner loop.
- **Error Handling:** Built-in exceptions like `ZERO_DIVIDE` are handled. If any other error occurs, it prints the error message and reraises the exception.
- **User-defined Exception:** `insufficient_funds` is a user-defined exception raised when there's not enough balance to complete a transaction.
- **RAISE_APPLICATION_ERROR:** In this example, `RAISE_APPLICATION_ERROR` is not explicitly used, but it's a common approach to raise custom application errors with specific error codes and messages.
