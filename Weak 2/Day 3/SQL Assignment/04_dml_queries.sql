INSERT INTO CUSTOMERS (customer_id,full_name,city,email,join_date) VALUES
    (6,'Sara Adel','Mansoura','sara.adel@novamart.com', DATE '2025-03-18')

    INSERT INTO products (product_id, product_name, category, price)
VALUES (107, 'Standing Desk', 'Furniture', 6200.00);

INSERT INTO orders (order_id, customer_name, order_date, status, total_amount)
VALUES (1006, 'Sara Adel', DATE '2025-03-28', 'PENDING', 2450.00);

UPDATE customers
SET email = 'karim.saad@novamart.com'
WHERE customer_id = 3;

UPDATE orders
SET status = 'PAID'
WHERE order_id = 1002;

DELETE FROM products
WHERE product_id = 104;