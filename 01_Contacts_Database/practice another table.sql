create database practice;
use practice;

drop table emp;
drop table projects;
set sql_safe_updates=1;
create table emp (

		emp_id int primary key auto_increment,
        emp_name varchar(100),
        dapartment varchar(100),
        city varchar(100),
        salary int     
);

create table projects (
		project_id int primary key auto_increment,
        emp_id int,
        project_name varchar(100),
        budget int,
        
        foreign key (emp_id)
        references emp(emp_id)
);

insert into emp
values
(1,'Amit','IT','Noida',70000),
(2,'Rahul','HR','Delhi',50000),
(3,'Priya','IT','Noida',90000),
(4,'Neha','Finance','Mumbai',60000),
(5,'Rohit','IT','Delhi',80000),
(6,'Anjali','HR','Noida',55000),
(7,'Vikas','Finance','Delhi',65000),
(8,'Karan','IT','Mumbai',75000),
(9,'Simran','HR','Noida',52000),
(10,'Arjun','Finance','Mumbai',85000);

insert into projects
values
(101,1,'AI System',200000),
(102,1,'Website',100000),
(103,3,'Cloud Migration',300000),
(104,5,'Security Tool',250000),
(105,8,'Mobile App',150000),
(106,10,'ERP System',400000),
(107,4,'Audit Tool',120000),
(108,7,'Finance Dashboard',180000);

select *
from	emp e
inner join projects p
using (emp_id);

select emp_name from emp
where city = 'noida';

select emp_name from emp
where salary > 70000;

select emp_name from emp
where salary between 50000 and 80000;

select  distinct dapartment,
	count(emp_name) as 'Total'
from emp
group by dapartment;


select avg(salary),
		dapartment
        from emp
group by dapartment;


select max(salary),
    city
    from emp
    group by city;
    
select sum(salary),
 dapartment
 from emp
 group by dapartment;
 
 select dapartment,
		count(emp_name)
from emp
group by dapartment
having count(emp_name) > 2;

select city,
	avg(salary)
    from emp
    group by city
    having avg(salary) > 65000;
    
    select dapartment,
	sum(salary)
    from emp
    group by dapartment
    having sum(salary) > 200000;

select e.emp_name,
		p.project_name
from emp e
inner join projects p
on e.emp_id = p.emp_id;

select e.emp_name,
		p.project_name
from emp e
inner join projects p
on e.emp_id = p.emp_id
where project_name is null;

select p.project_name,
e.dapartment
from emp e
inner join projects p
on e.emp_id = p.emp_id
where dapartment = 'IT';
    
select dapartment,
		avg(salary),
        count(emp_name)
from emp
group by dapartment
having avg(salary) > 70000
and count(emp_name) > 2;


SELECT e.dapartment,
       SUM(p.budget) AS total_budget
FROM emp e
INNER JOIN projects p
ON e.emp_id = p.emp_id
GROUP BY e.dapartment
HAVING SUM(p.budget) > 300000;


select dapartment,
	avg(salary)
from emp
where city = 'noida'
group by dapartment;

select e.dapartment
from emp e
join projects p
on e.emp_id = p.emp_id
group by dapartment
having avg(budget) > 200000;

select e.dapartment
from emp e
join projects p
on e.emp_id = p.emp_id
where city in ('delhi','noida')
group by dapartment
having avg(salary) > 65000 or count(project_name) > 1;

select e.dapartment,
		count(distinct e.emp_id) as 'Number of employees',
        avg(e.salary) as 'Average salary',
        sum(p.budget) as 'Total project budget'
from emp e
join projects p
on e.emp_id = p.emp_id
where e.salary > 60000
group by e.dapartment
having sum(p.budget) > 300000;

select e.dapartment as 'Department',
		count(distinct e.emp_id) as 'Number of employees',
        avg(e.salary) as 'Average salary'
	from emp e
join projects p
on e.emp_id = p.emp_id where city in ('delhi','noida')
group by e.dapartment
having avg(e.salary) > 65000
and count(*) >= 2;
