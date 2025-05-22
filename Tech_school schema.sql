CREATE DATABASE Tech_school;
USE Tech_school;
CREATE TABLE Programs (
program_id INT,
course_name CHAR (90),
Duration_months INT,
About CHAR (250),
PRIMARY KEY (Program_id)
);
DROP database Tech_school;
USE Tech_school; 
CREATE TABLE Students (
Student_id INT,
First_name CHAR (90),
Last_name CHAR (90),
Email VARCHAR (90),
Phone VARCHAR (15),
Date_of_birth DATE,
Gender CHAR (90),
Enrollment_date DATE,
Program_id INT,
PRIMARY KEY (Student_id),
FOREIGN KEY (Program_id) REFERENCES Programs (program_id) ON DELETE CASCADE
);
USE Tech_school;
CREATE TABLE Instructors (
Instructor_id INT,
First_name CHAR (90),
Last_name CHAR (90),
Email VARCHAR (90),
Phone VARCHAR (15),
Specialization CHAR (90),
PRIMARY KEY (Instructor_id)
);
USE Tech_school;
CREATE TABLE Courses (
Course_id INT,
Instructor_id INT,
Credit_hours DATETIME,
Course_description CHAR (200),
PRIMARY KEY (Course_id),
FOREIGN KEY (Instructor_id) REFERENCES Instructors (Instructor_id) ON DELETE CASCADE
);
USE Tech_school;
CREATE TABLE Classes (
Class_id INT,
Course_id INT (90),
Instructor_id INT,
Start_date DATE,
End_date DATE,
Classroom CHAR (90),
PRIMARY KEY (Class_id),
FOREIGN KEY (Instructor_id) REFERENCES Instructors (Instructor_id) ON DELETE CASCADE,
FOREIGN KEY (Course_id) REFERENCES Courses (Course_id) ON DELETE CASCADE
);
USE Tech_school;
CREATE TABLE Enrollment(
Enrollment_id INT,
Student_id INT,
Class_id INT,
Enrollment_date DATE,
Grade VARCHAR(12) NOT NULL,
PRIMARY KEY (Enrollmet_id),
FOREIGN KEY (Student_id) REFERENCES Students (Student_id) ON DELETE CASCADE,
FOREIGN KEY (Class_id) REFERENCES Classes (class_id) ON DELETE CASCADE
);

USE Tech_school;
CREATE TABLE Assessments (
Assessment_id INT,
CLass_id INT,
Assessment_type VARCHAR (90),
Test_date DATE,
Total_marks INT,
PRIMARY KEY (Assessment_id),
FOREIGN KEY(Class_id) REFERENCES Classes (Class_id) ON DELETE CASCADE
);
USE Tech_school;
CREATE TABLE Assessment_results (
Result_id INT,
Assessment_id INT,
Student_id INT,
Score INT,
PRIMARY KEY (Result_id),
FOREIGN KEY (Assessment_id) REFERENCES Assessments (Assessment_id) ON DELETE CASCADE,
FOREIGN KEY (Student_id) REFERENCES Students (Student_id) ON DELETE CASCADE
);
ALTER TABLE Students
ADD UNIQUE KEY (Email);
ALTER TABLE Students
ADD UNIQUE KEY (Phone);
ALTER TABLE Instructors
ADD UNIQUE KEY (Email);
ALTER TABLE Instructors
ADD UNIQUE KEY (Phone);
