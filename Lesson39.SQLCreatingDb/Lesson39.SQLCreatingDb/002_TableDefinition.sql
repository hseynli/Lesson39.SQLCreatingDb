USE ShopDB
GO

-------------------------------------------------------------------------
						/* Cədvəlin yaradılması */
-------------------------------------------------------------------------

DROP TABLE Customers; -- DROP TABLE - cədvəlin silinmə operatoru
GO

CREATE TABLE Customers                 
(	-- IDENTITY açar sözü identifikator sütunu yaradır. (seed = 1, step = 2)
	CustomerNo int IDENTITY(1, 2) NOT NULL,  
	CustomerName varchar(25) NOT NULL,   
	Address1 varchar(25) NOT NULL,
	Address2 varchar(25) DEFAULT 'Unknown', -- DEFAULT açar sözü default dəyər mənimsədir.
	City varchar(15) NOT NULL,
	[State] char(2) NOT NULL,
	Zip varchar(10) NOT NULL,
	Contact varchar(25) NOT NULL,
	Phone char(10) NOT NULL,
	FedIDNo  varchar(10) NOT NULL,
	DateInSystem smalldatetime NOT NULL 
);
GO

DROP TABLE Customers;
GO

CREATE TABLE Customers                 
(	-- IDENTITY açar sözü identifikator sütunu yaradır. (seed = 1, step = 2)
	CustomerNo int IDENTITY(1, 2) NOT NULL,  
	CustomerName varchar(25) NOT NULL,   
	Address1 varchar(25) NOT NULL,
	Address2 varchar(25) DEFAULT 'Unknown', -- DEFAULT açar sözü default dəyər mənimsədir.
	City varchar(15) NOT NULL,
	[State] char(2) NOT NULL,
	Zip varchar(10) NOT NULL,
	Contact varchar(25) NOT NULL,
	Phone char(10) NOT NULL,
	FedIDNo  varchar(10) NOT NULL,
	DateInSystem smalldatetime NOT NULL 
)
WITH (DATA_COMPRESSION = ROW); -- sətirləri sıxmaqla cədvəl yaratmaq (SQL Express-də işləmir)
GO

INSERT INTO Customers 
(CustomerName, Address1, City, [State], Zip, Contact, Phone, FedIDNo, DateInSystem)
VALUES
('Jeremy', 'new str', 'NewCity', 'ds', 'newZIP', 'newContact', '0567878932', 'NewIDNO', GETDATE());
GO

SELECT * FROM Customers;
GO

-------------------------------------------------------------------------
						/* Cədvəlin dəyişdirilməsi */
-------------------------------------------------------------------------

-- Customers cədvəlini dəyişirik, 
-- NewFild adlı sütun əlavə edirik

ALTER TABLE Customers -- ALTER TABLE operatoru cədvəli dəyişir
ADD                   -- ADD - əlavə edir
NewFild int NULL      -- sütun.
GO


SELECT * FROM Customers;
GO

-- Customers cədvəlini dəyişirik, 
-- NewFild adlı sütunu silirik

ALTER TABLE Customers -- ALTER TABLE operatoru cədvəli dəyişir
DROP COLUMN           -- DROP COLUMN - silir
NewFild               -- sütun.
GO

SELECT * FROM Customers;
GO

ALTER TABLE Customers 
ADD					 
NewFild2 varchar(10) NOT NULL 
-- Default dəyər olmadan NOT NULL olan sütun əlavə etmək mümkün deyil.
GO

ALTER TABLE Customers 
ADD						
NewFild2 varchar(10) NOT NULL 
DEFAULT 'Unknown'
GO

SELECT * FROM Customers
GO