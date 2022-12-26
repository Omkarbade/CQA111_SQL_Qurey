create database cqa111;
use cqa111;

create table employee(Id int,Ename varchar(50),designation varchar(50),Esalary int);

select * from employee;

drop table employee;

insert into employee(Id,Ename,designation,Esalary) 
values (101,'Omkar','QA',35000),(102,'Remant','JuniorQA',32000),
       (103,'Mayur','Dev',30000),(104,'Santosh','HR',25000),
	   (105,'Sanket','Acc',22000);

insert into employee(Id,Ename,designation,Esalary) 
values (106,'Tippal','Dev',31000);

delete from Employee where Ename='Tippal';

    select Ename, Esalary + 100 Add_Salary from employee;
	select Ename, Esalary - 500 sub_Salary from employee;
	select Ename, Esalary *12 Mul_Salary from employee;
	select Ename, Esalary /30 Div_Salary from employee;
	select Ename, Esalary %2 modsalary from employee;

Alter table employee add Dept_No int;

update employee set Dept_No=40 where designation='HR';

select * from employee where Esalary<=30000;
select * from employee where Esalary>25000;
select * from employee where  Designation!='QA'and Designation!='Dev';
select * from employee order by Ename DESC;
select * from employee order by Esalary ASC;

select * from employee where Designation='QA' and salary>25000;
select * from employee where Dept_No=20 or Dept_No=30;
select * from employee where Designation='QA' and Dept_No=20;
select * from employee where designation='QA'or designation='Manager';

create procedure MiniEsalary 
As
select min(Esalary) from employee;

EXECUTE MiniEsalary;

create procedure MaxEsalary 
As
select max(Esalary) from employee;

EXECUTE MaxEsalary;

DROP PROCEDURE [MaxEsalary];
GO