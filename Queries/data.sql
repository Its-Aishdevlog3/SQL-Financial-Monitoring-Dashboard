-- Insert customers
INSERT INTO customers (name, age, gender, city, account_type, created_at)
VALUES
('Alice', 29, 'Female', 'Delhi', 'Savings', '2023-01-15'),
('Bob', 45, 'Male', 'Mumbai', 'Current', '2022-07-01'),
('Charlie', 35, 'Male', 'Bangalore', 'Savings', '2023-03-12'),
('Diana', 41, 'Female', 'Chennai', 'Savings', '2021-11-22');

-- Insert transactions
INSERT INTO transactions (customer_id, txn_date, txn_type, amount, category)
VALUES
(1, '2023-10-01 10:23:00', 'debit', 2500, 'Shopping'),
(1, '2023-10-03 12:00:00', 'credit', 50000, 'Salary'),
(1, '2023-10-04 09:30:00', 'debit', 8000, 'Travel'),

(2, '2023-10-02 15:20:00', 'debit', 12000, 'Electronics'),
(2, '2023-10-04 11:15:00', 'credit', 60000, 'Salary'),

(3, '2023-10-01 08:10:00', 'debit', 500, 'Coffee'),
(3, '2023-10-02 14:45:00', 'debit', 20000, 'Shopping'),
(3, '2023-10-05 17:00:00', 'credit', 45000, 'Salary'),

(4, '2023-10-03 09:50:00', 'debit', 35000, 'Jewelry'),
(4, '2023-10-06 10:00:00', 'credit', 70000, 'Salary');