--SUBJECT (SubjCode, Description)
--Primary Key (SubjCode)
--SUBJECTOFFERING (Year, Semeseter, Fee, SubjCode, DateEnrolled, Grade, StudentID)
--Primary Key (Year, Semester)
--Foreign Key (SubjCode) References SUBJECT
--TEACHER (StaffID, Surname, GivenName)
--Primary Key (StaffID)
--ENROLMENT (Year, Semester, StudentID, DateEnrolled, Grade)
--Foreign Key (Year, Semester,StudentID) SUBJECTOFFERING, STUDENT
--STUDENT (StudentID, Surname, GivenName, Gender)
--Primary Key (StudentID)

CREATE DATABASE Practice
USE Practice

CREATE TABLE SUBJECT (
    SubjCode    NVARCHAR(100) PRIMARY KEY
   ,Description NVARCHAR(100) 
);

CREATE TABLE STUDENT (
    StudentID   NVARCHAR(10) PRIMARY KEY
   ,Surname     NVARCHAR(100)
   ,GivenName   NVARCHAR(100)
   ,Gender      NVARCHAR(1) CHECK (Gender IN ('M', 'F', 'I')) 
)

CREATE TABLE SUBJECTOFFERING (
    SubjCode    NVARCHAR(100)
   ,Year        INT
   ,Semester    INT 
   ,Fee         MONEY  CHECK (Fee >= 0)
   ,StaffID     INT
   ,PRIMARY KEY (Semester)
   ,FOREIGN KEY (SubjCode) REFERENCES SUBJECT
   ,FOREIGN KEY (StaffID) REFERENCES SUBJECT
)

CREATE TABLE ENROLMENT (
    StudentID   NVARCHAR(10)
   ,SubjCode    NVARCHAR(100)
   ,Year        INT
   ,Semester    INT 
   ,Grade       NVARCHAR(2) CHECK (Grade IN ('N', 'P', 'C', 'D', 'HD'))
   ,DateEnrolled DATE
   ,PRIMARY KEY (StudentID, SubjCode, Year, Semester)
   ,FOREIGN KEY (StudentID) REFERENCES STUDENT
)