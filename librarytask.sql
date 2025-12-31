SELECT *  FROM BOOKS;
SELECT * FROM BRANCH;
SELECT * FROM EMPLOYEES;
SELECT * FROM RETURN_STATUS;

--TASKS
--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO BOOKS(isbn, title, category, rental_price, status, author_name, publisher)
values ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
select * from books;


--Task 2: Update an Existing Member's Address
update members
set member_address='678 Oak street' 
where member_id='C110';
select * from members;

--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.
select * from issued_status;
delete  from issued_status
where issued_id='IS121';
select * from issued_status;

--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select issued_id, issued_book_name from issued_status where issued_emp_id='E101';

--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book. 

SELECT issued_emp_id, count(*)
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) > 1;

--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

select * from books as b
join issued_status as ist
on ist.issued_book_isbn =b.isbn;

--Task 7. Retrieve All Books in a Specific Category:
select * from books where category='Classic';

--Task 8: Find Total Rental Income by Category:
select b.category, sum(b.rental_price), count(*)
from issued_status as ist
join
books as b
on b.isbn= ist.issued_book_isbn
group by 1;

--List Members Who Registered in the Last 180 Days:
select * from members;

--List Employees with Their Branch Manager's Name and their branch details:
SELECT 
    e1.emp_id,
    e1.emp_name,
    e1.position,
    e1.salary,
    b.*,
    e2.emp_name as manager
FROM employees as e1
JOIN 
branch as b
ON e1.branch_id = b.branch_id    
JOIN
employees as e2
ON e2.emp_id = b.manager_id

--Create a Table of Books with Rental Price Above a Certain Threshold:
select title, rental_price from books 
where rental_price >7.00;

--Retrieve the List of Books Not Yet Returned
select title from books where status='yes' group by 1;

