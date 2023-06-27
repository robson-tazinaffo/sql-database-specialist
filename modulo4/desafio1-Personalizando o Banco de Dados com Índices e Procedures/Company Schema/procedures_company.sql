DELIMITER //
CREATE PROCEDURE proc_opcoes_employee(
	in Opcao int,
	in Fname_p varchar(15), 
    in Minit_p char(1), 
    in Lname_p varchar(15),
    in Ssn_p char(9), 
    in Bdate_p date, 
    in Address_p varchar(30), 
    in Sex_p char(1), 
    in Salary_p decimal(10,2), 
    in Super_ssn_p char(9), 
    in Dno_p int
)
BEGIN
    CASE 
        WHEN Opcao = 1 THEN 

			select * from employee;

        WHEN Opcao = 2 THEN 

			insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) values (Fname_p, Minit_p, Lname_p, Ssn_p, Bdate_p, Address_p, Sex_p, Salary_p, Super_ssn_p, Dno_p);			

            select 'Registro inserido com sucesso' as Message;
			select * from employee;
			
		WHEN Opcao = 3 THEN 
			update employee set 
			Fname = Fname_p, 
			Minit = Minit_p, 
			Lname = Lname_p, 
			Bdate = Lname_p, 
			Address = Address_p, 
			Sex = Sex_p, 
			Salary = Salary_p, 
			Super_ssn = Super_ssn_p, 
			Dno = Dno_p
			where Ssn = Ssn_p;
            
            select 'Alteração bem sucedida' as Message;
        WHEN Opcao = 4 THEN 
			delete from employee where Ssn = Ssn_p;
            select 'Registro excluido com sucesso!' as Message;
    END CASE;
END //

delimiter ;