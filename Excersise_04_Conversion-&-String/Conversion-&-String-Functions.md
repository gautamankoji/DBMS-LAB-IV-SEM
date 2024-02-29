# Exercise – 4

## Queries using conversion functions

Queries using Conversion functions (to_char, to_number and to_date), string functions (Concatenation, lpad, rpad, ltrim, rtrim, lower, upper, initcap, length, substr and instr), date functions (Sysdate, next_day, add_months, last_day, months_between, least, greatest, trunc,round, to_char, to_date).

Below are SQL queries demonstrating the use of conversion functions (`TO_CHAR`, `TO_NUMBER`, `TO_DATE`), string functions (concatenation, `LPAD`, `RPAD`, `LTRIM`, `RTRIM`, `LOWER`, `UPPER`, `INITCAP`, `LENGTH`, `SUBSTR`, `INSTR`), and date functions (`SYSDATE`, `NEXT_DAY`, `ADD_MONTHS`, `LAST_DAY`, `MONTHS_BETWEEN`, `LEAST`, `GREATEST`, `TRUNC`, `ROUND`, `TO_CHAR`, `TO_DATE`):

### Conversion Functions

1. **Convert a Numeric Value to a String**:

```sql
SELECT TO_CHAR(12345) AS converted_value FROM dual;
```

2. **Convert a String to a Numeric Value**:

```sql
SELECT TO_NUMBER('12345') AS converted_number FROM dual;
```

3. **Convert a String to a Date**:

```sql
SELECT TO_DATE('2024-02-28', 'YYYY-MM-DD') AS converted_date FROM dual;
```

### String Functions

4. **Concatenation of Strings**:

```sql
SELECT 'Hello' || ' ' || 'World' AS concatenated_string FROM dual;
```

5. **Padding Strings with Leading Zeros**:

```sql
SELECT LPAD('123', 5, '0') AS padded_string FROM dual;
```

6. **Trimming Spaces from the Right Side of a String**:

```sql
SELECT RTRIM('  Hello  ') AS trimmed_string FROM dual;
```

7. **Converting a String to Lowercase**:

```sql
SELECT LOWER('HELLO') AS lowercase_string FROM dual;
```

8. **Extracting Substring**:

```sql
SELECT SUBSTR('Hello World', 7, 5) AS extracted_substring FROM dual;
```

9. **Finding Position of Substring**:

```sql
SELECT INSTR('Hello World', 'World') AS substring_position FROM dual;
```

### Date Functions

10. **Current Date and Time**:

```sql
SELECT SYSDATE FROM dual;
```

11. **Next Day of a Given Date**:

```sql
SELECT NEXT_DAY(TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'SUNDAY') AS next_sunday FROM dual;
```

12. **Add Months to a Given Date**:

```sql
SELECT ADD_MONTHS(TO_DATE('2024-02-28', 'YYYY-MM-DD'), 3) AS future_date FROM dual;
```

13. **Last Day of a Given Month**:

```sql
SELECT LAST_DAY(TO_DATE('2024-02-28', 'YYYY-MM-DD')) AS last_day_of_month FROM dual;
```

14. **Difference in Months Between Two Dates**:

```sql
SELECT MONTHS_BETWEEN(TO_DATE('2024-02-28', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD')) AS month_difference FROM dual;
```

15. **Truncate Date to the Specified Unit**:

```sql
SELECT TRUNC(SYSDATE, 'MONTH') AS truncated_date FROM dual;
```

16. **Round Date to the Specified Unit**:

```sql
SELECT ROUND(SYSDATE, 'MONTH') AS rounded_date FROM dual;
```
