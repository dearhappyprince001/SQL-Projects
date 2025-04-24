CREATE DATABASE college;

USE college;
drop table student;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);

insert into student
(rollno,name)
values
(101,"Prince"),
(102,"Sam"),
(103,"karan");

select * from student;
insert into student values (104,"Rohit");
select * from student;

create database sqlcompany;

use sqlcompany;

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

create table temp1(
id int unique
);

insert into temp1 values (101);
insert into temp1 values (101);
select*from temp1;

create table emp(
id int,
salary int default 25000
);

insert into emp (id) values (1);
select * from emp;

create database college2;
use college2;

create table students(
rollno int primary key,
name varchar(30),
marks int not null,
grade varchar(20),
city varchar(40)
);


insert into students 
(rollno , name , marks , grade , city)
values
(101 , "anil" , 78 , "C" , "Pune"),
(102 , "bhumika" , 93 , "A" , "Mumbai"),
(103 , "chetan" , 85 , "B" , "Mumbai"),
(104 , "anil" , 96 , "A" , "Delhi"),
(105 , "anil" , 12 , "F" , "Delhi"),
(106 , "arohit" , 82 , "B" , "Delhi");

select marks,grade,name from students;
select * from students;
select distinct city from students;
select name from students where marks>75;
select city from students where city = "Delhi";

select * from students where marks>80;
select * from students where city="delhi";
select * from students where marks>90 and city="mumbai";
select * from students where marks+10>100;
select * from students where marks = 96;
select * from students where marks between 85 and 93;
select * from students where city in ("Delhi" ,"Mumbai");
select * from students where city not in ("Delhi" ,"Mumbai");
select * from students limit 3;
select * from students where marks>80 limit 3;
select * from students order by city asc;
select * from students order by city desc;
select * from students order by marks asc;
select max(marks) from students;
select min(marks) from students;
select sum(marks) from students;
select avg(marks) from students;
select count(marks) from students;

select city , count(rollno) from students group by city;
select city , name , count(rollno) from students group by city , name;
select city , avg(marks) from students group by city;
select city , avg(marks) from students group by city order by city asc;
select grade , count(rollNo) from students group by grade order by grade asc;

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

         -- 2.Delete
         
delete from students where marks<40;
select * from students;


          -- Alter Commands
		  -- 1.Add Column

Alter Table students add column age int;

select * from students;

-- 2 Drop Column

Alter table students drop column age;

select * from students;

alter table students change name full_name varchar(50);

set sql_safe_updates = 0;


delete from students where marks < 80;

alter table students drop column grade;

create view view1 as select rollno, full_name from students;
select * from view1 
where full_name = "anil";

drop view view1;
select * from view1;



