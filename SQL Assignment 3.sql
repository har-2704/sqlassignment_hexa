--Task 1

Use HMBank

Create Table Customers 
(  
customer_id int identity primary key,  
first_name varchar(50),  
last_name varchar(50),  
dob date,  
email varchar(100),  
phone_number varchar(10) unique,check(len(phone_number)=10),
address varchar(255)  
) 

Create Table Accounts 
(  
account_id int identity primary key,  
customer_id int,  
account_type varchar(50) check (account_type in ('Savings', 'Current', 'Zero_balance')),  
balance decimal,  
constraint fk_custid foreign key (customer_id) references Customers(customer_id) on delete cascade on update cascade
) 

Create Table Transactions 
(  
transaction_id int identity primary key,  
account_id int,  
transaction_type varchar(50) check (transaction_type in ('Deposit', 'Withdrawal', 'Transfer')),  
amount decimal not null check (amount > 0),  
transaction_date date,  
constraint fk_accid foreign key (account_id) references Accounts(account_id) on delete cascade on update cascade
)

--Task 2

--1. Insert at least 10 sample records into each of the following tables.  
Insert into Customers  
values  
('Aarav', 'Reddy', '1995-03-12', 'aarav.reddy@gmail.com', '9876543210', 'Hyderabad, Telangana'),  
('Meera', 'Iyer', '1998-07-25', 'meera.iyer@yahoo.com', '8765432109', 'Chennai, Tamil Nadu'),  
('Varun', 'Nair', '1992-11-15', 'varun.nair@hotmail.com', '7654321098', 'Kochi, Kerala'),  
('Shruti', 'Pillai', '1996-04-10', 'shruti.pillai@gmail.com', '6543210987', 'Trivandrum, Kerala'),  
('Vikram', 'Gowda', '1993-09-30', 'vikram.gowda@outlook.com', '5432109876', 'Bangalore, Karnataka'),  
('Ananya', 'Menon', '2000-05-14', 'ananya.menon@gmail.com', '4321098765', 'Coimbatore, Tamil Nadu'),  
('Rohan', 'Shetty', '1994-12-22', 'rohan.shetty@yahoo.com', '3210987654', 'Mangalore, Karnataka'),  
('Divya', 'Krishna', '1997-08-18', 'divya.krishna@hotmail.com', '2109876543', 'Mysore, Karnataka'),  
('Karthik', 'Rao', '1991-02-05', 'karthik.rao@gmail.com', '1098765432', 'Chennai, Tamil Nadu'),  
('Pooja', 'Prasad', '1999-06-28', 'pooja.prasad@outlook.com', '0987654321', 'Madurai, Tamil Nadu')

Insert into Accounts   
values  
(1, 'Savings', 15000),  
(2, 'Current', 32000),  
(3, 'Zero_balance', 0),  
(4, 'Savings', 4500),  
(5, 'Current', 28000),  
(6, 'Savings', 17000),  
(7, 'Zero_balance', 0),  
(8, 'Current', 6500),  
(9, 'Savings', 22000),  
(10, 'Zero_balance', 0),  
(3, 'Current', 14000),  
(5, 'Savings', 19000)

Insert into Transactions
values
(1, 'Deposit', 5000, '2025-03-01'),  
(2, 'Withdrawal', 1200, '2025-03-02'),  
(3, 'Deposit', 7000, '2025-03-03'),  
(4, 'Transfer', 3000, '2025-03-04'),  
(5, 'Deposit', 10000, '2025-03-05'),  
(6, 'Withdrawal', 2500, '2025-03-06'),  
(7, 'Deposit', 4500, '2025-03-01'),  
(8, 'Deposit', 8000, '2025-03-08'),  
(9, 'Withdrawal', 1800, '2025-03-09'),  
(10, 'Deposit', 6000, '2025-03-10'), 
(11, 'Transfer', 9000, '2025-03-11'),  
(12, 'Deposit', 3500, '2025-03-12')

--(2) 1. Write a SQL query to retrieve the name, account type and email of all customers. 
Select Customers.first_name,Customers.last_name,Accounts.account_type,Customers.email
from Customers, Accounts
where Customers.customer_id = Accounts.customer_id

--(2) 2. Write a SQL query to list all transaction corresponding customer. 
Select Customers.first_name,Customers.last_name,Transactions.*
from Customers, Transactions, Accounts
where Customers.customer_id = Accounts.customer_id and 
	  Accounts.account_id = Transactions.account_id

--(2) 3. Write a SQL query to increase the balance of a specific account by a certain amount.
Update Accounts set balance = 0
where account_id = 4

Select * from Accounts

--(2) 4. Write a SQL query to Combine first and last names of customers as a full_name. 
Select concat(first_name,' ',last_name) as FullName
from Customers

--(2) 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
Delete from Accounts where balance = 0 and account_type = 'Savings'

--(2) 6. Write a SQL query to Find customers living in a specific city.
Select first_name,last_name,address as city
from Customers
where address like 'Chennai%'

--(2) 7. Write a SQL query to Get the account balance for a specific account.
Select account_id,balance
from Accounts
where account_id = 6

--(2) 8. Write a SQL query to List all current accounts with a balance greater than $1,000.
Select * 
from Accounts
where balance > 1000

--(2) 9. Write a SQL query to Retrieve all transactions for a specific account. 
Select *
from Transactions
where account_id = 6

--(2) 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate. 
--(let interest be 5%)
Update Accounts 
set balance = balance + (balance * 0.05)
where account_type = 'Savings'

--(2) 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit. 
--(let overdraft limit be 10000)
Select *
from Accounts
where balance < 10000

--(2) 12. Write a SQL query to Find customers not living in a specific city. 
Select first_name,last_name
from Customers
where address not like 'Chennai%'

--Task 3

--1. Write a SQL query to Find the average account balance for all customers.   
Select Customers.first_name,Customers.last_name,avg(Accounts.balance) as AvgBal
from Customers
inner join Accounts on Accounts.customer_id = Customers.customer_id
group by Customers.first_name,Customers.last_name
order by AvgBal desc

--2. Write a SQL query to Retrieve the top 10 highest account balances.  
Select top 10 Accounts.balance, Customers.first_name, Customers.last_name, Customers.customer_id
from Customers
inner join Accounts on Accounts.customer_id = Customers.customer_id
group by Customers.first_name, Customers.last_name, Customers.customer_id, Accounts.balance
order by balance desc

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
Select sum(Transactions.amount) as TotalDeposit
from Transactions
where transaction_date like '2025-03-01' and transaction_type = 'Deposit'

--4. Write a SQL query to Find the Oldest and Newest Customers. 
Select 'NewCust' as Type, first_name,last_name, dob 
from Customers
where dob in (Select max(dob) from Customers)
union
Select 'OldCust' as Type,first_name,last_name, dob 
from Customers
where dob in (Select min(dob) from Customers)

--5. Write a SQL query to Retrieve transaction details along with the account type. 
Select *,Accounts.account_type
from Transactions
inner join Accounts on Accounts.account_id = Transactions.account_id

--6. Write a SQL query to Get a list of customers along with their account details. 
Select first_name,last_name,Accounts.*
from Customers
inner join Accounts on Accounts.customer_id = Customers.customer_id

--7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
Select Customers.*, Transactions.*
from Customers
inner join Accounts on Accounts.customer_id = Customers.customer_id
inner join Transactions on Accounts.account_id = Transactions.account_id
where Accounts.account_id = 2

--8. Write a SQL query to Identify customers who have more than one account. 
Select first_name,last_name
from Customers
inner join Accounts on Accounts.customer_id = Customers.customer_id
group by first_name,last_name
having count(account_id) > 1

--9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals. 
Select (Select sum(amount) from Transactions
		where transaction_type = 'Deposit') - (Select sum(amount) from Transactions
											   where transaction_type = 'Withdrawal') as DiffInTransaction

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period. 
Select avg(balance) as AvgDailyBal, Accounts.account_id
from Accounts
inner join Transactions on Transactions.account_id = Accounts.account_id
where transaction_date between '2025-03-01' and '2025-03-07'
group by Accounts.account_id

--11. Calculate the total balance for each account type. 
Select sum(balance) as TotalBal, account_type
from Accounts
group by account_type

--12.  Identify accounts with the highest number of transactions order by descending order. 
Select Accounts.account_id,count(Accounts.account_id) as HighTransaction
from Accounts
inner join Transactions on Transactions.account_id = Accounts.account_id
group by Accounts.account_id
order by count(Accounts.account_id) desc

--13. List customers with high aggregate account balances, along with their account types. 
Select Customers.first_name, Customers.Last_name, Customers.customer_id, Accounts.balance, Accounts.account_type
from Customers
inner join Accounts on Accounts.customer_id = Customers.customer_id

--14. Identify and list duplicate transactions based on transaction amount, date, and account.
Select amount, transaction_date, account_id, count(*) as DuplicateTransactions
from Transactions
group by amount, transaction_date, account_id
having count(*) > 1

--Task 4

--1. Retrieve the customer(s) with the highest account balance. 
Select first_name,last_name, (Select max(balance) from Accounts) as HighBal
from Customers
where customer_id in (Select top 1 customer_id from Accounts
					  order by balance desc)
					  
--2. Calculate the average account balance for customers who have more than one account.
Select avg(Accounts.balance) as AvgBal, Customers.first_name, Customers.last_name
from Accounts
inner join Customers on Customers.customer_id = Accounts.customer_id
group by Customers.first_name, Customers.last_name
having count(Accounts.customer_id) > 1
--or
Select avg(Accounts.balance) as AvgBal,customer_id
from Accounts
where Accounts.customer_id in (Select customer_id
								from Accounts
								group by customer_id
								having count(customer_id)>1) 
group by customer_id

--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
Select *
from Transactions
where amount > (Select avg(amount)
				from Transactions)

--4. Identify customers who have no recorded transactions.
Select first_name,last_name,customer_id
from Customers
where customer_id not in (Select customer_id
						  from Accounts,Transactions
						  where Accounts.customer_id = Customers.customer_id
						  and Accounts.account_id = Transactions.account_id)

--5. Calculate the total balance of accounts with no recorded transactions. 
Select sum(balance) as TotalBal
from Accounts
where account_id not in (Select account_id
						from Transactions)

--6. Retrieve transactions for accounts with the lowest balance.
Select * 
from Transactions
where account_id in (Select top 1 account_id
					 from Accounts
					 order by balance)

--7. Identify customers who have accounts of multiple types. 
Select first_name,last_name
from Customers
where customer_id in (Select customer_id
					  from Accounts
					  group by customer_id
					  having count(distinct(account_type))>1)

--8. Calculate the percentage of each account type out of the total number of accounts. 
Select account_type,(count(*) * 100/(Select count(*) from Accounts)) as Percentage
from Accounts
group by account_type

--9. Retrieve all transactions for a customer with a given customer_id. 
Select *
from Transactions
where account_id in (Select account_id 
					 from Accounts
					 where customer_id=3)

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause.
Select account_type,(Select sum(balance) from Accounts a1
					 where a.account_type = a1.account_type) as TotalBal
from Accounts a
group by account_type