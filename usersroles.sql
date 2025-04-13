USE bookstore_db;

CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'developer';
CREATE ROLE IF NOT EXISTS 'analyst';
CREATE ROLE IF NOT EXISTS 'support';

-- Admin: Full access
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'admin';

-- Developer: Read and write access
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO 'developer';

-- Analyst: Read-only access
GRANT SELECT ON bookstore_db.* TO 'analyst';

-- Support: Read and limited write access to customer-related tables
GRANT SELECT, UPDATE ON bookstore_db.customer TO 'support';
GRANT SELECT ON bookstore_db.customer_address TO 'support';

-- Replace 'secure_password' with strong, unique passwords
CREATE USER IF NOT EXISTS 'alice'@'localhost' IDENTIFIED BY 'secure_password';
GRANT 'admin' TO 'alice'@'localhost';

CREATE USER IF NOT EXISTS 'bob'@'localhost' IDENTIFIED BY 'secure_password';
GRANT 'developer' TO 'bob'@'localhost';

CREATE USER IF NOT EXISTS 'carol'@'localhost' IDENTIFIED BY 'secure_password';
GRANT 'analyst' TO 'carol'@'localhost';