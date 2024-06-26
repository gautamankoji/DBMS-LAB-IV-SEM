# Exercise – 13

## Develop Programs using BEFORE and AFTER Triggers, Row and Statement Triggers and INSTEAD OF Triggers

```sql
-- Creating a hypothetical table
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    order_date DATE,
    total_amount NUMBER
);

-- Creating a sequence to generate order IDs
CREATE SEQUENCE order_id_seq START WITH 1 INCREMENT BY 1;

-- Creating a trigger to populate order ID before insert
CREATE OR REPLACE TRIGGER before_insert_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    SELECT order_id_seq.NEXTVAL INTO :NEW.order_id FROM DUAL;
END;
/

-- Creating a trigger to update total amount after insert
CREATE OR REPLACE TRIGGER after_insert_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_amount = :NEW.total_amount * 1.1 -- Applying 10% tax
    WHERE order_id = :NEW.order_id;
END;
/

-- Creating a trigger to log inserted orders
CREATE OR REPLACE TRIGGER log_inserted_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_log (order_id, order_date, total_amount)
    VALUES (:NEW.order_id, :NEW.order_date, :NEW.total_amount);
END;
/

-- Creating a hypothetical view for orders with tax included
CREATE OR REPLACE VIEW orders_with_tax AS
SELECT order_id, order_date, total_amount AS total_amount_without_tax, 
       total_amount * 1.1 AS total_amount_with_tax
FROM orders;

-- Creating an INSTEAD OF trigger for the view to handle updates
CREATE OR REPLACE TRIGGER instead_of_update_orders_with_tax
INSTEAD OF UPDATE ON orders_with_tax
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_amount = :NEW.total_amount_without_tax / 1.1
    WHERE order_id = :OLD.order_id;
END;
/
```

Explanation:

- **BEFORE INSERT Trigger (`before_insert_order`)**: This trigger fires before an insert operation on the `orders` table. It populates the `order_id` column using a sequence.
- **AFTER INSERT Trigger (`after_insert_order`)**: This trigger fires after an insert operation on the `orders` table. It updates the `total_amount` column to include a 10% tax.
- **AFTER INSERT Trigger (`log_inserted_order`)**: This trigger fires after an insert operation on the `orders` table. It logs the inserted order details into a hypothetical `order_log` table.
- **INSTEAD OF UPDATE Trigger (`instead_of_update_orders_with_tax`)**: This trigger is created for the `orders_with_tax` view. It allows updating the `total_amount_without_tax` column in the view, and it updates the corresponding `total_amount` in the `orders` table accordingly.
