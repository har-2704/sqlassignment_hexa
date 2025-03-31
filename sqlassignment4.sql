create database cms
use cms

--USER TABLE
create table users(
userid int constraint pk_uid primary key,
name varchar(255),
email varchar(255) unique,
password varchar(255),
contactnumber varchar(255),
address text)


--COURIER TABLE
create table courier (
courierid int primary key,
sendername varchar(255),
senderaddress text,
receivername varchar(255),
receiveraddress text,
weight decimal(5,2),
status varchar(50),
trackingnumber varchar(20) unique,
deliverydate datetime)

--COURIER SERVICES
create table courierservices(
serviceid int primary key,
servicename varchar(100),
cost decimal(8,2))

--EMPLOYEE TABLE
create table employee(
employeeid int primary key,
name varchar(255),
email varchar(255) unique,
contactnumber varchar(20),
role varchar(50),
salary decimal(10,2))

--LOCATION TABLE
create table location(
locationid int primary key,
locationname varchar(100),
address text)

--PAYMENT TABLE
create table payment(
paymentid int primary key,
courierid int,
locationid int,
amount decimal(10,2),
paymentdate datetime,
constraint fk_cid foreign key(courierid) references courier(courierid),
constraint fk_lid foreign key(locationid) references location(locationid))

-- Insert data into User table
INSERT INTO Users VALUES
(1, 'John Doe', 'john.doe@example.com', 'password1', '9876543210', '123 Main St'),
(2, 'Jane Smith', 'jane.smith@example.com', 'password2', '9123456789', '456 Elm St'),
(3, 'Alice Johnson', 'alice.j@example.com', 'password3', '9876543201', '789 Oak St'),
(4, 'Bob Brown', 'bob.b@example.com', 'password4', '9876543220', '101 Pine St'),
(5, 'Charlie Clark', 'charlie.c@example.com', 'password5', '9876543230', '202 Birch St'),
(6, 'David Adams', 'david.a@example.com', 'password6', '9876543240', '303 Cedar St'),
(7, 'Ella Wilson', 'ella.w@example.com', 'password7', '9876543250', '404 Maple St'),
(8, 'Frank Thomas', 'frank.t@example.com', 'password8', '9876543260', '505 Walnut St'),
(9, 'Grace Hall', 'grace.h@example.com', 'password9', '9876543270', '606 Cherry St'),
(10, 'Hannah Lee', 'hannah.l@example.com', 'password10', '9876543280', '707 Spruce St');

-- Insert data into Courier table
INSERT INTO Courier VALUES
(1, 'John Doe', '123 Main St', 'Jane Smith', '456 Elm St', 2.50, 'Delivered', 'TRK001', '2024-01-10'),
(2, 'Alice Johnson', '789 Oak St', 'Bob Brown', '101 Pine St', 1.75, 'In Transit', 'TRK002', '2024-01-15'),
(3, 'Charlie Clark', '202 Birch St', 'David Adams', '303 Cedar St', 3.20, 'Pending', 'TRK003', '2024-01-20'),
(4, 'Ella Wilson', '404 Maple St', 'Frank Thomas', '505 Walnut St', 4.00, 'Delivered', 'TRK004', '2024-01-25'),
(5, 'Grace Hall', '606 Cherry St', 'Hannah Lee', '707 Spruce St', 2.10, 'In Transit', 'TRK005', '2024-02-01'),
(6, 'John Doe', '123 Main St', 'Alice Johnson', '789 Oak St', 1.50, 'Pending', 'TRK006', '2024-02-05'),
(7, 'Jane Smith', '456 Elm St', 'Charlie Clark', '202 Birch St', 5.00, 'Delivered', 'TRK007', '2024-02-10'),
(8, 'Bob Brown', '101 Pine St', 'David Adams', '303 Cedar St', 3.80, 'In Transit', 'TRK008', '2024-02-15'),
(9, 'Frank Thomas', '505 Walnut St', 'Grace Hall', '606 Cherry St', 2.90, 'Delivered', 'TRK009', '2024-02-20'),
(10, 'Hannah Lee', '707 Spruce St', 'John Doe', '123 Main St', 4.50, 'Pending', 'TRK010', '2024-02-25');

-- Insert data into CourierServices table
INSERT INTO CourierServices VALUES
(1, 'Express Delivery', 150.00),
(2, 'Same Day Delivery', 200.00),
(3, 'Overnight Delivery', 250.00),
(4, 'Standard Delivery', 100.00),
(5, 'International Delivery', 500.00),
(6, 'Two-Day Delivery', 180.00),
(7, 'Economy Delivery', 80.00),
(8, 'Business Delivery', 220.00),
(9, 'Local Delivery', 60.00),
(10, 'Priority Shipping', 300.00);

-- Insert data into Employee table
INSERT INTO Employee VALUES
(1, 'Michael Scott', 'michael.s@example.com', '9876543211', 'Manager', 70000.00),
(2, 'Jim Halpert', 'jim.h@example.com', '9876543212', 'Salesman', 50000.00),
(3, 'Pam Beesly', 'pam.b@example.com', '9876543213', 'Receptionist', 40000.00),
(4, 'Dwight Schrute', 'dwight.s@example.com', '9876543214', 'Assistant Manager', 60000.00),
(5, 'Angela Martin', 'angela.m@example.com', '9876543215', 'Accountant', 55000.00),
(6, 'Oscar Martinez', 'oscar.m@example.com', '9876543216', 'Finance Analyst', 58000.00),
(7, 'Kevin Malone', 'kevin.m@example.com', '9876543217', 'Accountant', 53000.00),
(8, 'Toby Flenderson', 'toby.f@example.com', '9876543218', 'HR', 52000.00),
(9, 'Kelly Kapoor', 'kelly.k@example.com', '9876543219', 'Customer Service', 47000.00),
(10, 'Ryan Howard', 'ryan.h@example.com', '9876543220', 'Intern', 35000.00);

-- Insert data into Location table
INSERT INTO Location VALUES
(1, 'Hyderabad', 'Ameerpet'),
(2, 'Bangalore', 'Indiranagar'),
(3, 'Chennai', 'Guindy'),
(4, 'Mumbai', 'Andheri'),
(5, 'Delhi', 'Karol Bagh'),
(6, 'Pune', 'Kothrud'),
(7, 'Kolkata', 'Salt Lake'),
(8, 'Jaipur', 'Malviya Nagar'),
(9, 'Lucknow', 'Gomti Nagar'),
(10, 'Ahmedabad', 'Navrangpura');

-- Insert data into Payment table
INSERT INTO Payment VALUES
(1, 1, 1, 150.00, '2024-01-10'),
(2, 2, 2, 200.00, '2024-01-15'),
(3, 3, 3, 250.00, '2024-01-20'),
(4, 4, 4, 100.00, '2024-01-25'),
(5, 5, 5, 500.00, '2024-02-01'),
(6, 6, 6, 180.00, '2024-02-05'),
(7, 7, 7, 80.00, '2024-02-10'),
(8, 8, 8, 220.00, '2024-02-15'),
(9, 9, 9, 60.00, '2024-02-20'),
(10, 10, 10, 300.00, '2024-02-25');


--TASK 2

1. List all customers:
 select distinct name
 from users

2. List all orders for a specific customer:
select *
from courier
where sendername = 'JOHN DOE'

3. List all couriers:
select distinct courierid
from courier

4. List all packages for a specific order:
select *
from courier
where courierid = 1

5. List all deliveries for a specific courier:
select *
from courier
where courierid = 1

6. List all undelivered packages:
select courierid
from courier
where status = 'pending'

7. List all packages that are scheduled for delivery today:
select courierid
from courier
where deliverydate = GETDATE()

8. List all packages with a specific status:
select courierid
from courier
where status = 'delivered'

9. Calculate the total number of packages for each courier.
select count(sendername),courierid
from courier
group by courierid

10. Find the average delivery time for each courier
select c.courierid,avg(datediff(day,c.deliverydate,p.paymentdate)) as diff
from courier c
join payment p
on c.courierid = p.courierid
group by c.courierid


11. List all packages with a specific weight range:
select courierid,weight
from courier
where weight between 2 and 3

12. Retrieve employees whose names contain 'John'
select name,employeeid
from employee
where name = 'john'

13. Retrieve all courier records with payments greater than $50. 
select courierid,paymentid
from payment
where amount > 50


--TASK 3
14. Find the total number of couriers handled by each employee.
select count(courierid),e.employeeid
from courier c

15. Calculate the total revenue generated by each location
select sum(c.cost)
from courierservices c
group by location

16. Find the total number of couriers delivered to each location.
select count(courierid),locationid
from payment
group by locationid

17. Find the courier with the highest average delivery time:
select top 1 c.courierid,avg(datediff(day,c.deliverydate,p.paymentdate)) as diff
from courier c
join payment p
on p.courierid =c.courierid
group by c.courierid
order by diff desc


18. Find Locations with Total Payments Less Than a Certain Amount
select locationid, sum(amount) as total
from payment
group by locationid
having sum(amount) < 100

19. Calculate Total Payments per Location
select locationid, sum(amount) as total
from payment
group by locationid

20. Retrieve couriers who have received payments totaling more than $1000 in a specific location
(LocationID = X):
select courierid,sum(amount)
from payment
where locationid = 1
group by courierid
having sum(amount) > 1000

21. Retrieve couriers who have received payments totaling more than $1000 after a certain date
(PaymentDate > 'YYYY-MM-DD'):
select courierid,sum(amount)
from payment
where paymentdate > '2024-01-02'
group by courierid
having sum(amount) > 1000

22. Retrieve locations where the total amount received is more than $5000 before a certain date
(PaymentDate > 'YYYY-MM-DD') 
select locationid , sum(amount)
from payment
where paymentdate < '2024-01-02'
group by locationid
having sum(amount) > 5000


--TASK 4

23. Retrieve Payments with Courier Information
select p.*,c.*
from payment p
join courier c
on c.courierid = p.courierid

24. Retrieve Payments with Location Information
select p.*,l.*
from payment p
join location l
on l.locationid = p.locationid

25. Retrieve Payments with Courier and Location Information
select p.*,c.*,l.*
from payment p
join location l
on l.locationid = p.locationid
join courier c
on c.courierid = p.courierid

26. List all payments with courier details
select p. paymentid,c.*
from payment p
join courier c
on p.courierid=c.courierid

27. Total payments received for each courier
select courierid,sum(amount)
from payment
group by courierid

28. List payments made on a specific date
select paymentid
from payment
where paymentdate = '2024-01-10'

29. Get Courier Information for Each Payment
select c.*,p.paymentid
from courier c
join payment p
on c.courierid = p.courierid

30. Get Payment Details with Location
select p.*
from payment p
join location l
on l.locationid = p.locationid

31. Calculating Total Payments for Each Courier
select sum(amount),courierid
from payment 
group by courierid

32. List Payments Within a Date Range 
select paymentid
from payment
where paymentdate between '2024-01-01' and '2024-02-01'

33. Retrieve a list of all users and their corresponding courier records, including cases where there are
no matches on either side
select u.*,c.*
from users u
full join courier c
on u.name = c.sendername


34. Retrieve a list of all couriers and their corresponding services, including cases where there are no
matches on either side
select c.courierid,cs.*
from courier c
full join courierservices cs
on 1 = 0


35. Retrieve a list of all employees and their corresponding payments, including cases where there are
no matches on either side
select e.name,p.*
from employee e
full join payment p
on 1 = 0




36. List all users and all courier services, showing all possible combinations.
select name, c.*
from users
cross join courierservices c


37. List all employees and all locations, showing all possible combinations:
select e.name,l.locationname
from employee e
cross join location l


38. Retrieve a list of couriers and their corresponding sender information (if available)
select c.*,u.*
from courier c
left join users u
where c.sendername = u.name

39. Retrieve a list of couriers and their corresponding receiver information (if available):
select c.*,u.*
from courier c
left join users u
where c.receivername = u.name

40. Retrieve a list of couriers along with the courier service details (if available):
select c.courierid,cs.*
from courier c
full join courierservices cs
on 1 =0



41. Retrieve a list of employees and the number of couriers assigned to each employee:
select e.name,count(c.courierid)
from employee e
left join courier c
on 1  = 0
group by e.name


42. Retrieve a list of locations and the total payment amount received at each location:
select l.locationname,sum(p.amount)
from location l
join payment p
on l.locationid = p.locationid
group by locationname

43. Retrieve all couriers sent by the same sender (based on SenderName).
select courierid,sendername
from courier
where sendername = 'Charlie Clark'

44. List all employees who share the same role.
select count(name),role
from employee
group by role

45. Retrieve all payments made for couriers sent from the same location.
select  p.paymentid,count(l.locationid)
from payment p
join location l
on l.locationid = p.locationid
group by paymentid

46. Retrieve all couriers sent from the same location (based on SenderAddress).
select  p.paymentid,count(l.locationid)
from payment p
join location l
on l.locationid = p.locationid
join courier c
on c.courierid = p.courierid
where c.senderaddress = '123 Main St'
group by paymentid


47. List employees and the number of couriers they have delivered:
select e.name,count(courierid)
from employee e
left join courier c
on 1 = 0
where c.status = 'delivered'
group by e.name

48. Find couriers that were paid an amount greater than the cost of their respective courier services


49. Find couriers that have a weight greater than the average weight of all couriers
select c.courierid,c.weight
from courier c
where c.weight > (select avg(weight) from courier)

50. Find the names of all employees who have a salary greater than the average salary:
select e.employeeid,e.salary
from employee e
where salary > (select avg(salary) from employee)

51. Find the total cost of all courier services where the cost is less than the maximum cost
select sum(cost)
from courierservices
where cost < (select max(cost) from courierservices)

52. Find all couriers that have been paid for
select courierid
from payment
where paymentdate <= getdate()

53. Find the locations where the maximum payment amount was made
select top 1 l.locationname,sum(p.amount)
from location l
join payment p
on p.locationid = l.locationid
group by locationname
order by sum(p.amount) desc


54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender
(e.g., 'SenderName'): 
select courierid,weight
from courier
where weight >( select max(weight) from courier where sendername = 'john doe' )


