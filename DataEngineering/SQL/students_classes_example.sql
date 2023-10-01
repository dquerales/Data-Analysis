-- Example 
USE test;

-- create students table
CREATE TABLE students(
	studentId INT,
    studentName VARCHAR(10)
);

-- insert data
INSERT INTO students (studentId,studentName)
	VALUES (1, 'John'),
           (2, 'Matt'),
           (3, 'James');

-- check table
SELECT *
FROM students;

-- create classes table
CREATE TABLE classes(
	ClassId INT,
    ClassName VARCHAR(10)
    );
    
-- insert data
INSERT INTO classes (ClassId, ClassName)
SELECT 1, 'Maths'
UNION ALL
SELECT 2, 'Arts'
UNION ALL
SELECT 3, 'History';

-- check table
SELECT *
FROM classes;

-- create student class relation
CREATE TABLE StudentClass (
	StudentId INT,
    ClassId INT
);

-- insert data
INSERT INTO StudentClass (StudentId, ClassId)
SELECT 1,1
UNION ALL
SELECT 1,2
UNION ALL
SELECT 3,1
UNION ALL
SELECT 3,2
UNION ALL
SELECT 3,3;

-- check table
SELECT *
FROM studentclass;

-- Question # 1: What will be the best posible join if we want to retrieve all the students who have signed up for the classes
SELECT students.studentName, classes.ClassName
FROM studentclass
INNER JOIN students ON students.StudentId = studentclass.StudentId
INNER JOIN classes ON classes.ClassId = studentclass.ClassId;

-- Question # 2: What will be the best posible join if we want to retrieve all the students who have signed up for no classes
SELECT students.studentName, classes.ClassName
FROM students
LEFT JOIN studentclass ON students.StudentId = studentclass.StudentId
LEFT JOIN classes ON classes.ClassId = studentclass.ClassId
WHERE classes.ClassName IS NULL;