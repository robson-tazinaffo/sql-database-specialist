use company;

--Drop view vw_employees_salary;

Create or Replace view vw_employees_salary as
select concat(Fname,Minit,lname) as Name, d.Dependent_ name as Dependent
from employee e
inner join dependent d on e.Ssn = d.Essn;


select * from company.vw_employees_salary;