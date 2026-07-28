CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
  city VARCHAR2(50) NOT NULL,
  email VARCHAR2(100) NULL,

    join_date DATE NOT NULL
);

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY
      product_name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50) NOT NULL,
    price NUMBER(10,2) NOT NULL
);

CREATE TABLE orders (

    order_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR2(20) NOT NULL,
     total_amount NUMBER(10,2) NOT NULL
);
