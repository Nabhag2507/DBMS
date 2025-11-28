USE CSE_3A_261;

DROP TABLE PERSON
CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT REFERENCES DEPT(DEPARTMENTID) NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL
);

INSERT INTO PERSON
VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');


CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

INSERT INTO DEPT
VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

--Part � A:

--1. Combine information from Person and Department table using cross join or Cartesian product.
SELECT *
FROM PERSON CROSS JOIN DEPT;

--2. Find all persons with their department name
SELECT PersonName, DepartmentName  
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID

--3. Find all persons with their department name & code.
SELECT PersonName, DepartmentName  
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID

--4. Find all persons with their department code and location.
SELECT PersonName, DepartmentCode, Location
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID;

--5. Find the detail of the person who belongs to Mechanical department.
SELECT *
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DepartmentName = 'Mechanical';

--6. Find person’s name, department code and salary who lives in Ahmedabad city.
SELECT PersonName, DepartmentCode, Salary
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE City = 'Ahmedabad';

--7. Find the person's name whose department is in C-Block.
SELECT PersonName
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE Block = 'C-Block';

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PersonName, Salary, DepartmentName
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE City = 'Jamnagar';

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
SELECT *
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DepartmentName = 'Civil'
  AND JoinDate > '2001-08-01';

--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT PersonName, DepartmentName
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DATEDIFF(DAY, JoinDate, GETDATE()) > 365;

--11. Find department wise person counts.
SELECT DepartmentName, COUNT(*) AS PersonCount
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY DepartmentName;

--12. Give department wise maximum & minimum salary with department name.
SELECT DepartmentName, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY DepartmentName;

--13. Find city wise total, average, maximum and minimum salary.
SELECT City, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary,
       MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary
FROM PERSON
GROUP BY City;

--14. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(Salary) AS AvgSalaryAhmedabad
FROM PERSON
WHERE City = 'Ahmedabad';

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.
SELECT PersonName + ' lives in ' + City + ' and works in ' + DepartmentName + ' Department.' AS PersonInfo
FROM PERSON 
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID;