## Faculties Table:
- FacultyID (Primary Key)
- FacultyName
 
## Departments Table:
- DepartmentID (Primary Key)
- DepartmentName
- FacultyID (Foreign Key referencing Faculties)
 
## Programs Table:
- ProgramID (Primary Key)
- ProgramName
- Tuition Fee
- DepartmentID (Foreign Key referencing Departments)
 
## Lecturers Table:
- LecturerID (Primary Key)
- LecturerName
- Email
- DepartmentID (Foreign Key referencing Departments)
 
## ProgramYears Table:
- ProgramYearID (Primary Key)
- StartYear
- EndYear
- ProgramID (Foreign Key referencing Programs)
- AdvisorID (Foreign Key referencing Lecturers)
 
## Semesters Table:
- SemesterID (Primary Key)
- SemesterName [fall, spring]
- ProgramYearID (Foreign Key referencing ProgramYear)
 
## Courses Table:
- CourseID (Primary Key)
- Code
- Name
- ECTS
- Credits
- Type (Elective or Compulsory)
- SemesterID (Foreign Key referencing Semester)
 
## Classes Table:
- ClassID (Primary Key)
- ClassName [ A ose B ]
- CourseID (Foreign Key referencing Courses)
 
## Students Table: [ te dhenat e nxenesit ]
- StudentID (Primary Key)
- StudentName
- StudentEmail
- YearOfEnrollment
- Graduate BOOLEAN
- GraduationDate
 
## ProgramEnrollment Table: [ nxenesi esht rregjistruar per 1 vit | ERD Relationship]
- EnrollmentID (Primary Key)
- StudentID (Foreign Key referencing Students)
- ProgramYearID (Foreign Key referencing ProgramYear)
 
## CourseSelection Table: [ nxenesi selekton klasen | ERD Relationship]
- CourseSelectionID (Primary Key)
- ClassID (Foreign Key referencing Classes)
- StudentID (Foreign Key referencing Students)
 
## LecturerClass: [lidhja prosorit me klasen | ERD Relationship]
- LecturerClassID (Primary Key)
- ClassID (Foreign Key referencing Classes)
- LecturerID (Foreign Key referencing Lecturers)
 
## Attendance Table: [ ERD Relationship] 
- AttendanceID (Primary Key)
- StudentID (Foreign Key referencing Students)
- CourseID (Foreign Key referencing Course)
- total [ sa or ishin per ate dite ]
- attended [ sa or ka qen ne klas ]
 
## InterimGrades Table: [kjo ka cdo note per cdo quiz, projekt, final etc.| ERD Relationship]
- GradeID (Primary Key)
- StudentID (Foreign Key referencing Students)
- CourseID (Foreign Key referencing Course)
- Type [Project, Assignments, Quizes, Midterm, Final]
- Percentage
- Value 
 
## FinalGrade Table: [kjo ka noten qe rrumbullakoset ne transcript | ERD Relationship]
- FinalGradeID (Primary Key)
- StudentID ( Foreign Key referencing Students )
- CourseID ( Foreign Key referencing Course )
- Value
 
## Payments Table: [Cdo kest ka rreshtin e vet ktu | ERD Relationship]
- PaymentID (Primary Key)
- StudentID (Foreign Key referencing Students)
- ProgramYearID (Foreign Key referencing ProgramYear)
- PaymentAmount
- PaymentDate DATE