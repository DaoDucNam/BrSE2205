
DROP TABLE IF EXISTS `Department`;
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
 DepartmentName VARCHAR(100)
);
INSERT INTO Department (DepartmentName) VALUES('Sales');
INSERT INTO Department (DepartmentName) VALUES('Marketing');
INSERT INTO Department (DepartmentName) VALUES('HR');
INSERT INTO Department (DepartmentName) VALUES('Sercurity');
INSERT INTO Department (DepartmentName) VALUES('Finance');
SELECT *
FROM Department;


DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
 PositionID INT PRIMARY KEY AUTO_INCREMENT,
 PositionName VARCHAR(100)
);
INSERT INTO Postion (PositionName) VALUES('Deve');
INSERT INTO Postion (PositionName)  VALUES('Test');
INSERT INTO Postion (PositionName)  VALUES('ScrumMaster');
INSERT INTO Postion (PositionName)  VALUES('PM');
SELECT *
FROM Position;


DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
 AccountID INT PRIMARY KEY AUTO_INCREMENT,
 Email VARCHAR(100),
 UserName VARCHAR(100),
 FullName VARCHAR(100),
 DeparmentID INT,
 PositionID INT,
 CreateDate DATE
);
SELECT *
FROM `Account`;


DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
GroupID INT PRIMARY KEY AUTO_INCREMENT,
GroupName VARCHAR(100),
CreatorID VARCHAR(100),
CreatDate DATE
);
SELECT *
FROM `Group`;



DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount (
GroupID INT PRIMARY KEY AUTO_INCREMENT,
AccountName VARCHAR(100),
JoinDate DATE
);
SELECT *
FROM GroupAccount;


DROP DATABASE IF EXISTS TypeQuestion;
CREATE DATABASE TypeQuestion;
USE TypeQuestion;
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID INT PRIMARY KEY AUTO_INCREMENT,
TypeName VARCHAR(100)
);
SELECT *
FROM TypeQuestion;


DROP DATABASE IF EXISTS CategoryQuestion;
CREATE DATABASE CategoryQuestion;
USE CategoryQuestion;
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
CategoryID INT PRIMARY KEY AUTO_INCREMENT,
CategoryName VARCHAR(100)
);
INSERT INTO CategoryQuestion (CategoryName) VALUES('Java');
INSERT INTO CategoryQuestion (CategoryName)  VALUES('.NET');
INSERT INTO CategoryQuestion (CategoryName)  VALUES('SQL');
INSERT INTO CategoryQuestion (CategoryName)  VALUES('Postman');
INSERT INTO CategoryQuestion (CategoryName)  VALUES('Ruby');
SELECT *
FROM CategoryQuestion;


DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QuestionID INT PRIMARY KEY AUTO_INCREMENT,
Content VARCHAR(100),
CategoryID INT,
TypeID INT,
CreaterID INT,
CreateDate DATE
);
SELECT *
FROM Question;


DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
AnswerID INT PRIMARY KEY AUTO_INCREMENT,
Content VARCHAR(100),
AnswerID INT,
isCorrect ENUM('True', 'False')
);
SELECT *
FROM Answer;


DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
ExamID INT PRIMARY KEY AUTO_INCREMENT,
Code INT,
Title VARCHAR(100),
CategoryID INT,
Duration TIME,
CreateID INT,
CreateDate DATE
);
SELECT *
FROM Exam;


DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
ExamID INT PRIMARY KEY AUTO_INCREMENT,
QuestionID INT
);
SELECT *
FROM ExamQuestion;