--Task 1

Use TechShop

Create table Customers
(
CustomerID int identity,
FirstName varchar(30),
LastName varchar(30),
Email varchar(100),
Phone bigint,
Address varchar(max),
constraint pk_cust Primary key(CustomerID),
constraint email_cust Unique(Email),
constraint ph_cust_ch Check (len(Phone)=10),
constraint ph_cust Unique(Phone)
)
GO

Insert into Customers
values
('Arjun', 'Sharma', 'arjun.sharma@mail.com', 9123456780, 'Delhi, India'),  
('Priya', 'Patel', 'priya.patel@mail.com', 9234567810, 'Ahmedabad, Gujarat'),  
('Ravi', 'Kumar', 'ravi.kumar@mail.com', 9345678120, 'Bengaluru, Karnataka'),  
('Sneha', 'Reddy', 'sneha.reddy@mail.com', 9456781230, 'Hyderabad, Telangana'),  
('Vikram', 'Singh', 'vikram.singh@mail.com', 9567812340, 'Jaipur, Rajasthan'),  
('Aditi', 'Verma', 'aditi.verma@mail.com', 9678123450, 'Lucknow, Uttar Pradesh'),  
('Rohan', 'Joshi', 'rohan.joshi@mail.com', 9781234560, 'Pune, Maharashtra'),  
('Meera', 'Nair', 'meera.nair@mail.com', 9892345670, 'Kochi, Kerala'),  
('Anil', 'Chopra', 'anil.chopra@mail.com', 9012345671, 'Chandigarh, Punjab'),  
('Kavya', 'Iyer', 'kavya.iyer@mail.com', 9123456782, 'Chennai, Tamil Nadu')

Create table Products
(
ProductID int identity,
ProductName varchar(255),
Description varchar(255),
Price decimal,
constraint pk_prod Primary key(ProductID)
)
GO

Insert into Products
values
('Samsung Galaxy S24', 'Smartphone', 80000),  
('Sony WH-1000XM5', 'Noise Cancelling Headphones', 35000),  
('Dell XPS 15', 'Laptop', 146000),  
('Apple iPad Pro', 'Tablet', 110000),  
('LG OLED TV', 'Smart TV', 190000),  
('Bose SoundLink', 'Bluetooth Speaker', 18000),  
('Garmin Forerunner 965', 'Smartwatch', 63000),  
('GoPro HERO12', 'Action Camera', 45000),  
('Sony PlayStation 5', 'Gaming Console', 50000),  
('JBL Bar 5.1', 'Soundbar', 55000)

Create table Orders
(
OrderID int identity,
CustomerID int,
OrderDate Date,
TotalAmount decimal,
constraint pk_ord Primary Key(OrderID),
constraint fk_cust Foreign key(CustomerID) References Customers(CustomerID) on delete cascade on update cascade
)

Insert into Orders
Values  
(4, '2024-03-01', 80000),  
(2, '2024-03-02', 35000),  
(7, '2024-03-03', 146000),  
(1, '2024-03-04', 110000),  
(5, '2024-03-05', 190000),  
(3, '2024-03-06', 18000),  
(9, '2024-03-07', 63000),  
(8, '2024-03-08', 45000),  
(6, '2024-03-09', 50000),  
(10, '2024-03-10', 55000),  
(3, '2024-03-11', 36000),  
(1, '2024-03-12', 94000),  
(7, '2024-03-13', 210000),  
(2, '2024-03-14', 87000),  
(4, '2024-03-15', 125000),  
(5, '2024-03-16', 73000)

Create table OrderDetails
(
OrderDetailID int identity (101,1),
OrderID int,
ProductID int,
Quantity int,
constraint fk_ordID Foreign key(OrderID) references Orders(OrderID) on delete cascade on update cascade,
constraint fk_prodID Foreign key(ProductID) references Products(ProductID) on delete cascade on update cascade
)
GO

Insert into OrderDetails 
Values  
(1, 1, 2),  
(1, 3, 1),  
(2, 2, 1),  
(2, 5, 3),  
(3, 4, 2),  
(4, 1, 1),  
(4, 6, 2),  
(5, 3, 4),  
(5, 7, 1),  
(6, 2, 2),  
(7, 5, 1),  
(8, 8, 2),  
(9, 10, 1),  
(10, 9, 3),  
(10, 4, 1)

Create table Inventory
(
InventoryID int Primary Key,
ProductID int,
QuantityInStock int,
LastStockUpdate date,
constraint fk_inv_prodID Foreign Key(ProductID) references Products(ProductID) on delete cascade on update cascade
)

Insert into Inventory
values
(1, 150, '2024-03-01'),  
(2, 80, '2024-03-02'),  
(3, 220, '2024-03-03'),  
(4, 100, '2024-03-04'),  
(5, 60, '2024-03-05'),  
(6, 190, '2024-03-06'),  
(7, 130, '2024-03-07'),  
(8, 50, '2024-03-08'),  
(9, 140, '2024-03-09'),  
(10, 70, '2024-03-10'),  
(1, 180, '2024-03-11'),  
(2, 90, '2024-03-12'),  
(3, 200, '2024-03-13'),  
(4, 110, '2024-03-14'),  
(5, 170, '2024-03-15'),  
(6, 120, '2024-03-16')

--Task 2

--1.Write an SQL query to retrieve the names and emails of all customers.
Select FirstName, LastName, Email from Customers

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.
Select Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.Lastname from Orders, Customers
where Orders.CustomerID = Customers.CustomerID

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
Insert into Customers (FirstName, LastName, Email, Address) values ('Riya','Kapoor','riyakapoor@mail.com','Pune,Mumbai')

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
Update Products set Price= Price + (10/100)

Select * from Products

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. 
--Allow users to input the order ID as a parameter.
Delete from OrderDetails where OrderID= 3
Delete from Orders where OrderID= 3    --because of on delete cascade

Select * from OrderDetails

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
Insert into Orders (CustomerID, OrderDate, TotalAmount) values (2, '2025-3-12', 45000)

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. 
--Allow users to input the customer ID and new contact information.
Update Customers set Email = 'snehareddy@mail.com', Address = 'Chennai, TamilNadu' 
where CustomerID = 4

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the 
--"OrderDetails" table.
Update Orders 
set TotalAmount= (Select sum(Products.Price * OrderDetails.Quantity) from Products,OrderDetails 
where Products.ProductID = OrderDetails.ProductID and OrderDetails.OrderID = Orders.OrderID)

Select * from Orders

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. 
--Allow users to input the customer ID as a parameter.
Delete from Orders where CustomerID = 1
--Delete from OrderDetails where OrderID not in (Select OrderID from Orders)   //on delete cascade

Select * from OrderDetails

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, 
--and any other relevant details.
Insert into Products values ('Smart Gadget', 'Latest tech gadget', 7000)

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). 
--Allow users to input the order ID and the new status.
Update Orders Set TotalAmount = 70000 where OrderID = 7

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
Select Orders.CustomerID, count(OrderID) AS TotalOrders
From Customers,Orders
where  Customers.CustomerID=Orders.CustomerID
Group by Orders.CustomerID

--Task 3

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
Select Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.OrderDate  
from Orders 
inner join Customers on Customers.CustomerID = Orders.CustomerID
--from Orders, Customers  
--where Orders.CustomerID = Customers.CustomerID  
order by Orders.OrderID

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
Select Products.ProductName, sum(OrderDetails.Quantity * Products.Price) as TotalRevenue 
from Products
inner join OrderDetails on OrderDetails.ProductID = Products.ProductID
--from OrderDetails, Products  
--where Products.Description = 'Electronic Gadget' and OrderDetails.ProductID = Products.ProductID  
group by Products.ProductName  
having sum(OrderDetails.Quantity * Products.Price) > 0  
order by TotalRevenue desc

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
Select Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone ,Orders.CustomerID
from Customers
inner join Orders on Orders.CustomerID = Customers.CustomerID
--from Customers, Orders  
--where Customers.CustomerID = Orders.CustomerID  
group by Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Email, Customers.Phone  ,Orders.CustomerID
having count(Orders.CustomerID) >= 1  
order by Customers.FirstName

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. 
--Include the product name and the total quantity ordered.
Select  top 1 with ties Products.ProductName, sum(OrderDetails.Quantity) as TotalQuantity  
from OrderDetails
inner join Products on Products.ProductID = OrderDetails.ProductID
--from OrderDetails, Products  
--where OrderDetails.ProductID = Products.ProductID  
group by Products.ProductName  
order by TotalQuantity desc  

Select * from Products

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
Select ProductName, Price, Description
from Products
order by Price

--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
Select Customers.FirstName, Customers.LastName, avg(Orders.TotalAmount) as AvgOrderValue  
from Customers
inner join Orders on Orders.CustomerID = Customers.CustomerID
--from Customers, Orders  
--where Customers.CustomerID = Orders.CustomerID  
group by Customers.CustomerID, Customers.FirstName, Customers.LastName  
order by AvgOrderValue desc

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
Select top 1 with ties Customers.CustomerID, Customers.FirstName, Customers.LastName, Orders.OrderID, sum(Products.Price * OrderDetails.Quantity) as TotalRevenue
from Customers 
inner join Orders on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID
inner join Products on Products.ProductID = OrderDetails.ProductID
--from Customers, Products, Orders, OrderDetails
--where Customers.CustomerID = Orders.CustomerID and Orders.OrderID = OrderDetails.OrderID and Products.ProductID = OrderDetails.ProductID
group by Customers.CustomerID, Customers.FirstName, Customers.LastName, Orders.OrderID
order by TotalRevenue desc 

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
Select Products.ProductName, count(OrderDetails.ProductID) as NoOfTimesOrdered
from Products
inner join OrderDetails on OrderDetails.ProductID = Products.ProductID
--from Products, OrderDetails
--where Products.ProductID = OrderDetails.ProductID
group by Products.ProductName

select * from Orders
--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
Select Orders.CustomerID, (Select Firstname from customers where Orders.CustomerID= Customers.CustomerID) as Customername
from Customers 
inner join Orders on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID
inner join Products on Products.ProductID = OrderDetails.ProductID
group by Orders.CustomerID
having count(Orders.CustomerID) = 1
--or
SELECT Customers.FirstName, Customers.LastName, Products.ProductName  
FROM Customers  
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID  
INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID  
INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID  
WHERE Products.ProductName = 'Samsung Galaxy S24'

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a
--specific time period. Allow users to input the start and end dates as parameters.
Select sum(Products.Price * OrderDetails.Quantity) as TotalRevenue
from Orders
inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID
inner join Products on Products.ProductID = OrderDetails.ProductID
where Orders.OrderDate between '2024-03-01' and '2024-03-09'

--Task 4

--1. Write an SQL query to find out which customers have not placed any orders.
Select concat(Firstname, ' ',LastName)
from Customers
where CustomerID not in (Select CustomerID from Orders)

--2. Write an SQL query to find the total number of products available for sale. 
Select Products.ProductID, sum(Inventory.QuantityInStock) as ProductsAvailable
from Inventory
inner join Products on Products.ProductID = Inventory.ProductID
group by Products.ProductID

--3. Write an SQL query to calculate the total revenue generated by TechShop. 
Select sum(OrderDetails.Quantity * Products.Price) as TotalRevenue
from orderDetails
inner join Products on Products.ProductID = OrderDetails.ProductID

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
Select Products.Description, avg(OrderDetails.Quantity) as AvgQuantity
from OrderDetails
inner join Products on OrderDetails.ProductID = Products.ProductID
--where ProductID in (Select ProductID from Products)
group by Products.Description

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
Select concat(Customers.FirstName, ' ' ,Customers.Lastname) as FullName, sum(OrderDetails.Quantity * Products.Price) as TotalRevenue
from Customers
inner join Orders on Customers.CustomerID = Orders.customerID
inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID
inner join Products on Products.ProductID = OrderDetails.ProductID
group by Customers.FirstName, Customers.LastName
order by TotalRevenue desc

--6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
Select concat(Customers.FirstName, ' ' ,Customers.Lastname) as FullName, count(OrderDetails.OrderID) as MostOrders
from Customers
inner join Orders on Orders.CustomerID = Customers.CustomerID
inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID
group by Customers.FirstName, Customers.LastName
--where OrderID in (Select OrderID from OrderDetails)

--7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
Select distinct ProductID, Products.ProductName, (Select sum(OrderDetails.Quantity) from OrderDetails 
													where OrderDetails.ProductID = Products.ProductID
													group by ProductID) as TotalQuantity
from Products
order by TotalQuantity desc

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.Select concat(FirstName, ' ' ,Lastname) as FullName, (Select sum(OrderDetails.Quantity * Products.Price) 													from Orders inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID													inner join Products on  OrderDetails.ProductID = Products.ProductID													where Orders.CustomerID = Customers.CustomerID) as TotalSpendingfrom Customersorder by TotalSpending desc--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.Select Concat(FirstName,' ',LastName)as Fullname,((Select sum(Products.Price * OrderDetails.Quantity)													from Orders													inner join OrderDetails on													Orders.OrderID = OrderDetails.OrderID													inner join Products on 													OrderDetails.ProductID = Products.ProductID													where Orders.CustomerID = Customers.CustomerID) / (Select count(OrderID) from Orders																										where CustomerID = Customers.CustomerID)) as AvgOrderValuefrom Customers--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.Select concat (FirstName,' ',LastName)as Customername, (Select count(OrderID) from Orders														where CustomerID = Customers.CustomerID) as OrderCountfrom Customers