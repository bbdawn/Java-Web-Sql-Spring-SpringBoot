drop table JPA_EMPLOYEE;
drop table JPA_DEPARTMENT;
drop sequence jpa_department_seq;
drop sequence jpa_employee_seq;


SELECT * FROM JPA_DEPARTMENT;
SELECT * FROM JPA_EMPLOYEE;

select employee0_.id as id1_1_0_, department1_.department_id as department_id1_0_1_,
employee0_.department_id as department_id3_1_0_, employee0_.ename as ename2_1_0_, 
department1_.dname as dname2_0_1_, department1_.location as location3_0_1_ 
from jpa_employee employee0_ 
right outer join jpa_department department1_ 
on employee0_.department_id=department1_.department_id