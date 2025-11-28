--Part – A:

--1. Display details of students who are from computer department.
SELECT * FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DNAME = 'COMPUTER')

--2. Displays name of students whose SPI is more than 8.
SELECT NAME FROM STUDENT_DATA
WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI>8);

--3. Display details of students of computer department who belongs to Rajkot city.
SELECT * FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DNAME = 'COMPUTER' AND CITY = 'RAJKOT')

--4. Find total number of students of electrical department.
SELECT COUNT(*) FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DNAME = 'ELECTRIC');

--5. Display name of student who is having maximum SPI.
SELECT * FROM STUDENT_DATA
WHERE RNO = (SELECT RNO FROM ACADEMIC 
WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC));

--6. Display details of students having more than 1 backlog
SELECT * FROM STUDENT_DATA
WHERE RNO IN (SELECT RNO FROM ACADEMIC 
WHERE BKLOG>1);

--Part – B:

--1. Display name of students who are either from computer department or from mechanical department.
SELECT * FROM STUDENT_DATA
WHERE DID IN (SELECT DID FROM DEPARTMENT 
WHERE DNAME IN ('COMPUTER','MECHANICAL'));

--2. Display name of students who are in same department as 102 studying in.
SELECT NAME FROM STUDENT_DATA
WHERE DID IN (SELECT DID FROM STUDENT_DATA WHERE RNO = 102);

--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT NAME FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DNAME = 'ELECTRIC') AND RNO IN(SELECT RNO FROM ACADEMIC WHERE SPI>=9)

--2. Display name of student who is having second highest SPI.
SELECT TOP 1 NAME FROM STUDENT_DATA
JOIN ACADEMIC
ON STUDENT_DATA.RNO = ACADEMIC.RNO
WHERE ACADEMIC.SPI IN (SELECT TOP 2 SPI FROM ACADEMIC ORDER BY SPI DESC)
ORDER BY ACADEMIC.SPI

--3. Display city names whose students SPI is 9.2
SELECT CITY FROM STUDENT_DATA
WHERE RNO = (SELECT RNO FROM ACADEMIC WHERE SPI > 9);

--4. Find the names of students who have more than the average number of backlogs across all students.
SELECT NAME FROM STUDENT_DATA
WHERE RNO IN (SELECT RNO FROM ACADEMIC 
WHERE BKLOG = (SELECT AVG(BKLOG) FROM ));

--5. Display the names of students who are in the same department as the student with the highest SPI.
SELECT NAME FROM STUDENT_DATA
WHERE DID IN (SELECT DID FROM STUDENT_DATA
WHERE RNO IN (SELECT RNO FROM ACADEMIC 
WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC)))
