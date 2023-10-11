USE ShopDB 
GO

-------------------------------------------------------------------------
					 /*İstifadəçi məhdudiyyətləri*/
-------------------------------------------------------------------------
	
DROP TABLE Orders;
GO
DROP TABLE Customers;
GO

CREATE TABLE Customers                
(                                      
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	-- İstifadəçi məhdudiyyəti
	Phone char(12) CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]') 
)
GO

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- Xəta.

SELECT * FROM Customers;

DROP TABLE Customers;
GO

CREATE TABLE Customers                
(                                      
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12) UNIQUE -- UNIQUE (alternariv açar), xanada olan məlumatlar unikal olmalıdır
)
GO

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******');

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231213'); 

SELECT * FROM Customers;

DROP TABLE Customers;
GO

-- Ixtiyari ardıcıllıqda bir neçə məhdudiyyət yaratmaq olar
CREATE TABLE Customers                
(                                      
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12) UNIQUE CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')		            
)
GO


INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- Xəta (Şablona uyğun deyil).

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212'); -- Xəta (Təkrarlanan məlumatlar).

SELECT * FROM Customers;

DROP TABLE Customers;
GO

CREATE TABLE Customers                
(                                      
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12)             
)
GO


-- Cari cədvəldə məhdudiyyətin yaradılması
ALTER TABLE Customers
ADD CONSTRAINT CN_CustomersPhoneNo 
-- CHECK məhdudiyyəti
CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')	 
GO

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)1231212');

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- Xəta (Şablona uyğun deyil).

-------------------------------------------------------------------------

ALTER TABLE Customers
NOCHECK CONSTRAINT CN_CustomersPhoneNo;		-- CHECK məhdudiyyətinin deaktiv edilməsi

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******');

-------------------------------------------------------------------------

ALTER TABLE Customers
CHECK CONSTRAINT CN_CustomersPhoneNo;		-- CHECK məhdudiyyətinin aktiv edilməsi


INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******'); -- Xəta (Şablona uyğun deyil).

--------------------------------------------------------------------------
ALTER TABLE Customers
DROP CONSTRAINT	CN_CustomersPhoneNo;		--  CHECK məhdudiyyətinin silinməsi

INSERT INTO Customers
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Alex', 'NewSTR', 'City', 'dfgjs@mail.ru', '(093)*******');


--  Silinəndən sonra CHECK məhdudiyyənin geri qaytarmaq mümkün deyil
ALTER TABLE Customers
CHECK CONSTRAINT CN_CustomersPhoneNo;		