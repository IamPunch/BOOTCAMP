CREATE DATABASE college_db;

CREATE TABLE Faculty (
    faculty_id SERIAL PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15),
    department VARCHAR(50)
);

CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    fee NUMERIC(10,2) CHECK (fee >= 0),
    duration VARCHAR(20),
    faculty_id INT REFERENCES Faculty(faculty_id)
);

CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES Students(student_id),
    course_id INT REFERENCES Courses(course_id),
    enrollment_date DATE
);

INSERT INTO Faculty (faculty_name, email, phone, department) VALUES
('Dr. Ramesh Kumar', 'ramesh.kumar@college.edu', '9876543210', 'Computer Science'),
('Dr. Anita Sharma', 'anita.sharma@college.edu', '9876543211', 'Computer Science'),
('Prof. Suresh Rao', 'suresh.rao@college.edu', '9876543212', 'Electronics'),
('Dr. Priya Nair', 'priya.nair@college.edu', '9876543213', 'Mechanical'),
('Prof. Vikram Singh', 'vikram.singh@college.edu', '9876543214', 'Electronics');

INSERT INTO Students (student_name, email, age, city) VALUES
('Arjun Reddy', 'arjun.reddy@mail.com', 21, 'Hyderabad'),
('Ravi Teja', 'ravi.teja@mail.com', 19, 'Bangalore'),
('Sneha Rao', 'sneha.rao@mail.com', 22, 'Hyderabad'),
('Karan Mehta', 'karan.mehta@mail.com', 20, 'Mumbai'),
('Ananya Iyer', 'ananya.iyer@mail.com', 18, 'Chennai'),
('Rahul Nanda', 'rahul.nanda@mail.com', 23, 'Hyderabad'),
('Divya Ranganathan', 'divya.r@mail.com', 20, 'Bangalore'),
('Aditya Kiran', 'aditya.kiran@mail.com', 19, 'Delhi'),
('Meera Krishnan', 'meera.k@mail.com', 24, 'Chennai'),
('Arvind Nair', 'arvind.nair@mail.com', 17, 'Hyderabad');

INSERT INTO Courses (course_name, fee, duration, faculty_id) VALUES
('Data Structures', 15000, '3 months', 1),
('Database Systems', 22000, '4 months', 1),
('Machine Learning', 30000, '6 months', 2),
('Digital Electronics', 18000, '3 months', 3),
('Embedded Systems', 25000, '5 months', 3),
('Thermodynamics', 12000, '3 months', 4),
('Robotics', 28000, '6 months', 5),
('Signal Processing', 20000, '4 months', 5);

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-01-10'),
(1, 3, '2025-01-15'),
(2, 2, '2025-01-11'),
(2, 4, '2025-01-12'),
(3, 1, '2025-01-13'),
(3, 5, '2025-01-14'),
(4, 6, '2025-01-15'),
(4, 7, '2025-01-16'),
(5, 8, '2025-01-17'),
(5, 1, '2025-01-18'),
(6, 2, '2025-01-19'),
(6, 3, '2025-01-20'),
(7, 4, '2025-01-21'),
(7, 6, '2025-01-22'),
(8, 5, '2025-01-23'),
(8, 7, '2025-01-24'),
(9, 8, '2025-01-25'),
(9, 2, '2025-01-26'),
(2, 1, '2025-01-27'),
(3, 3, '2025-01-28');

SELECT * FROM Students;

SELECT * FROM Faculty;

SELECT * FROM Courses;

SELECT student_name FROM Students;

SELECT faculty_name FROM Faculty;

SELECT * FROM Students WHERE age > 20;

SELECT * FROM Students WHERE city = 'Hyderabad';

SELECT * FROM Students WHERE city = 'Hyderabad' AND age > 20;

SELECT * FROM Students WHERE city = 'Hyderabad' OR city = 'Bangalore';

SELECT * FROM Students WHERE age BETWEEN 18 AND 22;

SELECT * FROM Students WHERE student_name LIKE 'A%';

SELECT * FROM Students WHERE student_name LIKE '%N';

SELECT * FROM Students WHERE student_name LIKE '%RA%';

SELECT DISTINCT city FROM Students;

SELECT * FROM Students ORDER BY student_id LIMIT 5;

SELECT * FROM Courses ORDER BY fee DESC LIMIT 3;

SELECT * FROM Courses WHERE fee > 20000;

SELECT * FROM Courses ORDER BY fee DESC;

SELECT COUNT(*) AS total_students FROM Students;

SELECT COUNT(*) AS total_faculty FROM Faculty;

SELECT
    MAX(fee) AS highest_fee,
    MIN(fee) AS lowest_fee,
    AVG(fee) AS average_fee,
    SUM(fee) AS total_fee
FROM Courses;

SELECT city, COUNT(*) AS student_count
FROM Students
GROUP BY city;

SELECT department, COUNT(*) AS faculty_count
FROM Faculty
GROUP BY department
HAVING COUNT(*) > 1;

UPDATE Students SET city = 'Pune' WHERE student_id = 4;

UPDATE Courses SET fee = 17000 WHERE course_id = 1;

UPDATE Faculty SET department = 'AI & Data Science' WHERE faculty_id = 2;

UPDATE Courses SET faculty_id = 5 WHERE course_id = 4;

DELETE FROM Enrollments WHERE enrollment_id = 20;

DELETE FROM Students WHERE student_id = 10;

DELETE FROM Enrollments WHERE course_id = 8;

DELETE FROM Courses WHERE course_id = 8;

SELECT s.student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT c.course_name, f.faculty_name
FROM Courses c
JOIN Faculty f ON c.faculty_id = f.faculty_id;

SELECT s.student_name, c.course_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

SELECT s.student_name, c.course_name, f.faculty_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id;

SELECT s.student_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;

SELECT c.course_name, s.student_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
LEFT JOIN Students s ON e.student_id = s.student_id;

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT f.faculty_name, COUNT(c.course_id) AS total_courses
FROM Faculty f
LEFT JOIN Courses c ON f.faculty_id = c.faculty_id
GROUP BY f.faculty_name;

SELECT s.student_name, c.course_name, f.faculty_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
WHERE f.faculty_id = 1;

SELECT f.faculty_name, COUNT(e.student_id) AS student_count
FROM Faculty f
JOIN Courses c ON f.faculty_id = c.faculty_id
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY f.faculty_name
ORDER BY student_count DESC
LIMIT 1;

INSERT INTO Students (email, age, city) VALUES
('noname@mail.com', 20, 'Delhi');

INSERT INTO Faculty (faculty_name, email, phone, department)
VALUES ('Duplicate Faculty', 'ramesh.kumar@college.edu', '9999999999', 'IT');

INSERT INTO Students (student_name, email, age, city)
VALUES ('Young Student', 'young@mail.com', 15, 'Delhi');

INSERT INTO Courses (course_name, fee, duration, faculty_id)
VALUES ('Free Course', -500, '2 months', 1);

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (999, 1, '2025-02-01');

INSERT INTO Courses (course_name, fee, duration, faculty_id)
VALUES ('Ghost Course', 10000, '3 months', 999);
