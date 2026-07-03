CREATE DATABASE CORP_DATA;
USE CORP_DATA;

		/* LOCATIONS → DEPARTMENTS → JOBS → EMPLOYEES → PROJECTS → EMPLOYEE_PROJECTS → CUSTOMERS → ORDERS → PRODUCTS → ORDER_ITEMS */

-- 1. LOCATIONS
CREATE TABLE LOCATIONS (
        location_id        INT PRIMARY KEY auto_increment,
        city               VARCHAR(50),
        state              VARCHAR(50),
        country            VARCHAR(50),
        timezone           VARCHAR(50)
) auto_increment = 1;


-- 2. JOBS
CREATE TABLE JOBS (
        JOB_ID INT PRIMARY KEY auto_increment,
        JOB_TITLE VARCHAR(100),
        MIN_SALARY DECIMAL(10,2),
        MAX_SALARY DECIMAL(10,2)
) auto_increment = 1;


-- 3. DEPARTMENTS (depends on LOCATIONS)
CREATE TABLE DEPARTMENTS (
        department_id      INT PRIMARY KEY auto_increment,
        department_name    VARCHAR(100),
        location_id        INT,
        budget             DECIMAL(15,2),
        created_at         DATETIME,

        CONSTRAINT fk_dept_location
        FOREIGN KEY (location_id)
        REFERENCES LOCATIONS(location_id)
) auto_increment = 1;


-- 4. EMPLOYEES (depends on DEPARTMENTS, JOBS, and itself)
CREATE TABLE EMPLOYEES (
        employee_id        INT PRIMARY KEY auto_increment,
        first_name         VARCHAR(50),
        last_name          VARCHAR(50),
        email              VARCHAR(100),
        phone_number       VARCHAR(20),
        hire_date          DATE,
        birth_date         DATE,
        salary             DECIMAL(10,2),
        bonus_percent      DECIMAL(5,2),
        department_id      INT,
        manager_id         INT,
        job_id             INT,
        city               VARCHAR(50),
        state              VARCHAR(50),
        country            VARCHAR(50),
        status             ENUM('Active','Resigned','On Leave')
                           DEFAULT 'Active',

        CONSTRAINT fk_emp_dept
        FOREIGN KEY (department_id)
        REFERENCES DEPARTMENTS(department_id),

        CONSTRAINT fk_emp_job
        FOREIGN KEY (job_id)
        REFERENCES JOBS(job_id),

        CONSTRAINT fk_emp_manager
        FOREIGN KEY (manager_id)
        REFERENCES EMPLOYEES(employee_id)
) auto_increment = 1;


-- 5. PROJECTS
CREATE TABLE PROJECTS (
        project_id         INT PRIMARY KEY auto_increment,
        project_name       VARCHAR(100),
        start_date         DATE,
        end_date           DATE,
        budget             DECIMAL(15,2),
        status             ENUM('Planning','Active','Completed')
) auto_increment = 1;


-- 6. EMPLOYEE_PROJECTS (depends on EMPLOYEES and PROJECTS)
CREATE TABLE EMPLOYEE_PROJECTS (
        employee_id        INT,
        project_id         INT,
        assigned_date      DATE,
        hours_worked       INT,
        role               VARCHAR(50),

        PRIMARY KEY (employee_id, project_id),

        CONSTRAINT fk_ep_employee
        FOREIGN KEY(employee_id)
        REFERENCES EMPLOYEES(employee_id),

        CONSTRAINT fk_ep_project
        FOREIGN KEY(project_id)
        REFERENCES PROJECTS(project_id)
);


-- 7. CUSTOMERS
CREATE TABLE CUSTOMERS (
        customer_id        INT PRIMARY KEY auto_increment,
        customer_name      VARCHAR(100),
        email              VARCHAR(100),
        registration_date  DATE,
        city               VARCHAR(50),
        country            VARCHAR(50)
) auto_increment = 1;


-- 8. ORDERS (depends on CUSTOMERS and EMPLOYEES)
CREATE TABLE ORDERS (
        ORDER_ID           INT PRIMARY KEY auto_increment,
        customer_id        INT,
        employee_id        INT,
        order_date         DATETIME,
        ship_date          DATETIME,
        order_amount       DECIMAL(12,2),
        order_status       ENUM('Pending','Shipped','Cancelled'),

        CONSTRAINT fk_orders_customer
        FOREIGN KEY(customer_id)
        REFERENCES CUSTOMERS(customer_id),

        CONSTRAINT fk_orders_employee
        FOREIGN KEY(employee_id)
        REFERENCES EMPLOYEES(employee_id)
) auto_increment = 1;


-- 9. PRODUCTS
CREATE TABLE PRODUCTS (
        product_id         INT PRIMARY KEY auto_increment,
        product_name       VARCHAR(100),
        category           VARCHAR(50),
        price              DECIMAL(10,2),
        stock_quantity     INT,
        created_at         DATETIME
) auto_increment = 1;


-- 10. ORDER_ITEMS (depends on ORDERS and PRODUCTS)
CREATE TABLE ORDER_ITEMS (
        order_item_id      INT PRIMARY KEY auto_increment,
        order_id           INT,
        product_id         INT,
        quantity           INT,
        unit_price         DECIMAL(10,2),
        discount           DECIMAL(5,2),

        CONSTRAINT fk_oi_order
        FOREIGN KEY(order_id)
        REFERENCES ORDERS(order_id),

        CONSTRAINT fk_oi_product
        FOREIGN KEY(product_id)
        REFERENCES PRODUCTS(product_id)
) auto_increment = 1;