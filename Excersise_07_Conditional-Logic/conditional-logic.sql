DECLARE
    v_score NUMBER := 85;
    v_result VARCHAR2(100);
BEGIN
    -- Using nested IF
    IF v_score >= 90 THEN
        v_result := 'Excellent';
    ELSE
        IF v_score >= 80 THEN
            v_result := 'Good';
        ELSE
            IF v_score >= 70 THEN
                v_result := 'Average';
            ELSE
                v_result := 'Below Average';
            END IF;
        END IF;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Result using nested IF: ' || v_result);
    
    -- Using CASE
    v_result := CASE
                    WHEN v_score >= 90 THEN 'Excellent'
                    WHEN v_score >= 80 THEN 'Good'
                    WHEN v_score >= 70 THEN 'Average'
                    ELSE 'Below Average'
                END;
    
    DBMS_OUTPUT.PUT_LINE('Result using CASE: ' || v_result);
    
    -- Using CASE expression
    DBMS_OUTPUT.PUT_LINE('Result using CASE expression: ' || 
                         CASE
                             WHEN v_score >= 90 THEN 'Excellent'
                             WHEN v_score >= 80 THEN 'Good'
                             WHEN v_score >= 70 THEN 'Average'
                             ELSE 'Below Average'
                         END);
    
    -- Using NULLIF
    DECLARE
        v_value1 NUMBER := 100;
        v_value2 NUMBER := 100;
    BEGIN
        IF NULLIF(v_value1, v_value2) IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('v_value1 is equal to v_value2.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('v_value1 is not equal to v_value2.');
        END IF;
    END;
    
    -- Using COALESCE
    DECLARE
        v_value1 NUMBER := NULL;
        v_value2 NUMBER := 10;
        v_result_coalesce NUMBER;
    BEGIN
        v_result_coalesce := COALESCE(v_value1, v_value2);
        DBMS_OUTPUT.PUT_LINE('Result using COALESCE: ' || v_result_coalesce);
    END;
END;
/
