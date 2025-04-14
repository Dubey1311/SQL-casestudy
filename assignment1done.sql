CREATE TABLE Salesman(SalesmanId INT,Name VARCHAR(255),Commission DECIMAL(10,2),City VARCHAR(255),
Age INT);
INSERT INTO Salesman SELECT 101,'Joe',50,'California',17
INSERT INTO Salesman SELECT 102,'Simon',70,'Texas',25
INSERT INTO Salesman SELECT 103,'Jessie',105,'Florida',35
INSERT INTO Salesman SELECT 104,'Danny',100,'Texas',22
INSERT INTO Salesman SELECT 105,'Lia',65,'New Jersey',30

CREATE TABLE Customer(SalesmanId INT,CustomerId INT,CustomerName VARCHAR(255),PurchaseAmount INT)
INSERT INTO Customer(SalesmanId,CustomerId,CustomerName,PurchaseAmount)
VALUES(101,2345,'Andrew',550)
INSERT INTO Customer(SalesmanId,CustomerId,CustomerName,PurchaseAmount)
VALUES(103,1575,'Lucky',4500)
INSERT INTO Customer(SalesmanId,CustomerId,CustomerName,PurchaseAmount)
VALUES(104,2345,'Andrew',4000)
INSERT INTO Customer(SalesmanId,CustomerId,CustomerName,PurchaseAmount)
VALUES(107,3747,'Remona',2700)
INSERT INTO Customer(SalesmanId,CustomerId,CustomerName,PurchaseAmount)
VALUES(110,4004,'Julia',4545)

CREATE TABLE Orders(OrderId INT, customerId INT,SalesmanId INT,Orderdate Date,Amount MONEY)
INSERT INTO Orders SELECT 5001,2345,101,'2021-07-01',550
INSERT INTO Orders SELECT 5003,1234,105,'2022-02-14',1500


--1.Insert a new record in your Orders table.

INSERT INTO Orders
SELECT 5006,2145,103,'2022-04-15',7500

SELECT * FROM  Orders

--2.Add Primary key constraint for SalesmanId column in Salesman table. Add default
--constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
--column in Customer table. Add not null constraint in Customer_name column for the Customer table.

ALTER TABLE Salesman ALTER COLUMN SalesmanId INT NOT NULL

ALTER TABLE Salesman ADD PRIMARY KEY (SalesmanId)

ALTER TABLE Salesman ADD DEFAULT 'Mexico' FOR City

ALTER TABLE Customer WITH NOCHECK ADD FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId)

ALTER TABLE Customer ALTER COLUMN CustomerName VARCHAR(255) NOT NULL

sp_help Customer

sp_help Salesman

SELECT * FROM Salesman 
SELECT * FROM Customer

--3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
--amount value greater than 500.

SELECT * FROM Customer WHERE PurchaseAmount>500 AND CustomerName LIKE '%N'


--4. Using SET operators, retrieve the first result with unique SalesmanId values from two
--tables, and the other result containing SalesmanId with duplicates from two tables.

SELECT SalesmanId FROM Salesman
UNION
SELECT SalesmanId FROM Customer

SELECT SalesmanId FROM Salesman
UNION ALL
SELECT SalesmanId FROM Customer

--5. Display the below columns which has the matching data.
--Orderdate, Salesman Name, Customer Name, Commission, and City which has the
--range of Purchase Amount between 500 to 1500.

SELECT Orderdate,Name,CustomerName,Commission,City FROM Salesman AS S 
JOIN Customer AS C ON S.SalesmanId=C.SalesmanId JOIN Orders AS O ON C.SalesmanId=O.SalesmanId
WHERE PurchaseAmount BETWEEN 500 AND 1500


--6. Using right join fetch all the results from Salesman and Orders table.

SELECT * FROM Salesman AS S RIGHT JOIN Orders AS O ON S.SalesmanId=O.SalesmanId
