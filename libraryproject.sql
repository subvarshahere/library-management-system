--Library management system
drop table if exists branch;
create table branch 
(branch_id	varchar(50) primary key,
manager_id	varchar,
branch_address varchar,
contact_no varchar
)

drop table if exists employees;
create table employees( 
emp_id varchar(10) primary key,
emp_name  varchar(25),
position varchar(25),
salary int, 
branch_id varchar(20))

alter table employees 
alter column salary type numeric(10,2);

drop table if exists books;
create table books(
isbn varchar(20) primary key,
book_title varchar(75),
category varchar(10),
rental_price float,
status varchar(15),
author_name varchar(25),
publisher varchar(50)
) 

alter table books
alter column category type varchar(20);

drop table if exists members;
create table members(
member_id varchar(20) primary key,
member_name varchar(50), 
member_address varchar(50), 
reg_date date
)

drop table if exists issued_status;
create table issued_status(
issued_id varchar(10) primary key,
issued_member_id varchar(25), --fk
issued_book_name varchar(50),
issued_date date,
issued_book_isbn varchar(25), --fk
issued_emp_id varchar(15) --fk
)

alter table issued_status
alter column issued_book_name type varchar(100);

drop table if exists return_status;
create table return_status(
return_id	varchar(15) primary key,
issued_id varchar(25),
return_book_name varchar(50),
return_date date,
return_book_isbn varchar(25)
)

--foreign key
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);
