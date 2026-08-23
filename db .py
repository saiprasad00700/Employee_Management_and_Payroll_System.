import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="YOUR_PASSWORD",
    database="employee_payroll_db"
)

cursor = conn.cursor()