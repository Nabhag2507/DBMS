USE CSE_3A_261;

--Part – A: 
--Use Deposit_Detail table (Altered table of DEPOSIT)

--1. Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000.  
DELETE FROM  DEPOSITE_DETAIL 
WHERE AMOUNT < 4000;

--2. Delete all the accounts CHANDI BRANCH. 
DELETE FROM DEPOSITE_DETAIL WHERE BNAME = 'CHANDI';

--3. Delete all the accounts having account number (ANO) is greater than 102 and less than 105. 
DELETE FROM DEPOSITE_DETAIL WHERE ANO > 102 AND ANO < 105;

--4. Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’ 
DELETE FROM DEPOSITE_DETAIL WHERE BNAME IN ('AJNI', 'POWAI');

--5. Delete all the accounts whose account number is NULL. 
DELETE FROM DEPOSITE_DETAIL WHERE ANO IS NULL;

--6. Delete all the remaining records using Delete command. 
DELETE FROM DEPOSITE_DETAIL;

--7. Delete all the records of Deposit_Detail table. (Use Truncate) 
TRUNCATE TABLE DEPOSITE_DETAIL;

--8. Remove Deposit_Detail table. (Use Drop)
DROP TABLE DEPOSITE_DETAIL;