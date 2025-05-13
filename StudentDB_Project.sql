
-- Step 1: Create Database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Step 2: Create Tables

-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course VARCHAR(50)
);

-- Marks table
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Step 3: Insert Sample Data

-- Insert data into Students
INSERT INTO Students (student_id, name, course) VALUES
(1, 'Aaryan', 'B.Tech'),
(2, 'Riya', 'B.Sc'),
(3, 'Neha', 'BCA');

-- Insert data into Marks
INSERT INTO Marks (mark_id, student_id, subject, marks) VALUES
(1, 1, 'Math', 85),
(2, 1, 'Physics', 90),
(3, 2, 'Math', 70),
(4, 2, 'Physics', 60),
(5, 3, 'Math', 40),
(6, 3, 'Physics', 45);

-- Step 4: Useful Queries

-- 1. Display all students
SELECT * FROM Students;

-- 2. Display all marks
SELECT * FROM Marks;

-- 3. Show marks of each student
SELECT s.name, m.subject, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id;

-- 4. Find students who scored less than 50
SELECT s.name, m.subject, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
WHERE m.marks < 50;

-- 5. Calculate average marks of each student
SELECT s.name, AVG(m.marks) AS average_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name;

-- 6. Find the topper
SELECT s.name, AVG(m.marks) AS average_marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name
ORDER BY average_marks DESC
LIMIT 1;
