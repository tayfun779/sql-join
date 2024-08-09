CREATE DATABASE Academy

USE Academy

create table Students (
	Id int primary key identity,
	Name varchar(50) not null,
	Surname varchar(55) not null default 'XXXXXX'
);

create table Subjects (
	Id int primary key identity,
	[Name] varchar(50) not null,
);

create table Exams (
	Id int primary key identity,
	[Date] date,
	SubjectId int,
	 foreign key (SubjectId) references Subjects(Id)
);

create table StudentExams (
	Id int primary key identity, 
	ExamResult int check(ExamResult >= 0 and ExamResult <= 100),
	ExamId int,
	StudentId int,
	foreign key (StudentId) references Students(Id),
	foreign key (ExamId) references Exams(Id)
);

SELECT 
    s.Name AS StudentName,
    s.Surname AS StudentSurname,
    sub.Name AS SubjectName,
    e.Date AS ExamDate,
    se.ExamResult
FROM 
    Students s
JOIN 
    StudentExams se ON s.Id = se.StudentId
JOIN 
    Exams e ON se.ExamId = e.Id
JOIN 
    Subjects sub ON e.SubjectId = sub.Id;