USE CSE_3A_261;

--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table) 
UPDATE DEPOSITE
SET AMOUNT = 5000
WHERE AMOUNT=3000;

--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 
UPDATE BORROW
SET BNAME = 'C. G. ROAD'
WHERE CNAME = 'ANIL';

--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table) 
UPDATE DEPOSITE
SET ACTNO = 111 , AMOUNT = 5000
WHERE CNAME = 'SANDIP'

--4. Update amount of KRANTI to 7000. (Use Deposit Table) 
UPDATE DEPOSITE
SET AMOUNT = 7000
WHERE CNAME = 'KRANTI'

--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table) 
UPDATE BRANCH
SET BNAME = 'ANDHERI WEST'
WHERE BNAME = 'ANDHERI'

--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) 
UPDATE DEPOSITE
SET BNAME = 'NEHRU PALACE'
WHERE CNAME = 'MEHUL';

--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table) 
UPDATE DEPOSITE 
SET AMOUNT = 5000
WHERE  ACTNO BETWEEN 103 AND 107;

--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 
UPDATE DEPOSITE
SET ADATE = '1-4-95'
WHERE CNAME = 'ANIL';

--9. Update the amount of MINU to 10000. (Use Deposit Table) 
UPDATE DEPOSITE
SET AMOUNT = 10000
WHERE CNAME = 'MINU';

--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table) 
UPDATE DEPOSITE 
SET AMOUNT = 5000, ADATE = '1-4-96'
WHERE CNAME = 'PRAMOD';

--Part – B:  
--1. Give 10% Increment in Loan Amount. (Use Borrow Table) 
UPDATE BORROW
SET AMOUNT = AMOUNT + (AMOUNT /10)
WHERE 1=1;

--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table) 
UPDATE DEPOSITE
SET AMOUNT = AMOUNT*1.2;

--3. Increase Amount by 1000 in all the account.  (Use Deposit Table) 
UPDATE DEPOSITE
SET AMOUNT = AMOUNT+1000;

--4. Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the 
--customer name is ‘MEHUL’ and the loan number is even. 
UPDATE BORROW 
SET AMOUNT = 7000,BNAME = 'CENTRAL'
WHERE CNAME = 'MEHUL' AND LOANNO % 2 =0;

--5. Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in 
--‘VRCE’ and with an account number less than 105. 
UPDATE DEPOSITE
SET ADATE = '05-15-2022', AMOUNT = 2500
WHERE BNAME = 'VRCE' AND ACTNO < 105;

--Part – C:  
--1. Update amount of loan no 321 to NULL. (Use Borrow Table) 
UPDATE BORROW 
SET AMOUNT = NULL
WHERE LOANNO = 3221;

--2. Update branch name of KRANTI to NULL (Use Borrow Table) 
UPDATE BORROW 
SET BNAME = NULL
WHERE CNAME = 'KRANTI';

--3. Display the name of borrowers whose Loan number is NULL. (Use Borrow Table) 
SELECT CNAME FROM BORROW
WHERE LOANNO IS NULL;

--4. Display the Borrowers whose having branch. (Use Borrow Table) 
SELECT CNAME FROM BORROW
WHERE BNAME IS NOT NULL;

--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. 
--(Use Borrow Table) 
UPDATE BORROW 
SET AMOUNT = 5000, BNAME = 'VRCE' , CNAME = 'DARSHAN'
WHERE LOANNO = 481;

--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less 
--than 2000. 
UPDATE DEPOSITE 
SET ADATE = '01-01-2021'
WHERE AMOUNT < 2000;

--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 110. 
UPDATE DEPOSITE 
SET ADATE = NULL ,BNAME = 'ANDHERI'
WHERE ACTNO = 110;