-- Creating a hypothetical product table
CREATE TABLE product (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    unit_price NUMBER,
    quantity_in_stock NUMBER
);

-- Inserting some sample data into the product table
INSERT INTO product (product_id, product_name, unit_price, quantity_in_stock) VALUES (1, 'Laptop', 1000, 10);
INSERT INTO product (product_id, product_name, unit_price, quantity_in_stock) VALUES (2, 'Phone', 500, 20);
INSERT INTO product (product_id, product_name, unit_price, quantity_in_stock) VALUES (3, 'Tablet', 300, 15);

-- Creating a stored function to calculate total value of a product in stock
CREATE OR REPLACE FUNCTION calculate_product_value(p_product_id IN product.product_id%TYPE)
RETURN NUMBER
IS
    v_total_value NUMBER;
BEGIN
    -- Retrieving unit price and quantity in stock
    SELECT unit_price * quantity_in_stock INTO v_total_value
    FROM product
    WHERE product_id = p_product_id;
    
    RETURN v_total_value;
END;
/

-- Invoking the function in SQL statements
-- Example 1: Calculating total value of product with ID 1
SELECT product_name, calculate_product_value(product_id) AS total_value
FROM product
WHERE product_id = 1;

-- Example 2: Calculating total value of all products
SELECT product_id, product_name, calculate_product_value(product_id) AS total_value
FROM product;
