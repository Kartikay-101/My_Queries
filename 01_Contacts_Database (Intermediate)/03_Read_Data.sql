use Employee_Data;

select * from personal_info;
select * from family_info;

SELECT * FROM EMP_INFO;

create view whole_data as
SELECT P.EMP_ID,
		P.NAME,
		E.FIRST_NAME,
		E.LAST_NAME,
        P.Gender,
        P.DOB,
        P.PHONE_NO,
        P.Gmail,
        P.Blood_group,
        E.DEPARTMENT,
        E.CITY,
        E.COUNTRY,
        E.SALARY,
        E.BONUS,
        E.JOINING_DATE,
        F.father_name,
        F.mother_name,
        F.sibling_name,
        F.Bhabhi_Maa
FROM PERSONAL_INFO P
LEFT JOIN FAMILY_INFO F
ON P.NAME = F.NAME
LEFT JOIN EMP_INFO E
ON P.EMP_ID = E.EMP_ID
		-- these below are logical operators
-- WHERE CITY NOT IN ('PUNE','DELHI')
-- WHERE SALARY NOT between 50000 AND 70000
-- WHERE SALARY LIKE "50%"
-- WHERE CITY = 'Noida'
-- AND DEPARTMENT = 'IT'
-- WHERE DEPARTMENT = 'IT'
-- AND (CITY = 'Noida' OR CITY = 'Bangalore')
order by NAME ASC;
        
		


-- Join personal_info and family_info tables
-- using the ON clause where names match
select
	p.emp_id,
	p.Name,
	p.Gender,
	p.DOB,
	p.Phone_No,
	p.Gmail,
	p.Blood_group,
    f.father_name,
    f.mother_name,
    f.sibling_name,
    f.bhabhi_maa
    
from personal_info p
INNER join family_info f
on p.name = f.name
ORDER BY NAME ASC;


-- Join personal_info and family_info tables
-- using the common column 'name'
-- USING is a shorter form when both tables
-- have the same column name
select *
from personal_info p
join family_info
using ( name)
ORDER BY NAME ASC;
