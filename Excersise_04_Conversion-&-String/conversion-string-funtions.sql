-- Conversion Functions:
-- Convert a Numeric Value to a String:
SELECT TO_CHAR(12345) AS converted_value FROM dual;

-- Convert a String to a Numeric Value:/
SELECT TO_NUMBER('12345') AS converted_number FROM dual;

-- 3. **Convert a String to a Date**:
SELECT TO_DATE('2024-02-28', 'YYYY-MM-DD') AS converted_date FROM dual;


-- ### String Functions
-- 4. **Concatenation of Strings**:
SELECT 'Hello' || ' ' || 'World' AS concatenated_string FROM dual;


-- 5. **Padding Strings with Leading Zeros**:
SELECT LPAD('123', 5, '0') AS padded_string FROM dual;


-- 6. **Trimming Spaces from the Right Side of a String**:
SELECT RTRIM('  Hello  ') AS trimmed_string FROM dual;


-- 7. **Converting a String to Lowercase**:
SELECT LOWER('HELLO') AS lowercase_string FROM dual;


-- 8. **Extracting Substring**:
SELECT SUBSTR('Hello World', 7, 5) AS extracted_substring FROM dual;


-- 9. **Finding Position of Substring**:
SELECT INSTR('Hello World', 'World') AS substring_position FROM dual;


-- ### Date Functions
-- 10. **Current Date and Time**:
SELECT SYSDATE FROM dual;

-- 11. **Next Day of a Given Date**:
SELECT NEXT_DAY(TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'SUNDAY') AS next_sunday FROM dual;


-- 12. **Add Months to a Given Date**:
SELECT ADD_MONTHS(TO_DATE('2024-02-28', 'YYYY-MM-DD'), 3) AS future_date FROM dual;


-- 13. **Last Day of a Given Month**:
SELECT LAST_DAY(TO_DATE('2024-02-28', 'YYYY-MM-DD')) AS last_day_of_month FROM dual;


-- 14. **Difference in Months Between Two Dates**:
SELECT MONTHS_BETWEEN(TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD')) AS month_difference FROM dual;


-- 15. **Truncate Date to the Specified Unit**:
SELECT TRUNC(SYSDATE, 'MONTH') AS truncated_date FROM dual;


-- 16. **Round Date to the Specified Unit**:
SELECT ROUND(SYSDATE, 'MONTH') AS rounded_date FROM dual;

