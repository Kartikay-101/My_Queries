use Employee_Data;

INSERT INTO personal_info
(Name, Gender, DOB, Phone_No, Gmail, Blood_group)
values
('Kartikay Nautiyal', 'Male', '2004-10-05', '+91 8447666603', 'nautiyalkartikay@gmail.com', 'A+'),
('Nishant Tomar', 'Male', '1999-12-25', '+91 8447664603', 'tomar@gmail.com', 'B-'),
('Shubham Suneel', 'Male', '1996-1-03', '+91 6787666603', 'shubham@gmail.com', 'O+'),
('Sambhav Sharma', 'Male', '2004-11-22', '+91 8419266603', 'sambahv@gmail.com', 'C+'),
('Sarthak Sharma', 'Male', '2004-07-12', '+91 8437566603', 'sarthak@gmail.com', 'B+'),
('Aarav Gupta', 'Male', '2001-05-12', 987654321, 'aarav@gmail.com', 'A+'),
('Vivaan Sharma', 'Male', '2000-08-23', 987654322, 'vivaan@gmail.com', 'B+'),
('Aditya Singh', 'Male', '1999-11-15', 987654323, 'aditya@gmail.com', 'O+'),
('Krishna Verma', 'Male', '2002-02-18', 987654324, 'krishna@gmail.com', 'AB+'),
('Rohan Mehta', 'Male', '1998-07-09', 987654325, 'rohan@gmail.com', 'B-'),
('Arjun Kumar', 'Male', '2001-12-01', 987654326, 'arjun@gmail.com', 'A-'),
('Mohit Yadav', 'Male', '1997-03-27', 987654327, 'mohit@gmail.com', 'O-'),
('Ayush Saxena', 'Male', '2003-09-14', 987654328, 'ayush@gmail.com', 'A+'),
('Harsh Agarwal', 'Male', '2000-01-30', 987654329, 'harsh@gmail.com', 'B+'),
('Karan Malhotra', 'Male', '1999-06-21', 987654330, 'karan@gmail.com', 'AB-'),
('Yash Chauhan', 'Male', '2002-04-05', 987654331, 'yash@gmail.com', 'O+'),
('Dev Bansal', 'Male', '2001-10-19', 987654332, 'dev@gmail.com', 'A+'),
('Manav Jain', 'Male', '1998-08-11', 987654333, 'manav@gmail.com', 'B-'),
('Dhruv Arora', 'Male', '2003-01-25', 987654334, 'dhruv@gmail.com', 'AB+'),
('Aman Tiwari', 'Male', '2000-11-07', 987654335, 'aman@gmail.com', 'O+');
INSERT INTO personal_info
(Name, Gender, DOB, Phone_No, Gmail, Blood_group)
values
('nitin shukla ji', 'male','2001-10-02', '+9109803974', null, null);
-- INSERT INTO personal_info						-- TESTING DEFAULT CONTRAINTS
-- (Name, Gender, DOB, Phone_No, Gmail, Blood_group)
-- values
-- ('ANSH NAUTYAL', 'Male', DEFAULT, '', 'nautiyaartikay@gmail.com', 'A+');			

INSERT INTO family_info
(Name, father_name, Mother_name, Sibling_name)
values
('Kartikay Nautiyal', 'KK Nautiyal', 'Satyawati Nautiyal', 'Aayush Nautiyal'),
('Nishant Tomar', 'Mahesh Tomar', 'Anita Tomar', 'Rohit Tomar'),
('Shubham Suneel', 'Suneel Kumar', 'Pooja Suneel', 'Priya Suneel'),
('Sambhav Sharma', 'Rakesh Sharma', 'Neetu Sharma', 'Aman Sharma'),
('Sarthak Sharma', 'Mukesh Sharma', 'Kavita Sharma', 'Ansh Sharma'),
('Aarav Gupta', 'Rakesh Gupta', 'Sunita Gupta', 'Ananya Gupta'),
('Vivaan Sharma', 'Mahesh Sharma', 'Poonam Sharma', 'Aryan Sharma'),
('Aditya Singh', 'Rajendra Singh', 'Kiran Singh', 'Aditi Singh'),
('Krishna Verma', 'Suresh Verma', 'Neelam Verma', 'Rahul Verma'),
('Rohan Mehta', 'Vijay Mehta', 'Anjali Mehta', 'Riya Mehta'),
('Arjun Kumar', 'Pradeep Kumar', 'Seema Kumar', 'Kunal Kumar'),
('Mohit Yadav', 'Dinesh Yadav', 'Kusum Yadav', 'Nitin Yadav'),
('Ayush Saxena', 'Ashok Saxena', 'Meena Saxena', 'Sneha Saxena'),
('Harsh Agarwal', 'Sanjay Agarwal', 'Rekha Agarwal', 'Priya Agarwal'),
('Karan Malhotra', 'Rohit Malhotra', 'Vandana Malhotra', 'Simran Malhotra'),
('Yash Chauhan', 'Narendra Chauhan', 'Sushma Chauhan', 'Tanya Chauhan'),
('Dev Bansal', 'Mukesh Bansal', 'Ritu Bansal', 'Nikhil Bansal'),
('Manav Jain', 'Anil Jain', 'Shweta Jain', 'Rashi Jain'),
('Dhruv Arora', 'Rajiv Arora', 'Monika Arora', 'Kritika Arora'),
('Aman Tiwari', 'Shiv Kumar Tiwari', 'Usha Tiwari', 'Rohan Tiwari');

set sql_safe_updates = 0;
INSERT INTO family_info
(Name, father_name, Mother_name, Sibling_name)
values
('nitin shulka ji', 'sdf', null, 'nitesh bhai');