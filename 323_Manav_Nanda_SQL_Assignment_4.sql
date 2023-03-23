-------------------------------------------------- -----------Joins Practice Below --------------------------------------------------------------------------------------------------
USE MN323ManavNanda;

-------------------------------------------------------------- Creation Of Table And Insertion Of Values Below ----------------------------------------------------------------------

CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    ReportsTo INT,
    Address VARCHAR(100)
);

INSERT INTO Employees2 (EmployeeID,FirstName,LastName, Title, BirthDate, HireDate, ReportsTo, Address)
VALUES (1, 'Manav', 'Nanda', 'Full-Stack-Developer', '2002-04-24', '2023-01-23', NULL, 'PrahladNagar Ahmedabad'),
       (2, 'Rushik', 'Jetva', 'Dynamic CRM 365', '2001-04-10', '2021-01-23', 1, 'Mansi Circle Ahmedabad'),
       (3, 'Jay', 'Patel', 'Full-Stack-Developer', '2002-01-20', '2019-02-01', 1, 'Gota Ahmedabad'),
       (4, 'Sanjay', 'Nagar', 'Dynamic CRM 365', '1995-07-25', '2020-07-01', 2, 'Karachi Pakistan'),
       (5, 'Darshan', 'Jabuani', 'Human Resource', '2000-09-30', '2021-01-01', 1, 'Bhuj Gujarat ');


CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers2(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees2(EmployeeID)
);

INSERT INTO Orders2 (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES (1, 1, 1, '2022-01-01'),
       (2, 2, 3, '2022-02-15'),
       (3, 3, 5, '2022-03-01'),
       (4, 3, 5, '2022-04-15'),
       (5, 5, 4, '2022-05-01');		  


CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(50),
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Customers2 (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country)
VALUES (1, 'Shaligram Infotech', 'ABC', 'CEO', 'AMBLI CROSS ROAD AHMEDABAD', 'AHMEDABAD', 'India'),
       (2, 'RapidOps', 'Jay', 'Manager', 'Satelite', 'AHMEDABAD', 'India'),
       (3, 'IndexNine', 'Alok Verma', 'Marketing Director', 'New Chowk Pune', 'Pune', 'India'),
       (4, 'Karachi Analysts', 'Sanjay Nagar', 'Account Manager', 'Osama Bin Laden Street', 'Karachi', 'Pakistan'),
       (5, 'UVW Solutions', 'Rahul Sharma', 'Business Analyst', '234 Fourth Ave, Pune', 'Pune', 'India');

------------------------------------------------------------------- Creation Of Insertion Of Values In Table Done Above ---------------------------------------------------------------

------------------------------------------------------- ------------------------Query Starts Below -----------------------------------------------------------------------------------

--(1)Write a SQL query to retrieve the list of all orders made by customers in the "USA".
	SELECT Ord.*
	FROM Orders2 AS Ord
	INNER JOIN Customers2 AS Cust ON Ord.CustomerID = Cust.CustomerID
	WHERE Cust.Country = 'Pakistan';

--(2)Write a SQL query to retrieve the list of all customers who have placed an order.
	SELECT Cust.*
	FROM Customers2 AS Cust
	INNER JOIN Orders2 AS Ord ON Cust.CustomerID = Ord.CustomerID;

--(3)Write a SQL query to retrieve the list of all employees who have not yet placed an order.
	SELECT EmployeeID
	FROM Employees2
	WHERE EmployeeID Not In
	(SELECT EmployeeID FROM Orders2)

--(4)Write a SQL query to retrieve the list of all employees who have placed an order.
	SELECT E.*
	FROM Employees2 AS E
	INNER JOIN Orders2 AS Ord ON E.EmployeeID = Ord.EmployeeID;

--(5)Write a SQL query to retrieve the list of all Customer who have not yet placed an order.
	SELECT CustomerID
	FROM Customers2
	WHERE CustomerID Not In
	(SELECT CustomerID FROM Orders2)

--(6)Write a SQL query to retrieve the list of all customers who have placed an order, along with the order date.
	SELECT DISTINCT Cust.* , Ord.OrderDate
	FROM Customers2 AS Cust
	INNER JOIN Orders2 AS Ord ON Cust.CustomerID = Ord.CustomerID;

--(7)Write a SQL query to retrieve the list of all orders placed by a particular customer.
	SELECT Cust.*
	FROM Customers2 AS Cust
	INNER JOIN Orders2 AS Ord ON Cust.CustomerID = Ord.CustomerID
	WHERE Cust.ContactName = 'ABC';

--(8)Write a SQL query to retrieve the list of all customers who have not yet placed an order, sorted by their country.
	SELECT CustomerID , Country
	FROM Customers2
	WHERE CustomerID Not In
	(SELECT CustomerID FROM Orders2)
	ORDER BY Country;

--(9)Write a SQL query to retrieve the list of all orders placed by customers in the "USA", sorted by order date.
	SELECT  ORD.*
	FROM ORDERS2 AS ORD
	INNER JOIN CUSTOMERS2 AS C ON ORD.CustomerID = C.CustomerID
	WHERE C.Country = 'India'
	ORDER BY ORD.OrderDate;

--(10)Write a SQL query to retrieve the list of all employees who have not yet placed an order, sorted by last name.
	SELECT EmployeeID
	FROM Employees2
	WHERE EmployeeID Not In
	(SELECT EmployeeID FROM Orders2)
	ORDER BY LastName;

--(11)Write a SQL query to retrieve the list of all customers who have placed an order, sorted by their company name.
	SELECT Ord.*,Cust.CompanyName
	FROM Orders2 AS Ord
	INNER JOIN Customers2 AS Cust ON Ord.CustomerID = Cust.CustomerID
	WHERE Cust.Country = 'India'
	ORDER BY Cust.CompanyName;

--(12)Write a SQL query to retrieve the list of all employees who have placed an order, sorted by their hire date.
	SELECT DISTINCT E.*
	FROM Employees2 AS E
	INNER JOIN Orders2 AS Ord ON E.EmployeeID = Ord.EmployeeID
	ORDER BY E.Hiredate;

--(13)Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, sorted by their company name.
	SELECT C.* , O.OrderDate
	FROM Customers2 AS C
	INNER JOIN Orders2 AS O ON C.CustomerID = O.CustomerID
	WHERE O.OrderDate = '2022-03-01'
	ORDER BY C.CompanyName;

--(14)Write a SQL query to retrieve the list of all customers who have placed an order, along with the employee who handled the order.
	SELECT C.* , O.OrderDate, O.EmployeeID
	FROM Customers2 AS C
	INNER JOIN Orders2 AS O ON C.CustomerID = O.CustomerID;

--(15)Write a SQL query to retrieve the list of all employees who have placed an order, along with the customer who placed the order.
	SELECT DISTINCT E.* , C.CustomerID, C.CompanyName 
	FROM Employees2 AS E
	INNER JOIN Orders2 AS Ord ON E.EmployeeID = Ord.EmployeeID
	INNER JOIN Customers2 AS C ON C.CustomerID = Ord.CustomerID;

--(16)Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date.
	SELECT O.OrderDate,C.Country , C.ContactName
	FROM Orders2 As O
	INNER JOIN Customers2 AS C ON O.CustomerID = C.CustomerID
	WHERE C.Country = 'India';

--(17)Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular year, along with the employee name and order date.
	SELECT E.BirthDate , E.FirstName , E.LastName,O.Orderdate
	FROM Employees2 AS E
	INNER JOIN Orders2 AS O ON E.EmployeeID = O.EmployeeID
	WHERE E.Birthdate = '2002-04-24';

--(18)Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order.
	SELECT C.CustomerID, C.ContactName , O.OrderDate , O.EmployeeID
	FROM Customers2 AS C
	INNER JOIN Orders2 AS O ON C.CustomerID = O.CustomerID;

--(19)Write a SQL query to retrieve the list of all orders placed by customers who have a particular contact title, along with the customer name and order date.
	SELECT O.OrderID, C.ContactName , O.OrderDate,C.ContactTitle
	FROM Orders2 AS O
	INNER JOIN Customers2 AS C ON O.CustomerID = C.CustomerID
	WHERE C.ContactTitle = 'Business Analyst';

--(20)Write a SQL query to retrieve the list of all orders placed by employees who have a particular job title, along with the employee name and order date.
	SELECT O.OrderID, E.Title , O.OrderDate
	FROM Orders2 AS O
	INNER JOIN Employees2 AS E ON O.EmployeeID = E.EmployeeID
	WHERE E.Title = 'Full-Stack-Developer';

--(21)Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, along with the customer name, order date, and employee who handled the order.
	SELECT C.CustomerID, C.ContactName , O.OrderDate , O.EmployeeID
	FROM Customers2 AS C
	INNER JOIN Orders2 AS O ON C.CustomerID = O.CustomerID
	WHERE O.OrderDate ='2022-01-01';

--(22)Write a SQL query to retrieve the list of all orders placed by customers in a particular city, along with the customer name and order date.
	SELECT O.OrderID, C.ContactName , O.OrderDate
	FROM Orders2 AS O
	INNER JOIN Customers2 AS C ON O.CustomerID = C.CustomerID
	WHERE C.City = 'Karachi';

--(23)Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular city, along with the employee name and order date.
	SELECT O.OrderID, E.FirstName , E.LastName , O.OrderDate
	FROM Orders2 As O
	INNER JOIN Employees2 AS E ON O.EmployeeID = E.EmployeeID
	WHERE E.Address  LIKE '%Ahmedabad%'; 

--(24)Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order, sorted by order date.
	SELECT C.CustomerID, C.ContactName , O.OrderDate , O.EmployeeID
	FROM Customers2 AS C
	INNER JOIN Orders2 AS O ON C.CustomerID = O.CustomerID
	ORDER BY O.OrderDate;

--(25)Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date, sorted by order date.
	SELECT O.OrderID, C.ContactName , O.OrderDate
	FROM Orders2 AS O
	INNER JOIN Customers2 AS C ON O.CustomerID = C.CustomerID
	WHERE C.Country = 'India'
	ORDER BY OrderDate;

------------------------------------------------------------------------- All 25 Query Done Above -------------------------------------------------------------------------------------