# Exercise – 14

## For a given set of relation tables perform the following:

### (a). Creating Views

To create a view, you need to specify the SELECT statement that defines the view's data set. Here's an example of how you might create a view:

```sql
CREATE VIEW EmployeeDetails AS
SELECT emp_id, emp_name, emp_salary
FROM Employees;
```

In this example, we're creating a view called `EmployeeDetails` that includes columns `emp_id`, `emp_name`, and `emp_salary` from the `Employees` table.
