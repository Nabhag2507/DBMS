USE CSE_3A_261

CREATE TABLE CRICKET(
	Name VARCHAR(20),
	City VARCHAR(20),
	Age INT
);

INSERT INTO CRICKET VALUES 
('Sachin Tendulkar','Mumbai',30),
('Rahul Dravid','Bombay',35),
('M.S. Dhoni','Jharkhand',31),
('Suresh Raina','Gujarat',30);

--1. Create table Worldcup from cricket with all the columns and data.  
SELECT *
INTO Worldcup 
FROM CRICKET

--2. Create table T20 from cricket with first two columns with no data. 
SELECT Name,City
INTO T20 FROM CRICKET
WHERE 1=0;

--3. Create table IPL From Cricket with No Data. 
SELECT * INTO IPL FROM CRICKET
WHERE 1=0

--4. Select players who are either older than 30 and from 'Mumbai' or exactly 31 years old and
--not from 'Bombay', and insert them into a new table PLAYER. 
SELECT * INTO PLAYER FROM CRICKET 
WHERE (AGE>30 AND CITY = 'Mumbai') OR (AGE=30 AND CITY != 'Bombay');

--5. Select players whose age is a prime number or their city belongs to India Country, and 
--insert them into a new table PLAYER_INFO. (Consider Cricketer age between 18 to 55) 
SELECT * INTO PLAYER_INFO FROM CRICKET
WHERE (AGE IN (19,23,29,31,37,41,43,47,53))
OR City IN ('Mumbai','Bombay','Jharkhand','Gujarat');

--6. Select players whose age is a multiple of 5 and insert them into a new table PLAYER_DATA. 
SELECT * INTO PLAYER_DATA FROM CRICKET
WHERE AGE %5 =0;

--7. Insert the cricketer into IPL table whose city is ‘Jharkhand’
INSERT INTO IPL SELECT * FROM CRICKET WHERE City = 'Jharkhand';