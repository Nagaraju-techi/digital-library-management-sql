CREATE DATABASE DigitalLibrary;
USE DigitalLibrary;

DROP TABLE IF EXISTS IssuedBooks;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Students;


-- 1 . Table  Creation 

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Category VARCHAR(50),
    TotalCopies INT
);

-- Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100),
    Course VARCHAR(50),
    JoinDate DATE
);
-- Issued Books Table
CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    BookID INT,
    IssueDate DATE,
    ReturnDate DATE,
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
-- Insert Books
INSERT INTO Books (Title, Author, Category, TotalCopies) VALUES
('The Alchemist', 'Paulo Coelho', 'Fiction', 5),
('Physics Basics', 'R.K Sharma', 'Science', 4),
('World War II', 'John Keegan', 'History', 3),
('Data Structures', 'Mark Allen', 'Technology', 6),
('Harry Potter', 'J.K Rowling', 'Fiction', 7),
('Biology Today', 'Ramesh Kumar', 'Science', 5),
('Indian Freedom', 'Bipan Chandra', 'History', 2),
('Computer Networks', 'Andrew Tanenbaum', 'Technology', 4);


-- Insert Students
INSERT INTO Students (StudentName, Course, JoinDate) VALUES
('Rahul', 'BCA', '2021-06-10'),
('Sneha', 'BSc', '2022-07-15'),
('Arjun', 'BA', '2020-03-20'),
('Priya', 'BCom', '2019-09-12'),
('Kiran', 'BTech', '2018-01-05'),
('Meena', 'BCA', '2023-02-11'),
('Ravi', 'BSc', '2017-05-25'),
('Anjali', 'BA', '2024-01-10');

-- Insert Issued Books
INSERT INTO IssuedBooks (StudentID, BookID, IssueDate, ReturnDate) VALUES
(1, 1, '2026-03-20', NULL),
(2, 2, '2026-04-05', '2026-04-10'),
(3, 3, '2026-03-18', NULL),
(4, 5, '2026-04-01', '2026-04-08'),
(5, 4, '2022-01-10', '2022-01-25'),
(6, 6, '2026-04-02', NULL),
(7, 7, '2021-02-15', '2021-03-01'),
(1, 8, '2026-04-06', NULL),
(3, 2, '2026-03-25', NULL),
(2, 5, '2026-04-10', NULL);

-- 2. Overdue logic 
-- take fixed date as 18-04-2026

SELECT s.StudentID,s.StudentName,b.Title,i.IssueDate,DATEDIFF('2026-04-18', i.IssueDate) AS DaysPending
FROM Students s JOIN IssuedBooks i ON s.StudentID = i.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL
AND DATEDIFF('2026-04-18', i.IssueDate) > 14;

-- 3. Popularity index 

SELECT b.Category,COUNT(i.BookID) AS TotalBorrowed
FROM Books b JOIN IssuedBooks i ON b.BookID = i.BookID
GROUP BY b.Category
ORDER BY TotalBorrowed DESC;

--  4. Date clean up

ALTER TABLE Students ADD Status VARCHAR(20);
UPDATE Students
SET Status = 'Inactive'
WHERE StudentID NOT IN
(
    SELECT StudentID
    FROM IssuedBooks
    WHERE IssueDate >= DATE_SUB('2026-04-18', INTERVAL 3 YEAR)
);


SELECT * FROM Books;
SELECT * FROM Students;
SELECT * FROM IssuedBooks;
