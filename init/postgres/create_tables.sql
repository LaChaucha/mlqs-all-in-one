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
    category_id SERIAL PRIMARY KEY,
    name        VARCHAR(50)
    );

-- Create Customer table
CREATE TABLE IF NOT EXISTS Customer
(
    customer_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100),
    address      VARCHAR(255),
    email        VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Supplier table
CREATE TABLE IF NOT EXISTS Supplier
(
    supplier_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100),
    address      VARCHAR(255),
    email        VARCHAR(100),
    phone_number VARCHAR(20)
    );

-- Create Product table
CREATE TABLE IF NOT EXISTS Product
(
    product_id  SERIAL PRIMARY KEY,
    name        VARCHAR(100),
    description TEXT,
    price       DECIMAL(10, 2),
    category_id INT REFERENCES Category (category_id),
    supplier_id INT REFERENCES Supplier (supplier_id)
);

-- Create Order table
CREATE TABLE IF NOT EXISTS OrderItem
(
    order_id       SERIAL PRIMARY KEY,
    order_date     DATE,
    status         VARCHAR(50),
    payment_method VARCHAR(50),
    customer_id    INT REFERENCES Customer (customer_id)
);

-- Create Employee table
CREATE TABLE IF NOT EXISTS Employee
(
    employee_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100),
    position     VARCHAR(100),
    email        VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Invoice table
CREATE TABLE IF NOT EXISTS Invoice
(
    invoice_id   SERIAL PRIMARY KEY,
    issue_date   DATE,
    total_amount DECIMAL(10, 2),
    order_id     INT REFERENCES OrderItem (order_id)
);

-- Create Transaction table
CREATE TABLE IF NOT EXISTS Transaction
(
    transaction_id   SERIAL PRIMARY KEY,
    transaction_type VARCHAR(50),
    amount           DECIMAL(10, 2),
    transaction_date DATE,
    invoice_id       INT REFERENCES Invoice (invoice_id)
);