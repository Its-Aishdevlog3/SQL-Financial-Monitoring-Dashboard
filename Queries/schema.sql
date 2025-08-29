CREATE DATABASE finance_dashboard;
USE finance_dashboard;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    account_type VARCHAR(20), -- e.g. savings, current
    created_at DATE
);

-- Transactions table
CREATE TABLE transactions (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    txn_date DATETIME,
    txn_type VARCHAR(20), -- debit/credit
    amount DECIMAL(10,2),
    category VARCHAR(50), -- e.g. shopping, utilities, salary
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
