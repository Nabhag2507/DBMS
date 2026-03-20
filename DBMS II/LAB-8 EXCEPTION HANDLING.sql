USE CSE_4B_465

--Part – A 

--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error. 
GO
CREATE OR ALTER PROCEDURE HANDLE_ZERO_ERROR
	@A INT, @B INT
AS
BEGIN 
	BEGIN TRY
		DECLARE @ANS FLOAT

		SET @ANS = @A / @B

		PRINT @ANS
	END TRY

	BEGIN CATCH
		PRINT 'DENOMINATOR CAN NOT BE ZERO'
	END CATCH 
END

EXEC HANDLE_ZERO_ERROR 10, 0

--2. Try to convert string to integer and handle the error using try…catch block. 
BEGIN TRY
	PRINT CAST ('ASDF' AS INT)
END TRY

BEGIN CATCH
	PRINT 'CAN NOT CONVERT STRING TO INTEGER'
END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
--	 exception with all error functions if any one enters string value in numbers otherwise print result. 
GO
CREATE OR ALTER PROCEDURE ADDITION
	@A VARCHAR(10), @B VARCHAR(10)
AS
BEGIN
	BEGIN TRY
		PRINT CAST (@A AS INT) + CAST (@B AS INT)
	END TRY

	BEGIN CATCH 
		PRINT 'PLEASE ENTER BOTH NUMBERS INTEGERS'
	END CATCH
END

EXEC ADDITION 10, 'ADSF'

--4. Handle a Primary Key Violation while inserting data into student table and print the error details such 
--	 as the error message, error number, severity, and state. 
BEGIN TRY
	INSERT INTO STUDENTS VALUES (101, 'VISHAL', 'VISHAL.COM', 215, 'ASDF', '31-12-1987', 1010101)
END TRY

BEGIN CATCH
	PRINT 'PRIMARY CAN NOT BE REPEATED'
END CATCH

--5. Throw custom exception using stored procedure which accepts StudentID as input & that throws 
--	 Error like no StudentID is available in database. 
GO
CREATE OR ALTER PROCEDURE FIND_STUDENT
	@ID		VARCHAR(20)
AS
BEGIN
	BEGIN TRY
		THROW 101, 'NO STUDENT ID', 215
	END TRY

	BEGIN CATCH 
		PRINT 'NO STUDENT ID IS AVAILABLE IN DATABASE'
	END CATCH
END

EXEC FIND_STUDENT 1010

--6. Handle a Foreign Key Violation while inserting data into Enrollment table and print appropriate error 
--	 message.
BEGIN TRY
	INSERT INTO ENROLLMENT VALUES 
		(2546, 'CS101', '2026-02-02', 'A++', 'ENROLLED')
END TRY 
BEGIN CATCH
	PRINT 'THIS FOREIGN KEY IS NOT AVAILABLE IN MAIN TABLE'
END CATCH 


--Part – B 

--7. Handle Invalid Date Format 
--	 message.
BEGIN TRY
	PRINT CAST ('2015-25-10' AS DATE)
END TRY 
BEGIN CATCH
	PRINT 'INVALID DATE FORMAT'
END CATCH 

--8. Procedure to Update faculty’s Email with Error Handling
GO 
CREATE OR ALTER PROCEDURE UPDATE_FAC_EMAIL
	@ID		INT,
	@MAIL	VARCHAR(50)
AS
BEGIN 
	BEGIN TRY
		UPDATE FACULTY 
		SET FacultyEmail = @MAIL
		WHERE FacultyID = @ID
	END TRY
	BEGIN CATCH
		PRINT 'ENTER VALID EMAIL'
	END CATCH
END

--9. Throw custom exception that throws error if the data is invalid. 
GO
CREATE OR ALTER PROCEDURE VALIDATE_STUDENT
    @NAME VARCHAR(50),
    @AGE INT
AS
BEGIN
    BEGIN TRY
        IF (@NAME = '')
            THROW 50001, 'NAME CANNOT BE EMPTY', 1;

        IF (@AGE <= 0)
            THROW 50002, 'AGE MUST BE GREATER THAN 0', 1;

        PRINT 'VALID DATA';
    END TRY

    BEGIN CATCH
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS VARCHAR);
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS VARCHAR);
    END CATCH
END

--Part – C 

--10. Write a script that checks if a faculty’s salary is NULL. If it is, use RAISERROR to show a message with a 
--	  severity of 16. (Note: Do not use any table)
DECLARE @SALARY INT

SET @SALARY = NULL

IF (@SALARY IS NULL)
BEGIN
    RAISERROR ('FACULTY SALARY IS NULL', 16, 1)
END
ELSE
BEGIN
    PRINT 'SALARY IS: ' + CAST(@SALARY AS VARCHAR)
END
