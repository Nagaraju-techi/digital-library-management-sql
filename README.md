# 📚 Digital Library Management & Audit System

## 📌 Overview

The **Digital Library Management & Audit System** is a SQL-based mini project developed using **MySQL Workbench**. It is designed to help educational institutions manage books, student borrowing records, overdue returns, and usage reports through a structured relational database.

This project demonstrates practical SQL concepts such as database design, table relationships, joins, aggregate functions, and date-based reporting.

---

## 🎯 Objectives

- 📖 Maintain book inventory records  
- 👨‍🎓 Manage student information  
- 🔄 Track issued and returned books  
- ⏰ Identify overdue books  
- 📊 Analyze most borrowed book categories  
- 🧹 Detect inactive student accounts  

---

## 🛠️ Technologies Used

- MySQL  
- MySQL Workbench  
- SQL  

---

## 🗃️ Database Structure

The project contains the following tables:

### 📚 Books
Stores book details such as title, author, category, and available copies.

### 👨‍🎓 Students
Stores student information including name, course, and join date.

### 🔄 IssuedBooks
Stores book issue and return transactions with dates.

---

## ✨ Key Features

- 📘 Book inventory management  
- 👥 Student borrowing records  
- ⏳ Overdue book detection  
- 📈 Category popularity analysis  
- 🚫 Inactive account identification  
- 📑 Structured reporting using SQL queries  

---

## 📊 Reports Generated

The system can generate useful reports such as:

- ⚠️ Students with overdue books  
- 📚 Most borrowed book categories  
- 🧹 Students inactive for more than three years  
- 📌 Current issued books records  
- 📈 Borrowing activity summaries  

---

## 📁 Project Structure

```text id="dc9e6e"
digital-library-management-sql/
│── digital_library.sql
│── README.md
│── screenshots/
