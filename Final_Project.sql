create database Final_Project;
use Final_Project ;

create table Students (
StudentID int primary key ,
FirstName varchar (50),
LastName varchar (50),
Email varchar (50),
BrithDate date ,
EnrollmentDate date 
);

insert into Students (StudentID , FirstName , LastName , Email , BrithDate , EnrollmentDate ) values 
(1 , 'John' , 'Doe' , 'john.doe@email.com' , '2000-01-15' , '2022-08-01' ),
(2 , 'Jane' , 'Smith' ,'jane.smith@email.com' , '1999-05-25' , '2021-08-01');


create table Departments (
DepartmentID int primary key ,
DepartmentName varchar (50) 
);

insert into Departments (DepartmentID , DepartmentName ) values 
(1 , 'Computer Science' ),
(2 , 'Mathematics' ) ;



create table Courses (
CourseID int primary key , 
CourseName varchar (50),
DepartmentID int  ,
Credits  int ,
foreign key (DepartmentID) references Departments (DepartmentID) 
);


insert into Courses ( CourseID , CourseName , DepartmentID , Credits ) values 
(101 , 'Introduction to SQL ' , 1 , 3 ),
(102 , 'Data Structures ' , 2 , 4 );
 
 
 create table Instructors (
InstructorID int primary key ,
FirstName varchar (50),
LastName varchar (50),
Email varchar (50),
DepartmentID int ,
foreign key (DepartmentID) references Departments (DepartmentID) 
);

insert into Instructors (InstructorID , FirstName , LastName , Email , DepartmentID ) values 
(1 , 'Alice' , 'Johnson' , 'alice.johnson@univ.com' , 1 ),
(2 , 'Bob' , 'Lee' , 'bob.lee@univ.com' , 2 );

create table Enrollments (
EnrollmentID int primary key ,
StudentID int ,
CourseID int , 
EnrollmentDate date,
foreign key (StudentID) references Students (StudentID ),
foreign key (CourseID) references Courses (CourseID) 
);

insert into Enrollments (EnrollmentID , StudentID , CourseID , EnrollmentDate ) values 
(1 , 1 , 101 , '2022-08-01' ),
(2 , 2 , 102 , '2021-08-01' );

## Q-1 CRUD 

select * from Students ; 
update Students set Email = 'johndon2220@email.com' where StudentID = 1 ;
SET FOREIGN_KEY_CHECKS = 0;
delete from Students where Email  = 'johndon2220@email.com' ;

select * from Departments ;
update Departments set DepartmentName = 'IT' where DepartmentID = 1 ;
delete from Departments where DepartmentID = 1 ;

select * from Courses ;
update Courses set CourseName = 'AI' where CourseID = 1 ;
delete from Courses where CourseID = 1;

select * from Instructors ;
update Instructors set FirstName = 'saurav' where InstructorID = 1 ;
delete from Instructors where InstructorID = 1 ;

select * from Enrollments ;
update Enrollments set StudentID = 5 where EnrollmentID = 1 ;
delete from Enrollments where EnrollmentID = 1;

## Q - 2 

select*from Students where EnrollmentDate > '2022-01-01' ;

## Q - 3 

select * from Courses where DepartmentID = (select DepartmentID from Departments where DepartmentName = 'Mathemetics' ) limit 5 ; 

## Q - 4 

select c.CourseID , c.CourseName , count(e.StudentID) AS NumStudents 
from Courses c 
left join Enrollments e on c.CourseID = e.CourseID 
group by c.CourseID , c.CourseName 
having count(e.StudentID) > 5 ;

## Q - 5 

SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE EXISTS (
  SELECT 1 FROM Enrollments e1
  WHERE e1.StudentID = s.StudentID AND e1.CourseID = 101
)
AND EXISTS (
  SELECT 1 FROM Enrollments e2
  WHERE e2.StudentID = s.StudentID AND e2.CourseID = 102
);


##  Q - 6 

select distinct s.StudentID , FirstName , LastName from Students s 
join Enrollments e on s.StudentID = e.StudentID 
where e.CourseID in (101,102) ;

## Q - 7 

select avg(Credits) AS AVGCradits from  Courses ;

## Q - 8 

ALTER TABLE Instructors
ADD column Salary DECIMAL(10,2);

insert into Instructors (Salary) value 
(80000.10),
(50000.80);

select * from Instructors ;

select max(i.Salary) as MAXSalary 
from Instructors i
join Departments d on d.DepartmentID = i.DepartmentID 
where d.DepartmentName = 'Computer science ' ;

## Q - 9 

SELECT d.DepartmentID, d.DepartmentName, COUNT(DISTINCT e.StudentID) AS StudentsInDept
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

## Q - 10 

select s.StudentID , concat(s.FirstName ,' ' , s.LastName) AS StudentName , c.CourseID , c.CourseName , e.EnrollmentDate
from Students s 
join Enrollments e on s.StudentID = s.StudentID 
join Courses c on e.CourseID = c.CourseID 
order by s.StudentID ;


## Q - 11 

select s.StudentID , concat(s.FirstName ,' ' , s.LastName) AS StudentName , c.CourseID , c.CourseName , e.EnrollmentDate
from Students s 
left join Enrollments e on s.StudentID = s.StudentID 
left join Courses c on e.CourseID = c.CourseID 
order by s.StudentID ;


## Q - 12 

select distinct s.StudentID, s.FirstName, s.LastName
from Students s
join Enrollments e ON s.StudentID = e.StudentID
where e.CourseID IN (
select  CourseID FROM Enrollments GROUP BY CourseID HAVING COUNT(StudentID) > 10
);

## Q - 13 

select StudentID , EnrollmentDate , year (EnrollmentDate) AS Enrollyear from Students ;

## Q - 14 

select InstructorID, CONCAT(FirstName, ' ', LastName) AS InstructorName FROM Instructors;

## Q - 15 

SELECT EnrollmentID, EnrollmentDate, 
       COUNT(*) OVER (ORDER BY EnrollmentDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeEnrollments
FROM Enrollments
ORDER BY EnrollmentDate;

## Q - 16 

SELECT StudentID, FirstName, LastName, EnrollmentDate,
  CASE
    WHEN DATEDIFF(CURRENT_DATE, EnrollmentDate) >= 4*365 THEN 'Senior'
    ELSE 'Junior'
  END AS YearLabel
FROM Students;
