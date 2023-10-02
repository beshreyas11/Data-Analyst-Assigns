use assignments ;

\\ question 1

select * from employee
where deptno = 10 and salary >= 3000;

\\ question 2

select * from students ;
select id,name,marks,case
when marks between 40 and 50 then 'Second Class'
when marks between 50 and 60 then 'First Class'
when marks between 60 and 80 then'First Class'
when marks between 80 and 100 then 'Distinctions'
else 'fail' end as 'student_grades' from students ;

select id,name,marks,count(*),case
when marks between 40 and 50 then 'Second Class'
when marks between 50 and 60 then 'First Class'
when marks between 60 and 80 then'First Class'
when marks between 80 and 100 then 'Distinctions'
else 'fail' end as 'student_grades' from students group by student_grades ; 
 
 \\ question 3
 
 select distinct id,city from station
 where id mod 2 = 0 
 order by city ;
 
 \\ question 4
 
 SELECT
(select count(city) as N from station) -
(select COUNT(distinct city) from station);

\\ question 5

select distinct CITY FROM STATION 
WHERE city REGEXP '^[a e i o u]' order by city;

select distinct CITY FROM STATION 
WHERE city REGEXP '^[a e i o u]' and city regexp '[a e i o u]$'  order by city;

select distinct CITY FROM STATION 
WHERE city not REGEXP '^[a e i o u]' order by city;

select distinct CITY FROM STATION 
WHERE city not REGEXP '^[a e i o u]' and city not regexp '[a e i o u]$'  order by city;
select * from emp;

-- question 6

select * from emp where salary > 2000
and hire_date >= date_sub(curdate(),interval 36 month) 
order by hire_date;

-- question 7

select deptno,sum(salary) from employee
group by deptno ;

\\ question 8

select count(*) from city where population > 100000 ;

\\ question 9

select sum(population) as 'population_of_california' from city where district = 'california'
group by district ;

\\ question 10

select district,avg(population) as 'avg_population' from city 
group by district ;

\\ question 11

select orderNumber,orders.customernumber,customerName,status,comments from customers
right join orders on customers.customernumber = orders.customernumber
where status ='disputed';
