from db import conn, cursor
import mysql.connector


# ---------------- ADD EMPLOYEE ----------------
def add_employee():
    try:
        emp_id = int(input("Employee ID: "))
        name = input("Name: ")
        gender = input("Gender: ")
        phone = input("Phone: ")
        email = input("Email: ")
        role = input("Job Role: ")
        hire_date = input("Hire Date (YYYY-MM-DD): ")
        salary = float(input("Basic Salary: "))
        dept_id = int(input("Department ID: "))

        query = """
        INSERT INTO employee
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
        """

        values = (
            emp_id, name, gender, phone,
            email, role, hire_date,
            salary, dept_id
        )

        cursor.execute(query, values)
        conn.commit()

        print("Employee Added Successfully!")

    except mysql.connector.Error as err:
        print("Database Error:", err)

    except ValueError:
        print("Invalid Input!")


# ---------------- VIEW EMPLOYEES ----------------
def view_employees():

    cursor.execute("SELECT * FROM employee")

    rows = cursor.fetchall()

    print("\n------ EMPLOYEES ------")

    for row in rows:
        print(row)


# ---------------- SEARCH EMPLOYEE ----------------
def search_employee():

    try:
        emp_id = int(input("Employee ID: "))

        cursor.execute(
            "SELECT * FROM employee WHERE emp_id=%s",
            (emp_id,)
        )

        row = cursor.fetchone()

        if row:
            print(row)
        else:
            print("Employee Not Found!")

    except ValueError:
        print("Invalid ID")


# ---------------- UPDATE SALARY ----------------
def update_salary():

    try:
        emp_id = int(input("Employee ID: "))
        salary = float(input("New Salary: "))

        cursor.execute("""
        UPDATE employee
        SET basic_salary=%s
        WHERE emp_id=%s
        """, (salary, emp_id))

        if cursor.rowcount == 0:
            print("Employee Not Found!")
        else:
            conn.commit()
            print("Salary Updated Successfully!")

    except ValueError:
        print("Invalid Input")


# ---------------- DELETE EMPLOYEE ----------------
def delete_employee():

    try:
        emp_id = int(input("Employee ID: "))

        cursor.execute(
            "DELETE FROM employee WHERE emp_id=%s",
            (emp_id,)
        )

        if cursor.rowcount == 0:
            print("Employee Not Found!")
        else:
            conn.commit()
            print("Employee Deleted Successfully!")

    except ValueError:
        print("Invalid ID")


# ---------------- VIEW DEPARTMENTS ----------------
def view_departments():

    cursor.execute("SELECT * FROM department")

    rows = cursor.fetchall()

    print("\n------ DEPARTMENTS ------")

    for row in rows:
        print(row)


# ---------------- MARK ATTENDANCE ----------------
def mark_attendance():

    attendance_id = int(input("Attendance ID: "))
    emp_id = int(input("Employee ID: "))
    date = input("Date (YYYY-MM-DD): ")
    status = input("Status (Present/Absent): ")

    query = """
    INSERT INTO attendance
    VALUES (%s,%s,%s,%s)
    """

    values = (attendance_id, emp_id, date, status)

    cursor.execute(query, values)
    conn.commit()

    print("Attendance Marked Successfully!")


# ---------------- VIEW ATTENDANCE ----------------
def view_attendance():

    cursor.execute("""
    SELECT emp_id, attendance_date, status
    FROM attendance
    ORDER BY attendance_date
    """)

    rows = cursor.fetchall()

    print("\n------ ATTENDANCE ------")

    for row in rows:
        print(row)


# ---------------- ATTENDANCE REPORT ----------------
def attendance_report():

    cursor.execute("""
    SELECT e.emp_name,
           a.attendance_date,
           a.status
    FROM employee e
    JOIN attendance a
    ON e.emp_id=a.emp_id
    ORDER BY a.attendance_date
    """)

    rows = cursor.fetchall()

    print("\n------ ATTENDANCE REPORT ------")

    for row in rows:
        print(row)


# ---------------- GENERATE PAYROLL ----------------
def generate_payroll():

    payroll_id = int(input("Payroll ID: "))
    emp_id = int(input("Employee ID: "))
    month = input("Month: ")

    cursor.execute(
        "SELECT basic_salary FROM employee WHERE emp_id=%s",
        (emp_id,)
    )

    result = cursor.fetchone()

    if result is None:
        print("Employee Not Found!")
        return

    basic = float(result[0])

    hra = basic * 0.20
    da = basic * 0.10
    pf = basic * 0.12

    net_salary = basic + hra + da - pf

    query = """
    INSERT INTO payroll
    VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
    """

    values = (
        payroll_id, emp_id, month,
        basic, hra, da, pf, net_salary
    )

    cursor.execute(query, values)
    conn.commit()

    print("Payroll Generated Successfully!")
    print("Net Salary:", net_salary)


# ---------------- VIEW PAYROLL ----------------
def view_payroll():

    cursor.execute("""
    SELECT e.emp_name,
           p.month,
           p.net_salary
    FROM employee e
    JOIN payroll p
    ON e.emp_id=p.emp_id
    """)

    rows = cursor.fetchall()

    print("\n------ PAYROLL REPORT ------")

    for row in rows:
        print(row)


# ---------------- DEPARTMENT SALARY REPORT ----------------
def department_salary_report():

    cursor.execute("""
    SELECT d.dept_name,
           ROUND(AVG(e.basic_salary),2)
    FROM employee e
    JOIN department d
    ON e.dept_id=d.dept_id
    GROUP BY d.dept_name
    """)

    rows = cursor.fetchall()

    print("\n------ AVG SALARY ------")

    for row in rows:
        print(row)


# ---------------- EMPLOYEE COUNT REPORT ----------------
def employee_count_report():

    cursor.execute("""
    SELECT d.dept_name,
           COUNT(e.emp_id)
    FROM department d
    LEFT JOIN employee e
    ON d.dept_id=e.dept_id
    GROUP BY d.dept_name
    """)

    rows = cursor.fetchall()

    print("\n------ EMPLOYEE COUNT ------")

    for row in rows:
        print(row)


# ---------------- HIGHEST PAID EMPLOYEE ----------------
def highest_paid_employee():

    cursor.execute("""
    SELECT emp_name,
           basic_salary
    FROM employee
    WHERE basic_salary=
    (
        SELECT MAX(basic_salary)
        FROM employee
    )
    """)

    row = cursor.fetchone()

    print("\n------ HIGHEST PAID ------")
    print(row)


# ====================== MENU ======================

while True:

    print("\n===== EMPLOYEE PAYROLL SYSTEM =====")
    print("1. Add Employee")
    print("2. View Employees")
    print("3. Search Employee")
    print("4. Update Salary")
    print("5. Delete Employee")
    print("6. View Departments")
    print("7. Mark Attendance")
    print("8. View Attendance")
    print("9. Attendance Report")
    print("10. Generate Payroll")
    print("11. View Payroll")
    print("12. Department Salary Report")
    print("13. Employee Count Report")
    print("14. Highest Paid Employee")
    print("15. Exit")

    choice = input("Enter Choice: ")

    if choice == "1":
        add_employee()

    elif choice == "2":
        view_employees()

    elif choice == "3":
        search_employee()

    elif choice == "4":
        update_salary()

    elif choice == "5":
        delete_employee()

    elif choice == "6":
        view_departments()

    elif choice == "7":
        mark_attendance()

    elif choice == "8":
        view_attendance()

    elif choice == "9":
        attendance_report()

    elif choice == "10":
        generate_payroll()

    elif choice == "11":
        view_payroll()

    elif choice == "12":
        department_salary_report()

    elif choice == "13":
        employee_count_report()

    elif choice == "14":
        highest_paid_employee()

    elif choice == "15":
        conn.close()
        print("Thank You!")
        break

    else:
        print("Invalid Choice")