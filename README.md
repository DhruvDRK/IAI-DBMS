
# IAI-DBMS
# 📊 Retail & Customer Analytics Data Systems Assignment

Welcome to the **Retail & Customer Analytics Data Systems Assignment**! This hands-on lab evaluates core relational database concepts, including data modeling, primary/foreign key relationships, data import strategies, and multi-table SQL query writing using **MySQL**.

---

## 🎯 Assignment Overview

In this assignment, students act as Database Architects and Data Analysts for an e-commerce enterprise. You are provided with 6 unlinked raw datasets (`.csv` files) representing different operational domains of the business. 

Your task is to
1. **Analyze & Model:** Review the raw file schemas, establish proper data types, define Primary Keys (PKs), and set up Foreign Key (FK) relationships.
2. **Build Database:** Write standard MySQL Data Definition Language (`CREATE TABLE`) scripts and load the provided data.
3. **Analyze Data:** Write structured SQL queries to solve multi-table business analytical problems without relying on database views or window functions.

---

## 📁 Dataset Specifications

The database consists of **6 core entities**:

| Table Name | Source File | Description | Key Relationships |
| :--- | :--- | :--- | :--- |
| **`customers`** | `customers.csv` | Customer demographics, contact details, and account registration records. | **Primary Table** (`customer_id` PK) |
| **`transactions`** | `transactions.csv` | Purchase history including item prices, quantities, and store locations. | FK &rarr; `customers(customer_id)` |
| **`interactions`** | `interactions.csv` | Digital behavior logs (web views, mobile apps, "Add to Cart" events). | FK &rarr; `customers(customer_id)` |
| **`campaigns`** | `campaigns.csv` | Marketing performance metrics, budget allocations, clicks, and ROI. | Independent Entity (`campaign_id` PK) |
| **`customer_reviews_complete`** | `customer_reviews_complete.csv` | Product ratings (1–5 stars) and customer review narrative text. | FK &rarr; `customers(customer_id)` |
| **`support_tickets`** | `support_tickets.csv` | Customer service tickets, priority levels, resolution times, and CSAT scores. | FK &rarr; `customers(customer_id)` |

---

## 🚀 Setup & Execution Guide

### Step 1: Clone the Repository
```bash
git clone [https://github.com/your-username/mysql-data-systems-assignment.git](https://github.com/your-username/mysql-data-systems-assignment.git)
cd mysql-data-systems-assignment
