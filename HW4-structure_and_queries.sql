
-- CPSC 2300 HW4
-- Daniel Rios

# 1
# create Students table
CREATE TABLE Students(
	studentID char(11) PRIMARY KEY,
    firstName varchar(20) NOT NULL,
    lastName varchar(20) NOT NULL,
    gender char(1) NOT NULL,
    dateofBirth DATE NOT NULL);
    
# create Courses table
CREATE TABLE Courses(
	courseCode varchar(6) PRIMARY KEY,
    courseName varchar(70) NOT NULL,
    level char(2) NOT NULL,
    credits int NOT NULL);
    
# create Registration table 
CREATE TABLE Registration (
    studentID CHAR(11),
    courseCode VARCHAR(6),
    grade DECIMAL(2,1) NOT NULL,
    PRIMARY KEY (studentID, courseCode),
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (courseCode) REFERENCES Courses(courseCode)
);
    
# 2

# insert data into Students table
INSERT INTO Students VALUES
('861103-2438', 'Adam', 'Johnson', 'M', '1990-10-01'),
('911212-1746', 'Eva', 'Smith', 'F', '1991-08-20'),
('950829-1848', 'Anna', 'Washington', 'F', '1993-09-26'),
('123456-0980', 'Eric', 'Alonzo', 'M', '1990-05-26'),
('908023-2456', 'Bo', 'Ek', 'M', '1992-03-15'),
('098735-3456', 'Danny', 'Goss', 'M', '1992-02-01'),
('124345-3430', 'Mike', 'White', 'M', '1995-06-10'),
('124568-1345', 'Emily', 'Young', 'F', '1995-04-28'),
('908409-0010', 'Cathy', 'Lee', 'F', '1993-10-06'),
('124587-9088', 'Ben', 'Woo', 'M', '1992-11-30'),
('120953-0909', 'Anna', 'Washington','F', '1990-10-09'),
('120449-1008', 'John', 'Goss', 'M', '1995-10-26');

# insert data into Courses table 
INSERT INTO Courses VALUES
('CS056', 'Database Systems', 'G1', 5),
('CS010', 'C++', 'U1', 5),
('ENG111', 'English', 'U1', 3),
('FIN052', 'Finance', 'G1', 5),
('PHY210', 'Physics', 'U2', 5),
('CHE350', 'Chemistry', 'U3', 5),
('BIO001', 'Biology', 'U1', 3),
('CS052', 'Operating Systems', 'G1', 5);

# insert data into Registration table
INSERT INTO Registration VALUES
('861103-2438', 'CS056', 4),
('861103-2438', 'CS010', 4),
('861103-2438', 'PHY210', 3.5),
('911212-1746', 'ENG111', 2),
('950829-1848', 'CHE350', 3),
('950829-1848', 'BIO001', 2.5),
('123456-0980', 'CS052', 3.5),
('123456-0980', 'CS056', 4),
('908023-2456', 'PHY210', 3.0),
('908023-2456', 'CS056', 1.0),
('908023-2456', 'CS010', 2.0),
('124345-3430', 'FIN052', 2.5),
('124345-3430', 'CHE350', 4),
('908409-0010', 'CS052', 2),
('124587-9088', 'BIO001', 4),
('124587-9088', 'CS052', 3.5);

# 3
SELECT firstName, lastName
FROM Students
ORDER BY lastName, firstName;

# 4
SELECT studentID, firstName, lastName, dateofBirth
FROM Students
WHERE gender = 'F' AND dateofBirth < '1993-01-01';

# 5
SELECT COUNT(studentID) 
FROM Registration
WHERE courseCode = 'PHY210';

# 6
SELECT COUNT(*) 
FROM Courses
WHERE courseCode LIKE 'CS%';

# 7
SELECT courseCode, courseName
FROM Courses
WHERE level = 'G1' AND credits = 5;

# 8
SELECT level, COUNT(*) 
FROM Courses
GROUP BY level;

# 9
SELECT AVG(grade)
FROM Registration
WHERE studentID = '861103-2438';

# 10
SELECT studentID
FROM Registration
WHERE courseCode = 'CS052'
ORDER BY grade DESC
LIMIT 1;

# 11
SELECT DISTINCT courseCode
FROM Registration
WHERE studentID = '861103-2438' AND courseCode IN (SELECT courseCode FROM Registration WHERE studentID = '123456-0980');
 
# 12
SELECT studentID
FROM Students
WHERE studentID NOT IN (SELECT studentID FROM Registration);

# 13
SELECT studentID, SUM(grade), AVG(grade) AS AvgGrade
FROM Registration
GROUP BY studentID
HAVING AvgGrade < 3;

# 14
SELECT studentID
FROM Registration
GROUP BY studentID
ORDER BY COUNT(*) DESC
LIMIT 1;

# 15
SELECT DISTINCT studentID
FROM Registration
WHERE courseCode IN ('PHY210', 'BIO001');

# 16
SELECT firstName, lastName
FROM Students
ORDER BY dateofBirth DESC
LIMIT 1;

# 17
SELECT COUNT(studentID)
FROM Students
WHERE studentID NOT IN (SELECT studentID FROM Registration WHERE courseCode = 'CS056');

# 18
UPDATE Courses
SET credits = 6
WHERE courseCode LIKE 'CS%' AND credits = 5;

# 19
DELETE FROM Registration
WHERE studentID = '908409-0010';
