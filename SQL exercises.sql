--exercise N1
USE Ordering;
SELECT TOP 60 PERCENT *
FROM Customer;
----
SELECT  first_name,last_name,age
FROM staff
ORDER BY  first_name ASC,last_name ASC, age DESC;
----
SELECT Customer.first_name,Customer.last_name,
Contract.amount_of_payment_Lari, Contract.debt_Lari
FROM Customer INNER JOIN Contract
ON Customer.customer_ID = Contract.staff_ID
ORDER BY Customer.first_name,Customer.last_name;
-----
SELECT MAX(age) AS [The maximum age]
FROM Staff;
--exercise N2
--WHERE N2
USE Ordering;
SELECT *
FROM Staff
WHERE city = N'Tbilisi';

--GROUP BY N1
SELECT Staff_ID, MIN(amount_of_payment_Lari) AS [ MIN Amount]
FROM Contract
GROUP BY Staff_ID;
--- HAVING CLAUSE N1
SELECT Staff_ID, MIN(amount_of_payment_Lari) AS [ MIN Amount]
FROM Contract
GROUP BY Staff_ID
HAVING MIN(amount_of_payment_Lari)< 5000;
--exercise N3
USE Ordering;
--N1
SELECT *
FROM Contract
WHERE debt_Lari =
(
SELECT MIN(debt_Lari)
FROM Contract
) ;



--N2
SET DATEFORMAT DMY;
SELECT *
FROM Customer Cu
WHERE '01-01-2011' IN
(

SELECT date_of_beginning
FROM Contract Co
WHERE Cu.Customer_ID =Co. Customer_ID
);
--exercise N4
--insert N3
USE Ordering;
INSERT INTO Customer (juridical_individual,last_name,first_name,city,region,area,mobile_of_head_company,gender,name_company,address_company,bank_account,email,company_representative,name_representative,mobile_representative)

VALUES (NULL, N'Sakvare;idze',N'Ani', N'Tbilisi', NULL, NULL, NULL, N'female',
NULL, NULL, NULL, NULL, NULL, NULL, NULL);
SELECT * FROM Customer;
--UPDATE n1
UPDATE Staff SET salary = salary+200 ;
SELECT * FROM Staff;
--exercise N5--N1 
USE Base22;
CREATE TABLE Table_3
(
table3_ID INT PRIMARY KEY IDENTITY (1,1),
co1 INT,
col2 NVARCHAR(20),
col3 FLOAT,
col4 DATETIME 

);
--N2
CREATE TABLE Table_4 (
    table4_ID INT IDENTITY(1,1) PRIMARY KEY,
    table3_ID INT NULL REFERENCES Table_3(table3_ID),
    column2 VARCHAR(100), 
	col2 NVARCHAR(20),
    col3 FLOAT,
    col4 DATETIME 
    
);
--N3
CREATE TABLE Table_5
(
table5_ID INT PRIMARY KEY IDENTITY (1,1),
table3_ID INT NULL REFERENCES Table_3(table3_ID) ON DELETE CASCADE,
col2 NVARCHAR(20),
col3 FLOAT,
col4 DATETIME
);
 
