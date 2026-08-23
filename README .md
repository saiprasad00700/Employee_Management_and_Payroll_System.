# Employee Management and Payroll System

A menu-driven Python and MySQL application for managing employees, departments, attendance, and payroll with SQL-based analytical reports.

## Project Overview

This project automates employee management and payroll processing using **Python**, **MySQL**, and **SQL**. It performs CRUD operations, tracks attendance, calculates salaries automatically, and generates business reports.

## Tech Stack

- Python
- MySQL
- SQL
- mysql-connector-python

## Features

### Employee Management
- Add Employee
- View Employees
- Search Employee
- Update Salary
- Delete Employee

### Department Management
- View Departments

### Attendance Management
- Mark Attendance
- View Attendance
- Attendance Report

### Payroll Management
- Automatic payroll generation
- HRA (20%)
- DA (10%)
- PF (12%)
- Net Salary calculation
- Payroll Report

## SQL Reports

- Employee with Department
- Employee Count by Department
- Average Salary by Department
- Highest Paid Employee
- Attendance Report
- Payroll Report

## Database Tables

| Table | Description |
|--------|-------------|
| Department | Stores department details |
| Employee | Stores employee information |
| Attendance | Daily attendance records |
| Payroll | Generated payroll details |

## Project Structure

```text
Employee_Management_and_Payroll_System/
│
├── Employee_Management_and_Payroll_System.ipynb
├── db.py
├── main.py
├── employee_payroll_db.sql
└── README.md
```

## How to Run

1. Import `employee_payroll_db.sql` into MySQL Workbench.
2. Update MySQL credentials in `db.py`.
3. Install the connector:

```bash
pip install mysql-connector-python
```

4. Run:

```bash
python main.py
```

## Learning Outcomes

- Python CRUD Operations
- MySQL Database Design
- SQL JOIN, GROUP BY, COUNT, AVG, MAX
- Python–MySQL Integration
- Payroll Automation
- Exception Handling

## Author

**Saiprasad Nukala**

Python | SQL | MySQL | Data Analytics
