USE CSE_4B_465

ALTER TABLE STUDENTS
DROP COLUMN CGPA

--Part – A 

--1.	INSERT Procedures: Create stored procedures to insert records into STUDENT tables (SP_INSERT_STUDENT)

GO
CREATE OR ALTER PROCEDURE PR_INSERT_STUDENT
	@STUID			INT,
	@NAME			VARCHAR(100),
	@EMAIL			VARCHAR(100),
	@PHONE			VARCHAR(15),
	@DEPARTMENT		VARCHAR(50),
	@DOB			DATE,
	@ENROLLMENTNO	INT
AS
BEGIN
	INSERT INTO STUDENTS VALUES
	(@STUID,@NAME,@EMAIL,@PHONE,@DEPARTMENT,@DOB,@ENROLLMENTNO)
END

EXEC PR_INSERT_STUDENT 10, 'HARSH PARMAR', 'HARSH@UNIV.EDU', '9876543218', 'CSE', '2005-09-18', 2023
EXEC PR_INSERT_STUDENT 20, 'OM PATEL', 'OM@UNIV.EDU', '9876543211', 'IT', '2002-08-22', 2022

--2.	INSERT Procedures: Create stored procedures to insert records into COURSE tables (SP_INSERT_COURSE)

GO
CREATE OR ALTER PROCEDURE PR_INSERT_COURSE
	@COURSEID			VARCHAR(10),
	@COURSENAME			VARCHAR(100),
	@COURSECREDITS		INT,
	@COURSEDEPARTMENT	VARCHAR(50),
	@COURSESEMESTER		INT
AS 
BEGIN
	INSERT INTO COURSE VALUES
	(@COURSEID,@COURSENAME,@COURSECREDITS,@COURSEDEPARTMENT,@COURSESEMESTER)
END

EXEC PR_INSERT_COURSE 'CS330','Computer Networks',4,'CSE',5
EXEC PR_INSERT_COURSE 'EC120','ELECTRONIC CIRCUITS',3,'ECE',2

--3.	UPDATE Procedures: Create stored procedure SP_UPDATE_STUDENT to update Email and Phone in STUDENT table. 
--(Update using studentID)

GO
CREATE OR ALTER PROCEDURE PR_UPDATE_STUDENT
	@EMAIL		VARCHAR(20),
	@PHONE		VARCHAR(15),
	@STUID		INT
AS
BEGIN
	UPDATE STUDENTS
	SET StuEmail = @EMAIL, StuPhone = @PHONE
	WHERE StudentID = @STUID
END

--4.	DELETE Procedures: Create stored procedure SP_DELETE_STUDENT to delete records from STUDENT where
--Student Name is Om Patel.
GO
CREATE OR ALTER PROCEDURE PR_DELETE_STUDENT
	@STUNAME	VARCHAR(50)
AS
BEGIN
	DELETE FROM STUDENTS
	WHERE StuName = @STUNAME
END

--5.	SELECT BY PRIMARY KEY: Create stored procedures to select records by primary key (SP_SELECT_STUDENT_BY_ID)
--from Student table.
GO
CREATE OR ALTER PROCEDURE PR_SELECT_STUDENT_BY_ID
	@STUID INT
AS
BEGIN
	SELECT * FROM STUDENTS
	WHERE StudentID = @STUID
END

--6.	Create a stored procedure that shows details of the first 5 students ordered by EnrollmentYear.
GO
CREATE OR ALTER PROCEDURE PR_TOP_N
	@N		INT
AS
BEGIN
	SELECT TOP (@N) * FROM STUDENTS
	ORDER BY StuEnrollmentYear
END

--Part – B  

--7.	Create a stored procedure which displays faculty designation-wise count.
GO 
CREATE OR ALTER PROCEDURE PR_DESIGNATION_COUNT
AS
BEGIN
	SELECT FacultyDesignation,COUNT(FacultyDesignation) FROM FACULTY
	GROUP BY FacultyDesignation
END

EXEC PR_DESIGNATION_COUNT

--8.	Create a stored procedure that takes department name as input and returns all students in that department.
GO
CREATE OR ALTER PROCEDURE PR_STU_DEPT_WISE
	@DEPTNAME		VARCHAR(50)
AS
BEGIN
	SELECT * FROM STUDENTS
	WHERE StuDepartment = @DEPTNAME
END

EXEC PR_STU_DEPT_WISE 'CSE'

--Part – C 

--9.	Create a stored procedure which displays department-wise maximum, minimum, and average credits of courses.
GO
CREATE OR ALTER PROCEDURE PR_AGGRE_COURSE
AS
BEGIN
	SELECT CourseDepartment,MAX(CourseCredits), MIN(CourseCredits), AVG(CourseCredits) FROM COURSE
	GROUP BY CourseDepartment
END

EXEC PR_AGGRE_COURSE

--10.	Create a stored procedure that accepts StudentID as parameter and returns all courses the student is enrolled 
--in with their grades.
GO
CREATE OR ALTER PROCEDURE PR_STU_COURSE
	@STUID		INT
AS
BEGIN
	SELECT StuName, CourseName, Grade
	FROM STUDENTS JOIN ENROLLMENT
	ON STUDENTS.StudentID = ENROLLMENT.StudentID
	JOIN COURSE ON ENROLLMENT.CourseID = COURSE.CourseID
	WHERE STUDENTS.StudentID = @STUID
END

EXEC PR_STU_COURSE 4
