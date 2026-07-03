CREATE DATABASE	Employee_Data;
use Employee_Data;

		-- parent table
CREATE TABLE Personal_Info (
    EMP_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE,			-- HERE I HAVE UNIQUE CONSTRAINTS
    Gender VARCHAR(10),
    DOB DATE,
    Phone_No VARCHAR(20),
    Gmail VARCHAR(100) UNIQUE,
    Blood_group VARCHAR(3)
);

		-- child table
CREATE TABLE family_info (
    name VARCHAR(17) PRIMARY KEY,
    father_name VARCHAR(20),
    mother_name VARCHAR(20),
    sibling_name VARCHAR(20),

    FOREIGN KEY (name)
    REFERENCES personal_info(name)
);

select * from Personal_Info;
select * from family_info;

select
		p.emp_id,
        p.name,
        p.phone_no,
        f.father_name
from personal_info p
join family_info f
on p.name = f.name
where p.name = 'nitin shukla ji'
order by (name) asc;

