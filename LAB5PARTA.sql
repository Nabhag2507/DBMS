USE CSE_3A_261;

--Part � A: 
--1. Add two more columns City VARCHAR (20) and Pincode INT. 
ALTER TABLE DEPOSITE 
ADD CITY VARCHAR(20) , PINCODE INT;

--2. Add column state VARCHAR(20). 
ALTER TABLE DEPOSITE 
ADD STATE VARCHAR(20);

--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35). 
ALTER TABLE  DEPOSITE
ALTER COLUMN CNAME VARCHAR(20);

--4. Change the data type DECIMAL to INT in amount Column. 
ALTER TABLE DEPOSITE
ALTER COLUMN AMOUNT INT;

--5. Delete Column City from the DEPOSIT table. 
ALTER TABLE DEPOSITE 
DROP COLUMN CITY;

--6. Rename Column ActNo to ANO. 
EXEC SP_RENAME 'DEPOSITE.ACTNO' , 'ANO';

--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.
EXEC SP_RENAME 'DEPOSITE' , 'DEPOSITE_DETAIL';

--Part � B: 
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table. 
EXEC SP_RENAME 'DEPOSITE_DETAIL.ADATE' , 'AOPENDATE'

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table. 
ALTER TABLE DEPOSITE_DETAIL
DROP COLUMN AOPENDATE;

--3. Rename Column CNAME to CustomerName. 
EXEC SP_RENAME 'CNAME' , 'CustomerName';

--4. Add Column country. 
ALTER TABLE DEPOSITE
ADD COUNTRY VARCHAR(20);

--Part � C: 
--Create following table using query according to the definition. 

CREATE TABLE STUDENT_DETAIL (
    Enrollment_No VARCHAR(20),
    Name VARCHAR(25),
    CPI DECIMAL(5,2),
    Birthdate DATETIME
);

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null). 
ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR(20) NOT NULL , BACKLOG INT;

--2. Add column department VARCHAR (20) Not Null. 
ALTER TABLE STUDENT_DETAIL
ADD DEPARTMENT VARCHAR(20) NOT NULL;

--3. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35). 
ALTER TABLE STUDENT_DETAIL
ALTER COLUMN NAME VARCHAR(35);

--4. Change the data type DECIMAL to INT in CPI Column. 
ALTER TABLE STUDENT_DETAIL
ALTER COLUMN CPI INT;

--5. Delete Column City from the student_detail table. 
ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY;

--6. Rename Column Enrollment_No to ENO. 
EXEC SP_RENAME 'STUDENT_DETAIL.Enrollment_No' , 'ENO';

--7. Change name of table student_detail to STUDENT_MASTER.
EXEC SP_RENAME 'STUDENT_DETAIL' , 'STUDENT_MASTER';
