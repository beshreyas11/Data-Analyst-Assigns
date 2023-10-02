\\ question 1&2

create database assignments;
use assignments;

\\ question 3

create table countries(name varchar(100),
				population int ,
                capital varchar(150));
insert into countries(name,population,capital)
values('China',1382,'Beijing'),('India',1326,'Delhi'),('United States',324,'Washington D.C.'),('Indonesia',260,'Jakarta'),('Brazil',209,'Brasilia'),
('Pakistan',193,'Islamabad'),('Nigeria',187,'Abuja'),('Bangladesh',163,'Dhaka'),('Russia',143,'Moscow'),('Mexico',128,'Mexico City'),
('Japan',126,'Tokyo'),('Philippines',102,'Manila'),('Ethiopia',101,'Addis Ababa'),('Vietnam',94,'Hanoi'),('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),('Iran',80,'Tehran'),('Turkey',79,'Ankara'),('Congo',79,'Kinshasa'),('France',64,'Paris'),('United Kingdom',65,'London'),
('Italy',60,'Rome'),('South Africa',55,'Pretoria'),('Myanmar',54,'Naypyidaw') ;

insert into countries(name,population,capital)
values('uganda',500,'kampala'),('iraq',65,'baghdad'),('ukarine',75,'kyiv') ;
select * from big_countries where capital = 'new delhi';
update big_countries set capital ='new delhi'
where capital ='delhi' ;

\\ question 4

rename table countries to big_countries ;

\\ question 5

create table suppliers(supplier_id int auto_increment primary key,
						supplier_name varchar(150),
						location varchar(250));
                        
create table product(product_id int auto_increment primary key,
						product_name varchar(150) not null unique,
                        suppliers_id int,
                        foreign key (suppliers_id) references suppliers(supplier_id));
                        
create table stock(id int auto_increment primary key,
					product_id int,
                    balance_stock int,
                    foreign key (product_id) references product(product_id));
 
 \\ question 6

 insert into suppliers(supplier_name,location)
 values('ayush','bengaluru'),('laksh','mumbai'),('etash','goa') ;
 
insert into product (product_name,suppliers_id)
 values('dairy milk',1),('munch',2),('kit kat',3) ;

 insert into stock(product_id,balance_stock)
 values(4,155),(5,75),(6,23) ;

 select * from stock ;
  select * from suppliers ;
  select * from product ;
 
\\ question 7
 
  alter table suppliers
  modify supplier_name varchar(100) not null unique ;
  
  -- question 8
update emp set deptno = 10;
update emp set deptno = 20 where emp_id%2 = 0;
update emp set deptno = 30 where emp_id%3= 0;    
update emp set deptno = 40 where emp_id%4 = 0; 
update emp set deptno = 50 where emp_id%5 = 0;
select  * from emp;

\\ question 9
  
create index empid_index
on  employee(empid);

create index emp_no_index
on  emp(emp_no);

\\ question 10

CREATE VIEW emp_sal AS
SELECT emp_no, first_name, last_name, salary
FROM emp
order by salary desc ;
