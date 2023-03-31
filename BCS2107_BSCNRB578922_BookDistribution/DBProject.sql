use Project
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    grade_level INT,
    teacher_id INT,
    CONSTRAINT fk_teacher
        FOREIGN KEY (teacher_id)
        REFERENCES Teachers(teacher_id)
);

CREATE TABLE Textbooks (
    textbook_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    subject VARCHAR(50),
    grade_level INT,
    quantity INT,
    CONSTRAINT ck_quantity
        CHECK (quantity >= 0)
);

CREATE TABLE Distribution (
    distribution_id INT PRIMARY KEY,
    student_id INT,
    textbook_id INT,
    date_issued DATE,
    date_returned DATE,
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    CONSTRAINT fk_textbook
        FOREIGN KEY (textbook_id)
        REFERENCES Textbooks(textbook_id)
);

INSERT INTO Teachers (teacher_id, first_name, last_name, department) 
VALUES 
    (1, 'John', 'Kinyua', 'Math'),
    (2, 'Jane', 'Wanjiru', 'Science'),
    (3, 'Bob', 'Omondi', 'English'),
    (4, 'Alex', 'Rotich', 'Kiswahili'),
    (5, 'Emily', 'Mwende', 'SST'),
    (6, 'David', 'Bundi', 'CRE');

	select *from Teachers

INSERT INTO Students (student_id, first_name, last_name, grade_level, teacher_id) 
VALUES 
    (1, 'Tom', 'Ngatia', 3, 1),
    (2, 'Sarah', 'Kimani', 2, 2),
    (3, 'Mike', 'Otieno', 1, 3),
    (4, 'Amy', 'Kendi', 1, 3),
    (5, 'Daniel', 'Wafula', 2, 1),
    (6, 'Grace', 'Nanjala', 3, 2);

	select *from Students

INSERT INTO Textbooks (textbook_id, title, author, subject, grade_level, quantity) 
VALUES 
    (1, 'Mathematics for Grade 3', 'James Charles', 'Math', 3, 10),
    (2, 'Science for Grade 2', 'Benjamin Watson', 'Science', 2, 8),
    (3, 'English for Grade 1', 'Winnie Adams', 'English', 1, 12),
    (4, 'Kiswahili for Grade 4', 'Wallah Bin', 'Kiswahili', 4, 15),
    (5, 'SST for Grade 5', 'Trevor Noah Mwende', 'SST', 5, 20),
    (6, 'CRE for Grade 3', 'Darwin Washington', 'CRE', 3, 10);

	select *from Textbooks

	UPDATE Textbooks
SET author = REPLACE(author, 'Mwende', '')
WHERE author LIKE 'Trevor Noah%';

UPDATE Textbooks
SET author = CONCAT(author, ' Wallah')
WHERE author = 'Wallah Bin';
	
INSERT INTO Distribution (distribution_id, student_id, textbook_id, date_issued, date_returned) 
VALUES 
    (1, 1, 1, '2023-01-02', NULL),
    (2, 2, 2, '2023-01-05', NULL),
    (3, 3, 3, '2023-01-08', NULL),
    (4, 4, 4, '2023-01-11', NULL),
    (5, 5, 5, '2023-01-14', NULL),
    (6, 6, 6, '2023-01-17', NULL);

	select *from Distribution

SELECT TOP 5 *
FROM Students;

SELECT *
FROM Students
WHERE grade_level = '3';

SELECT Textbooks.*
FROM Textbooks
JOIN Distribution ON Textbooks.textbook_id = Distribution.textbook_id
JOIN Students ON Distribution.student_id = Students.student_id
WHERE Students.first_name = 'Sarah';

SELECT grade_level, AVG(quantity)  
FROM Textbooks 
GROUP BY grade_level;

SELECT * FROM Textbooks WHERE quantity > 10;

SELECT t.first_name, t.last_name
FROM Teachers t
JOIN Students s ON t.teacher_id = s.teacher_id
WHERE s.first_name = 'Tom' AND s.last_name = 'Ngatia'; 