-- Create Database
CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    full_name VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    email VARCHAR(150),
    phone VARCHAR(30),
    street_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    registration_date DATE,
    preferred_channel VARCHAR(30)
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    transaction_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(150),
    quantity INT,
    unit_price DECIMAL(10,2),
    payment_method VARCHAR(50),
    store_location VARCHAR(100),
    discount_applied DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Interactions Table
CREATE TABLE interactions (
    interaction_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    channel VARCHAR(50),
    interaction_type VARCHAR(50),
    interaction_date DATETIME,
    duration DECIMAL(8,2),
    page_or_product VARCHAR(150),
    session_id VARCHAR(100),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Campaigns Table
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(150),
    campaign_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    target_segment VARCHAR(100),
    budget DECIMAL(12,2),
    impressions INT,
    clicks INT,
    conversions INT,
    conversion_rate DECIMAL(5,4),
    roi DECIMAL(8,2)
);

-- Customer Reviews Table
CREATE TABLE customer_reviews_complete (
    review_id INT PRIMARY KEY,
    customer_id VARCHAR(50),
    product_name VARCHAR(150),
    product_category VARCHAR(80),
    full_name VARCHAR(100),
    transaction_date DATE,
    review_date DATE,
    rating INT,
    review_title VARCHAR(255),
    review_text TEXT,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Support Tickets Table
CREATE TABLE support_tickets (
    ticket_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    issue_category VARCHAR(80),
    priority VARCHAR(20),
    submission_date DATETIME,
    resolution_date DATETIME,
    resolution_status VARCHAR(30),
    resolution_time_hours DECIMAL(8,2),
    customer_satisfaction_score DECIMAL(3,2),
    notes TEXT,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- Import Customers
LOAD DATA LOCAL INFILE 'D:/semster 5/Subject/DBMS/TAE/TAE 1/archive/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Import Transactions
LOAD DATA LOCAL INFILE 'D:/semster 5/Subject/DBMS/TAE/TAE 1/archive/transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    transaction_id,
    customer_id,
    transaction_date,
    product_category,
    product_name,
    quantity,
    unit_price,
    payment_method,
    store_location,
    discount_applied
);

-- Import Interactions
LOAD DATA LOCAL INFILE 'D:/semster 5/Subject/DBMS/TAE/TAE 1/archive/interactions.csv'
INTO TABLE interactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    interaction_id,
    customer_id,
    channel,
    interaction_type,
    interaction_date,
    duration,
    page_or_product,
    session_id
);

-- Import Campaigns
LOAD DATA LOCAL INFILE 'D:/semster 5/Subject/DBMS/TAE/TAE 1/archive/campaigns.csv'
INTO TABLE campaigns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Import Customer Reviews
LOAD DATA LOCAL INFILE 'D:/semster 5/Subject/DBMS/TAE/TAE 1/archive/customer_reviews_complete.csv'
INTO TABLE customer_reviews_complete
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    review_id,
    customer_id,
    product_name,
    product_category,
    full_name,
    transaction_date,
    review_date,
    rating,
    review_title,
    review_text
);

-- Import Support Tickets
LOAD DATA LOCAL INFILE 'D:/semster 5/Subject/DBMS/TAE/TAE 1/archive/support_tickets.csv'
INTO TABLE support_tickets
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;