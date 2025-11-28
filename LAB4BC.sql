USE CSE_3A_261;

CREATE TABLE EMPLOYEE(
	Name VARCHAR(20),
	City VARCHAR(20),
	Age INT
);

INSERT INTO EMPLOYEE VALUES 
('Jay Patel','Rajkot',30),
('Rahul Dave','Baroda',35),
('Jeet Patel','Surat',31),
('Vijay Raval','Rajkot',30);

--1. Create table Employee_detail from Employee with all the columns and data.  
SELECT * 
INTO Employee_detail 
FROM EMPLOYEE

--2. Create table Employee_data from Employee with first two columns with no data. 
SELECT Name,City
INTO Employee_data FROM EMPLOYEE
WHERE 1=0;

--3. Create table Employee_info from Employee with no Data
SELECT * 
INTO Employee_info 
FROM EMPLOYEE
WHERE 1=0;



--==========PART - C ===========--

--1. Insert the Data into Employee_info from Employee whose CITY is Rajkot 
INSERT INTO Employee_info SELECT * FROM EMPLOYEE WHERE City = 'Rajkot';

--2. Insert the Data into Employee_info from Employee whose age is more than 32. 
INSERT INTO Employee_info 
SELECT * FROM EMPLOYEE 
WHERE AGE>32
