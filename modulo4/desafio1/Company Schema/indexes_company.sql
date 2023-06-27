use company;

show index from employee;
alter table employee add index employee_salary(Salary);
alter table employee add index employee_department(Dno);
alter table employee add index employee_name(Fname);

show index from departament;
ALTER TABLE departament ADD UNIQUE un_idx_dname(Dname); 
alter table departament add index mgr_start_at_dept_idx(Mgr_start_date);
alter table departament add index dept_create_dt_idx(Dept_create_date);


show index from dependent;
alter table dependent add index father_mother_code(Essn);
alter table dependent add index relation_dependent(Relationship);

show index from project;
alter table project add index project_location(Plocation);

show index from works_on;


