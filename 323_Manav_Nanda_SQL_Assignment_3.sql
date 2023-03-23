---------------------------------------------------------------------------Practice Task Of SQL --------------------------------------------------------------------------------------
USE MN323ManavNanda;

---------------------------------------------------------- Creation Of Table And Insertion Of Values Below ----------------------------------------------------------------------------
CREATE TABLE EMPLOYEES(
EmployeeId INT PRIMARY KEY,
EmployeeName VARCHAR(200) NOT NULL,
EmployeeDepartment VARCHAR(200) NOT NULL,
EmployeeSalary DECIMAL (8,2) NOT NULL,
EmployeeHireDate DATE NOT NULL
);


INSERT INTO EMPLOYEES(EmployeeId, EmployeeName, EmployeeDepartment, EmployeeSalary, EmployeeHireDate)
VALUES
(1, 'Manav Nanda', 'Full-Stack-Developer', 56000.00, '2023-01-23'),
(2, 'Rushik Jethva', 'Dynamics CRM', 48000.00, '2023-01-15'),
(3, 'Jay Patel', 'UI/UX', 62000.00, '2020-07-01'),
(4, 'Sanjay Nagar', 'Human Resources', 72000.00, '2018-09-30'),
(5, 'Jay Nanda', 'Full-Stack-Developer', 80000.00, '2017-01-10'),
(6, 'Darshan Jabuani', 'Dynamics CRM', 90000.00, '2019-12-15'),
(7, 'Hemang Dholu', 'UI/UX', 45000.00, '2020-04-01'),
(8, 'Yash Nanda', 'Full-Stack-Developer', 64000.00, '2019-08-01'),
(9, 'Prachi Patel', 'Human Resources', 55000.00, '2021-01-15'),
(10, 'Nilesh Yadav', 'Full-Stack-Developer', 50000.00, '2018-05-01');
select * from EMPLOYEES

--------------------------------------------- -----------------Creation And Insertion Of Values DONE Above -----------------------------------------------------------------------------

---------------------------------------------------------------------------Query's Starts Below -----------------------------------------------------------------------------------------

--(1)How many employees are in the table?
	SELECT COUNT(*) FROM EMPLOYEES;

--(2)What is the highest salary in the table?
	SELECT MAX(EmployeeSalary) FROM EMPLOYEES;

--(3)What is the average salary by department?
	SELECT EmployeeDepartment, AVG(EmployeeSalary) AS AvgSalary
	FROM EMPLOYEES
	GROUP BY EmployeeDepartment;

--(4)Who are the top 5 highest paid employees?
	SELECT DISTINCT TOP 5 EmployeeSalary , EmployeeName
	FROM EMPLOYEES
	ORDER BY EmployeeSalary DESC;

--(5)How many employees were hired in the last year?
	SELECT COUNT(EmployeeId) AS Hired_Last_Year
	FROM employees
	WHERE EmployeeHireDate >= DATEADD(year, -1, GETDATE())

--(6)How do you select all columns from a table named "employees"?
	SELECT * FROM EMPLOYEES;
	
--(7)How do you select only the "employee_id" and "employee_name" columns from a table named "employees"?
	SELECT Employeeid,EmployeeName FROM EMPLOYEES;

--(8)How do you filter records in a table named "employees" to only include those where the "salary" column is greater than or equal to 50000?
	SELECT * FROM EMPLOYEES WHERE EmployeeSalary >=50000;

--(9)How do you filter records in a table named "employees" to only include those where the "department" column is "Sales"?
	SELECT * FROM EMPLOYEES WHERE EmployeeDepartment = 'Sales';

--(10)How do you filter records in a table named "employees" to only include those where the "hire_date" column is between January 1, 2022 and December 31, 2022?
	SELECT *
	FROM employees
	WHERE EmployeeHireDate BETWEEN '2021-01-01' AND '2022-12-31'

--(11)How do you calculate the average salary of all employees in a table named "employees"?
	SELECT AVG(EmployeeSalary) FROM EMPLOYEES;

--(12)How do you calculate the total salary of all employees in a table named "employees"?
	SELECT SUM(EmployeeSalary) FROM EMPLOYEES;

--(13)How do you calculate the highest salary in a table named "employees"?
	SELECT MAX(EmployeeSalary) FROM EMPLOYEES;

--(14)How do you calculate the lowest salary in a table named "employees"?
	SELECT MIN(EmployeeSalary) FROM EMPLOYEES;

--(15)How do you calculate the number of employees in a table named "employees"?
	SELECT COUNT(*) FROM EMPLOYEES;

--(16)How do you sort the records in a table named "employees" by the "salary" column in ascending order?
	SELECT EmployeeName,EmployeeSalary
	FROM EMPLOYEES
	ORDER BY EmployeeSalary;

--(17)How do you sort the records in a table named "employees" by the "salary" column in descending order?
	SELECT EmployeeName,EmployeeSalary
	FROM EMPLOYEES
	ORDER BY EmployeeSalary DESC;

--(18)How do you count the number of employees in each department in a table named "employees"?
	SELECT COUNT(*) AS NoOfDept,EmployeeDepartment
	FROM EMPLOYEES
	GROUP BY EmployeeDepartment;

--(19)How do you select the first 10 records in a table named "employees"?
	SELECT TOP 10 *
	FROM EMPLOYEES;

--(20)How do you select the last 10 records in a table named "employees"?
	SELECT TOP 10 * FROM EMPLOYEES ORDER BY EmployeeId DESC;

--(21)How do you select the top 5 highest paid employees from a table named "employees"?
	SELECT TOP 5 EmployeeSalary , EmployeeName
	FROM EMPLOYEES
	ORDER BY EmployeeSalary DESC;

--(22)How do you select the top 10 highest paid employees from a table named "employees"?
	SELECT TOP 10 EmployeeSalary , EmployeeName
	FROM EMPLOYEES
	ORDER BY EmployeeSalary DESC;

--(23)How do you select the bottom 5 lowest paid employees from a table named "employees"?
	SELECT TOP 5 EmployeeSalary,EmployeeName
	FROM Employees
	ORDER BY EmployeeSalary;

--(24)How do you select the employees who have a salary that is above the average salary in a table named "employees"?
	SELECT * FROM EMPLOYEES
	WHERE EmployeeSalary > (SELECT AVG(EmployeeSalary) FROM EMPLOYEES);


--(25)How do you select the employees who have a salary that is below the average salary in a table named "employees"?
	SELECT * FROM EMPLOYEES
	WHERE EmployeeSalary < (SELECT AVG(EmployeeSalary) FROM EMPLOYEES);

--(26)How do you select the employees who have a salary that is between 40000 and 60000 in a table named "employees"?
	SELECT * FROM EMPLOYEES
	WHERE EmployeeSalary BETWEEN 40000 and 60000;

--(27)How do you calculate the total salary of all employees in each department in a table named "employees"?
	SELECT EmployeeDepartment, SUM(EmployeeSalary) as TotalSalary
	FROM EMPLOYEES
	GROUP BY EmployeeDepartment;


--(28) How do you calculate the average salary of all employees in each department in a table named "employees"?
	SELECT EmployeeDepartment, AVG(EmployeeSalary) as avg_salary
	FROM EMPLOYEES
	GROUP BY EmployeeDepartment;

--(29)How do you calculate the highest salary of all employees in each department in a table named "employees"?
	SELECT EmployeeDepartment, MAX(EmployeeSalary) as highest_salary
	FROM EMPLOYEES
	GROUP BY EmployeeDepartment;

--(30)How do you calculate the lowest salary of all employees in each department in a table named "employees"?
	SELECT EmployeeDepartment, MIN(EmployeeSalary) as highest_salary
	FROM EMPLOYEES
	GROUP BY EmployeeDepartment;

--(31)How do you select the employees who have been hired in the last year from a table named "employees"?
	SELECT COUNT(EmployeeId) AS Hired_Last_Year
	FROM employees
	WHERE EmployeeHireDate >= DATEADD(year, -1, GETDATE())

--(32)How do you select the employees who have been hired in the last 6 months from a table named "employees"?
	SELECT * FROM EMPLOYEES
	WHERE EmployeeHireDate >= DATEADD(month, -6, GETDATE())

--(33)How do you select the employees who have been hired in the last 3 months from a table named "employees"?
	SELECT * FROM EMPLOYEES
	WHERE EmployeeHireDate >= DATEADD(month, -3, GETDATE())

--(34)How do you select the employees who have been hired in the last week from a table named "employees"?
	SELECT * FROM EMPLOYEES
	WHERE EmployeeHireDate >= DATEADD(week, -1, GETDATE())

--(35)How do you select the employees who have a name that starts with the letter "A" in a table named "employees"?
	SELECT EmployeeName 
	FROM EMPLOYEES
	WHERE EmployeeName LIKE 'A%';
--(36)How do you select the employees who have a name that ends with the letter "s" in a table named "employees"?
	SELECT EmployeeName 
	FROM EMPLOYEES
	WHERE EmployeeName LIKE '%S';


--------------------------------------------------------------------Practice Query Done Above ----------------------------------------------------------------------------------
