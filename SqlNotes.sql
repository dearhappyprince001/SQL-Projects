CREATE DATABASE college;

USE college;

drop table student;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
email varchar(50)
);

insert into student
(rollno,name,email)
values
(101,"Prince","Prince@gmail.com"),
(102,"Sam","Sam@gmail.com"),
(103,"karan","Karan@gmail.com");

select * from student;

insert into student values (104,"Rohit","Rohit@gmail.com");
select * from student;
insert into student values (105,"Varun","Varun@gmail.com");
insert into student values (106,"Chomu","Chomu@gmail.com");


-- insert into student values ("hemant",107,"hemant@gmail.com");  Note: These values are in same order of column name
insert into student values (107,"hemant","hemant@gmail.com");
select * from student;


select name from student;
select rollno from student;
select email from student;
select name,email,rollno from student;
select email,rollno,name from student;
select rollno , email from student where name like "h%";


                           -- Single Line Comment

create database sqlcompany;

use sqlcompany;

drop table employee;

create table employee(
id int primary key,
name varchar(30),
salary int 

);

insert into employee 
(id,name,salary)
values
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

Select * from employee;
insert into employee (id,name,salary) values (5,"robin",5000);

                             -- It is used to print second highest salary from employee table.
select max(salary) as second_highest_salary from employee where salary < (select max(salary) from employee);   -- (by using subqueries) 

                             -- It is used to print third highest salary from employee table.
SELECT MAX(salary) AS Third_Highest_Salary FROM employee WHERE salary < (SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee));   -- (by using subqueries) 

create table temp1(
id int unique
);

insert into temp1 values (101);
insert into temp1 values (101);
select*from temp1;

drop table emp;

create table emp(
id int primary key,
name varchar(30),
salary int default 25000
);

insert into emp (id,name) 
values
 (1,"Sonal"),
 (2,"Amit"),
 (3,"Divya"),
 (4,"Prachi");

select * from emp;
select name from emp;
select id,salary from emp;
select salary,id from emp;

                      -- Next Database Created

create database college2;

use college2;

drop table students ;

create table students(
rollno int primary key,
first_name varchar(30),
last_name varchar(30),
marks int not null,
grade varchar(20),
city varchar(40)
);


insert into students 
(rollno , first_name , last_name , marks , grade , city)
values
(101 , "anil" , "Kumar" , 78 , "C" , "Pune"),
(102 , "bhumika" , "sharma" , 93 , "A" , "Mumbai"),
(103 , "chetan" , "shah" , 85 , "B" , "Mumbai"),
(104 , "anil" , "saini" , 96 , "A" , "Delhi"),
(105 , "anil" , "shahu", 12 , "F" , "Delhi"),
(106 , "arohit" , "verma" ,  82 , "B" , "Delhi");

select * from students;

                             -- String Methods.
select rollno , first_name , last_name , Upper(first_name) as New_first_name , Upper(last_name) as New_last_name from students;
select rollno , first_name , last_name , Upper(first_name) as New_first_name , lower(last_name) as New_last_name from students;
select rollno , first_name , character_length(first_name) as first_namecharacter_length from students;
select rollno , first_name , character_length(last_name) as last_namecharacter_length from students;
select rollno , first_name , length(first_name) as bytes from students;
select rollno , first_name , last_name , concat(first_name , " " , last_name ) as full_name from students;
select rollno , first_name , position("tan"  in "chetan") as name from students;
select rollno , first_name , replace( last_name, "verma" , "Kapoor" ) as Modified from students;
select substring(first_name , 1 , 4) as SubString from students;
select rollno , first_name , last_name , reverse(last_name) as ReverseLast_name from students;
select rollno , first_name , last_name , repeat(last_name , 2) as ReverseLast_name from students;


				      -- select queries in details.
                        
select marks,grade,first_name from students;

select * from students;

select distinct city from students;

select distinct first_name from students;

select  distinct last_name from students where marks>75;

select city from students where city = "Delhi";

select * from students where marks>80;

select * from students where marks<10;

select * from students where city="delhi";

select * from students where marks>90 and city="mumbai";

select * from students where marks<100 and city = "Gurugram";

select * from students where marks>90 or city="Noida";

select * from students where marks+10>100;

select * from students where marks = 96;

select * from students where marks = 83;

select * from students where marks between 85 and 93;

select * from students where rollno between 102 and 106;

select * from students where city in ("Delhi" ,"Mumbai");

select * from students where city in ("Pune" ,"Delhi");

select * from students where city not in ("Delhi" ,"Mumbai");

                           -- limit Clause
                           
select * from students limit 3;

select * from students limit 5;

select * from students where marks>80 limit 3;

select * from students where grade = "A" limit 1;

select * from students where city = "Pune"  limit 2;

select * from students where marks>80 and city = "Pune" limit 3;

-- select * from students limit -3; we can not provide limit value as negative.

select * from students limit 0;

                               -- Order By Clause.
                               
select * from students order by city asc;
select * from students order by city desc;
select * from students order by marks asc;
select * from students order by marks desc;
select * from students order by last_name asc;
select * from students order by first_name desc;
select * from students order by first_name , last_name , city , marks ;
select * from students order by first_name asc , last_name desc , city asc , marks desc , grade asc;

                                      -- Aggregate Functions.
                                    
select max(marks) from students;
select min(marks) from students;
select sum(marks) from students;
select avg(marks) from students;
select count(marks) from students;
select max(grade) from students;
select min(grade) from students;
select count(grade) from students;

                                          -- Group by clause.
                                          
select city , count(rollno) from students group by city;
select city , first_name , count(rollno) from students group by city , first_name;
select city , avg(marks) from students group by city;
select city , avg(marks) from students group by city order by city asc;
select grade , count(rollNo) from students group by grade order by grade asc;

                                        -- Having Clause.
                                        
select city, count(rollno) from students group by city having max(marks)>90;

                                       -- Table Related Queries.
-- 1.Updates 
set sql_safe_updates = 0;
  
update students set grade = "O" where grade = "A";
select * from students;

update students set marks = 92 where marks = 12;
select * from students;

update students set grade = "B" where marks>80;
select * from students;

update students set first_name = "Kunal" where grade = "C";
select * from students;

update students set last_name = "Rajput" where marks<80;
select * from students;

-- 2.Delete
delete from students where marks<40;
select * from students;

delete from students where last_name = 'sharma'; 
select * from students;

delete from students where grade = "F";
select * from students;

                                 -- Alter table Commands

-- 1.Add Column
Alter Table students add column age int;
select * from students;

-- 2 Drop Column
Alter table students drop column age;
select * from students;

-- Change Column.
alter table students change first_name full_name varchar(50);
select * from students;

set sql_safe_updates = 0;


delete from students where marks < 80;

-- Drop column.
alter table students drop column grade;
select * from students;

                  -- Sql view.
create view view1 as select rollno, full_name from students;
select * from view1 
where full_name = "anil";

drop view view1;
select * from view1;

                             -- JOINS.

create database joins;

use joins;

             -- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

                 -- Insert data into Students table
INSERT INTO Students (student_id, name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob');

select * from students;

                -- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

         -- Insert data into Courses table
INSERT INTO Courses (course_id, student_id, course_name) VALUES
(101, 1, 'Math'),
(102, 2, 'Science'),
(103, 1, 'History');

select * from courses;

-- Perform INNER JOIN
SELECT *
FROM Students
INNER JOIN Courses ON Students.student_id = Courses.student_id;
-- OR
SELECT Students.name, Courses.course_name
FROM Students
INNER JOIN Courses ON Students.student_id = Courses.student_id;

-- Perform LEFT JOIN
SELECT Students.name, Courses.course_name
FROM Students
LEFT JOIN Courses ON Students.student_id = Courses.student_id;

-- Perform RIGHT JOIN
SELECT Students.name, Courses.course_name
FROM Students
RIGHT JOIN Courses ON Students.student_id = Courses.student_id;

-- Perform FULL JOIN
SELECT Students.name, Courses.course_name
FROM Students
LEFT JOIN Courses ON Students.student_id = Courses.student_id

UNION

SELECT Students.name, Courses.course_name
FROM Students
RIGHT JOIN Courses ON Students.student_id = Courses.student_id;


show index from students ;

                          -- Enum datatype in Sql 
				
create database grade;

use grade;

create table student_grade(
    id INT PRIMARY KEY AUTO_INCREMENT,
    age int not null,
    Grade VARCHAR(250) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

insert into student_grade (age , grade , priority)
 values 
(23 , "B" , "Medium"),
(26 , "A" , "High"),
(28 , "C" , "Low"),
(20 , "A" , "High");

select * from student_grade;

insert into student_grade (age , grade , priority)
 values
 --  (30 , "C" ,"Poor");it will produce error.
  (30 , "C" ,"Low");
  select * from student_grade;
  
  
                      -- To Backup the database.
BACKUP DATABASE grade TO DISK = "C:\Sql Backup\Grade DB.Bak" ;







