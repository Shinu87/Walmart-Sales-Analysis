# 🛒 Walmart Sales Data Analysis

This project involves cleaning, exploring, and analyzing Walmart sales data using Python and SQL. It demonstrates how to process raw data, store it in a MySQL database, and run SQL queries to derive meaningful business insights.

---

## 📌 Features

- Data cleaning and preprocessing using **Pandas**
- Exporting cleaned data to **MySQL** using **SQLAlchemy** and **PyMySQL**
- Structured **SQL queries** to solve real-world business problems
- Calculation of KPIs such as profit, top categories, preferred payment methods, etc.

---

## 🧰 Tech Stack

- **Languages & Libraries:** Python, Pandas, SQL, SQLAlchemy, PyMySQL
- **Database:** MySQL
- **Tools:** Jupyter Notebook, MySQL Workbench

---

## 📂 Project Structure

```
Walmart-Sales-Analysis/
│
├── data/
│   ├── Walmart.csv                # Original dataset 
│   └── walmart_cleaned.csv        # Cleaned dataset 
│
├── notebooks/
│   └── project.ipynb  # Jupyter Notebook for data prep and MySQL upload
│
├── sql_queries/
│   └── business_queries.sql       # SQL queries for business insights          
│
├── README.md                      # Project documentation
├── requirements.txt               # Python dependencies
```

---

## 🧼 Data Cleaning Summary

- Removed duplicates and null values
- Converted `unit_price` from string to float
- Created new column `total = quantity * unit_price`

---

## 📊 SQL Business Problems Solved

- Most preferred **payment method** per branch  
- **Top-rated** product category per branch  
- **Busiest day** of the week per branch  
- Total **profit per category**  
- Branches with highest **revenue drop** from 2022 to 2023  
- Sales segmented by **time of day** (Morning, Afternoon, Evening)  

---

## ⚙️ How to Run Locally

1. Clone the repository
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Make sure MySQL is running locally and update your credentials in the notebook or script:
   ```python
   user = "your_username"
   password = "your_password"
   ```
4. Use any MySQL client to run queries from `business_queries.sql`

---

## 🚫 Note

- This project uses **placeholder MySQL credentials** (`username`, `password`) for demonstration purposes.

---


# 📦 requirements.txt

```
pandas==2.2.2
SQLAlchemy==2.0.30
PyMySQL==1.1.0
numpy==1.26.4
python-dateutil==2.9.0
six==1.16.0
```

---

