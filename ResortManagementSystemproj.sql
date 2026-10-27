create database ResortManagementSystem;

use ResortManagementSystem;

select database();

show tables;
create table employees(employee_id int primary key auto_increment ,
First_Name varchar(50) not null,
Last_Name varchar(50) not null,
Address varchar(100),
 Email varchar(100) unique ,
 salary decimal(10,2),
 gender varchar(10),
 Job_Title varchar(50));
 desc employees;
 
 show create table employees;
 
 select * from employees;
 


CREATE TABLE Rooms (
    Room_Number INT PRIMARY KEY,
    Room_Type VARCHAR(50) NOT NULL,
    Person INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
desc Rooms;


CREATE TABLE Cottages (
    Cottage_Number INT PRIMARY KEY,
    Cottage_Type VARCHAR(50) NOT NULL,
    Person INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
desc Cottages;

CREATE TABLE Guests (
    Guest_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Guest_Address VARCHAR(100),
    Contact_Number VARCHAR(15),
    FOREIGN KEY (Employee_ID)
        REFERENCES Employees(Employee_ID)
);
desc Guests;




CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    Guest_ID INT NOT NULL,
    Room_Number INT,
    Cottage_Number INT,
    Check_in DATE NOT NULL,
    Check_out DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
    FOREIGN KEY (Room_Number) REFERENCES Rooms(Room_Number),
    FOREIGN KEY (Cottage_Number) REFERENCES Cottages(Cottage_Number)
);
 
 desc Transactions;
 
 
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Transaction_ID INT NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Method VARCHAR(30) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Transaction_ID)
        REFERENCES Transactions(Transaction_ID)
);

desc Payments;



INSERT INTO Employees
    (First_Name, Last_Name, Address, Email, Salary, Gender, Job_Title)
VALUES
    ('Suresh', 'Reddy', 'Hyderabad', 'suresh@example.com', 28000.00, 'Male', 'Accountant'),
    ('Lakshmi', 'Devi', 'Karimnagar', 'lakshmi@example.com', 24000.00, 'Female', 'Housekeeping'),
    ('Kiran', 'Kumar', 'Warangal', 'kiran@example.com', 26000.00, 'Male', 'Security Officer'),
    ('Anitha', 'Rao', 'Nizamabad', 'anitha@example.com', 32000.00, 'Female', 'Receptionist'),
    ('Rahul', 'Sharma', 'Hyderabad', 'rahul@example.com', 35000.00, 'Male', 'Chef'),
    ('Deepika', 'Reddy', 'Khammam', 'deepika@example.com', 27000.00, 'Female', 'Accountant'),
    ('Vamsi', 'Krishna', 'Warangal', 'vamsi@example.com', 23000.00, 'Male', 'Gardener'),
    ('Swathi', 'Rani', 'Karimnagar', 'swathi@example.com', 29000.00, 'Female', 'Manager'),
    ('Naveen', 'Kumar', 'Nalgonda', 'naveen@example.com', 25000.00, 'Male', 'Security Officer'),
    ('Pooja', 'Sharma', 'Hyderabad', 'pooja@example.com', 31000.00, 'Female', 'Chef');
    
#1 Count how many employees you have:
select count(*) as Total_employees
from employees;

#2 greaterthan 28000:
select First_Name,Last_Name,salary
from employees
where salary >28000;

select employee_id , First_name,Last_Name, Job_Title
from employees;
#3 .Display all the employees whose salary is greater than 25000:

select * from employees
where salary >25000;

#4. Find the second hightest salary:
select max(salary) 
from employees
where salary <(
	select max(salary)
    from employees);
    
#5.Find employees earning more than the average salary:

select employee_id,First_Name,salary,job_title from employees
where salary >(
select avg(salary)
from employees);

#6.Count employee in each job title:
select job_title,count(*) as total_employee
from employees
group by job_title;

#7. Find employees whose email adresses are missing:

select employee_id ,First_Name,Last_Name
from employees
where email is null;

#8. Find employees earning more than the average salary:
select employee_id,First_Name,Last_Name,Salary
from employees
where salary >(
	select avg(salary)
    from employees);

INSERT INTO Guests
    (Guest_ID, First_Name, Last_Name, Guest_Address, Contact_Number)
VALUES
    (1, 'Akhil', 'Reddy', 'Hyderabad', '9876500001'),
    (2, 'Sneha', 'Rao', 'Warangal', '9876500002'),
    (3, 'Manoj', 'Kumar', 'Karimnagar', '9876500003'),
    (4, 'Divya', 'Sharma', 'Nizamabad', '9876500004'),
    (5, 'Karthik', 'Reddy', 'Khammam', '9876500005'),
    (6, 'Meena', 'Devi', 'Hyderabad', '9876500006'),
    (7, 'Rohit', 'Kumar', 'Warangal', '9876500007'),
    (8, 'Harika', 'Rao', 'Karimnagar', '9876500008'),
    (9, 'Sandeep', 'Sharma', 'Nalgonda', '9876500009'),
    (10, 'Keerthi', 'Reddy', 'Hyderabad', '9876500010');
#9 get who are belongs to karimnagar:
select First_Name,Last_Name, Guest_Address
from guests
where Guest_Address= 'Karimnagar';

#10 count total guest:
select count(*) as total_count
from guests;

INSERT INTO Rooms
    (Room_Number, Room_Type, Person, Price)
VALUES
    (101, 'Standard', 2, 1500.00),
    (102, 'Standard', 2, 1500.00),
    (103, 'Standard', 3, 1800.00),
    (201, 'Deluxe', 2, 2500.00),
    (202, 'Deluxe', 3, 2800.00),
    (203, 'Deluxe', 4, 3200.00),
    (301, 'Premium', 2, 3500.00),
    (302, 'Premium', 3, 3800.00),
    (303, 'Premium', 4, 4200.00),
    (401, 'Suite', 2, 5000.00),
    (402, 'Suite', 4, 6000.00),
    (403, 'Suite', 5, 7000.00),
    (501, 'Family', 4, 4000.00),
    (502, 'Family', 5, 4500.00),
    (503, 'Family', 6, 5000.00);


select * from rooms 
order by Room_Number;

#11 write a query of rooms in each room type:
select room_type, count(*) as Total_Rooms
from Rooms
group by 
room_type;

#12 Find rooms priced above 3000:

select room_number,
room_type,
price from rooms
where price >3000;

#13 find the rooms whose price is below the average price of all romms:
select room_number, room_type, price
from rooms
where price <(select avg(price)
from rooms);

#14 Display only the different types of rooms available in the resort:
Select distinct room_type
from rooms;

#15 Display rooms that can accommodate more than 2 people
select room_number, room_type,person
from rooms
where person >2;


INSERT INTO Cottages
    (Cottage_Number, Cottage_Type, Person, Price)
VALUES
    (1, 'Garden Cottage', 2, 3000.00),
    (2, 'Garden Cottage', 3, 3500.00),
    (3, 'Lake View Cottage', 2, 4500.00),
    (4, 'Lake View Cottage', 4, 5500.00),
    (5, 'Deluxe Cottage', 3, 5000.00),
    (6, 'Deluxe Cottage', 4, 6000.00),
    (7, 'Family Cottage', 5, 6500.00),
    (8, 'Family Cottage', 6, 7500.00),
    (9, 'Luxury Cottage', 4, 9000.00),
    (10, 'Luxury Cottage', 6, 11000.00);

select * from cottages
order by cottage_Number;

#16 display cottages that can accomodate exactly 4 people:
select * from cottages
where person=4;

#17 Find the cheapest cottage in the resort:
select cottage_number,cottage_type,price
from cottages
where price=(select min(price) 
from cottages);

#18 count the number of cottages available in each cottage type
select cottage_type, count(*) as total_cottages
from cottages
group by cottage_type;

INSERT INTO Transactions
    (Guest_ID, Room_Number, Cottage_Number,
     Check_in, Check_out, Total_Amount)
VALUES
    (1, 101, NULL, '2026-01-05', '2026-01-07', 3000.00),
    (2, 201, NULL, '2026-01-08', '2026-01-10', 5000.00),
    (3, NULL, 1, '2026-01-10', '2026-01-12', 6000.00),
    (4, 301, NULL, '2026-01-12', '2026-01-15', 10500.00),
    (5, NULL, 3, '2026-01-15', '2026-01-17', 9000.00),
    (1, 102, NULL, '2026-02-01', '2026-02-03', 3000.00),
    (2, NULL, 5, '2026-02-04', '2026-02-06', 10000.00),
    (6, 202, NULL, '2026-02-07', '2026-02-09', 5600.00),
    (7, 401, NULL, '2026-02-10', '2026-02-12', 10000.00),
    (8, NULL, 7, '2026-02-12', '2026-02-15', 19500.00),
    (3, 103, NULL, '2026-03-01', '2026-03-03', 3600.00),
    (1, NULL, 9, '2026-03-05', '2026-03-07', 18000.00),
    (9, 203, NULL, '2026-03-08', '2026-03-10', 6400.00),
    (10, NULL, 2, '2026-03-10', '2026-03-12', 7000.00),
    (2, 302, NULL, '2026-03-15', '2026-03-18', 11400.00);
    
    select transaction_id , guest_id,
    total_amount
    from transactions
    order by
    transaction_id;
    
#19  count number of bookings:
select guest_id , count(transaction_id) as bookigs
from transactions
group by guest_id;

select count(*) as total_transactions
from transactions;    



# 20  Find the number of bookings made by each quest: 

select g.guest_id,g.First_Name,g.Last_Name, count(t.transaction_id) as Booking
from guests g
left join transactions t
on g.guest_id= t.guest_id
group by g.guest_id,g.First_Name;

# 2.find quests who have never booked:

select g.guest_id, g.First_Name ,count(t.transaction_id) as booking
from guests g
left join transactions t
on g.guest_id = t.guest_id
group by g.guest_id , g.First_Name
having count(t.transaction_id) = 0;

# 21.Find the quest who booked atleast once:

select g.guest_id , g.First_Name, count(t.transaction_id) as bookings
from guests g
left join transactions t
on g.guest_id= t.guest_id
group by g.guest_id , g.First_Name
having count(t.transaction_id) >0;

# 22. Find guests who spent the most money on booking:
select g.guest_id, g.First_Name,Sum(t.total_amount) as total_spent
from guests g
left join transactions t
on g.guest_id=t.guest_id
group by g.guest_id ,g.First_Name
order by total_spent DESC;

# 23. Find guests whose total booking amount is greaterthan 10000:
select g.guest_id,g.First_Name ,sum(t.total_amount) as total_spent
from guests g
join transactions t 
group by g.guest_id,g.First_Name
having sum(t.total_amount)>10000;  

    
   INSERT INTO Payments
    (Transaction_ID, Payment_Date, Payment_Method, Amount)
VALUES
    (141, '2026-01-05', 'UPI', 3000.00),
    (142, '2026-01-08', 'Credit Card', 2500.00),
    (142, '2026-01-09', 'UPI', 2500.00),
    (143, '2026-01-10', 'Cash', 6000.00),
    (144, '2026-01-12', 'Debit Card', 5000.00),
    (144, '2026-01-13', 'UPI', 3000.00),
    (145, '2026-01-15', 'Credit Card', 9000.00),
    (146, '2026-02-01', 'UPI', 1500.00),
    (146, '2026-02-02', 'UPI', 1500.00),
    (148, '2026-02-07', 'Cash', 5600.00),
    (149, '2026-02-10', 'Credit Card', 10000.00),
    (150, '2026-02-12', 'UPI', 10000.00),
    (150, '2026-02-13', 'Cash', 9500.00),
    (151, '2026-03-01', 'Debit Card', 3600.00),
    (153, '2026-03-08', 'UPI', 3000.00),
    (153, '2026-03-09', 'Cash', 3400.00),
    (154, '2026-03-10', 'Credit Card', 7000.00),
    (155, '2026-03-15', 'UPI', 11400.00);

select * from payments
order by payment_id;

SELECT COUNT(*) AS Total_Payments
FROM Payments;

#24 calcualte the total amount billed by the resort:
select sum(amount)as total_billed
from payments;

# 25 display all payments made using upi

select * from payments
where payment_method ="upi";

#26 Count how many payments were made using each payments method:

select payment_method, count(*) as total_payments
from payments
group by payment_method;