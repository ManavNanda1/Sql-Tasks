----------------------------------------1. Creation Of database Below For Task-2 Of SQL -----------------------------------------------------------------
CREATE DATABASE MN323ManavNanda;
USE MN323ManavNanda

-- ---------------------------------------------Creation Of Table And Insertion Of Values Below --------------------------------------------------------

CREATE TABLE emp_department(
DPT_CODE INT PRIMARY KEY,
DPT_NAME   VARCHAR(100) NOT NULL,
DPT_ALLOTMENT INT NOT NULL
);

INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT)
VALUES
    (57, 'IT', 65000),
    (63, 'Finance', 15000),
    (47, 'HR', 240000),
    (27, 'RD', 55000),
    (89, 'QC', 75000);

CREATE TABLE emp_details (
EMP_IDNO INT NOT NULL,
EMP_FNAME VARCHAR(100) NOT NULL,       
EMP_LNAME VARCHAR(100),      
EMP_DEPT INT FOREIGN KEY REFERENCES emp_department(DPT_CODE)
);

INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
    (127323, 'Michale', 'Robbin', 57),
    (526689, 'Carlos', 'Snares', 63),
    (843795, 'Enric', 'Dosio', 57),
    (328717, 'Jhon', 'Snares', 63),
    (444527, 'Joseph', 'Dosni', 47),
    (659831, 'Zanifer', 'Emily', 47),
    (847674, 'Kuleswar', 'Sitaraman', 57),
    (748681, 'Henrey', 'Gabriel', 47),
    (555935, 'Alex', 'Manuel', 57),
    (539569, 'George', 'Mardy', 27),
    (733843, 'Mario', 'Saule', 63),
    (631548, 'Alan', 'Snappy', 27),
    (839139, 'Maria', 'Foster', 57);


CREATE TABLE company_mast(
COM_ID INT PRIMARY KEY,
COM_NAME VARCHAR(100)
);

INSERT INTO company_mast (COM_ID, COM_NAME)
VALUES
    (11, 'Samsung'),
    (12, 'iBall'),
    (13, 'Epsion'),
    (14, 'Zebronics'),
    (15, 'Asus'),
    (16, 'Frontech');


CREATE TABLE item_mast(
PRO_ID INT PRIMARY KEY,
PRO_NAME VARCHAR(200) NOT NULL,               
PRO_PRICE INT NOT NULL, 
PRO_COM INT FOREIGN KEY REFERENCES company_mast(COM_ID)
);

INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
    (101, 'Mother Board', 3200, 15),
    (102, 'Key Board', 450, 16),
    (103, 'ZIP drive', 250, 14),
    (104, 'Speaker', 550, 16),
    (105, 'Monitor', 5000, 11),
    (106, 'DVD drive', 900, 12),
    (107, 'CD drive', 800, 12),
    (108, 'Printer', 2600, 13),
    (109, 'Refill cartridge', 350, 13),
    (110, 'Mouse', 250, 12);


CREATE TABLE salesman(
SALESMAN_ID INT PRIMARY KEY,
NAMES VARCHAR(200) NOT NULL,
CIYY VARCHAR(200) NOT NULL,
COMMISION DECIMAL (8,2) NOT NULL
);

INSERT INTO salesman (SALESMAN_ID,NAMES , CITY, COMMISION)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

EXEC sp_RENAME 'salesman.CIYY', 'CITY', 'COLUMN'


CREATE TABLE customer(
customer_id INT PRIMARY KEY,
cust_name VARCHAR(200) NOT NULL,
city VARCHAR(200) NOT NULL,
grade INT,
salesman_id INT FOREIGN KEY REFERENCES salesman(SALESMAN_ID )
);

INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


CREATE TABLE Orders(
ord_no INT NOT NULL,
purch_amt DECIMAL(8,2) NOT NULL, 
ord_date DATE NOT NULL,
customer_id  INT FOREIGN KEY REFERENCES customer(customer_id),
salesman_id INT FOREIGN KEY REFERENCES salesman(SALESMAN_ID)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);


--------------------------- -------------------------TABLE CREATION AND INSERTION DONE  --------------------------------------------------------------------


-------------------------------------------------------MAIN QUERY STARTS BELOW------------------------------------------------------------------------------

--(1) Write a SQL statement to find the total purchase amount of all orders.
	SELECT SUM(purch_amt) FROM orders; 

--(2) Write a SQL statement to find the average purchase amount of all orders.
	SELECT AVG(purch_amt) FROM orders;

--(3) Write a SQL statement to find the number of salesmen currently listing for all of their customers
	SELECT COUNT(DISTINCT salesman_id) FROM customer;
	SELECT COUNT(salesman_id) FROM customer;     

--(4) Write a SQL statement to know how many customer have listed their names.
	SELECT COUNT(cust_name) FROM customer;
	SELECT COUNT(DISTINCT cust_name) FROM customer;

--(5) Write a SQL statement find the number of customers who gets at least a gradation for his/her performance
	SELECT COUNT(grade) FROM customer;
	SELECT COUNT(DISTINCT customer_id) FROM customer WHERE grade IS NOT NULL;
	SELECT COUNT(grade)FROM customer WHERE grade IS NOT NULL;

--(6) Write a SQL statement to get the maximum purchase amount of all the orders
	SELECT MAX(purch_amt) FROM orders;

--(7) Write a SQL statement to get the minimum purchase amount of all the orders
	SELECT MIN(purch_amt) FROM orders;

--(8) Write a SQL statement which selects the highest grade for each of the cities of the customers.
	SELECT city, MAX(grade) AS highest_grade 
	FROM customer 
	GROUP BY city;

--(9) Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.
	SELECT customer_id, MAX(purch_amt) AS highest_purchase_amount 
	FROM orders 
	GROUP BY customer_id;

--(10) Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount. 
	SELECT customer_id,ord_date,MAX(purch_amt) AS Highest_Purchase_Amount 
	FROM orders 
	GROUP BY customer_id,ord_date;

--(11) Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.
	SELECT salesman_id, MAX(purch_amt) AS highest_purchase_amount
	FROM orders
	WHERE ord_date = '2012-08-17'
	GROUP BY salesman_id;

--(12) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.
	SELECT customer_id,ord_date,MAX(purch_amt) AS Highest_Purchase_Amount 
	FROM orders 
	GROUP BY customer_id,ord_date
	HAVING MAX (purch_amt)>2000.00;

--(13) Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000
	SELECT customer_id,ord_date,MAX(purch_amt) AS Highest_Purchase_Amount 
	FROM orders 
	GROUP BY customer_id,ord_date
	HAVING MAX(purch_amt) BETWEEN 2000 AND 6000

--(14) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.
	SELECT customer_id,ord_date,MAX(purch_amt) AS Highest_Purchase_Amount
	FROM orders
	GROUP BY customer_id,ord_date
	HAVING MAX(purch_amt) IN (2000,3000,5760,6000);

--(15) Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.
	SELECT customer_id, MAX(purch_amt) AS Highest_Purchase_Amount
	FROM orders
	WHERE customer_id BETWEEN 3002 AND 3007
	GROUP BY customer_id;

--(16) Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.  
	SELECT customer_id ,MAX(purch_amt) AS Highest_Purchase_Amount
	FROM orders
	WHERE customer_id BETWEEN 3002 AND 3007
	GROUP BY customer_id
	HAVING MAX(purch_amt)>1000;

--(17) Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008. 
	SELECT salesman_id,MAX(purch_amt) AS Highest_Purchase_Amount
	FROM orders
	WHERE salesman_id BETWEEN 5003 AND 5008
	GROUP BY salesman_id;

--(18) Write a SQL statement that counts all orders for a date August 17th, 2012.
	SELECT COUNT(ord_date) 
	FROM orders 
	WHERE ord_date = '2012-08-17';

--(19) Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified.  
	SELECT COUNT(NAMES) FROM salesman WHERE city IS NOT NULL;

--(20) Write a query that counts the number of salesmen with their order date and ID registering orders for each day.
	SELECT ord_date, COUNT(DISTINCT salesman_id) AS No_Of_Salesman, COUNT(ord_no) AS No_Of_Orders
    FROM orders
	GROUP BY ord_date;
 
 --(21) Write a SQL query to calculate the average price of all the products.
	SELECT AVG(PRO_PRICE) FROM item_mast;

--(22) Write a SQL query to find the number of products with a price more than or equal to Rs.350.
	SELECT COUNT(PRO_PRICE) FROM item_mast WHERE PRO_PRICE >= 350;
	SELECT PRO_PRICE FROM item_mast WHERE PRO_PRICE >= 350;

--(23) Write a SQL query to display the average price of each company's products, along with their code.
	SELECT PRO_COM AS Company_Code, AVG(PRO_PRICE) AS Average_Price
	FROM item_mast
	GROUP BY PRO_COM;

--(24) Write a query in SQL to find the sum of the allotment amount of all departments. 
	SELECT SUM(DPT_ALLOTMENT) as Total_Allotment
	FROM emp_department;


--(25) Write a query in SQL to find the number of employees in each department along with the department code.
	SELECT EMP_DEPT, COUNT(*) as num_employees
	FROM emp_details
	GROUP BY EMP_DEPT;

--------------------------------------------------------------- 25 Querys Done Above -------------------------------------------------------------------------