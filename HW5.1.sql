-- Daniel Rios
-- CPSC 2300 HW5

# creating the databasee

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

-- Part 1

# (1)
SELECT courseName, credits
FROM Courses
JOIN Registration 
ON Courses.courseCode = Registration.courseCode
WHERE studentID = '861103-2438';

# (2)
SELECT s.studentID, firstName, lastName, SUM(credits)
FROM Students s
JOIN Registration r ON s.studentID = r.studentID
JOIN Courses c ON r.courseCode = c.courseCode
GROUP BY s.studentID;

# (3)
SELECT s.studentID, lastName, firstName, AVG(grade) AS grade_avg
FROM Students s
JOIN Registration r ON s.studentID = r.studentID
GROUP BY studentID
HAVING AVG(grade) = (SELECT AVG(grade) AS grade_avg 
					FROM Students s 
					JOIN Registration r ON s.studentID = r.studentID 
					GROUP BY s.studentID
					ORDER BY grade_avg DESC
					LIMIT 1);

# (4)
SELECT firstName, lastName
FROM Students s
JOIN Registration r ON s.studentID = r.studentID
JOIN Courses c ON r.courseCode = c.courseCode
WHERE courseName = 'Database Systems';

# (5)
SELECT s.firstName, s.lastName
FROM Students s
JOIN Registration r1 ON s.studentID = r1.studentID
JOIN Courses c1 ON r1.courseCode = c1.courseCode
JOIN Registration r2 ON s.studentID = r2.studentID
JOIN Courses c2 ON r2.courseCode = c2.courseCode
WHERE c1.courseName = 'Database Systems' AND c2.courseName = 'C++';

# (6)
SELECT s.studentID, firstName, lastName, courseName, grade
FROM Students s
LEFT JOIN Registration r ON s.studentID = r.studentID
LEFT JOIN Courses c ON r.courseCode = c.courseCode;

# (7)
SELECT firstName, lastName, courseName
FROM Students s
JOIN Registration r ON s.studentID = r.studentID
JOIN Courses c ON r.courseCode = c.courseCode
WHERE c.courseCode LIKE 'CS%';

-- Part 2

# create database
create table Inventory
(
itemid varchar(20) primary key,
name varchar(30),
price decimal(6,2),
quantity int
);

create table Transaction
(
 transid int auto_increment primary key,
 itemid varchar(20),
 quantity int,
 time datetime,
 foreign key (itemid) references Inventory(itemid)
);

create table Inventory_history
(
 id int auto_increment primary key,
 itemid varchar(20),
 action varchar(20),
 oldprice decimal(6,2),
 time datetime,
 foreign key (itemid) references Inventory(itemid)
);

# (1)
DELIMITER |
CREATE TRIGGER Insert_inventory
    AFTER INSERT ON Inventory
    FOR EACH ROW BEGIN 
    INSERT INTO Inventory_history
    SET 
        itemid = NEW.itemid,
        action = 'add an item',
        oldprice = NULL,
		time = NOW();
	END;
|
DELIMITER ;

# (2)
DELIMITER |
CREATE TRIGGER change_quantity
    AFTER INSERT ON Transaction
    FOR EACH ROW BEGIN 
    UPDATE Inventory
    SET 
        quantity = quantity - NEW.quantity
        WHERE itemid = NEW.itemid;
	END;
|
DELIMITER ;
    
# (3)
DELIMITER |
CREATE TRIGGER change_price
    BEFORE UPDATE ON Inventory
    FOR EACH ROW BEGIN 
	IF NEW.price <> OLD.price THEN
    UPDATE Inventory_history
	SET 
        itemid = OLD.itemid,
        action = 'price change',
        time = NOW();
	END IF;
    END;
|
DELIMITER ;
