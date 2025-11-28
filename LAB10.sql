-- Create Table
CREATE TABLE STUDENT_INFO (
    RNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10),
    SPI DECIMAL(4,2),
    Bklog INT
);

-- Insert Values
INSERT INTO STUDENT_INFO (RNo, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 1),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'EC', 4.50, 3);

SELECT * FROM STUDENT_INFO

--PART - A

--1. Create a view Personal with all columns.
CREATE VIEW PERSONAL
AS (SELECT * FROM STUDENT_INFO);

--2. Create a view Student_Details having columns Name, Branch & SPI.
CREATE VIEW STUDENT_DETAIL
AS (SELECT NAME,BRANCH,SPI FROM STUDENT_INFO);

--3. Create a view AcademicData having columns RNo, Name, Branch.
CREATE VIEW ACADEMICDATA
AS (SELECT RNO,NAME,BRANCH FROM STUDENT_INFO);

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
CREATE VIEW STUDENT_BKLOG
AS (SELECT * FROM STUDENT_INFO
    WHERE Bklog > 2);

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
CREATE VIEW STUDENT_PATTER
AS (SELECT RNO,NAME,BRANCH FROM STUDENT_INFO
    WHERE NAME LIKE '____');

--6. Insert a new record to AcademicData view. (107, Meet, ME)
INSERT INTO ACADEMICDATA VALUES
(107,'MEET','ME')

--7. Update the branch of Amit from CE to ME in Student_Details view.
UPDATE STUDENT_DETAIL
SET BRANCH = 'ME' WHERE NAME = 'AMIT'

--8. Delete a student whose roll number is 104 from AcademicData view.
DELETE FROM STUDENT_INFO
WHERE RNO = 104;

SELECT * FROM STUDENT_INFO

--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and backlog less than 2.
CREATE VIEW VW_Student_M_A AS
SELECT *
FROM STUDENT_INFO
WHERE Name LIKE 'M%a'
  AND SPI > 6
  AND Bklog < 2;


--10. Create the view for the students whose name contains vowel.
CREATE VIEW VW_Student_Vowel AS
SELECT *
FROM STUDENT_INFO
WHERE Name LIKE '%a%'
   OR Name LIKE '%e%'
   OR Name LIKE '%i%'
   OR Name LIKE '%o%'
   OR Name LIKE '%u%';


--PART - B

--1. Create a view that displays information of all students whose SPI is above 8.5
CREATE VIEW VW_SPI_Above_85 AS
SELECT *
FROM STUDENT_INFO
WHERE SPI > 8.5;

--2. Create a view that displays 0 backlog students.
CREATE VIEW VW_NoBacklog AS
SELECT *
FROM STUDENT_INFO
WHERE Bklog = 0;

--3. Create a view Computerview that displays CE branch data only.
CREATE VIEW Computerview AS
SELECT *
FROM STUDENT_INFO
WHERE Branch = 'CE';

--PART - C

--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
CREATE VIEW Result_EC AS
SELECT Name, SPI
FROM STUDENT_INFO
WHERE Branch = 'EC' AND SPI < 5;

--2. Update the result of student MAHESH to 4.90 in Result_EC view.
UPDATE Result_EC
SET SPI = 4.90
WHERE Name = 'Mahesh';

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5.
CREATE VIEW Stu_Bklog AS
SELECT RNo, Name, Bklog
FROM STUDENT_INFO
WHERE Name LIKE 'M%' AND Bklog > 5;

--4. Drop Computerview form the database
DROP VIEW Computerview;
