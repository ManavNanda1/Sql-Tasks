------------------------------------------------------------Task-6 Of SQL(Store-Procedure)----------------------------------------------------------------
USE MN323ManavNanda;

-- Create the customers table
CREATE TABLE customers3(
  id INT PRIMARY KEY,
  names VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  PhoneNo INT,
  TotalBalance INT
);

-- Insert 20 records into the customers table
INSERT INTO customers3 (id, names , email,PhoneNo)
VALUES
  (1, 'Manav Nanda', 'nandamanav@gmail.com',8780160),
  (2, 'Yash Nanda','Yash@gmail.com',1234567),
  (3, 'Jay Nanda','Jay@gmail.com',789456),
  (4, 'Hiral Nanda','hiral@gmail.com',145789),
  (5, 'Rushik Jethva','rushik@gmail',7878946),
  (6, 'Jay Patel','jay@gmail',145238),
  (7, 'Sanjay Nagar','sanjay@gmail.com',4578123),
  (8, 'Sanjay Prajapati','sanjay@gm',45457876),
  (9, 'Darshan Jabuani','darshan@gmail',1234785),
  (10, 'Hemang Dholu','hemang@gmail.com',4548789),
  (11, 'Ram Pithiya' , 'Ram@gmail',4457979),
  (12, 'Nilkanth Tandel','nt@gmail',4547878),
  (13, 'Krunal Jagani','kj@gmail.com',454578),
  (14, 'Osama Bin Laden' , 'obn@gmail.com',5578887),
  (15, 'Akshay Kumar','ak@gmail.com',36994467),
  (16, 'Selmon Bhoi','Sb@gmail.com',112887),
  (17, 'SRK' , 'srk@gmail.com',5548878),
  (18, 'NTR' , 'NTR@gmail.com',555454),
  (19, 'Thalapathy Vijay' , 'TV@gmail.com',664748),
  (20, 'Ram Charan' , 'RC@gmail.com',999995);


-- Create the products table
CREATE TABLE products3 (
  id INT PRIMARY KEY,
  names VARCHAR(255),
  price DECIMAL(10,2),
  customer_id INT
  FOREIGN KEY (customer_id) REFERENCES customers3(id),
);

-- Insert 20 records into the products table
INSERT INTO products3 (id, names, price,customer_id)
VALUES
  (1, 'Dal Makhani', 0.99,2),
  (2, 'Paneer Butter Masala', 1.50,1),
  (3, 'Paneer Lababdar', 0.50,3),
  (4, 'Garlic Nan', 2.50,4),
  (5, 'Dal Bati', 3.00,5),
  (6, 'Paneer Sandwich', 1.99,6),
  (7, 'Vegetable Sandwich', 2.49,1),
  (8, 'Gughra Sandwich', 3.99,4),
  (9, 'Schezwan Noodles', 2.99,9),
  (10, 'Maggi', 4.99,10),
  (11, 'Manchurian', 1.79,12),
  (12, 'Momo', 0.89,17),
  (13, 'Bateta Shak', 1.29,19),
  (14, 'Butter Roti', 1.99,12),
  (15, 'Butter Tandoori roti', 0.69,18),
  (16, 'Laccha Paratha', 0.79,17),
  (17, 'Chaas', 1.49,10),
  (18, 'hyderabadi Biryani', 1.19,20),
  (19, 'Vegatable Biryani', 5.99,2),
  (20, 'Gulab Jamun', 3.99,1);


-- Create the orders table
CREATE TABLE orders3 (
  id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  Ord_date date,
  FOREIGN KEY (customer_id) REFERENCES customers3(id),
  FOREIGN KEY (product_id) REFERENCES products3(id)
);

-- Insert 20 records into the orders table, referencing customers and products
INSERT INTO orders3 (id, customer_id, product_id ,quantity,Ord_date )
VALUES
  (1, 1, 2 ,3 ,'2022-9-12'),
  (2, 1, 5,3 ,'2021-9-12'),
  (3, 2, 4,5 , '2022-4-12'),
  (4, 2, 9,1 , '2022-9-10'),
  (5, 3, 1,2 , '2022-05-12'),
  (6, 3, 6,3 , '2022-12-11'),
  (7, 4, 7,2 , '2020-09-12'),
  (8, 4, 3,6 , '2012-09-2'),
  (9, 5, 8,3 , '2022-05-12'),
  (10, 5, 10,1 , '2012-11-12'),
  (11, 6, 14,5 , '2021-09-12'),
  (12,7 ,16,0 , '2020-07-12'),
  (13, 9 , 15,1 , '2022-09-4'),
  (14, 11 , 12,0 , '2013-09-5'),
  (15, 13 , 13,15 , '2014-4-12'),
  (16,17,17,8,'2011-02-12'),
  (17 ,4 , 19,9 , '2022-09-12'),
  (18,3,10,2, '2022-09-7'),
  (19,3,12,23 , '2022-11-12'),
  (20,5,10,12 , '2022-01-12');

---------------------------------------------------------- Table Creation And Insertion Of Value Done Above ------------------------------------------------------

---------------------------------------------------------- Main Query Starts Below ------------------------------------------------------------------------

--1.Create a stored procedure called "get_customers" that returns all customers from the "customers" table.
	CREATE PROCEDURE get_customers
	AS
	BEGIN
	SELECT * FROM customers3;
	END;

	EXEC get_customers;

--2.Create a stored procedure called "get_orders" that returns all orders from the "orders" table.
	CREATE PROCEDURE get_orders
	AS
	BEGIN
	SELECT * FROM orders3;
	END;

	EXEC get_orders;

--3.Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and returns the details of that order (i.e., the products and quantities).
	CREATE PROCEDURE get_order_details
    @order_id INT
	AS
	BEGIN
	SELECT P.names , P.price , O.quantity , o.id 
	FROM orders3 AS O
	INNER JOIN products3 AS P ON
	P.id = O.product_id
	WHERE o.id = @order_id
	END

	EXEC get_order_details 5;

--4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer.
	CREATE PROCEDURE get_customer_orders
    @cust_id INT
	AS
	BEGIN
	SELECT C.id ,C.names , O.id
	FROM customers3 AS C
	INNER JOIN orders3 AS O
	ON C.id = O.customer_id
	WHERE O.customer_id = @cust_id;
	END

	EXEC get_customer_orders 5;

--5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order.
	CREATE PROCEDURE get_order_total
	@order_id INT
	AS
	BEGIN
	SELECT O.id , P.price AS Amount
	FROM orders3 AS O
	INNER JOIN products3 AS P
	ON O.id = P.id
	WHERE O.id = @order_id;
	END

	EXEC get_order_total 5;

--6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table.
	CREATE PROCEDURE get_product_list
	AS
	BEGIN
	SELECT *FROM products3;
	END

	EXEC get_product_list;

--7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.
	CREATE PROCEDURE get_product_info
	@Product_id INT
	AS
	BEGIN
	SELECT P.id , P.names , P.price
	FROM products3 AS P
	WHERE P.id = @Product_id;
	END

	EXEC get_product_info 3;

--8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer.
	CREATE PROCEDURE get_customer_info
	@cust_id INT
	AS
	BEGIN
	SELECT * FROM customers3 WHERE id = @cust_id;
	END

	EXEC get_customer_info 3;

--9.Create a stored procedure called "update_customer_info" that accepts a customer ID and new information as parameters and updates the customer's information in the "customers" table.
	CREATE PROCEDURE update_customer_info
	@cust_id INT,
	@name VARCHAR(260),
	@email VARCHAR(230),
	@PhoneNo INT
	AS
	BEGIN
	UPDATE customers3 
	SET names = @name , Email = @email , PhoneNo = @PhoneNo
	WHERE id = @cust_id;
	END

	EXEC update_customer_info 4,'Michael Jakson','MJ@gmail.com',457845;

--10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.
	CREATE PROCEDURE delete_customer
	@cust_id INT
	AS
	BEGIN
	DELETE FROM orders3 WHERE customer_id = @cust_id;
	DELETE FROM customers3 WHERE id = @cust_id;
	END

	EXEC delete_customer 4;

--11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.
	CREATE PROCEDURE get_order_count
	@cust_id INT
	AS
	BEGIN
	SELECT Count(id) AS TotalOrder , customer_id 
	FROM orders3 
	WHERE customer_id = @cust_id 
	GROUP BY customer_id;
	END

	EXEC get_order_count 5;

--12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).
	CREATE PROCEDURE get_customer_balance
	@cust_id INT
	AS
	BEGIN
	SELECT  C.names,(C.TotalBalance - P.Price) AS AmoutLeft
	FROM customers3 AS C
	INNER JOIN products3 AS P ON C.id = P.customer_id
	WHERE C.id = @cust_id
	END

	EXEC get_customer_balance 20;

--13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.
	CREATE PROCEDURE get_customer_payments
	@cust_id INT
	AS
	BEGIN
	SELECT C.names , P.names , P.price
	FROM customers3 AS C
	INNER JOIN products3 AS P
	ON C.id = P.customer_id
	WHERE C.id = @cust_id;
	END

	EXEC get_customer_payments 1;

--14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.
	CREATE PROCEDURE add_customer
	@name VARCHAR(250),
	@email VARCHAR(260),
	@PhoneNo INT
	AS
	BEGIN
	INSERT INTO customers3(id,names,Email,PhoneNo,TotalBalance)
	VALUES(21,@name,@email,@PhoneNo,19029);
	END

	EXEC add_customer 'Don','Don@gmail.com',12122121;

--15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.
	CREATE PROCEDURE get_top_products
	AS
	BEGIN
	SELECT TOP 10  P.price * O.quantity AS TotalSales FROM orders3 AS O 
	INNER JOIN products3 AS P ON P.id = O.product_id
	ORDER BY P.price * O.quantity DESC;
	END

	EXEC get_top_products;

--16.Create a stored procedure called "get_product_sales" that accepts a product ID as a parameter and returns the total sales volume for that product.
	CREATE PROCEDURE get_product_sales
	@pro_id INT
	AS
	BEGIN
	SELECT P.price * O.quantity AS TotalSales FROM orders3 AS O 
	INNER JOIN products3 AS P ON P.id = O.product_id
	WHERE p.id = @pro_id;
	END

	EXEC get_product_sales 1;

--17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as parameters and returns all orders for that customer within the specified date range.
	CREATE PROCEDURE get_customer_orders_by_date
	@cust_id INT,
	@datestart DATE,
	@dateend DATE
	AS
	BEGIN
	SELECT * FROM orders3 
	WHERE ord_date BETWEEN @datestart AND @dateend AND customer_id = @cust_id;
	END

	EXEC get_customer_orders_by_date 5 , '2021-4-12' , '2022-12-30';

--18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and returns the details of that order within the specified date range.
	CREATE PROCEDURE get_order_details_by_date
	@id INT,
	@datestart DATE,
	@dateend DATE
	AS
	BEGIN
	SELECT * FROM orders3 
	WHERE ord_date BETWEEN @datestart AND @dateend AND customer_id = @id;
	END

	EXEC get_order_details_by_date 1,'2021-4-12' , '2022-12-30';

--19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales volume for that product within the specified date range.
	CREATE PROCEDURE get_product_sales_by_date
	@pro_id INT,
	@datestart DATE,
	@dateend DATE
	AS
	BEGIN
	SELECT product_id,Sum(quantity) AS TotalSales FROM Orders3
	WHERE Ord_date BETWEEN @datestart AND  @dateend AND product_id = @pro_id group by product_id ;
	END

	EXEC get_product_sales_by_date 5, '2021-04-12' , '2022-12-30';

--20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's balance within the specified date range.
	CREATE PROCEDURE get_customer_balance_by_date
	@cust_id INT,
	@datestart DATE,
	@dateend DATE
	AS
	BEGIN
	SELECT C.names, SUM(C.Totalbalance) AS Balance FROM orders3 AS O
	INNER JOIN customers3 AS C ON C.id = O.customer_id
	WHERE C.id = @CUST_ID AND O.ord_date BETWEEN @datestart AND @dateend
	GROUP BY C.names
	END

	EXEC get_customer_balance_by_date 5,'2021-4-12' , '2022-12-30';

--21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters and adds a new order to the "orders" table.
	CREATE PROCEDURE add_order
	@cust_id INT,
	@amount INT,
	@ord_date DATE
	AS
	BEGIN
	INSERT INTO  orders3(id, customer_id, product_id , quantity, ord_date)
	VALUES(21,@cust_id,20,@amount,@ord_date);
	END

	EXEC add_order 20,4,'2023-03-20';

--22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and updates the total amount of the order in the "orders" table.
	CREATE PROCEDURE update_order_total
	@ord_id INT,
	@totalamount DECIMAL(8,3)
	AS
	BEGIN
	UPDATE orders3 SET quantity= @totalamount WHERE id = @ord_id;
	END

	EXEC update_order_total 3,1200.201;

--23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.
	CREATE PROCEDURE delete_order
	@orderid INT
	AS
	BEGIN
	DELETE FROM orders3 WHERE id = @orderid;
	END

	EXEC delete_order 4;


----------------------------------------------------------- 23 Querys For Store-Procedure Done Above --------------------------------------------------------------