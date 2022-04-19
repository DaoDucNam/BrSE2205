DROP DATABASE IF EXISTS Testing_System;
CREATE DATABASE Testing_System; 

-- Cần chạy lại khi khởi động chạy MySQL
USE Testing_System; 

-- 1. Tạo Bảng Phòng Ban
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
 DepartmentID    INT PRIMARY KEY AUTO_INCREMENT,
 DepartmentName  VARCHAR(100) 
);

-- 2. Tạo bảng Position
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
 PositionID   INT PRIMARY KEY AUTO_INCREMENT,
 PositionName VARCHAR(20)
);

-- 3. Tạo bảng Account

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
AccountID     INT PRIMARY KEY AUTO_INCREMENT,
Email         VARCHAR(100),
UserName      VARCHAR(70),
FullName      VARCHAR(100),
DepartmentID  INT,
PositionID    INT,
CreateDate    DATE
);

-- 4. Tạo bảng GROUP

DROP TABLE IF EXISTS `GROUP`;
CREATE TABLE `GROUP` (
GroupID      INT PRIMARY KEY AUTO_INCREMENT,
GroupName    VARCHAR(100),
CreatorID    INT,
CreateDate   DATE
);

-- 5.Tạo bảng GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
  GroupID    INT,
  AccountID  INT,
  JoinDate   DATE,
  PRIMARY KEY (GroupID, AccountID),
  FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID), 
  FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

-- 6.Tạo bảng TypeQuestion

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
 TypeID    INT PRIMARY KEY AUTO_INCREMENT,
 TypeName  ENUM('Easy','Multi-Choice')
);

-- 7. Tạo bảng CategoryQuestion

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
 CategoryID     INT PRIMARY KEY AUTO_INCREMENT,
 CategoryName   ENUM('Java', '.Net', 'SQL', 'Postman', 'Ruby')
);

-- 8. Tạo bảng Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
 QuestionID       INT PRIMARY KEY AUTO_INCREMENT,
 Content          VARCHAR (500),
 CategoryID       INT,
 TypeID           INT,
 CreatorID        INT,
 CreateDate       DATE,
 FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
 FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
 FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- 8. Tạo bảng Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
AnswerID     INT PRIMARY KEY AUTO_INCREMENT,
Content      VARCHAR(400),
QuestionID   INT,
Iscorrect    INT,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

-- 9. Tạo bảng Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
ExamID      INT PRIMARY KEY AUTO_INCREMENT,
Code        VARCHAR(15),
Title       VARCHAR(100),
CategoryID  INT,
Duration    INT,
CreatorID   INT,
CreateDate  DATE,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
);

-- 10. Tạo bảng ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
 ExamID       INT,
 QuestionID   INT,
 PRIMARY KEY (ExamID, QuestionID),
 FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
 FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);


INSERT INTO Department (DepartmentName) VALUES ( N'Marketing');
INSERT INTO Department (DepartmentName) VALUES ( N'Sale');
INSERT INTO Department (DepartmentName) VALUES ( N'Bảo vệ');
INSERT INTO Department (DepartmentName) VALUES ( N'Nhân Sự');
INSERT INTO Department (DepartmentName) VALUES ( N'Kỹ thuật');
INSERT INTO Department (DepartmentName) VALUES ( N'Tài chính');
INSERT INTO Department (DepartmentName) VALUES ( N'Phó giám đốc');
INSERT INTO Department (DepartmentName) VALUES ( N'Giám đốc');
INSERT INTO Department (DepartmentName) VALUES ( N'Thư ký');
INSERT INTO Department (DepartmentName) VALUES ( N'Bán hàng');

SELECT * FROM Department;

INSERT INTO Position (PositionName) VALUES(N'Giám đốc');
INSERT INTO Position (PositionName) VALUES(N'Phó Giám đốc');
INSERT INTO Position (PositionName) VALUES(N'Trưởng phòng');
INSERT INTO Position (PositionName) VALUES(N'Phó trưởng phòng');
INSERT INTO Position (PositionName) VALUES(N'Quản đốc');
INSERT INTO Position (PositionName) VALUES(N'Giám đốc marketing');
INSERT INTO Position (PositionName) VALUES(N'Giám đốc nhân sự');
INSERT INTO Position (PositionName) VALUES(N'Phó phòng sale');
INSERT INTO Position (PositionName) VALUES(N'Phó phòng nhân sự');
INSERT INTO Position (PositionName) VALUES(N'Nhân viên marketing');
INSERT INTO Position (PositionName) VALUES(N'Nhân viên nhân sự');
INSERT INTO Position (PositionName) VALUES(N'Trưởng phòng sale');

SELECT *
FROM Position;

-- Update Phuong Phap
UPDATE Position
SET PositionName = N'PGD-Nhân Sự'
WHERE PositionID IN (2,3,4);

INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('namnt@gmail.com', 'namnt','Le Van Nam', 1, 1, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('tuanvl@gmail.com', 'tuanlv','Le Van Tuan', 1,2, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('nganct@gmail.com', 'ngact',N'Cao Thị Nga', 2, 1, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('vanttt@gmail.com', 'vanttt',N'Trần Thị Thu Vân', 3, 1, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('thaott@gmail.com', 'thaott','Trần Thị Thảo', 3, 2, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('annv@gmail.com', 'annv','Nguyen Van An', 3, 3, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('lanhtv@gmail.com', 'lanhtv',N'Trần Văn Lành', 4, 1, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('thoaid@gmail.com', 'thoaid','Thạo Đàm', 4, 2, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('thaivv@gmail.com', 'thaivv',N'Võ Văn Thái', 4, 3, '2020-11-12');
INSERT INTO Account (Email, UserName, FullName, DepartmentID, PositionID, CreateDate) VALUES('phunv@gmail.com', 'phunv','Nguyễn Văn Phú', 5, 1, '2020-11-12');

SELECT * 
FROM Account;

INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group1', 1, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group2', 2, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group3', 3, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group4', 1, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group5', 2, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group6', 3, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group7', 4, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group8', 5, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group9', 6, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group10', 7, '2021-01-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group11', 7, '2021-02-14');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group13', 7, '2021-03-11');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group14', 8, '2021-05-10');
INSERT INTO `GROUP` (GroupName, CreatorID, CreateDate) VALUES(N'Group15', 6, '2021-06-03');

SELECT *
FROM `Group`;

INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (1, 1, '2022-01-02');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (2, 2, '2022-01-03');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (3, 3, '2022-01-04');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (4, 4, '2022-01-05');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (5, 5, '2022-01-06');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (6, 6, '2022-01-07');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (7, 7, '2022-01-08');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (8, 8, '2022-01-09');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (9, 9, '2022-01-10');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (10, 10, '2022-01-11');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (1, 2, '2022-01-02');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (1, 3, '2022-01-02');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (1, 4, '2022-01-02');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (2, 1, '2022-01-02');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (2, 3, '2022-01-02');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES (2, 4, '2022-01-02');


SELECT COUNT(*)
FROM GroupAccount;

INSERT INTO TypeQuestion (TypeName) VALUES ('Easy');
INSERT INTO TypeQuestion (TypeName) VALUES ('Easy');
INSERT INTO TypeQuestion (TypeName) VALUES ('Easy');
INSERT INTO TypeQuestion (TypeName) VALUES ('Easy');
INSERT INTO TypeQuestion (TypeName) VALUES ('Easy');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multi-Choice');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multi-Choice');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multi-Choice');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multi-Choice');
INSERT INTO TypeQuestion (TypeName) VALUES ('Multi-Choice');

SELECT COUNT(*)
FROM TypeQuestion;


INSERT INTO CategoryQuestion (CategoryName) VALUES(N'Java');
INSERT INTO CategoryQuestion (CategoryName) VALUES(N'.Net');
INSERT INTO CategoryQuestion (CategoryName) VALUES(N'Postman');
INSERT INTO CategoryQuestion (CategoryName) VALUES(N'SQL');
INSERT INTO CategoryQuestion (CategoryName) VALUES(N'Ruby');


SELECT COUNT(*)
FROM CategoryQuestion;

INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('Who are you?', 1, 1, 1, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is Java?', 2, 2, 2, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is OOP?', 3, 3, 3, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is SQL?', 4, 4, 4, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is MySQL?', 5, 5, 5, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is sum?', 4, 5, 6, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is avg?', 4, 6, 7, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is restAPI?', 3, 4, 8, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is ruby?', 5, 8, 9, '2021-12-01');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) VALUES('What is programing?', 3, 8, 9, '2021-12-01');

SELECT * 
FROM Question;


INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('ABDEEEE',1, true);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data',1, true);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data1',2, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data2',3, true);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data3',4, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data4',5, true);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data5',6, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data6',7, true);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data7',8, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data8',9, true);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data9',10, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data10',10, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data11',10, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data12',10, false);
INSERT INTO Answer (Content, QuestionID, isCorrect) VALUES('It can accept many data13',10, false);

SELECT *
FROM Answer;

INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-1', 'Final Java Exam', 1, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-2', 'Final Postname Exam', 2, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-3', 'Final QA Exam', 1, 120, 3, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-4', 'Final Philo Exam', 4, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-5', 'Final Secury Exam', 5, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-6', 'Final netowrk Exam', 1, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-7', 'Final oracle Exam', 2, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-8', 'Final Japanse Exam', 3, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-9', 'Final Ruby Exam', 4, 120, 1, '2022-01-03');
INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate) VALUES ('Exam-1-', 'Final SQL Exam', 5, 120, 1, '2022-01-03');

SELECT *
FROM Exam;

INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 1);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 2);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 3);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 4);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 5);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 6);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 7);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 8);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 9);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (1, 10);

INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 1);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 2);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 3);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 4);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 5);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 6);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 7);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 8);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 9);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 10);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (2, 10);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (3, 1);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (3, 2);
INSERT INTO ExamQuestion (ExamID, QuestionID) VALUES (3, 4);

SELECT *
FROM ExamQuestion;

-- Sub-query 
SELECT MAX(LENGTH(a.FullName))
FROM Account a;

SELECT *
FROM `Account` a
WHERE LENGTH(a.Fullname) = (SELECT MAX(LENGTH(b.Fullname)) FROM  `Account` b WHERE b.DepartmentID = 3);


-- Question 2: Lấy ra tất cả các phòng ban
SELECT DepartmentID, DepartmentName
FROM Department;

-- Question 3: Lấy ra ID của phòng ban Sales
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
-- Cach 1
SELECT *
FROM Account
ORDER BY length(FullName) DESC
LIMIT 1;

-- Cach 2
SELECT *
FROM Account
WHERE length(FullName) = (SELECT MAX(length(FullName)) FROM Account);

-- Question 5:  Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
-- Cach 1
SELECT a.FullName
FROM Account a
WHERE length(FullName) = (SELECT MAX(length(FullName)) FROM Account) AND DepartmentID = 3;
-- Cach 2
WITH dept_3 AS (
 SELECT * FROM `Account` WHERE DepartmentID = 3
)
SELECT *
FROM `dept_3`
WHERE LENGTH(fullName) = (SELECT MAX(LENGTH(FullName)) FROM `dept_3`);

-- Question 6:  Lấy ra tên group đã tham gia trước ngày 20/12/2022
SELECT GroupName
FROM `Group`
WHERE CreateDate <'2022-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT QuestionID
FROM Answer
GROUP BY QuestionID
HAVING COUNT(AnswerID) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2022
SELECT `Code`
FROM Exam
WHERE Duration >= 60 AND CreateDate <'2022-12-20';

-- Question 9:  Lấy ra 5 group được tạo gần đây nhất
SELECT GroupName, CreateDate
FROM `Group`
ORDER BY CreateDate DESC 
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT count(*) AS 'Sonhanvien'
FROM `Account`
WHERE DepartmentID = '2';

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT FullName
FROM `Account`
WHERE FullName LIKE 'C%' AND FullName LIKE '%a';

-- Question 12:  Xóa tất cả các Exam được tạo trước ngày 20/12/2019
DELETE 
FROM Exam
WHERE CreateDate < "2019-12-20";

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE 
FROM Question
WHERE Content LIKE `câu hỏi%`;

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và  email
UPDATE `Account`
SET 
    Email      = 'loc.nguyenba@vti.com.vn',
    FullName   = 'Nguyễn Bá Lộc'
WHERE AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `Account`
SET 
GroupID = 4
WHERE AccountID = 5;

SELECT a.QuestionID, COUNT(*) AS `NumberOfAnswer`
FROM Answer a
GROUP BY QuestionID
HAVING COUNT(*) > 4;

SELECT *
FROM `Account` 
WHERE length(FullName) = (SELECT MAX(length(FullName)) FROM `Account`);

SELECT *
FROM `Group` g
ORDER BY g.CreateDate DESC
LIMIT 3;

SELECT *
FROM `Account` a
JOIN `GROUP` g ON a.AccountID = g.CreatorID
JOIN Department d ON a.DepartmentID = d.DepartmentID;


