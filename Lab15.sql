USE CSE_3A_273

CREATE TABLE STU_MASTER(
		Rno INT PRIMARY KEY,
		Name VARCHAR(50),
		Branch VARCHAR(10) DEFAULT 'GENERAL',
		SPI DECIMAL(2,0) CHECK (SPI <=10),
		Bklog INT CHECK (Bklog >=0)
)


INSERT INTO STU_MASTER
VALUES  (101, 'Raju', 'CE', 8.80, 0),
		(102, 'Amit', 'CE', 2.20, 3),
		(103, 'Sanjay', 'ME', 1.50, 6),
		(104, 'Neha', 'EC', 7.65, 0),
		(105, 'Meera', 'EE', 5.52, 2),
		(106, 'Mahesh', DEFAULT ,4.50, 3)	


--Part – A:


--Create below table with following constraints
--1. Do not allow SPI more than 10

--2. Do not allow Bklog less than 0.

--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified.

--4. Try to update SPI of Raju from 8.80 to 12.

UPDATE STU_MASTER
SET SPI = 12 WHERE NAME = 'RAJU'

--5. Try to update Bklog of Neha from 0 to -1

UPDATE STU_MASTER
SET Bklog = -1 WHERE NAME = 'NEHA'



--Part – B: Create table as per following schema with proper validation and try to insert data which violate your
--validation.

--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_details(Did, Dname)
--City_details(Cid, Cname)


-- Table for Department Details
CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

-- Table for City Details
CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- Table for Employee Details
CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
);


-- Insert valid department and city first
INSERT INTO Dept_details VALUES (1, 'Engineering');
INSERT INTO City_details VALUES (101, 'Mumbai');

-- Attempt to insert employee with invalid Salary and Experience
INSERT INTO Emp_details VALUES (
    1001, 'John Doe', 1, 101, -50000.00, -3
);


--PART - C
--Part – A: Views (First create a view then display all views)


-- Country Table
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- State Table
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

-- District Table
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

-- Dept_info Table
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

-- City_info Table
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

-- Emp_info Table
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);

-- Country
INSERT INTO Country VALUES (1, 'India'), (2, 'USA'), (3, 'Japan'), (4, 'Germany'), (5, 'Brazil');

-- State
INSERT INTO State VALUES (101, 'Gujarat', 1), (102, 'California', 2), (103, 'Tokyo', 3), (104, 'Bavaria', 4), (105, 'São Paulo', 5);

-- District
INSERT INTO District VALUES (201, 'Rajkot', 101), (202, 'Los Angeles', 102), (203, 'Shinjuku', 103), (204, 'Munich', 104), (205, 'Campinas', 105);

-- Dept_info
INSERT INTO Dept_info VALUES (301, 'HR'), (302, 'Finance'), (303, 'Engineering'), (304, 'Marketing'), (305, 'Design');

-- City_info
INSERT INTO City_info VALUES (401, 'Rajkot City', 201), (402, 'LA City', 202), (403, 'Tokyo City', 203), (404, 'Munich City', 204), (405, 'Campinas City', 205);

-- Emp_info
INSERT INTO Emp_info VALUES 
(501, 'Amit', 301, 401, 50000, 5),
(502, 'Sara', 302, 402, 60000, 3),
(503, 'Kenji', 303, 403, 70000, 7),
(504, 'Hans', 304, 404, 55000, 4),
(505, 'Carlos', 305, 405, 48000, 2);


-- Negative salary (violates CHECK constraint)
INSERT INTO Emp_info VALUES (506, 'InvalidEmp', 301, 401, -10000, 2);
-- Negative experience
INSERT INTO Emp_info VALUES (507, 'InvalidExp', 302, 402, 30000, -1);
-- Non-existent Dept ID
INSERT INTO Emp_info VALUES (508, 'WrongDept', 999, 401, 40000, 1);
-- Non-existent City ID
INSERT INTO Emp_info VALUES (509, 'WrongCity', 301, 999, 40000, 1);


SELECT 
    E.Ename AS EmployeeName,
    D.Dname AS DepartmentName,
    E.Salary,
    E.Experience,
    CI.Cname AS City,
    DI.Dname AS District,
    S.Sname AS State,
    C.Cname AS Country
FROM Emp_info E
JOIN Dept_info D ON E.Did = D.Did
JOIN City_info CI ON E.Cid = CI.Cid
JOIN District DI ON CI.Did = DI.Did
JOIN State S ON DI.Sid = S.Sid
JOIN Country C ON S.Cid = C.Cid;