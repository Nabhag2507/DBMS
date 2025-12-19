USE CSE_4B_465

--ADVANCE STORED PROCEDURE

--Part – A 

--1.	Create a stored procedure that accepts a date and returns all faculty members who joined on that date.
GO
CREATE OR ALTER PROCEDURE PR_JOINING_DATE
	@D	DATE
AS
BEGIN
	SELECT * FROM FACULTY
	WHERE FacultyJoiningDate = @D
END

EXEC PR_JOINING_DATE '2015-06-10'

--2.	Create a stored procedure for ENROLLMENT table where user enters either StudentID OR ENROLLMENT ID and returns 
--		EnrollmentID,EnrollmentDate, Grade, and Status.
GO
CREATE OR ALTER PROCEDURE PR_STU_STATUS_FIND
	@ID		INT
AS
BEGIN
	SELECT EnrollmentID, EnrollmentDate, Grade, EnrollmentStatus
	FROM STUDENTS JOIN ENROLLMENT
	ON STUDENTS.StudentID = ENROLLMENT.StudentID
	WHERE STUDENTS.StudentID = @ID OR EnrollmentID = @ID
END

EXEC PR_STU_STATUS_FIND 3

--3.	Create a stored procedure that accepts two integers (min and max credits) and returns all courses
--		whose credits fall between these values.
GO
CREATE OR ALTER PROCEDURE PR_COURSE_BETWEEN_CREDITS
	@MIN	INT,
	@MAX	INT
AS
BEGIN
	SELECT *
	FROM COURSE
	WHERE CourseCredits BETWEEN @MIN AND @MAX
END

EXEC PR_COURSE_BETWEEN_CREDITS 2,4

--4.	Create a stored procedure that accepts Course Name and returns the list of students enrolled in that course.
GO
CREATE OR ALTER PROCEDURE PR_STU_ENR_COURSE
	@COURSENAME		VARCHAR(20)
AS
BEGIN
	SELECT StuName
	FROM COURSE JOIN ENROLLMENT
	ON COURSE.CourseID = ENROLLMENT.CourseID
	JOIN STUDENTS
	ON ENROLLMENT.StudentID = STUDENTS.StudentID
	WHERE COURSE.CourseName = @COURSENAME
END

EXEC PR_STU_ENR_COURSE 'Data Structures'

--5.	Create a stored procedure that accepts Faculty Name and returns all course assignments.
GO 
CREATE OR ALTER PROCEDURE PR_FAC_ASSIGNED_COURSE
	@FACNAME	VARCHAR(20)
AS
BEGIN
	SELECT CourseName
	FROM FACULTY JOIN COURSE_ASSIGNMENT
	ON FACULTY.FacultyID = COURSE_ASSIGNMENT.FacultyID
	JOIN COURSE
	ON COURSE_ASSIGNMENT.CourseID = COURSE.CourseID
	WHERE FacultyName = @FACNAME
END

EXEC PR_FAC_ASSIGNED_COURSE 'Dr. Singh'

--6.	Create a stored procedure that accepts Semester number and Year, and returns all course assignments 
--		with faculty and classroom details.
GO
CREATE OR ALTER PROCEDURE PR_SEM_YEAR
	@SEMESTER	INT,
	@YEAR		INT
AS
BEGIN
	SELECT	FacultyName, ClassRoom
	FROM COURSE_ASSIGNMENT JOIN FACULTY
	ON FACULTY.FacultyID = COURSE_ASSIGNMENT.FacultyID
	WHERE Semester = @SEMESTER AND YEAR = @YEAR
END

EXEC PR_SEM_YEAR 4, 2024


--Part – B 


--7.	Create a stored procedure that accepts the first letter of Status ('A', 'C', 'D') and returns enrollment 
--		details.
GO
CREATE OR ALTER PROCEDURE PR_ENROLLMENT_DETAILS
	@FL		CHAR(1)
AS
BEGIN
	SELECT * FROM ENROLLMENT
	WHERE EnrollmentStatus LIKE @FL+'%'
END

EXEC PR_ENROLLMENT_DETAILS 'C'

--8.	Create a stored procedure that accepts either Student Name OR Department Name and returns student data 
--		accordingly.
GO
CREATE OR ALTER PROCEDURE PR_STU_OR_DEPT
	@NAME	VARCHAR(20)
AS
BEGIN
	SELECT * FROM STUDENTS  
	WHERE StuName = @NAME OR StuDepartment = @NAME
END

EXEC PR_STU_OR_DEPT 'Amit Kumar'

--9.	Create a stored procedure that accepts CourseID and returns all students enrolled grouped by enrollment
--		status with counts.
GO
CREATE OR ALTER PROCEDURE PR_STU_DETAILS_BY_COURSEID
	@CID	VARCHAR(10)
AS
BEGIN
	SELECT COUNT(EnrollmentStatus), EnrollmentStatus
	FROM STUDENTS JOIN ENROLLMENT
	ON STUDENTS.StudentID = ENROLLMENT.StudentID
	JOIN COURSE 
	ON COURSE.CourseID = ENROLLMENT.CourseID
	GROUP BY EnrollmentStatus
END

EXEC PR_STU_DETAILS_BY_COURSEID 'CS201'


--Part – C 


--10.	Create a stored procedure that accepts a year as input and returns all courses assigned to faculty in that
--		year with classroom details.
GO
CREATE OR ALTER PROCEDURE PR_COURSE_TO_FACULTY
	@YEAR	INT
AS
BEGIN
	SELECT	FacultyName, ClassRoom
	FROM FACULTY JOIN COURSE_ASSIGNMENT
	ON FACULTY.FacultyID = COURSE_ASSIGNMENT.FacultyID
	WHERE Year = @YEAR
END

EXEC PR_COURSE_TO_FACULTY 2024

--11.	Create a stored procedure that accepts From Date and To Date and returns all enrollments within that
--		range with student and course details.
GO 
CREATE OR ALTER PROCEDURE PR_DATE_TODATE
	@D	DATE,
	@TD	DATE
AS
BEGIN
	SELECT StuName, CourseName
	FROM ENROLLMENT JOIN STUDENTS
	ON ENROLLMENT.StudentID = STUDENTS.StudentID
	JOIN COURSE
	ON ENROLLMENT.CourseID = COURSE.CourseID
	WHERE ENROLLMENT.EnrollmentDate BETWEEN @D AND @TD
END

EXEC PR_DATE_TODATE '2021-07-01','2022-01-05'

--12.	Create a stored procedure that accepts FacultyID and calculates their total teaching load 
--		(sum of credits of all courses assigned).
GO
CREATE OR ALTER PROCEDURE PR_SUM_CREDITS_OF_FACULTIES
	@FID	INT
AS 
BEGIN
	SELECT SUM(CourseCredits),FacultyName
	FROM FACULTY JOIN COURSE_ASSIGNMENT
	ON FACULTY.FacultyID = COURSE_ASSIGNMENT.FacultyID
	JOIN COURSE
	ON COURSE.CourseID = COURSE_ASSIGNMENT.CourseID
	GROUP BY FacultyName
END

EXEC PR_SUM_CREDITS_OF_FACULTIES 106


--EXTRA OUTPUT PARAMETER QUERY

GO 
CREATE OR ALTER PROCEDURE PR_COUNT_COURSES_BY_DEPT
	@DEPT	VARCHAR(50),
	@COUNT	INT OUT
AS
BEGIN
	SELECT @COUNT = COUNT(*)
	FROM COURSE 
	WHERE CourseDepartment = @DEPT
	GROUP BY CourseDepartment
END

DECLARE @ANS INT
EXEC PR_COUNT_COURSES_BY_DEPT 'CSE', @COUNT = @ANS OUT
SELECT @ANS AS ANSWER
