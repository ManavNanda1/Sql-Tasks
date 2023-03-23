------------------------------------------------------------------ Task-5 Of Sql -----------------------------------------------------------------------
USE MN323ManavNanda

---------------------------------------------------------------- Main Query Starts Below ---------------------------------------------------------------

--1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city
	SELECT S.names , c.cust_name,S.city
	FROM salesman AS S
	INNER JOIN customer AS C ON S.SALESMAN_ID = C.salesman_id
	WHERE S.city=C.city;

--2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000
	SELECT O.ord_no , O.purch_amt , C.cust_name,C.city
	FROM Orders AS O
	INNER JOIN customer AS C ON O.salesman_id = C.salesman_id
	WHERE O.purch_amt BETWEEN 500 AND 2000;

--3. Write a SQL statement to know which salesman are working for which customer.
	SELECT C.cust_name , c.customer_id , s.salesman_id,s.names
	FROM customer AS C
	INNER JOIN salesman AS S ON C.salesman_id = S.SALESMAN_ID;

--4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%
	SELECT C.cust_name , C.customer_id , S.salesman_id,S.names,S.COMMISION
	FROM customer AS C
	INNER JOIN salesman AS S
	ON C.salesman_id = S.SALESMAN_ID
	WHERE S.COMMISION >.12;

--5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%
	SELECT C.cust_name, C.City, S.NAMES , S.city,S.COMMISION  
	FROM customer AS C 
	INNER JOIN salesman AS S  
	ON C.salesman_id=S.salesman_id 
	WHERE S.COMMISION>.12 
	AND C.city<>S.city;

--6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order.
	SELECT O.ord_no, O.ord_date , O.purch_amt,C.cust_name , salesman.Names , salesman.COMMISION
	FROM ORDERS AS O
	INNER JOIN customer AS C ON O.salesman_id = C.salesman_id
	INNER JOIN salesman ON O.salesman_id = salesman.salesman_id;
	
--7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come.
	SELECT DISTINCT *
	FROM orders
	INNER JOIN customer ON orders.customer_id = customer.customer_id
	INNER JOIN salesman ON orders.salesman_id = salesman.salesman_id;

--8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. 
	SELECT C.cust_name,C.city,C.grade, 
	S.NAMES AS "Salesman",S.city 
	FROM customer C 
	LEFT JOIN salesman AS S 
	ON C.salesman_id=S.salesman_id 
	order by C.customer_id;

--9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own. 
	SELECT S.* , C.cust_name , C.grade
	FROM salesman AS S
	INNER JOIN customer AS C ON S.SALESMAN_ID = C.salesman_id
	WHERE C.grade <300
	ORDER BY C.grade;

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
	SELECT C.cust_name , C.city , O.ord_no , O.ord_date , O.purch_amt
	FROM customer AS C
	INNER JOIN orders AS O ON C.customer_id = O.customer_id
	ORDER BY O.purch_amt;

--11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own. 
	SELECT a.cust_name,a.city, b.ord_no,
	b.ord_date,b.purch_amt AS "Order Amount", 
	c.names,c.commision 
	FROM customer a 
	LEFT OUTER JOIN orders b 
	ON a.customer_id=b.customer_id 
	LEFT OUTER JOIN salesman c 
	ON c.salesman_id=b.salesman_id;

--12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.  
	SELECT C.cust_name , S.salesman_id
	FROM customer AS C
	RIGHT JOIN salesman AS S ON S.SALESMAN_ID = C.salesman_id
	ORDER BY S.SALESMAN_ID;

--13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier.
	SELECT C.customer_id ,S.salesman_id
	FROM customer AS C
	LEFT JOIN  Orders AS O ON C.customer_id=O.customer_id
	RIGHT JOIN salesman AS S ON C.salesman_id=S.SALESMAN_ID

--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
	SELECT C.customer_id ,S.salesman_id,O.purch_amt
	FROM customer AS C
	LEFT JOIN Orders AS O ON C.customer_id=O.customer_id
	RIGHT JOIN salesman AS S ON C.salesman_id=S.SALESMAN_ID
	WHERE O.purch_amt>=2000 AND C.grade IS NOT NULL;

--15 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.
	SELECT C.cust_name , C.city , O.Ord_no , O.ord_date , O.purch_amt
	FROM customer AS C
	LEFT JOIN Orders AS O ON C.customer_id=O.customer_id

--16 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list not have a grade. 
	SELECT C.cust_name , C.city , O.Ord_no , O.ord_date , O.purch_amt
	FROM customer AS C
	LEFT JOIN Orders AS O ON C.customer_id=O.customer_id
	WHERE C.Grade IS NOT NULL;

--17 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa.
	SELECT * FROM Salesman CROSS JOIN Customer

--18 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that customer who belongs to a city.
	SELECT * FROM Salesman 
	CROSS JOIN Customer C 
	WHERE C.City IS NOT NULL

--19 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade. 
	SELECT * FROM Salesman AS S 
	CROSS JOIN Customer AS C
	WHERE S.City IS NOT NULL AND C.Grade IS NOT NULL;

--20 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade. 
	SELECT * FROM Salesman AS S 
	CROSS JOIN Customer AS C
	WHERE S.City!=C.City AND C.Grade IS NOT NULL;

--21 . Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company.
	SELECT I.*,C.COM_NAME
	FROM item_mast AS I
	INNER JOIN company_mast AS C ON I.PRO_COM = C.COM_ID;

--22 . Write a SQL query to display the item name, price, and company name of all the product
	SELECT I.PRO_NAME,I.PRO_PRICE , C.COM_NAME
	FROM item_mast AS I
	INNER JOIN company_mast AS C ON I.PRO_COM = C.COM_ID;

--23 . Write a SQL query to display the average price of items of each company, showing the name of the company. 
	SELECT AVG(pro_price), company_mast.com_name
	FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id
    GROUP BY company_mast.com_name;

--24 . Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350.
	SELECT AVG(pro_price), company_mast.com_name
	FROM item_mast INNER JOIN company_mast ON item_mast.pro_com= company_mast.com_id
    GROUP BY company_mast.com_name
	HAVING AVG(pro_price)>=350;

--25 . Write a SQL query to display the name of each company along with the ID and price for their most expensive product.
	SELECT  MAX(p.pro_price) AS MAXVAL , P.PRO_COM , C.COM_NAME  
	FROM item_mast  AS P
	INNER JOIN company_mast AS C ON C.COM_ID = P.PRO_COM
	GROUP BY P.PRO_COM , C.COM_NAME 
	ORDER BY MAX(p.pro_price) DESC;

--26 . Write a query in SQL to display all the data of employees including their department
	SELECT E.*, ED.DPT_NAME
	FROM emp_details AS E
	INNER JOIN emp_department AS ED ON E.EMP_DEPT = ED.DPT_CODE;

--27 . Write a query in SQL to display the first name and last name of each employee, along with the name and sanction amount for their department.
	SELECT E.EMP_FNAME , E.EMP_LNAME , ED.DPT_NAME , ED.DPT_ALLOTMENT
	FROM emp_details AS E
	INNER JOIN emp_department AS ED ON E.EMP_DEPT = ED.DPT_CODE;

--28 . Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000. 
	SELECT E.EMP_FNAME , E.EMP_LNAME , ED.DPT_NAME , ED.DPT_ALLOTMENT
	FROM emp_details AS E
	INNER JOIN emp_department AS ED ON E.EMP_DEPT = ED.DPT_CODE
	WHERE ED.DPT_ALLOTMENT > 50000;

--29 . Write a query in SQL to find the names of departments where more than two employees are working.
	SELECT emp_department.DPT_NAME
	FROM emp_department 
	JOIN emp_details ON emp_department.DPT_CODE = emp_details.EMP_DEPT
	GROUP BY emp_department.DPT_NAME
	HAVING COUNT(*) > 2;

--30 . Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'
	SELECT O.*,S.NAMES
	FROM ORDERS AS O
	INNER JOIN salesman AS S ON O.salesman_id = S.SALESMAN_ID
	WHERE S.NAMES = 'Paul Adam';

--31 . Write a query to display all the orders for the salesman who belongs to the city London.
	SELECT O.*,S.NAMES , S.CITY
	FROM ORDERS AS O
	INNER JOIN salesman AS S ON O.salesman_id = S.SALESMAN_ID
	WHERE S.CITY = 'London';

--32 . Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.
	SELECT O.*,S.NAMES , S.CITY 
	FROM ORDERS AS O
	INNER JOIN salesman AS S ON O.salesman_id = S.SALESMAN_ID
	WHERE customer_id = 3007;

--33 . Write a query to display all the orders which values are greater than the average order value for 10th October 2012.
	SELECT *FROM orders
	WHERE ord_date = '2012-10-10' AND purch_amt > (
	SELECT AVG(purch_amt)
	FROM orders
	WHERE ord_date = '2012-10-10'
	)

--34 . Write a query to find all orders attributed to a salesman in New york.
	SELECT O.ord_date , O.ord_no,S.NAMES , S.CITY
	FROM ORDERS AS O
	INNER JOIN salesman AS S ON O.salesman_id = S.SALESMAN_ID
	WHERE S.CITY = 'New York';

--35 . Write a query to count the customers with grades above New York's average
	SELECT grade, COUNT (*)
	FROM customer
	GROUP BY grade
	HAVING grade >
		(SELECT AVG(grade)
		 FROM customer
		 WHERE city = 'New York');

--36 . Write a query to display all the customers with orders issued on date 17th August, 2012
	SELECT O.ord_no , O.ord_date , C.cust_name
	FROM orders AS O
	INNER JOIN customer AS C ON O.customer_ID = C.customer_id
	WHERE O.ord_date = '  2012-08-17';

--37 . Write a query to find the name and numbers of all salesmen who had more than one customer. 
	SELECT S.NAMES, COUNT(C.customer_id) as customer_count
	FROM salesman S
	JOIN customer C ON S.salesman_id = C.salesman_id
	GROUP BY S.NAMES
	HAVING COUNT(C.customer_id) > 1;

--38 . Write a query to find all orders with order amounts which are above-average amounts for their customers.
	SELECT o.*
	FROM orders AS o
	WHERE purch_amt > (
	  SELECT AVG(purch_amt)
	  FROM orders
	  WHERE customer_id = o.customer_id
	)

--39 . Write a queries to find all orders with order amounts which are on or above-average amounts for their customers.  
	SELECT o.*
	FROM orders AS o
	WHERE purch_amt >= (
	  SELECT AVG(purch_amt)
	  FROM orders
	  WHERE customer_id = o.customer_id
	)
--40 . Write a query to find the sums of the amounts from the orders table, grouped by date, eliminating all those dates where the sum was not at least 1000.00 above the maximum order amount for that date
	SELECT ord_date, SUM(purch_amt) as total_amount
	FROM orders
	GROUP BY ord_date
	HAVING SUM(purch_amt) >= (SELECT MAX(purch_amt) + 1000.00 
	FROM orders o2 
	WHERE o2.ord_date = orders.ord_date);

--41 . Write a query to extract the data from the customer table if and only if one or more of the customers in the customer table are located in London. 
	SELECT *
	FROM customer
	INNER JOIN salesman ON customer.salesman_id = salesman.salesman_id
	WHERE customer.city = 'London';

--42 . Write a query to find the salesmen who have multiple customers.
	SELECT salesman_id, COUNT(*) as customer_count 
	FROM customer
	GROUP BY salesman_id 
	HAVING COUNT(*) > 1;


--43 . Write a query to find all the salesmen who worked for only one customer
	SELECT salesman_id, COUNT(*) as customer_count 
	FROM customer
	GROUP BY salesman_id 
	HAVING COUNT(*) = 1;

--44 . Write a query that extract the rows of all salesmen who have customers with more than one orders.
	Select O.salesman_id, O.customer_id,Count(O.customer_id) As No_Of_Orders
	From Orders As O
	Group By salesman_id,O.customer_id
	Having Count(O.customer_id)>1

--45 . Write a query to find salesmen with all information who lives in the city where any of the customers lives. 
	SELECT *
	FROM salesman 
	WHERE city=ANY
		(SELECT city
		 FROM customer);


--46 . Write a query to find all the salesmen for whom there are customers that follow them.
	SELECT DISTINCT s.NAMES
	FROM salesman s
	WHERE EXISTS (
	  SELECT 1
	  FROM customer c
	  WHERE c.salesman_id = s.salesman_id
	)

--47 . Write a query to display the salesmen which name are alphabetically lower than the name of the customers.
	SELECT DISTINCT S.*
	FROM salesman S
	INNER JOIN customer b ON S.NAMES < b.cust_name;


--48 . Write a query to display the customers who have a greater gradation than any customer who belongs to the alphabetically lower than the city New York.
	SELECT DISTINCT C.*
	FROM customer C
	INNER JOIN customer sub
	   ON C.grade > sub.grade
	   AND sub.city < 'New York';


--49 . Write a query to display all the orders that had amounts that were greater than at least one of the orders on September 10th 2012. 
	SELECT purch_amt , ord_date , salesman_id
	FROM orders
	WHERE purch_amt > ANY (
	SELECT purch_amt FROM Orders WHERE ord_date = '2012-09-10');

--50 . Write a query to find all orders with an amount smaller than any amount for a customer in London.
	SELECT purch_amt , ord_date , salesman_id
	FROM orders
	WHERE purch_amt > ANY (
	SELECT NAMES FROM salesman);

--51 . Write a query to display all orders with an amount smaller than any amount for a customer in London.
	SELECT *
	FROM orders
	WHERE purch_amt < (
	  SELECT MIN(purch_amt)
	  FROM orders
	  JOIN customer ON orders.customer_id = customer.customer_id
	  WHERE customer.city = 'London'
	)

--52 . Write a query to display only those customers whose grade are, in fact, higher than every customer in New York. 
	SELECT *
	FROM customer 
	WHERE grade > (
	  SELECT MAX(grade)
	  FROM customer
	  WHERE city = 'New York'
	)

--53 . Write a query to find only those customers whose grade are, higher than every customer to the city New York. 
	SELECT c1.*
	FROM customer AS c1
	WHERE c1.grade > ALL (
	  SELECT c2.grade
	  FROM customer AS c2
	  WHERE c2.city = 'New York'
	)

--54 . Write a query to get all the information for those customers whose grade is not as the grade of customer who belongs to the city London
	SELECT *
	FROM customer
	WHERE grade != (
	  SELECT MAX(grade)
	  FROM customer
	  WHERE city = 'London'
	)

--55 . Write a query to find all those customers whose grade are not as the grade, belongs to the city Paris.
	SELECT *
	FROM customer
	WHERE grade NOT IN (
	  SELECT grade
	  FROM customer
	  WHERE city = 'Paris'
	)

--56 . Write a query to find all those customers who hold a different grade than any customer of the city Dallas.
	SELECT *
	FROM customer
	WHERE NOT grade = ANY (
	  SELECT TOP 1 grade
	  FROM customer
	  WHERE city = 'Dallas'
	  ORDER BY grade DESC
	)

--57 . Write a SQL query to find the average price of each manufacturer's products along with their name.
	SELECT CM.COM_NAME ,AVG(IM.PRO_PRICE) AS AVG_PRICE 
	FROM item_mast IM 
	INNER JOIN company_mast CM ON IM.PRO_COM = CM.COM_ID
	GROUP BY CM.COM_NAME; 
--58 . Write a SQL query to display the average price of the products which is more than or equal to 350 along with their names.
	Select I.PRO_NAME,Avg(I.PRO_PRICE) As Avg_price
	From item_mast As I
	Group By I.PRO_NAME
	Having Avg(I.PRO_PRICE)>=350


--59 . Write a SQL query to display the name of each company, price for their most expensive product along with their Name.
	SELECT C.COM_ID,C.COM_NAME, Max(I.PRO_PRICE) As  Max_price
	FROM company_mast AS C
	INNER JOIN item_mast AS I ON C.COM_ID = I.PRO_COM
	Group By C.COM_ID,C.COM_NAME

------------------------------------------------------Querys For Task-5 Done Above ---------------------------------------------------------------------