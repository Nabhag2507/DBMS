USE CSE_3A_261;

CREATE TABLE EMP
(
	EID INT,
	ENAME VARCHAR(50),
	DEPARTMENT VARCHAR(50),
	SALARY INT,
	JOININGDATE DATE,
	CITY VARCHAR(50),
	GENDER VARCHAR(6)
)

INSERT INTO EMP VALUES 
(101,'RAHUL','ADMIN',56000,'1990-01-01','RAJKOT','MALE'),
(102,'HARDIK','IT',18000,'1990-08-25','Ahmedabad','MALE'),
(103,'BHAVIN','HR',25000,'1991-05-14','BARODA','MALE'),
(104,'BHOOMI','ADMIN',39000,'1991-02-8','RAJKOT','FEMALE'),
(105,'ROHIT','IT',17000,'1990-07-23','JAMNAGAR','MALE'),
(106,'PRIYA','IT',9000,'1990-10-18','Ahmedabad','FEMALE'),
(107,'BHOOMI','HR',34000,'1991-12-25','RAJKOT','FEMALE');

SELECT * FROM EMP;

--1.Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MIN(SALARY) AS MINIMUM FROM EMP;
SELECT MAX(SALARY) AS MAXIMUM FROM EMP;

--2.Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
SELECT SUM(SALARY) AS TOTAL , AVG(SALARY) AS AVG FROM EMP;

--3.Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) AS NO_OF_EMPS FROM EMP;

--4.Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS MAX_FROM_RAJKOT FROM EMP WHERE CITY = 'RAJKOT';

--5.Give maximum salary from IT department.
SELECT MAX(SALARY) AS MAX_FROM_IT FROM EMP WHERE DEPARTMENT = 'IT';

--6.Count employee whose joining date is after 8-feb-91.
SELECT COUNT(*) AS NO_OF_EMPS FROM EMP WHERE JOININGDATE>'1991-02-08';

--7.Display average salary of Admin department.
SELECT AVG(SALARY) AS AVG_OF_ADMIN FROM EMP WHERE DEPARTMENT = 'ADMIN';

--8.Display total salary of HR department.
SELECT SUM(SALARY) AS TOTAL_OF_HR FROM EMP WHERE DEPARTMENT = 'HR';

--9.Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) AS CITYCOUNT FROM EMP;

--10.Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) AS DEPARTMENTCOUNT FROM EMP;

--11.Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(SALARY) AS MIN_FROM_AMD FROM EMP WHERE CITY = 'AHMEDABAD'

--12.Find city wise highest salary.
SELECT CITY,MAX(SALARY) AS CITY FROM EMP GROUP BY CITY;
 
--13.Find department wise lowest salary.
SELECT DEPARTMENT,MIN(SALARY) AS DEPARTMENT FROM EMP GROUP BY DEPARTMENT;

--14.Display city with the total number of employees belonging to each city.
SELECT CITY,COUNT(*) AS SALARY FROM EMP GROUP BY CITY;

--15.Give total salary of each department of EMP table.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_FROM_EACHDEP FROM EMP GROUP BY DEPARTMENT;

--16.Give average salary of each department of EMP table without displaying the respective department name.
SELECT AVG(SALARY) AS AVG_SALARY FROM EMP GROUP BY DEPARTMENT;

--17.Count the number of employees for each department in every city.
SELECT CITY,DEPARTMENT,COUNT(*) AS NO_OF_EMP FROM EMP GROUP BY CITY,DEPARTMENT;

--18.Calculate the total salary distributed to male and female employees.
SELECT GENDER,COUNT(SALARY) AS SALARY FROM EMP GROUP BY GENDER;

--19.Give city wise maximum and minimum salary of female employees.
SELECT CITY,MAX(SALARY) AS MAX_SALARY ,MIN(SALARY) AS MIN_SALARY FROM EMP WHERE GENDER = 'FEMALE' GROUP BY CITY;

--20.Calculate department, city, and gender wise average salary.
SELECT CITY,DEPARTMENT,GENDER,AVG(SALARY) AS AVG_SALARY FROM EMP GROUP BY CITY,DEPARTMENT,GENDER;


--Part – B:

--1.Count the number of employees living in Rajkot.
SELECT COUNT(ENAME) AS NO_EMP_RJK FROM EMP WHERE CITY = 'RAJKOT';

--2.Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(SALARY) - MIN(SALARY) AS DIFFERENCE FROM EMP;

--3.Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(*) AS EMP FROM EMP WHERE JOININGDATE < '1991-01-01';

--Part – C:

--1.Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(*) AS EMP FROM EMP WHERE CITY IN ('RAJKOT','BARODA')

--2.Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(*) AS EMP FROM EMP WHERE JOININGDATE<'1991-01-01' AND DEPARTMENT = 'IT';

--3.Find the Joining Date wise Total Salaries.
SELECT JOININGDATE,COUNT(SALARY) AS SALARY FROM EMP GROUP BY JOININGDATE;

--4.Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT DEPARTMENT,CITY,MAX(SALARY) AS SALARY FROM EMP WHERE CITY LIKE 'R%' GROUP BY DEPARTMENT,CITY;