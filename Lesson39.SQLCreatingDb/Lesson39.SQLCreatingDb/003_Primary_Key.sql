USE ShopDB 
GO

DROP TABLE Customers;
GO

-------------------------------------------------------------------------
--                  Primary key-in yaradılması
-------------------------------------------------------------------------

-- Primary key cədvəldə hər bir sətri müəyyən etmək üçün istifadə olunur

CREATE TABLE Customers					
(                                      
	CustomerNO int NOT NULL PRIMARY KEY, -- CustomerNO sütununda primary key yaradırıq
	CustomerName nvarchar(25) NOT NULL,
	Address1 nvarchar(25) NOT NULL,
	City     nvarchar(15) NOT NULL,
	Contact  nvarchar(25) NOT NULL,
	Phone char(12)
)
GO

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,N'Hüseynli Fərid', N'Nizami', N'Bakı', 'farid@mail.ru', '(093)1231212'),
(2,N'Abdullayev Kazım', N'Xətai', N'Bakı', 'kazim@gmail.com', '(095)2313244'); 
GO

-- Unikallığı pozmaq cəhdi.
INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,N'Nəsirov Kazım', N'Babək 12', 'Masallı', 'SemSem@mail.ru', '(063)4533272'); -- XƏTA!

SELECT * FROM Customers;

DROP TABLE Customers;
GO

-- Priamy key-i eyni zamanda bir neçə sütun üçün də yaratmaq olar,
-- İkinci primary key əlavə etmə cəhdi xətaya gətirim çıxaracaqdır.
-- Cədvəldə primary key ancaq bir dənə ola bilər (cüt və ya tək şəkildə)
CREATE TABLE Customers                
(                                      
	CustomerNo int NOT NULL,    
	CustomerName nvarchar(25) NOT NULL,
	Address1 nvarchar(25) NOT NULL,
	City      nvarchar(15) NOT NULL,
	Contact nvarchar(25) NOT NULL,
	Phone char(12) NOT NULL,
	PRIMARY KEY (CustomerNo, CustomerName) -- Cütlü şəkildə iki sütun üçün primary key yaradırıq - CustomerNo, CustomerName
)
GO

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,N'Kazımov Cavid', 'Nizami', 'Bakı', 'cavid@mail.ru', '(093)1231212'),
(2,N'Məmmədov Günəş', N'Heydər Əliyev', N'Sumqayıt', 'gunash@gmail.com', '(095)2313244'); 
GO

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,N'Nəsirov Fuad', N'Nizami 12', 'Gəncə', 'fuad@mail.ru', '(063)4533272'); 

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(2,N'Məmmədov Günəş', N'Heydər Əliyev', N'Sumqayıt', 'gunash@gmail.com', '(095)2313244');  -- Xəta!

SELECT * FROM Customers;

-- Cari cədvəldə primary key-in yaradılması
DROP TABLE Customers;
GO

CREATE TABLE Customers                
(                                      
	CustomerNO int IDENTITY NOT NULL, 
	CustomerName nvarchar(25) NOT NULL,
	Address1 nvarchar(25) NOT NULL,
	City     nvarchar(15) NOT NULL,
	Contact  nvarchar(25) NOT NULL,
	Phone char(12)             
)
GO

-- Customers cədvəlini dəyişirik və CustomerNo sütununda primary key yaradırıq
ALTER TABLE Customers
ADD CONSTRAINT PK_Customers
PRIMARY KEY (CustomerNo)

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
(N'Kazımov Cavid', 'Nizami', 'Bakı', 'cavid@mail.ru', '(093)1231212'),
(N'Məmmədov Günəş', N'Heydər Əliyev', N'Sumqayıt', 'gunash@gmail.com', '(095)2313244'); 
GO

SELECT * FROM Customers;

DROP TABLE Customers;
GO

CREATE TABLE Customers                
(                                      
	CustomerNO int NOT NULL, 
	CustomerName nvarchar(25) NOT NULL,
	Address1 nvarchar(25) NOT NULL,
	City     nvarchar(15) NOT NULL,
	Contact  nvarchar(25) NOT NULL,
	Phone char(12)             
)
GO

ALTER TABLE Customers
ADD  -- Primary keyin adı mütləq deyil.
PRIMARY KEY (CustomerNo,Address1)

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,N'Kazımov Cavid', 'Nizami', 'Bakı', 'cavid@mail.ru', '(093)1231212'),
(2,N'Məmmədov Günəş', N'Heydər Əliyev', N'Sumqayıt', 'gunash@gmail.com', '(095)2313244'); 
GO

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(1,N'Nəsirov Fuad', N'Nizami 12', 'Gəncə', 'fuad@mail.ru', '(063)4533272'); 

INSERT INTO Customers																			   
(CustomerNO, CustomerName, Address1, City, Contact, Phone)
VALUES
(2,N'Abdullayev Kazım', N'Xətai', N'Bakı', 'kazim@gmail.com', '(095)2313244'); 

SELECT * FROM Customers;