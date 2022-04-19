DROP DATABASE IF EXISTS       SQL_Assignment_4;
CREATE DATABASE IF NOT EXISTS SQL_Assignment_4;
-- Lenh chon database (chay lai khi khoi dong lai chuong trinh)
USE SQL_Assignment_4;

-- Tao table 1:        Department (Phong ban) 
DROP TABLE IF EXISTS  `Department`;
CREATE TABLE          `Department`(
			           Department_Number   INT PRIMARY KEY AUTO_INCREMENT,
			           DepartmentName VARCHAR(300) NOT NULL UNIQUE  
);

-- Tao table 2:       Employee_Table (Cong nhan)
DROP TABLE IF EXISTS `Employee_Table`;
CREATE TABLE         `Employee_Table` (
	Employee_Number         INT PRIMARY KEY AUTO_INCREMENT,
	Employee_Name           VARCHAR(100) NOT NULL UNIQUE,
    Department_Number       INT,
	FOREIGN KEY (Department_Number) REFERENCES `Department` (Department_Number)
);

-- Tao table 3:       Employee_Skill_Table (Ky nang)
DROP TABLE IF EXISTS `Employee_Skill_Table`;
CREATE TABLE         `Employee_Skill_Table` (
	Employee_Number       INT,
	Skill_Code            INT,
	Date_Registed         DATE,
    primary key (Employee_Number, Skill_Code), 
    foreign key (Employee_Number) references Employee_Table (Employee_Number)
)