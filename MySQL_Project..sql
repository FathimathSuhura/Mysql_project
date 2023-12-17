create database library;
use library;
create table Branch(branch_no varchar(10) PRIMARY KEY,manager_id varchar(10), branch_address varchar(45),contact_no int);
create table employee(emp_id varchar(10) primary key,emp_name varchar(20), Position varchar(20),salary int , branch_no varchar(10));
create table customer(customer_id varchar(10) primary key, customer_name varchar(20),customer_address varchar(35),reg_date date);
create table IssueStatus(Issue_ID varchar(10) primary key, Issued_cust varchar(10) , Issued_book_name varchar(40), Issued_date date, Isbn_book varchar(50), foreign key(issued_cust) references customer(customer_id) , foreign key(Isbn_book) references books(isbn));
create table ReturnStatus(Return_ID int primary key, Return_Cust Varchar(25),Return_Book_Name varchar(25), Return_Date date, Isbn_book2 varchar(50) , foreign key(Isbn_book2) references books(isbn));
create table books(isbn varchar(50) primary key, book_title varchar(25), category varchar(15), rental_price float , Status varchar(4) check (status in ('yes','no')) Not NULL , Author varchar(20), publisher varchar(40));
insert into Branch values("B001", "LM001","456 Oak Avenue, Townsville",345327) , ("BOO2", "LM002","789 Pine Street, Cityburg", 379274),("B003","LM003","101 Maple Lane, Villagetown" , 356492) , ("B004","LM004" ,"321 Cedar Road, Hamletville" , 378648), ("B005","LM005","555 Birch Boulevard, Suburbville",358856);
insert into employee values("E001","Jane Doe", "Librarian",21000,"B001"), ("E002","Michael Johnson", "Assitant Librarian",17000,"B001"), ("E003","Sarah Williams" , "Archivist",19000,"B001"),("E004","Emily Chen","Library Clerk",12000,"B001"), ("E005","Robert Turner","Assistant Librarian", 14000,"B001"),("E006","Holden Caulfield", "Librarian",55000,"B001"),("E007","Ebenezer Scrooge","Librarian",70000,"B002");
insert into customer values("C001", "Lily Robinson" , "888 Elm Square, Mountainview", "2023-03-15"),("C002","Benjamin Young", "321 Pine Drive, Countryside", "2023-05-10"),("C003","Mia Clark" , "666 Sycamore Lane, Meadowville","2023-07-18"), ("C004","Ava Wilson","222 Redwood Road, Suburbville","2023-10-02"),("C005","Sophia Anderson","444 Spruce Street, Townsville","2023-07-18"),("C006","Thomas Mathew", "123 Oakwood Avenue, Parkville","2018-03-15");
insert into issuestatus values("I11" , "C001","To Kill a Mockingbird", "2023-03-15","ISBN-13: 978-0-06-112008-4") , ("I12", "C002" , "The Hobbit","2023-05-10" , "ISBN-13: 978-0-261-10238-5"),("I13","C003","The Hunger Games" , "2022-03-23","ISBN-13: 978-0-439-02348-1"),("I14","C005","The Chronicles of Narnia", "2021-01-9","ISBN-13: 978-0-06-623850-0"),("I15","C004","1984","2018-06-21","ISBN-13: 978-0-452-28423-4");
insert into books values("ISBN-13: 978-0-06-112008-4","To Kill a Mockingbird","Literature",98.33,"YES","Harper Lee","J.B. Lippincott & Co"),("ISBN-13: 978-0-261-10238-5","The Hobbit","Fantasy Fiction",78.10,"Yes","J.R.R. Tolkien","George Allen & Unwin"),("ISBN-13: 978-0-439-02348-1","The Hunger Games","Fiction",91.00,"Yes","Suzanne Collins","Scholastic Corporation"),("ISBN-13: 978-0-06-623850-0","The Chronicles of Narnia","Fiction",100.00,"Yes","C.S. Lewis","Geoffrey Bles"),("ISBN-13: 978-0-452-28423-4","1984","Fiction",79.99,"Yes","George Orwell","Secker & Warburg",("Null","Adventures of Tom Sawyer","Adventure",50.00,"No","Mark Twain","Charles L. Webster and Company"),("ISBN-13: 978-0393328622","The History of Love","Fiction",80.00,"No","Nicole Krauss","W. W. Norton & Company");;
insert into returnstatus values(101,"Lily Robinson","1984","2019-12-21","ISBN-13: 978-0-452-28423-4"),(102,"Benjamin Young","To kill a Moccking Bird","2022-01-20","ISBN-13: 978-0-06-112008-4"),(103,"Mia Clark","The Hobbit","2023-12-12","ISBN-13: 978-0-261-10238-5"),(104,"Ava Wilson","The Hunger Games","2020-09-30","ISBN-13: 978-0-439-02348-1"),(105,"Sophia Anderson","The Chronicles of Narnia","2019-05-23","ISBN-13: 978-0-06-623850-0");
update issuestatus set issued_date = '2023-06-15' where issue_id = 'I11';

#1.  Retrieve the book title, category, and rental price of all available books.
select book_title, category, rental_price from books where status = "yes";

#2.  List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;

#3. Retrieve the book titles and the corresponding customers who have issued those books. 
select Book_title ,Category ,Rental_Price from Books where status="yes";

#4.  Display the total count of books in each category.
select category , count(*) as Total_Number from books group by category;

#5.  Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select emp_name,Position,salary from employee where salary> 50000;

#6.  List the customer names who registered before 2022-01-01 and have not issued any books yet.
select customer_name , reg_date from customer where reg_date < '2022-01-01' and customer_id not in (select issued_cust from issuestatus);

#7. .  Display the branch numbers and the total count of employees in each branch.
select branch.branch_no , count(*) from employee right join branch on branch.branch_no = employee.branch_no group by branch_no;

#8.  Display the names of customers who have issued books in the month of June 2023.
select customer_name , issued_date from customer join issuestatus on customer.customer_id = issuestatus.issued_cust where issued_date between '2023-06-01' and '2023-06-30';

#9.  Retrieve book_title from book table containing history. 
select book_title from books where book_title like '%history%';

#10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
select branch_no , count(emp_name) as total_number_of_employees from employee group by branch_no having total_number_of_employees > 5;





