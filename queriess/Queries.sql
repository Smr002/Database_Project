SELECT StudentName,BirthPlace FROM students;

SELECT Courses.Code, Courses.Name, Departments.DepartmentName, Faculties.FacultyName
FROM Courses
JOIN Semesters ON Courses.SemesterID = Semesters.SemesterID
JOIN ProgramYears ON Semesters.ProgramYearID = ProgramYears.ProgramYearID
JOIN Programs ON ProgramYears.ProgramID = Programs.ProgramID
JOIN Departments ON Programs.DepartmentID = Departments.DepartmentID
JOIN Faculties ON Departments.FacultyID = Faculties.FacultyID;


SELECT StudentName, BirthDate
FROM Students
WHERE BirthDate > '2002-10-29';

SELECT Semesters.SemesterName, COUNT(ProgramEnrollment.StudentID) AS StudentCount
FROM Semesters
LEFT JOIN ProgramEnrollment ON Semesters.ProgramYearID = ProgramEnrollment.ProgramYearID
GROUP BY Semesters.SemesterName;

SELECT Lecturers.LecturerName
FROM Lecturers
JOIN Departments ON Lecturers.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'Computer Engineering';

SELECT MAX(Tuition_Fee) AS MaxTuitionFee
FROM Programs;

SELECT Students.StudentName
FROM Students
LEFT JOIN Payments ON Students.StudentID = Payments.StudentID
WHERE Payments.PaymentID IS  NOT NULL;

SELECT Programs.ProgramName, Departments.DepartmentName
FROM Programs
JOIN Departments ON Programs.DepartmentID = Departments.DepartmentID;

SELECT Courses.Code, COUNT(Classes.ClassID) AS ClassCount
FROM Courses
LEFT JOIN Classes ON Courses.CourseID = Classes.CourseID
GROUP BY Courses.Code;

SELECT Courses.Code, Courses.Name, Programs.ProgramName
FROM Courses
JOIN Semesters ON Courses.SemesterID = Semesters.SemesterID
JOIN ProgramYears ON Semesters.ProgramYearID = ProgramYears.ProgramYearID
JOIN Programs ON ProgramYears.ProgramID = Programs.ProgramID
WHERE Courses.Type = 'Elective';


SELECT Lecturers.LecturerName, Courses.Code, Courses.Name
FROM LecturerClass
JOIN Lecturers ON LecturerClass.LecturerID = Lecturers.LecturerID
JOIN Classes ON LecturerClass.ClassID = Classes.ClassID
JOIN Courses ON Classes.CourseID = Courses.CourseID
WHERE Lecturers.LecturerName = 'Sabrina Begaj';


SELECT ProgramYears.StartYear, COUNT(ProgramEnrollment.StudentID) AS StudentCount
FROM ProgramYears
LEFT JOIN ProgramEnrollment ON ProgramYears.ProgramYearID = ProgramEnrollment.ProgramYearID
GROUP BY ProgramYears.StartYear;

--Find the department with the biggest number of students
SELECT d.DepartmentName, COUNT(pe.StudentID) AS EnrolledStudents
FROM Departments d
JOIN Programs p ON d.DepartmentID = p.DepartmentID
JOIN ProgramYears py ON p.ProgramID = py.ProgramID
JOIN ProgramEnrollment pe ON py.ProgramYearID = pe.ProgramYearID
GROUP BY d.DepartmentName
ORDER BY EnrolledStudents DESC
LIMIT 1;

--Top 5 lecturers with the biggest number of students in their classes
SELECT l.LecturerName, COUNT(cs.StudentID) AS EnrolledStudents
FROM Lecturers l
JOIN LecturerClass lc ON l.LecturerID = lc.LecturerID
JOIN Classes c ON lc.ClassID = c.ClassID
JOIN CourseSelection cs ON c.ClassID = cs.ClassID
GROUP BY l.LecturerName
ORDER BY EnrolledStudents DESC
LIMIT 5;

--Lecturer who has taught most classes
SELECT l.LecturerName, COUNT(lc.ClassID) AS TaughtClassesCount
FROM Lecturers l
JOIN LecturerClass lc ON l.LecturerID = lc.LecturerID
GROUP BY l.LecturerName
ORDER BY TaughtClassesCount DESC
LIMIT 1;

--Student with the highest scholarship
SELECT StudentName, Scolarship
FROM Students
ORDER BY Scolarship DESC
LIMIT 1;

--Total credits earned by each student
SELECT s.StudentID, s.StudentName, SUM(c.Credits) AS TotalCreditsEarned
FROM Students s
JOIN CourseSelection cs ON s.StudentID = cs.StudentID
JOIN Classes cl ON cs.ClassID = cl.ClassID
JOIN Courses c ON cl.CourseID = c.CourseID
GROUP BY s.StudentID, s.StudentName;

--Students who have paid more than average payment
SELECT s.StudentName, p.PaymentAmount, py.ProgramYearID
FROM Students s
JOIN Payments p ON s.StudentID = p.StudentID
JOIN ProgramEnrollment pe ON s.StudentID = pe.StudentID
JOIN ProgramYears py ON pe.ProgramYearID = py.ProgramYearID
WHERE p.PaymentAmount > (
    SELECT AVG(p2.PaymentAmount)
    FROM Payments p2
    WHERE p2.ProgramYearID = py.ProgramYearID
);

--Email addresses of professors of a department
SELECT DISTINCT le.Email
FROM Lecturers le
INNER JOIN Departments d ON le.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Engineering';

--Results of top performing students
SELECT fg.CourseID, c.Name AS CourseName, s.StudentName, MAX(fg.Val) AS Final_Grade
FROM FinalGrade fg
JOIN Students s ON fg.StudentID = s.StudentID
JOIN Courses c ON fg.CourseID = c.CourseID
GROUP BY fg.CourseID, c.Name, s.StudentName;

--Displaying a lot of information
SELECT 
    s.StudentID,
    s.StudentName,
    s.StudentEmail,
    s.YearOfEnrollment,
    s.Scolarship,
    s.Graduate,
    s.GraduationDate,
    s.BirthDate,
    s.BirthPlace,
    pr.ProgramID,
    pr.ProgramName,
    pr.Tuition_Fee,
    d.DepartmentID,
    d.DepartmentName,
    f.FacultyID,
    f.FacultyName
FROM 
    Students s
LEFT JOIN 
    ProgramEnrollment pe ON s.StudentID = pe.StudentID
LEFT JOIN 
    ProgramYears py ON pe.ProgramYearID = py.ProgramYearID
LEFT JOIN 
    Programs pr ON py.ProgramID = pr.ProgramID
LEFT JOIN 
    Departments d ON pr.DepartmentID = d.DepartmentID
LEFT JOIN 
    Faculties f ON d.FacultyID = f.FacultyID;

