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
