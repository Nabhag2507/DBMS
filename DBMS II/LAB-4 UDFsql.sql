USE CSE_4B_465

--Part � A

--1.Write a scalar function to print "Welcome to DBMS Lab".
GO
CREATE OR ALTER FUNCTION FUNC_WELCOME()
RETURNS VARCHAR(20)
AS
BEGIN 
	RETURN 'WELCOME TO DBMS LAB'
END
GO

SELECT DBO.FUNC_WELCOME()

--2.Write a scalar function to calculate simple interest.
GO
CREATE OR ALTER FUNCTION FUNC_SIMPLE_INTEREST(@P INT, @N INT,@R INT)
RETURNS FLOAT
AS
BEGIN
	RETURN (@P * @R * @N) / 100
END
GO

SELECT DBO.FUNC_SIMPLE_INTEREST(1000,2,1)

--3.Function to Get Difference in Days Between Two Given Dates


--4.Write a scalar function which returns the sum of Credits for two given CourseIDs.
GO
CREATE OR ALTER FUNCTION FUNC_CREDITS(@C1 VARCHAR(10), @C2 VARCHAR(10))
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT;

	SELECT @SUM = SUM(COURSECREDITS) FROM COURSE
	WHERE COURSEID IN (@C1, @C2)

	RETURN @SUM
END
GO

SELECT DBO.FUNC_CREDITS('CS101', 'CS102')

--5.Write a function to check whether the given number is ODD or EVEN.
GO
CREATE OR ALTER FUNCTION FUNC_ODD_EVEN(@NUM INT)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ANS VARCHAR(10)
	IF @NUM % 2 = 0
		SET @ANS = 'EVEN'
	ELSE
		SET @ANS = 'ODD'

	RETURN @ANS
END
GO

SELECT DBO.FUNC_ODD_EVEN(15)

--6.Write a function to print number from 1 to N. (Using while loop)
GO
CREATE OR ALTER FUNCTION FUNC_PRINT_TO_N(@NUM INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @ANS VARCHAR(100) = '',	@TEMP INT = 1
	WHILE @TEMP <= @NUM
	BEGIN
		SET @ANS = @ANS + CAST(@TEMP AS VARCHAR(2)) + ' '
		SET @TEMP = @TEMP + 1
	END
	RETURN @ANS
END
GO

SELECT DBO.FUNC_PRINT_TO_N(15)

--7.Write a scalar function to calculate factorial of total credits for a given CourseID.
GO
CREATE OR ALTER FUNCTION FUNC_FACT(@CID VARCHAR(10))
RETURNS INT
AS
BEGIN
	DECLARE @CREDIT INT, @TEMP INT = 1, @ANS INT = 1
	SELECT @CREDIT = COURSECREDITS FROM COURSE
	WHERE COURSEID = @CID

	WHILE @TEMP <= @CREDIT
	BEGIN
		SET @ANS = @ANS * @TEMP
		SET @TEMP = @TEMP + 1
	END
	RETURN @ANS
END
GO

SELECT DBO.FUNC_FACT('CS101')

--8.Write a scalar function to check whether a given EnrollmentYear is in the past, current or future (Case statement)
GO
CREATE OR ALTER FUNCTION FUNC_ENR(@ENRYEAR INT)
RETURNS VARCHAR(100)
AS
BEGIN 
	DECLARE @ANS VARCHAR(100) = ''

	RETURN CASE
		WHEN @ENRYEAR < DATEPART(year, GETDATE())
			THEN 'The enrollment is of past year'
		WHEN @ENRYEAR = DATEPART(YEAR, GETDATE())
			THEN 'The enrollment is of current year'
		ELSE  'The enrollment is of future year'
	END
END
GO

SELECT DBO.FUNC_ENR(2026)

--9.Write a table-valued function that returns details of students whose names start with a given letter.
GO
CREATE OR ALTER FUNCTION FUNC_STU_DETAILS(@C CHAR(1))
RETURNS TABLE
AS RETURN
	SELECT * FROM STUDENTS
	WHERE STUNAME LIKE @C + '%'
GO

SELECT * FROM DBO.FUNC_STU_DETAILS('R')

--10.Write a table-valued function that returns unique department names from the STUDENT table.
GO
CREATE OR ALTER FUNCTION FUNC_UNIQUE_DEPARTMENT()
RETURNS TABLE
AS RETURN
	SELECT DISTINCT STUDEPARTMENT FROM STUDENTS
GO

SELECT * FROM DBO.FUNC_UNIQUE_DEPARTMENT()

--Part � B

--11.Write a scalar function that calculates age in years given a DateOfBirth.
GO
CREATE OR ALTER FUNCTION FUNC_CALC_AGE(@DOB DATE)
RETURNS INT
AS
BEGIN
    DECLARE @AGE INT

    SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE())

    -- Adjust if birthday not yet occurred this year
    IF (MONTH(@DOB) > MONTH(GETDATE())) 
        OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
    BEGIN
        SET @AGE = @AGE - 1
    END

    RETURN @AGE
END
GO

SELECT DBO.FUNC_CALC_AGE('2005-06-10')

--12.Write a scalar function to check whether given number is palindrome or not.
GO
CREATE OR ALTER FUNCTION FUNC_PALINDROME(@NUM INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @REV INT = 0,
            @TEMP INT,
            @REM INT

    SET @TEMP = @NUM

    WHILE @TEMP > 0
    BEGIN
        SET @REM = @TEMP % 10
        SET @REV = (@REV * 10) + @REM
        SET @TEMP = @TEMP / 10
    END

    IF @REV = @NUM
        RETURN 'PALINDROME'
    
    RETURN 'NOT PALINDROME'
END
GO

SELECT DBO.FUNC_PALINDROME(121)

--13.Write a scalar function to calculate the sum of Credits for all courses in the 'CSE' department.
GO
CREATE OR ALTER FUNCTION FUNC_CSE_TOTAL_CREDITS()
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT

    SELECT @TOTAL = SUM(COURSECREDITS)
    FROM COURSE
    WHERE DEPARTMENT = 'CSE'

    RETURN ISNULL(@TOTAL,0)
END
GO

SELECT DBO.FUNC_CSE_TOTAL_CREDITS()

--14.Write a table-valued function that returns all courses taught by faculty with a specific designation.
GO
CREATE OR ALTER FUNCTION FUNC_COURSE_BY_DESIGNATION(@DESG VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT C.*
    FROM COURSE C
    JOIN FACULTY F ON C.FACULTYID = F.FACULTYID
    WHERE F.DESIGNATION = @DESG
)
GO

SELECT * FROM DBO.FUNC_COURSE_BY_DESIGNATION('Professor')

--Part � C

--15.Write a scalar function that accepts StudentID and returns their total enrolled credits (sum of credits from all active enrollments).
GO
CREATE OR ALTER FUNCTION FUNC_TOTAL_ENROLLED_CREDITS(@SID VARCHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT

    SELECT @TOTAL = SUM(C.COURSECREDITS)
    FROM ENROLLMENT E
    JOIN COURSE C ON E.COURSEID = C.COURSEID
    WHERE E.STUDENTID = @SID
        AND E.STATUS = 'Active'

    RETURN ISNULL(@TOTAL,0)
END
GO

SELECT DBO.FUNC_TOTAL_ENROLLED_CREDITS('S101')

--16.Write a scalar function that accepts two dates (joining date range) and returns the count of faculty who joined in that period.
GO
CREATE OR ALTER FUNCTION FUNC_FACULTY_JOIN_COUNT(@STARTDATE DATE, @ENDDATE DATE)
RETURNS INT
AS
BEGIN
    DECLARE @COUNT INT

    SELECT @COUNT = COUNT(*)
    FROM FACULTY
    WHERE JOINDATE BETWEEN @STARTDATE AND @ENDDATE

    RETURN @COUNT
END
GO

SELECT DBO.FUNC_FACULTY_JOIN_COUNT('2020-01-01','2023-12-31')
