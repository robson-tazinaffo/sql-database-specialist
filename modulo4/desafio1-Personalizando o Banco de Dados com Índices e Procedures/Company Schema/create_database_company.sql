-- create database company;
create schema if not exists company;
use company;


-- TABLE EMPLOYEE
CREATE TABLE IF NOT EXISTS employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null, 
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null default 1,
    constraint pk_employee primary key (Ssn)
);


-- TABLE DEPARTAMENT
create table if not exists departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date,
    constraint chk_dept_date check (Dept_create_date <= Mgr_start_date),
    constraint chk_dept_dnumber check (Dnumber <> 0),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique(Dname),
    constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn)
);

-- para modificar uma constraint primeiro dropamos

alter table departament drop constraint fk_dept;
alter table departament 
	add constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn) 
	on update cascade;

-- TABLE DEPT_LOCATIONS
create table if not exists dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation)
    constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations 
	add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
	on delete cascade
    on update cascade;


-- TABLE PROJECT
create table if not exists project(
	Pname varchar(15) not null,
	Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    constraint pk_project primary key (Pnumber),
    constraint unique_name_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

-- TABLE WORKS_ON
create table if not exists works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_works_on foreign key (Essn) references departament(Mgr_ssn),
    foreign key (Pno) references project(Pnumber)
);

-- TABLE DEPENDENT
create table if not exists dependent(
	Essn char(9) not null,
    dependent_name varchar(255) not null,
    Sex char,
    Bdate date,
    Age int,
    Relationship varchar(8),
    constraint chk_age_dependent check (Age < 21),
    constraint pk_dependent primary key(Essn, dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

-- SELECT CONSTRAINTS 
select * from information_schema.table_constraints 
	where (constraint_schema = 'company');
