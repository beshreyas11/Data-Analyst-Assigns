
use assignments ;


\\ question 1
delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(ord_year integer,ord_month integer)
BEGIN
    select ordernumber, orderdate, status 
    from orders 
    where year(orderdate) = ord_year
    and month(orderdate) = ord_month ;
    
END; //
call order_status(2005,05);

\\ question 2 
# a.
delimiter //
create table cancellations (
id integer primary key auto_increment,
customernumber integer ,
ordernumber integer,
foreign key(customernumber) references customers(customernumber),
foreign key(ordernumber) references orders(ordernumber));
 
 # b.
 CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_frocedure`()
BEGIN
	declare cusnumber, ordernumber, finished integer default 0;
    
	declare order_cursor cursor for
    select customernumber, ordernumber 
    from orders
    where status='cancelled';

    declare exit handler for NOT FOUND set finished = 1;
    

    open order_cursor;    
    
    ordloop:REPEAT
		fetch order_cursor into cusnumber, ordernumber;
        insert into cancellations (customernumber, ordernumber) values(cusnumber, ordernumber);
        
	until finished = 1
    end repeat ordloop ;
    end
    
    
-- question 3
# a.
CREATE DEFINER=`root`@`localhost` FUNCTION `purchase_status`(cnum integer) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare pstatus varchar(10) default '';
    declare amt integer default 0;
    
    set amt = (select sum(amount) from payments where customerNumber = cnum) ;
    if amt < 25000 then
      set pstatus = 'Silver';
	elseif amt between 25000 and 50000 then
      set pstatus = 'Gold';
	else 
       set pstatus = 'Platinum';
	end if;
    
RETURN pstatus;
END
# b.
select customerNumber, customerName,country,salesrepemployeenumber, purchase_status(customerNumber) as status from customers;
select * from customers ;

\\ question 4
delimiter //
CREATE TRIGGER update_cascade 
AFTER UPDATE ON `movies` 
FOR EACH ROW
BEGIN
    update rentals set movieid = new.id
    where movieid = old.id;
END; //

-- On delete cascade
delimiter //
CREATE TRIGGER delete_cascade 
AFTER DELETE ON `movies` 
FOR EACH ROW
BEGIN
   delete from rentals 
   where movieid = old.id;
END;//


\\ question 5

select fname,salary from employee order by salary desc limit 1 offset 2 ;

\\ question 6

select empid,fname,lname as full_name,salary,rank() over(order by salary desc) as salary_rank
from employee ;
