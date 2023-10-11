-- Hər hansı bazanı silməzdən oncə əvvəlcədən
-- master bazasına kecmək məsləhət görülur.
USE master;
GO

-- DROP DATABASE operatoru verilənlər bazasını silir.
DROP DATABASE  ShopDB;
GO

-------------------------------------------------------------------------
					 /* Verilənlər bazasının yaradılması */
-------------------------------------------------------------------------

CREATE DATABASE ShopDB    
ON							  
(
	NAME = 'ShopDB',            
	FILENAME = 'D:\ShopDB.mdf', 
	SIZE = 10MB,                    
	MAXSIZE = 100MB,				
	FILEGROWTH = 10MB				
)
LOG ON						  
( 
	NAME = 'LogShopDB',            
	FILENAME = 'D:\LogShopDB.ldf', 
	SIZE = 5MB,                        
	MAXSIZE = 50MB,                    
	FILEGROWTH = 5MB                   
)   
COLLATE Cyrillic_General_CI_AS -- Verilənlər bazası ücün default olaraq kodirovka veririk

-------------------------------------------------------------------------
					 /* Verilənlər bazasının dəyişdirilməsi */
-------------------------------------------------------------------------

EXEC sp_helpdb ShopDB

ALTER DATABASE ShopDB   -- ALTER DATABASE operatoru VB-nı dəyişir
MODIFY FILE			    -- VB-nın ölcusünün dəyisdirilməsi
( NAME = 'ShopDB',
  SIZE = 100MB )
GO
  
 ALTER DATABASE ShopDB	-- ALTER DATABASE operatoru VB-nı dəyişir
 MODIFY FILE				
( NAME = 'ShopDB',
  MAXSIZE = 1000MB,			-- VB-nın maksimal ölcusünün dəyişdirilməsi 
  FILEGROWTH = 20% )	    -- VB-nın ölcusünün dəyişdirlməsi paramteri
  -- Əgər FILEGROWTH faizlə verilsə, onda faiz VB-nın cari olcusunə əsasən hesablanır (FILEGROWTH = 0,2*SIZE). 
GO

ALTER DATABASE ShopDB
 MODIFY FILE				
( 
  NAME = 'ShopDB',
  MAXSIZE = 10MB		  -- Maksimal ölcü cari olcudən az ola bilməz 
)	  
GO

ALTER DATABASE ShopDB   
MODIFY FILE					
( NAME = 'ShopDB',
  SIZE = 100MB )		  -- VB-na caridən az və ya cari qədər ölcü vermək mumkun deyil.
GO

EXEC sp_helpdb ShopDB