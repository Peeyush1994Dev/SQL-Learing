create database sales
use sales
CREATE TABLE if not exists sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);



 Load data infile 
 'C:\salesdatafinal.csv'
 into table sales1
 fields terminated by ','
 enclosed by '"'
 lines terminated by '\n'
 ignore 1 rows 
 
 select * from sales1
 select count(*) from sales1
select sum(Sales) from Sales1
Select avg(Sales) from sales1
Select avg(Sales) from sales1 group by country 

alter table sales1
add column discount_Status varchar(10) AFTER DISCOUNT ;

update sales1
set discount_status= if (discount>0, 'yes','No')

SET SQL_SAFE_UPDATES = 0; // To avoid update erros//

alter table sales1
add column qty_status varchar(10) after quantity 

update sales1
set qty_status = if (quantity>1 , 'Multiple','single')

select qty_status ,count(qty_status) from sales1 group by qty_status

select country , avg(sales) from sales1 group by country

Select * from sales1

Select discount_status,Count(discount_Status) from Sales1 group by discount_Status

Delimiter &&
create procedure Totalsales()
Begin
select sum(Sales) from Sales1;
END &&

call Totalsales();

Delimiter &&
create procedure if not exists Totalsales1()
Begin
select Product_name, sum(Sales) from Sales1 group by Product_name;
END &&

call Totalsales1();


create database Sales_Practice
use Sales_Practice

create Table if not exists Sales_P4(
invoiceno varchar(50),
Stockcode varchar(30),
`Description` varchar(100),
Quantity int,
invoice_date varchar(30),
unitprice int,
CustomerID varchar(50),
Country varchar(30)
)

Load data infile 
'C:\Online Retail.csv'
into table Sales_P4
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


select * from Sales_P4
select Count(*) from Sales_P4

use sales
select * from sales1

DELIMITER &&
create function Actual_Profits( Sales Decimal (20,6), Discount Decimal (20,6), Shipping_cost decimal (20,6), Profit Decimal(20,6))
Returns int
deterministic
Begin
Declare Acutal_Profit int;
set Acutal_Profit= Profit - (Sales * Discount)- Shipping_cost;
Return Acutal_Profit;
end &&

Select sales, Discount, shipping_cost, profit, Actual_Profits (sales, Discount, shipping_cost, profit) from sales1

create table Insert_valueTen_Table( `No` int)

Delimiter &&
create procedure Ten_Tableinsert2()
Begin
Declare var int ;
Set var= 10;
Ten_Table : Loop
insert into Insert_valueTen_Table values (var);
Set var= 10 + var;
if var > 1000 then
	leave Ten_table;
end if;
end loop Ten_Table;
select * from Insert_valueTen_Table;
end &&

call Ten_Tableinsert2;

create database key_prim
use key_prim

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into ineuron values(01 , 'FSDA','active',100)
insert into ineuron values(02 , 'FSDs','not-actrive',100)
select * from ineuron

create table studets_ineuron(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references ineuron(course_id))


insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',05)

insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01)
insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01)
insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01)

select * from studets_ineuron

create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id))





































create database ineuron_partition
use ineuron_partition

create table if not exists ineuron_course(
course_name varchar(50),
course_id int(10),
course_title varchar(30),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)

select * from ineuron_course
insert into ineuron_course values ('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) 

select * from ineuron_course where course_launch_year= 2020;

create table if not exists ineuron_course1(
course_name varchar(50),
course_id int(10),
course_title varchar(30),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)
partition by range (course_launch_year)
(
partition p0 values less than (2019),
partition p1 values less than (2020),
partition p2 values less than (2021),
partition p3 values less than (2022),
partition p4 values less than (2023)
)

insert into ineuron_course1 values ('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 101 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 101 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 101 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 101 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) 

select partition_name, table_name, table_rows from information_schema.Partitions where table_name= 'ineuron_course1';

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses1'

select * from ineuron_course1

create table if not exists ineuron_course2(
course_name varchar(50),
course_id int(10),
course_title varchar(30),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)
partition by hash(course_launch_year)
partitions 5;

select partition_name , table_name , table_rows from information_schema.partitions where table_name = 'ineuron_courses2'

create table if not exists ineuron_course4(
course_name varchar(50),
course_id int(10) primary key,
course_title varchar(30),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)
partition by key()
partitions 10;

insert into ineuron_course4 values ('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 111 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 112 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 113 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 114 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 115 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) 

select partition_name, table_name, table_rows from  information_schema.partitions where table_name = 'ineuron_course4'


create table if not exists ineuron_course5(
course_name varchar(50),
course_id int(10),
course_title varchar(30),
course_desc varchar(60),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)
partition by list(course_launch_year)
(
Partition p0 values in (2019,2020),
partition p1 values in (2021,2022)
)

insert into ineuron_course5 values ('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 111 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 112 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 113 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 114 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 115 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) 

select partition_name, table_name, table_rows from information_schema.partitions where table_name= 'ineuron_course5'


create table if not exists ineuron_courses10
(
course_name varchar(50),
course_id int(10),
course_title varchar(60),
course_desc varchar(80),
launch_date date,
course_fee int,
course_mentor varchar(60),
course_launch_year int
)
partition by range(course_launch_year)
subpartition by hash(course_launch_year)
subpartitions 5 (
partition p0 values less than (2019) ,
partition p1 values less than (2020) ,
partition p2 values less than (2021) ,
partition p3 values less than (2022) 
);

insert into ineuron_course10 values ('machine_learning' , 101 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,

('aiops' , 102 , 'ML', "this is aiops course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('dlcvnlp' , 103 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('aws cloud' , 104 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('blockchain' , 105 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('RL' , 106 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('Dl' , 107 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('interview prep' , 108 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) ,
('big data' , 109 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('data analytics' , 110 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fsds' , 111 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('fsda' , 112 , 'ML', "this is ML course" ,'2021-07-07',3540,'sudhanshu',2021) ,
('fabe' , 113 , 'ML', "this is ML course" ,'2022-07-07',3540,'sudhanshu',2022) ,
('java' , 114 , 'ML', "this is ML course" ,'2020-07-07',3540,'sudhanshu',2020) ,
('MERN' , 115 , 'ML', "this is ML course" ,'2019-07-07',3540,'sudhanshu',2019) 

select partition_name, table_name, table_rows from information_schema. partitions where table_name= 'ineuron_course10'


Create database Operation
use Operation

create table if not exists course 
(
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)
)

create table if not exists student 
(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int
)

insert into course values (101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language')

insert into student values (301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103)

select * from course
select * from student

select c.course_id,c.course_name,c.course_desc,s.student_id,s.student_name,s.student_course_id from course c
inner join student s on c.course_id = s.student_course_id

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
left join student s on c.course_id = s.student_course_id

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
left join student s on c.course_id = s.student_course_id where s.student_id is null;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
right join student s on c.course_id = s.student_course_id where c.course_id is null

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s 

show index from course1

create table if not exists course1
(course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id))

insert into course1 values 
(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language')

create table if not exists course2 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name)
)

create table if not exists course4 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag)
)

insert into course4 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language')


create table if not exists course5 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)
)

insert into course5 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language')

show index from course4

select course_id from course4 where course_id= 108  //Search Optimisation due to indexing operation
select course_id from course5 where course_id= 108  

//union//

create table if not exists course 
(
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50)
)

create table if not exists student 
(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int
)

insert into course values (101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language')

insert into student values (301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103)


select course_id ,course_name from course 
union                                              
select student_id,student_name from student 
 // In union duplicate data not caputured


select course_id ,course_name from course 
union all                                             
select student_id,student_name from student 

// All row captured in union all // It is a Vertical joint always rows and column of 1st table is captured//

//CTE// common Table expression 

create table if not exists student1 
(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int
)


insert into student1 values (301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "Peeyush", 3543453,'yes', 105),
(302 , "Nisit", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sandeep", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "Naru", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103)






with sample_student1 as (
select * from student1 where student_course_id in (101,102,103,104))
select * from sample_student1 where student_name in ('Nisit', 'Peeyush', 'sudhanshu')


**Notes**
// Multiple CTE Table can be use in one go by using With statement//
// CTE table is temerory table hence any opeation on CTE table must be use with CTE table creation statement//


with recursive CTE as(
select 1 as n, 2 as m, 3 as p
union all
select n+1,m+3,p+4 from CTE where n<5)
select * from CTE






