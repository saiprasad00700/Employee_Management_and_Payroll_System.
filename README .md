# Employee Management and Payroll System

A menu-driven Python and MySQL application that manages employee records, departments, attendance, and payroll. The system also generates analytical SQL reports for business insights.

## Project Overview

This project was developed using **Python, MySQL, and SQL** to automate employee management and payroll processing. It performs CRUD operations, tracks attendance, calculates salaries automatically, and generates reports using SQL queries.

## Tech Stack

- Python
- MySQL
- SQL
- mysql-connector-python

## Database Tables

| Table | Description |
|--------|-------------|
| Department | Stores department details |
| Employee | Stores employee information |
| Attendance | Stores daily attendance records |
| Payroll | Stores calculated payroll details |

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
- Automatically fetches employee salary
- Calculates HRA, DA, PF, and Net Salary
- Stores payroll records in MySQL
- Generates payroll reports

## SQL Analytics Reports

- Employee with Department (JOIN)
- Employee Count by Department
- Average Salary by Department
- Highest Paid Employee
- Attendance Report
- Payroll Report

## Payroll Formula

Net Salary = Basic Salary + HRA + DA − PF

- HRA = 20% of Basic Salary
- DA = 10% of Basic Salary
- PF = 12% of Basic Salary

## Project Structure

```text
Employee_Payroll_System/
│
├── db.py
├── main.py
├── employee_payroll_db.sql
└── README.md
```

## How to Run

1. Import `employee_payroll_db.sql` into MySQL Workbench.
2. Update your MySQL username and password in `db.py`.
3. Install the MySQL connector:

```bash
pip install mysql-connector-python
```

4. Run the application:

```bash
python main.py
```

## Sample Menu

```text
1. Add Employee
2. View Employees
3. Search Employee
4. Update Salary
5. Delete Employee
6. View Departments
7. Mark Attendance
8. View Attendance
9. Attendance Report
10. Generate Payroll
11. View Payroll
12. Department Salary Report
13. Employee Count Report
14. Highest Paid Employee
15. Exit
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