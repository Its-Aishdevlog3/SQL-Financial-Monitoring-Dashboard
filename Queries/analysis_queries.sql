-- Customer Behavior Analysis Queries
-- 	1. Total Spend per Customer
SELECT c.name, SUM(t.amount) AS total_spent
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE t.txn_type = 'debit'
GROUP BY c.name
ORDER BY total_spent DESC;

--	2. Monthly Transaction Trends
SELECT c.name, DATE_FORMAT(t.txn_date, '%Y-%m') AS month, 
       SUM(CASE WHEN txn_type='debit' THEN amount ELSE 0 END) AS total_debit,
       SUM(CASE WHEN txn_type='credit' THEN amount ELSE 0 END) AS total_credit
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.name, month
ORDER BY month DESC;

-- Anomaly / Fraud Detection Queries
--	1. Detect unusually high transactions (> ₹20,000)

SELECT c.name, t.amount, t.category, t.txn_date
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.amount > 20000
ORDER BY t.amount DESC;

-- 	2. Customers with sudden spike in spending (using Window Function)
WITH txn_spikes AS (
    SELECT customer_id,
           txn_date,
           amount,
           LAG(amount) OVER (PARTITION BY customer_id ORDER BY txn_date) AS prev_amount,
           (amount - LAG(amount) OVER (PARTITION BY customer_id ORDER BY txn_date)) AS spike
    FROM transactions
)
SELECT *
FROM txn_spikes
WHERE spike > 15000;

-- 3. Frequent Small Transactions (possible money laundering)
SELECT c.name, COUNT(*) AS small_txn_count
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.amount < 1000
GROUP BY c.name
HAVING small_txn_count > 3;

-- Dashboard-Level Insights (Aggregates)
-- 	Customer Balances (Credits - Debits)
SELECT c.name,
       SUM(CASE WHEN txn_type='credit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN txn_type='debit' THEN amount ELSE 0 END) AS balance
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.name;

-- Top 3 Customers by Spending
SELECT c.name, SUM(t.amount) AS total_spent
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE txn_type='debit'
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;
