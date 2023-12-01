CREATE TABLE IF NOT EXISTS Faculties (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(25) NOT NULL
);
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(25) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);
CREATE TABLE IF NOT EXISTS Programs(
    ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(25) NOT NULL,
    Tuition_Fee INT NOT NULL,
    DepartmentID INT NOT NULL ,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE IF NOT EXISTS Lecturers (
	LecturerID INT PRIMARY KEY,
	LecturerName VARCHAR(30) NOT NULL,
	Email VARCHAR(35) NOT NULL,
	DepartmentID INT UNIQUE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE IF NOT EXISTS ProgramYears(
	ProgramYearID INT PRIMARY KEY,
	StartYear INT NOT NULL,
	EndYear INT NOT NULL,
	ProgramID INT NOT NULL,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID),
	AdvisorID INT NOT NULL,
    FOREIGN KEY (AdvisorID) REFERENCES Lecturers(LecturerID)
);
CREATE TABLE IF NOT EXISTS Semesters (
     SemesterID INT PRIMARY KEY,
    -- Name of the semester (e.g., 'Fall' or 'Spring')
    SemesterName VARCHAR(6) COMMENT 'Fall or spring',
    ProgramYearID INT NOT NULL ,
    FOREIGN KEY (ProgramYearID) REFERENCES ProgramYears(ProgramYearID)
);

CREATE TABLE IF NOT EXISTS Courses (
    CourseID INT PRIMARY KEY,
    Code VARCHAR(10) NOT NULL,
    Name VARCHAR(32) NOT NULL,
    ECTS INT NOT NULL,
    Credits INT NOT NULL,
    -- TYPE IS (Elective or Compulsory) 
    Type VARCHAR(11),
    SemesterID INT NOT NULL,
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID) 
);
CREATE TABLE IF NOT EXISTS Classes (
    ClassID INT PRIMARY KEY,
   -- A,B,C or D
    ClassName VARCHAR(1) NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    StudentEmail VARCHAR(30)NOT NULL,
    YearOfEnrollment INT NOT NULL, 
    Graduate BOOLEAN,
    GraduationDate DATE
);
