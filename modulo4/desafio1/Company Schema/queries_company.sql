-- Consultas SQL

select * from employee;


Perguntas:  

-- Qual o departamento com maior número de pessoas? 

select count(*) as NroPessoas from employee;

select d.Dname as Departament, count(*) as Nopessoas
	from departament as d, employee as e
	where (d.Dnumber = e.Dno)
    group by d.DNumber, d.Dname
    order by Nopessoas desc limit 1;


-- Quais são os departamentos por cidade? 
select d.Dname as Departament, l.Dlocation as Location
	from departament as d, dept_locations l
	where (d.Dnumber = l.Dnumber)
    order by l.Dlocation;



-- Relação de empregrados por departamento. 




-- nome do departamento, nome do gerente 
select distinct d.Dname, concat(e.Fname,' ',e.Lname) as Manager, Address
	from departament as d, employee as e, works_on as w, project p
	where (d.Dnumber = e.Dno and e.Ssn=d.Mgr_ssn and w.Pno = p.Pnumber)
    order by d.Dname, e.Fname, e.Lname;

-- recupero todos os empregados e seus projetos em andamento
select d.Dname as Department, concat(e.Fname,' ',e.Lname) as Employee, p.Pname as Project_Name, Address
	from departament as d, employee e, works_on w, project p
    where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
    order by d.Dname desc, e.Fname asc, e.Lname asc;

-- recupero todos os empregados e seus projetos em andamento
select d.Dname as Department, concat(e.Fname,' ',e.Lname) as Employee, p.Pname as Project_Name, Address
	from departament as d, employee e, works_on w, project p
    where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
    order by d.Dname desc, e.Fname asc, e.Lname asc;



select Ssn, count(Essn) from employee e, dependent d where (e.Ssn = d.Essn);
select * from dependent;

SELECT Bdate, Address FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

select * from departament where Dname = 'Research';

SELECT Fname, Lname, Address
FROM employee, departament
WHERE Dname = 'Research' AND Dnumber = Dno;

select * from project;

--
--
--
-- Expressões e concatenação de strings
--
--
-- recuperando informações dos departamentos presentes em Stafford
select Dname as Department, Mgr_ssn as Manager from departament d, dept_locations l
where d.Dnumber = l.Dnumber;

-- padrão sql -> || no MySQL usa a função concat()
select Dname as Department, concat(Fname, ' ', Lname) from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- recuperando info dos projetos em Stafford
select * from project, departament where Dnum = Dnumber and Plocation = 'Stafford';

-- recuperando info sobre os departamentos e projetos localizados em Stafford
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM project, departament, employee
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND
Plocation = 'Stafford';

SELECT * FROM employee WHERE Dno IN (3,6,9);

--
--
-- Operadores lógicos
--
--

SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

SELECT E.Fname, E.Lname, E.Address
FROM EMPLOYEE E, DEPARTAMENT D
WHERE D.Dname = 'Research' AND D.Dnumber = E.Dno;
--
--
-- Expressões e alias
--
--

-- recolhendo o valor do INSS-*
select Fname, Lname, Salary, Salary*0.011 from employee;
select Fname, Lname, Salary, Salary*0.011 as INSS from employee;
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
select e.Fname, e.Lname, 1.1*e.Salary as increased_sal from employee as e,
works_on as w, project as p where e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname='ProductX';

-- concatenando e fornecendo alias
select Dname as Department, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- recuperando dados dos empregados que trabalham para o departamento de pesquisa
select Fname, Lname, Address from employee, departament
	where Dname = 'Research' and Dnumber = Dno;

-- definindo alias para legibilidade da consulta
select e.Fname, e.Lname, e.Address from employee e, departament d
	where d.Dname = 'Research' and d.Dnumber = e.Dno;
	
	
	
-- OUTRAS --
/* What is the department with more employees */
select count(*) as Qtd_Pessoas,Dnumber, Dname, 
	Dept_create_date from departament d 
    left join employee e on e.Dno = d.Dnumber
    group by Dnumber order by Qtd_Pessoas desc;
    
/* What are the departments by City */
select Dnumber,Dname,Dlocation from 
	dept_locations natural join
	departament order by Dnumber desc;

/* Relation of employee by department */
	select Dnumber,Dname,CONCAT(Fname,' ',Minit,' ',Lname) as 
		Employee_Name from Employee e Left Join
		Departament d on e.Dno = d.Dnumber
        order by d.Dnumber desc;
    
/* Top 5 most well payed employees */
select Ssn,CONCAT(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Salary,Dnumber,Dname from employee e 
    Left Join Departament d on e.Dno = d.Dnumber
    order by Salary desc Limit 5;

/* Project's name and their respective department order by city*/
select Pnumber,Pname,Plocation,Dname
	from project p Inner Join departament d
    on p.Dnum = d.Dnumber order by Pnumber,Plocation;

/* Relation of Employees and their dependents*/    
select Essn as ID_Employee,CONCAT(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Dependent_name,Relationship
    from dependent d Inner Join Employee e
    on d.Essn = e.Ssn order by Essn;
    
/* Employees and the projects that they're on */
select Ssn as ID_Employee,
	concat(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Pname,Plocation,Dname 
    from employee e inner join departament d
    on e.Dno = d.Dnumber inner
    join project p on p.Dnum = d.Dnumber
    order by ID_Employee;

/* Employees and the projects that they're on 
that the city location is Houston */    
select Ssn as ID_Employee,
	concat(Fname,' ',Minit,' ',Lname) as 
    Employee_Name,Pname,Plocation,Dname 
    from employee e inner join departament d
    on e.Dno = d.Dnumber inner
    join project p on p.Dnum = d.Dnumber
    where Plocation = 'Houston'
    order by ID_Employee;	

