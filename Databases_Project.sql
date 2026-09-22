CREATE DATABASE  BookStore
ON PRIMARY
(
NAME = BookStore,
FILENAME = N'C:\SQL_1\BookStore.mdf',
SIZE = 10MB,
MAXSIZE = 50MB,
FILEGROWTH = 8MB
)
LOG ON
(
NAME = BookStore_Log,
FILENAME = N'C:\SQL_1\BookStore.ldf',
SIZE = 6MB,
MAXSIZE = 20MB,
FILEGROWTH = 3MB
);

USE BookStore;
SET DATEFORMAT DMY;
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthDate DATE
);

CREATE TABLE Books (
    BookID  INT PRIMARY KEY IDENTITY(1,1),
	AuthorID INT NULL REFERENCES Authors(AuthorID),
    Title NVARCHAR(100),
    ReleaseDate DATE,
    ReceivedDate DATE,
    Price INT
);

BEGIN TRANSACTION Bookstore_Trans;
BEGIN TRY
   
    INSERT INTO Authors (FirstName, LastName, BirthDate) VALUES
    (N'Leo', N'Tolstoy', '09-09-1828'),
    (N'Jane', N'Austen', '16-12-1775'),
    (N'Konstantine', N'Gamsaxurdia', '03-05-1893'),
	(N'Suzanne',N'Collins','10-05-1983');

   
    INSERT INTO Books (AuthorID, Title, ReleaseDate, ReceivedDate, Price) VALUES
    (1, N'War and Peace','01-01-1869','22-10-2001',45),
    (2, N'Pride and Prejudice', '20-12-1980', '11-11-1999', 30),
	(3, N'The right hand of the grand master','10-10-1939','03-04-2006',56),
	(4, N'Hunger games','12-07-2003','11-04-2008',25);
    

    COMMIT TRANSACTION Bookstore_Trans;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION Bookstore_Trans;
    PRINT 'An error occurred. Transaction rolled back.';
END CATCH;


SELECT * 
FROM Books 
ORDER BY Title;

SELECT * 
FROM Books 
ORDER BY ReceivedDate;

SELECT * 
FROM Authors 
ORDER BY LastName;

SELECT * 
FROM Books 
WHERE ReleaseDate > '01-01-1950';

SELECT MAX(Price) AS MaxBookPrice FROM Books;
