USE CORP_DATA;

-- 1. LOCATIONS
INSERT INTO LOCATIONS (location_id, city, state, country, timezone) VALUES
(1, 'Hyderabad', 'Telangana', 'India', 'IST'),
(2, 'Bengaluru', 'Karnataka', 'India', 'IST'),
(3, 'Chennai', 'Tamil Nadu', 'India', 'IST'),
(4, 'Pune', 'Maharashtra', 'India', 'IST'),
(5, 'Mumbai', 'Maharashtra', 'India', NULL),
(6, 'Delhi', 'Delhi', 'India', 'IST'),
(7, 'Noida', 'Uttar Pradesh', 'India', NULL),
(8, 'Gurugram', 'Haryana', 'India', 'IST'),
(9, 'Kolkata', 'West Bengal', 'India', 'IST'),
(10, 'Ahmedabad', 'Gujarat', 'India', NULL);

-- 2. JOBS
INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
(1, 'Junior Analyst', 25000.00, 45000.00),
(2, 'Analyst', 40000.00, 70000.00),
(3, 'Senior Analyst', 65000.00, 95000.00),
(4, 'Business Consultant', 70000.00, 110000.00),
(5, 'Data Analyst', 45000.00, 80000.00),
(6, 'Risk Analyst', 50000.00, 85000.00),
(7, 'Team Lead', 80000.00, 120000.00),
(8, 'Project Manager', 90000.00, 140000.00),
(9, 'Operations Executive', 30000.00, NULL),
(10, 'Associate Consultant', 60000.00, 100000.00);

-- 3. DEPARTMENTS
INSERT INTO DEPARTMENTS (department_id, department_name, location_id, budget, created_at) VALUES
(1, 'Risk Consulting', 1, 500000.00, '2025-01-10 09:00:00'),
(2, 'Data Analytics', 2, 650000.00, '2025-01-12 10:15:00'),
(3, 'Operations', 3, 400000.00, '2025-01-15 11:30:00'),
(4, 'Finance', 4, 700000.00, '2025-01-18 09:45:00'),
(5, 'Human Resources', 5, NULL, '2025-01-20 14:00:00'),
(6, 'Technology', 6, 900000.00, '2025-01-22 16:20:00'),
(7, 'Compliance', 7, 550000.00, '2025-01-25 13:10:00'),
(8, 'Internal Audit', 8, 600000.00, '2025-01-28 12:00:00'),
(9, 'Procurement', 9, NULL, '2025-01-30 10:40:00'),
(10, 'Support Services', 10, 300000.00, '2025-02-01 09:25:00');

-- 4. EMPLOYEES
INSERT INTO EMPLOYEES
(employee_id, first_name, last_name, email, phone_number, hire_date, birth_date, salary, bonus_percent, department_id, manager_id, job_id, city, state, country, status)
VALUES
(1, 'NITIN', 'SHUKLA', 'aarav.sharma@corpdata.com', '9876500001', '2024-04-01', '1995-06-12', 250000.00, 15.00, 1, NULL, 8, 'Hyderabad', 'Telangana', 'India', 'Active'),
(2, 'Riya', 'Verma', 'riya.verma@corpdata.com', '9876500002', '2024-05-10', '1998-09-21', 60000.00, 10.00, 2, 1, 5, 'Bengaluru', 'Karnataka', 'India', 'Active'),
(3, 'Karan', 'Mehta', 'karan.mehta@corpdata.com', '9876500003', '2024-06-15', '1997-03-18', 72000.00, 12.50, 2, 1, 6, 'Bengaluru', 'Karnataka', 'India', 'Active'),
(4, 'Sneha', 'Iyer', 'sneha.iyer@corpdata.com', '9876500004', '2024-07-20', '1999-11-05', 54000.00, NULL, 3, 2, 1, 'Chennai', 'Tamil Nadu', 'India', 'On Leave'),
(5, 'Rahul', 'Nair', 'rahul.nair@corpdata.com', NULL, '2024-08-12', '1996-02-14', 76000.00, 8.00, 4, 2, 2, 'Pune', 'Maharashtra', 'India', 'Active'),
(6, 'Priya', 'Singh', 'priya.singh@corpdata.com', '9876500006', '2024-09-01', NULL, 76000.00, 8.00, 4, 3, 3, 'Mumbai', 'Maharashtra', 'India', 'Active'),
(7, 'Vikram', 'Joshi', 'vikram.joshi@corpdata.com', '9876500007', '2024-10-05', '1994-08-30', 50000.00, NULL, 5, 4, 9, 'Delhi', 'Delhi', 'India', 'Resigned'),
(8, 'Neha', 'Kapoor', NULL, '9876500008', '2024-11-11', '2000-01-25', 82000.00, 11.00, 6, 4, 7, 'Noida', 'Uttar Pradesh', 'India', 'Active'),
(9, 'Arjun', 'Patel', 'arjun.patel@corpdata.com', '9876500009', '2024-12-20', '1998-12-02', 61000.00, 9.00, 7, 5, 10, 'Gurugram', 'Haryana', 'India', 'Active'),
(10, 'Meera', 'Khan', 'meera.khan@corpdata.com', '9876500010', '2025-01-15', '1997-07-17', 61000.00, 9.00, 8, 5, 2, 'Kolkata', 'West Bengal', 'India', 'Active');
INSERT INTO EMPLOYEES
(employee_id, first_name, last_name, email, phone_number, hire_date, birth_date, salary, bonus_percent, department_id, manager_id, job_id, city, state, country, status)
VALUES
(11, 'KARTIKAY', 'NAUTIYAL', 'nautiyalkartikay@gmail.com', '8447666603', now(),'2004-10-05', 250000, 30, 1, null, 8, 'GREATER NOIDA', 'UTTAR PRADESH', 'INDIA', 'ACTIVE');

-- 5. PROJECTS
INSERT INTO PROJECTS (project_id, project_name, start_date, end_date, budget, status) VALUES
(1, 'Risk Assessment Automation', '2025-01-05', NULL, 250000.00, 'Active'),
(2, 'Spend Analysis Dashboard', '2025-01-10', '2025-04-15', 180000.00, 'Completed'),
(3, 'Contract Review Tracker', '2025-02-01', NULL, 200000.00, 'Planning'),
(4, 'Internal Audit Support', '2025-02-10', '2025-06-30', 300000.00, 'Active'),
(5, 'Compliance Reporting', '2025-03-01', NULL, 220000.00, 'Active'),
(6, 'Data Quality Cleanup', '2025-03-10', '2025-05-20', 150000.00, 'Completed'),
(7, 'Vendor Risk Monitoring', '2025-04-01', NULL, 275000.00, 'Planning'),
(8, 'Finance Controls Review', '2025-04-12', '2025-07-25', 320000.00, 'Active'),
(9, 'Employee Analytics', '2025-05-01', NULL, 160000.00, 'Planning'),
(10, 'Operations Optimization', '2025-05-15', '2025-08-31', 210000.00, 'Active');

-- 6. EMPLOYEE_PROJECTS
INSERT INTO EMPLOYEE_PROJECTS (employee_id, project_id, assigned_date, hours_worked, role) VALUES
(1, 1, '2025-01-06', 120, 'Project Sponsor'),
(2, 2, '2025-01-12', 140, 'Analyst'),
(3, 2, '2025-01-12', 135, 'Analyst'),
(4, 3, '2025-02-02', 100, 'Coordinator'),
(5, 4, '2025-02-12', 160, 'Lead Analyst'),
(6, 5, '2025-03-03', 110, 'Analyst'),
(7, 6, '2025-03-12', 90, 'Support Analyst'),
(8, 7, '2025-04-03', 150, 'Risk Analyst'),
(9, 8, '2025-04-15', 130, 'Reviewer'),
(10, 9, '2025-05-02', 125, 'Data Analyst');

-- 7. CUSTOMERS
INSERT INTO CUSTOMERS (customer_id, customer_name, email, registration_date, city, country) VALUES
(1, 'Alpha Enterprises', 'contact@alpha.com', '2024-01-05', 'Hyderabad', 'India'),
(2, 'Bright Solutions', 'info@brightsolutions.com', '2024-01-18', 'Bengaluru', 'India'),
(3, 'Core Systems', NULL, '2024-02-10', 'Chennai', 'India'),
(4, 'Delta Traders', 'support@deltatraders.com', '2024-02-22', 'Pune', 'India'),
(5, 'Eagle Finance', 'hello@eaglefinance.com', '2024-03-01', 'Mumbai', 'India'),
(6, 'Future Tech', 'team@futuretech.com', '2024-03-15', 'Delhi', 'India'),
(7, 'Global Retail', NULL, '2024-04-02', 'Noida', 'India'),
(8, 'Hyper Mart', 'care@hypermart.com', '2024-04-20', 'Gurugram', 'India'),
(9, 'Insight Labs', 'admin@insightlabs.com', '2024-05-05', 'Kolkata', 'India'),
(10, 'Jupiter Services', 'contact@jupiterservices.com', '2024-05-18', 'Ahmedabad', 'India');

-- 8. ORDERS
INSERT INTO ORDERS (ORDER_ID, customer_id, employee_id, order_date, ship_date, order_amount, order_status) VALUES
(1, 1, 2, '2025-05-01 10:00:00', '2025-05-03 15:30:00', 15000.00, 'Shipped'),
(2, 2, 3, '2025-05-02 11:20:00', NULL, 22000.00, 'Pending'),
(3, 3, 4, '2025-05-03 09:45:00', '2025-05-06 13:10:00', 18500.00, 'Shipped'),
(4, 4, 5, '2025-05-05 14:10:00', NULL, 9800.00, 'Cancelled'),
(5, 5, 6, '2025-05-07 16:00:00', '2025-05-10 12:00:00', 25000.00, 'Shipped'),
(6, 6, 7, '2025-05-08 10:30:00', NULL, 12750.00, 'Pending'),
(7, 7, 8, '2025-05-10 12:15:00', '2025-05-12 18:25:00', 30000.00, 'Shipped'),
(8, 8, 9, '2025-05-12 09:05:00', NULL, 7600.00, 'Pending'),
(9, 9, 10, '2025-05-14 17:45:00', '2025-05-16 14:40:00', 19800.00, 'Shipped'),
(10, 10, 2, '2025-05-15 13:25:00', NULL, 11200.00, 'Pending');

-- 9. PRODUCTS
INSERT INTO PRODUCTS (product_id, product_name, category, price, stock_quantity, created_at) VALUES
(1, 'Laptop', 'Electronics', 55000.00, 20, '2025-01-10 10:00:00'),
(2, 'Wireless Mouse', 'Electronics', 1200.00, 150, '2025-01-12 11:00:00'),
(3, 'Office Chair', 'Furniture', 8000.00, 35, '2025-01-15 09:30:00'),
(4, 'Notebook', 'Stationery', 60.00, 500, '2025-01-18 12:10:00'),
(5, 'Printer', 'Electronics', 14000.00, 12, '2025-01-20 14:20:00'),
(6, 'Desk Lamp', 'Furniture', 950.00, 80, '2025-01-22 15:00:00'),
(7, 'File Folder', 'Stationery', 35.00, 1000, '2025-01-25 10:45:00'),
(8, 'Monitor', 'Electronics', 17000.00, 25, '2025-01-28 16:30:00'),
(9, 'Keyboard', 'Electronics', 2200.00, 110, '2025-01-30 09:15:00'),
(10, 'Whiteboard', 'Office Supplies', 3200.00, 18, '2025-02-01 13:40:00');

-- 10. ORDER_ITEMS
INSERT INTO ORDER_ITEMS (order_item_id, order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 1, 1, 55000.00, 5.00),
(2, 2, 2, 3, 1200.00, NULL),
(3, 3, 3, 2, 8000.00, 10.00),
(4, 4, 4, 10, 60.00, NULL),
(5, 5, 5, 1, 14000.00, 0.00),
(6, 6, 6, 4, 950.00, 7.50),
(7, 7, 7, 20, 35.00, NULL),
(8, 8, 8, 1, 17000.00, 12.00),
(9, 9, 9, 5, 2200.00, 3.00),
(10, 10, 10, 2, 3200.00, NULL);