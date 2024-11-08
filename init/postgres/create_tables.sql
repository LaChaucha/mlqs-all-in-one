-- Drop tables if they exist
DROP TABLE IF EXISTS "Transaction";
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

-- Create Category table
CREATE TABLE IF NOT EXISTS Category
(
    category_id VARCHAR(100) PRIMARY KEY,
    name        VARCHAR(50)
    );

-- Create Customer table
CREATE TABLE IF NOT EXISTS Customer
(
    customer_id  VARCHAR(100) PRIMARY KEY,
    name         VARCHAR(100),
    address      VARCHAR(255),
    email        VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Supplier table
CREATE TABLE IF NOT EXISTS Supplier
(
    supplier_id  VARCHAR(100) PRIMARY KEY,
    name         VARCHAR(100),
    address      VARCHAR(255),
    email        VARCHAR(100),
    phone_number VARCHAR(20)
    );

-- Create Product table
CREATE TABLE IF NOT EXISTS Product
(
    product_id  VARCHAR(100) PRIMARY KEY,
    name        VARCHAR(100),
    description TEXT,
    price       DECIMAL(10, 2),
    category_id VARCHAR(100) REFERENCES Category (category_id),
    supplier_id VARCHAR(100) REFERENCES Supplier (supplier_id)
);

-- Create Employee table
CREATE TABLE IF NOT EXISTS Employee
(
    employee_id  VARCHAR(100) PRIMARY KEY,
    name         VARCHAR(100),
    position     VARCHAR(100),
    email        VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Order table
CREATE TABLE IF NOT EXISTS OrderItem
(
    order_id       VARCHAR(100) PRIMARY KEY,
    order_date     VARCHAR(100),
    status         VARCHAR(50),
    payment_method VARCHAR(50),
    customer_id    VARCHAR(100) REFERENCES Customer (customer_id),
    seller_id      VARCHAR(100)   REFERENCES Employee (employee_id),
    order_rate     VARCHAR(50)
    );

-- Create Order table
CREATE TABLE IF NOT EXISTS OrderProducts
(
    order_products_id       VARCHAR(100) PRIMARY KEY,
    order_id    VARCHAR(100) REFERENCES OrderItem (order_id),
    product_id    VARCHAR(100) REFERENCES Product (product_id)
    );

-- Create Invoice table
CREATE TABLE IF NOT EXISTS Invoice
(
    invoice_id   VARCHAR(100) PRIMARY KEY,
    issue_date   VARCHAR(100) ,
    total_amount DECIMAL(10, 2),
    order_id     VARCHAR(100) REFERENCES OrderItem (order_id)
);

-- Create Transaction table
CREATE TABLE IF NOT EXISTS Transaction
(
    transaction_id   VARCHAR(100) PRIMARY KEY,
    transaction_type VARCHAR(50),
    amount           DECIMAL(10, 2),
    transaction_date VARCHAR(100),
    invoice_id       VARCHAR(100) REFERENCES Invoice (invoice_id)
);