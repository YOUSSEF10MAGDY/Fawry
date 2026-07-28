INSERT INTO customers (customer_id, full_name, city, email, join_date) VALUES
                                                                           (1, 'Ahmed Ali', 'Cairo', 'ahmed.ali@novamart.com', DATE '2025-01-10'),
                                                                           (2, 'Mona Hassan', 'Giza', 'mona.hassan@novamart.com', DATE '2025-01-15'),
                                                                           (3, 'Karim Saad', 'Alexandria', NULL, DATE '2025-02-01'),
                                                                           (4, 'Laila Mostafa', 'Cairo', 'laila.mostafa@novamart.com', DATE '2025-02-10'),
                                                                           (5, 'Omar Nabil', 'Tanta', 'omar.nabil@novamart.com', DATE '2025-03-05');
INSERT INTO products (product_id, product_name, category, price) VALUES
                                                                     (101, 'Wireless Mouse', 'Electronics', 350.00),
                                                                     (102, 'Mechanical Keyboard', 'Electronics', 1200.00),
                                                                     (103, 'Office Chair', 'Furniture', 4500.00),
                                                                     (104, 'USB-C Cable', 'Accessories', 150.00),
                                                                     (105, 'Laptop Stand', 'Accessories', 800.00),
                                                                     (106, 'Monitor 24 Inch', 'Electronics', 5200.00);

INSERT INTO orders (order_id, customer_name, order_date, status, total_amount) VALUES
                                                                                   (1001, 'Ahmed Ali', DATE '2025-03-20', 'PAID', 1150.00),
                                                                                   (1002, 'Mona Hassan', DATE '2025-03-21', 'PENDING', 1200.00),
                                                                                   (1003, 'Ahmed Ali', DATE '2025-03-22', 'FAILED', 800.00),
                                                                                   (1004, 'Laila Mostafa', DATE '2025-03-25', 'PAID', 5200.00),
                                                                                   (1005, 'Omar Nabil', DATE '2025-03-26', 'PAID', 4500.00);
INSERT INTO sandbox_logs (log_id, log_message, created_at) VALUES
                                                               (1, 'Imported seed data', DATE '2025-03-01'),
                                                               (2, 'First training session started', DATE '2025-03-02');