USE CSE_3A_261;

--Part – A:
--1. Display the result of 5 multiply by 30.
SELECT 5*30;

--2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25),ABS(25),ABS(-50),ABS(50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 5%2, 5%3;

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3,2) , POWER(4,3);

--7. Find out the square root of 25, 30 and 50.
SELECT SQRT(25), SQRT(30), SQRT(50);

--8. Find out the square of 5, 15, and 25.
SELECT SQUARE(5),SQUARE(15),SQUARE(25);

--9. Find out the value of PI.
SELECT PI();

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,2), ROUND(157.732,0), ROUND(157.732,-2);

--11. Find out exponential value of 2 and 3.
SELECT EXP(2), EXP(3);

--12. Find out logarithm having base e of 10 and 2.
SELECT LOG(10), LOG(2);

--13. Find out logarithm having base b having value 10 of 5 and 100.
SELECT LOG(5,10), LOG(10,100);

--14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415), COS(3.1415), TAN(3.1415);

--15. Find sign of -25, 0 and 25.
SELECT SIGN(-25), SIGN(0), SIGN(25);

--16. Generate random number using function.
SELECT RAND();


--Part – B:
--Create and insert the following records in the EMP_MASTER table

CREATE TABLE EMP_MASTER(
	EmpNo INT,
	EmpName VARCHAR(50),
	JoiningDate DATETIME,
	Salary DECIMAL(7,2),
	Commission INT,
	City VARCHAR(50),
	Dept_Code VARCHAR(50)
)
--DROP TABLE EMP_MASTER

INSERT INTO EMP_MASTER VALUES
	(101,'Keyur','2002-01-05',12000.00,4500,'Rajkot','3@g'),
	(102,'Hardik','2004-02-15',14000.00,2500,'Ahmedabad','3@'),
	(103,'Kajal','2006-03-14',15000.00,3000,'Baroda','3-GD'),
	(104,'Bhoomi','2005-06-23',12500.00,1000,'Ahmedabad','1A3D'),
	(105,'Harmit','2024-02-15',14000.00,2000,'Rajkot','312A')

SELECT * FROM EMP_MASTER

--1. Display the result of Salary plus Commission.
SELECT SALARY+COMMISSION FROM EMP_MASTER

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2),CEILING(35.7),CEILING(-55.2);

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2),FLOOR(35.7),FLOOR(-55.2);

--4. Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 55%2, 55%3;

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23,2), POWER(14,3);


--Part – C:

--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.
SELECT * 
FROM EMP_MASTER
WHERE SALARY+COMMISSION > 15000;

--2. Find the details of employees whose commission is more than 25% of their salary.
SELECT * 
FROM EMP_MASTER
WHERE Commission > SALARY*.025;

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are than 15000.
SELECT * 
FROM EMP_MASTER
WHERE SALARY+COMMISSION > 15000 AND JoiningDate<'2005-01-01';

--4. Find employees whose total earnings (Salary + Commission) are at least double their salary.
SELECT * 
FROM EMP_MASTER
WHERE Commission+Salary >= SALARY*2;
