use company;

insert into employee values ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
							('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
                            ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
                            ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
                            ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
                            ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
                            ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
                            ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 18, 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 15, 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 20, 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 20, 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 18, 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 13, 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 20, 'Spouse');
							 
							 
insert into departament values ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

insert into dept_locations values (1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
                                 (5, 'Sugarland'),
                                 (5, 'Houston');

insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
						   ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);

insert into works_on values (333445555, 1, 32.5),
							(333445555, 2, 7.5),
                            (333445555, 3, 40.0),
                            (333445555, 10, 20.0),
                            (333445555, 20, 20.0),
                            (333445555, 30, 10.0),
                            (987654321, 1, 10.0),
                            (987654321, 2, 10.0),
                            (987654321, 3, 10.0),
                            (987654321, 20, 30.0),
                            (987654321, 30, 10.0),
                            (888665555, 1, 35.0),
                            (888665555, 2, 5.0),
                            (888665555, 3, 20.0),
                            (888665555, 20, 15.0),
                            (888665555, 30, 0.0);


