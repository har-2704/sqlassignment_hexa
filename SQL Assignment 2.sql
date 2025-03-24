--Task 1

Use SISDB

Create table Students 
(
student_id int identity primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
email varchar(100),
phone_number bigint unique, check (len(phone_number)=10)
)

Insert into Students
values  
('Aadhav', 'Rithesh', '2001-02-14', 'aadhav.rithesh@gmail.com', 9876543210),  
('Ishita', 'Varun', '2000-07-22', 'ishita.varun@yahoo.com', 8765432109),  
('Rithvik', 'Arnav', '1999-12-05', 'rithvik.arnav@hotmail.com', 9123456780),  
('Tanvi', 'Kriva', '2002-03-10', 'tanvi.kriva@gmail.com', 9345678901),  
('Devansh', 'Zayan', '2000-09-18', 'devansh.zayan@outlook.com', 9654321789),  
('Anaya', 'Viaan', '2001-06-12', 'anaya.viaan@gmail.com', 9987654321),  
('Vihaan', 'Reyansh', '2000-05-25', 'vihaan.reyansh@yahoo.com', 9871234560),  
('Kiara', 'Navya', '2002-04-08', 'kiara.navya@hotmail.com', 8765123490),  
('Yuvan', 'Ishaan', '1999-11-30', 'yuvan.ishaan@gmail.com', 9345671234),  
('Saanvi', 'Advay', '2001-08-15', 'saanvi.advay@outlook.com', 9123678540)

Create table Teacher 
(
teacher_id int identity primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100)
)

Insert into Teacher 
values  
('Arun', 'Krishnan', 'arun.krishnan@email.com'),  
('Meera', 'Srinivasan', 'meera.srinivasan@email.com'),  
('Karthik', 'Ravi', 'karthik.ravi@email.com'),  
('Lakshmi', 'Venkat', 'lakshmi.venkat@email.com'),  
('Vignesh', 'Subramanian', 'vignesh.subramanian@email.com'),  
('Priya', 'Balakrishnan', 'priya.balakrishnan@email.com'),  
('Anand', 'Rajesh', 'anand.rajesh@email.com'),  
('Deepa', 'Chandran', 'deepa.chandran@email.com'),  
('Ramesh', 'Iyer', 'ramesh.iyer@email.com'),  
('Sindhu', 'Natarajan', 'sindhu.natarajan@email.com')

Create table Courses 
(
course_id int identity primary key,
course_name varchar(100),
credits int,
teacher_id int,
constraint fk_teacherid foreign key (teacher_id) references Teacher(teacher_id) on delete cascade on update cascade
)

Insert into Courses 
values  
('Data Science', 4, 1),  
('Artificial Intelligence', 3, 2),  
('Cybersecurity', 3, 3),  
('Web Development', 4, 4),  
('Cloud Computing', 3, 5),  
('Machine Learning', 4, 6),  
('Mobile App Development', 3, 7),  
('Blockchain Technology', 3, 8),  
('Internet of Things', 4, 9),  
('Software Testing', 3, 10),  
('Database Management', 4, 1),  
('Ethical Hacking', 3, 2),  
('Digital Marketing', 3, 3),  
('Embedded Systems', 4, 4)

Create table Enrollments 
(
enrollment_id int identity primary key,
student_id int,
course_id int,
enrollment_date date,
constraint fk_studentid foreign key (student_id) references Students(student_id) on delete cascade on update cascade,
constraint fk_courseid foreign key (course_id) references Courses(course_id) on delete cascade on update cascade
)

Insert into Enrollments 
values  
(1, 3, '2024-01-15'),  
(2, 5, '2024-02-10'),  
(3, 7, '2024-03-05'),  
(4, 9, '2024-04-12'),  
(5, 11, '2024-05-18'),  
(6, 2, '2024-06-08'),  
(7, 4, '2024-07-20'),  
(8, 6, '2024-08-25'),  
(9, 8, '2024-09-30'),  
(10, 10, '2024-10-05'),  
(3, 1, '2024-11-12'),  
(5, 12, '2024-12-10'),  
(7, 14, '2025-01-20'),  
(9, 13, '2025-02-15'),  
(2, 4, '2025-03-10')

Create table Payments 
(
payment_id int identity primary key,
student_id int,
amount money,
payment_date date,
constraint fk_payment_studentid foreign key (student_id) references students(student_id) on delete cascade on update cascade
)

Insert into Payments  
values  
(1, 2500, '2024-01-10'),  
(2, 3000, '2024-02-15'),  
(3, 4500, '2024-03-05'),  
(4, 3200, '2024-04-12'),  
(5, 2800, '2024-05-18'),  
(6, 5000, '2024-06-20'),  
(7, 3500, '2024-07-25'),  
(8, 4000, '2024-08-30'),  
(9, 2700, '2024-09-10'),  
(10, 3800, '2024-10-05'),  
(3, 6000, '2024-11-12'),  
(5, 4300, '2024-12-08'),  
(7, 5200, '2025-01-15'),  
(9, 3900, '2025-02-20')

--Task 2

--1. Write an SQL query to insert a new student into the "Students" table with the following details: 
--a. First Name: John  
--b. Last Name: Doe 
--c. Date of Birth: 1995-08-15 
--d. Email: john.doe@example.com 
--e. Phone Number: 1234567890 
Insert into Students values ('John','Doe','1995-08-15','john.doe@example.com','1234567890')

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date. 
Insert into Enrollments values (1, 7, '2025-03-19')

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address. 
Update Teacher set email='deepachandran@email.com' 
where teacher_id = 8

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.
Delete from Enrollments where student_id=1 and course_id=7

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables. 
Update Courses set teacher_id = 5
where course_id = 6

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity. 
Delete from Students where student_id=6
Select * from Enrollments

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount. 
Update Payments set amount=5000 where payment_id = 8

--Task 3

--1.  Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID. 
Select Students.student_id, Students.first_name, Students.last_name, sum(Payments.amount) as TotalPayment
from Students
inner join Payments on Payments.student_id = Students.student_id
group by Students.student_id, Students.first_name, Students.last_name

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
Select Courses.course_name, count(Enrollments.student_id) as CountOfStudents
from Courses
inner join Enrollments on Courses.course_id = Enrollments.course_id
group by Courses.course_name, Enrollments.course_id

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
Select concat(Students.first_name,' ',Students.last_name) as StudentName
from Students
left join Enrollments on Enrollments.student_id = Students.student_id
where Enrollments.student_id is null

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
Select Students.first_name, Students.last_name, Courses.course_name
from Students
inner join Enrollments on Enrollments.student_id = Students.student_id
inner join Courses on Courses.course_id = Enrollments.course_id

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
Select Teacher.first_name, Teacher.last_name, Courses.course_name
From Teacher
inner join Courses on Courses.teacher_id = Teacher.teacher_id

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables. 
Select Students.first_name, Students.last_name, Enrollments.enrollment_date
from Students 
inner join Enrollments on Enrollments.student_id = Students.student_id
inner join Courses on Courses.course_id = Enrollments.course_id

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
Select Students.first_name, Students.last_name
from Students
left join Payments on Payments.student_id = Students.student_id
where Payments.student_id is null

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records. 
Select Courses.course_name
from Courses
left join Enrollments on Enrollments.course_id = Courses.course_id
where Enrollments.course_id is null

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records. 
Select Students.first_name ,Students.last_name
from Students
inner join Enrollments e on e.student_id = Students.student_id
inner join Enrollments e1 on e1.student_id = e.student_id and e1.course_id = e.course_id
group by Students.student_id, Students.first_name ,Students.last_name

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.
Select Teacher.first_name, Teacher.last_name
from Teacher 
left join Courses on Courses.teacher_id = Teacher.teacher_id
where Courses.teacher_id is null

--Task 4

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this. 
Select Courses.course_name, (Select count(student_id) from Enrollments where Enrollments.course_id = Courses.course_id) as AvgStudents
from Courses

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount. 
Select top 1 with ties Students.student_id, Students.first_name, Students.last_name, 
(Select sum(amount) from Payments where Payments.student_id = Students.student_id
group by student_id) as MaxPayment
from Students
order by MaxPayment desc

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count. 
Select top 1 with ties Courses.course_name,(Select (count(Enrollments.course_id)) 
											from Enrollments
											where Enrollments.course_id = Courses.course_id
											group by Enrollments.course_id) as MaxEnroll
from Courses
order by MaxEnroll desc

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
Select Teacher.first_name,Teacher.last_name, (Select sum(Payments.amount) from Payments 
												inner join Enrollments on Enrollments.student_id = Payments.student_id
												inner join Courses on Courses.course_id = Enrollments.course_id
												where Courses.teacher_id = Teacher.teacher_id) as TotalPay
from Teacher
group by Teacher.teacher_id,Teacher.first_name,Teacher.last_name

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses. 
Select first_name, last_name
from Students
where student_id in (Select student_id from Enrollments)

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments. 
Select first_name,last_name
from Teacher
where teacher_id not in (Select teacher_id from Courses)

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth. 
Select first_name,last_name, (Select avg(datediff(year,date_of_birth,getdate())) from Students s where s.student_id = s1.student_id) as AvgAge
from Students s1
group by student_id,first_name,last_name

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records. 
Select course_name
from Courses
where course_id not in (Select course_id from Enrollments)

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments. 
Select distinct Students.first_name, Students.last_name, (Select sum(Payments.amount) from Payments
																	  inner join Enrollments on Enrollments.student_id = Payments.student_id
																	  where Enrollments.student_id = Students.student_id and 
																	  Enrollments.course_id = Courses.course_id) as TotalPay
from Students
inner join Enrollments on Enrollments.student_id = Students.student_id
inner join Courses on Courses.course_id = Enrollments.course_id
group by Students.first_name, Students.last_name, Students.student_id, Courses.course_id

--10.  Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one. 
Select first_name,last_name
from Students
where student_id in (Select student_id from Payments
					 group by student_id 
					 having count(payment_id)>1)

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
Select Students.first_name, Students.last_name, (Select sum(amount) from Payments where student_id = Students.student_id) as TotalPay
from Students
group by Students.first_name, Students.last_name, Students.student_id

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments. 
Select Courses.course_name, (Select count(student_id) from Enrollments
							where course_id = Courses.course_id) as CountOfStudents
from Courses
group by Courses.course_name, Courses.course_id

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
Select Students.first_name, Students.last_name, (Select avg(amount) from Payments 
												where student_id = Students.student_id) as AvgAmt
from Students
group by Students.first_name, Students.last_name, Students.student_id