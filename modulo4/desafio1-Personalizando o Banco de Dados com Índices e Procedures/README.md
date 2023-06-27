## **Formação SQL Database Specialist**



<div><center>
<img align="center" alt="Linux" height="150" width="150" src="https://hermes.dio.me/tracks/bc454148-6e72-4047-95cc-d516706ae405.png" />
</div>



```
Desenvolva suas habilidades com banco de dados, aprenda como modelar uma base de dados de acordo com necessidades de negócios, aprenda a trabalhar com comandos Data Manipulation Language (DML) e Data Definition Language (DDL) para consultar e manipular seus dados. Crie projetos de soluções baseadas nas boas práticas das regras formais e explore técnicas de Recuperação e Controle de Concorrência em Banco de dados.
```



## Links Úteis

[Site da Dio](https://dio.me/)

[Sintaxe Básica Markdown](https://www.markdownguide.org/basic-syntax/)

[Download do git](https://git-scm.com/downloads)

[MySQL](https://dev.mysql.com/downloads/installer/)



## Tecnologias utilizadas nos projetos

<div style="display: inline_block">
<img align="center" alt="git" height="120" width="90" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original-wordmark.svg"/>
<img align="center" alt="GitHub" height="70" width="60" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original-wordmark.svg" />
<img align="center" alt="Linux" height="70" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" />
<img align="center" alt="Windows" height="70" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/windows8/windows8-original.svg" />              
<img align="center" alt="MySQL" height="150" width="120" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original-wordmark.svg" />
</div>
## **Personalizando o Banco de Dados com Índices e Procedures.**



## **Parte 1 - Criando índices em Banco de Dados**

Criação de índices para consultas para o cenário de company com as perguntas (queries sql) para recuperação de informações. Sendo assim, dentro do script será criado os índices com base na consulta SQL. 

O que será levado em consideração para criação dos índices? 

1. Quais os dados mais acessados.
1. Quais os dados mais relevantes no contexto.



## **Índices** 

- Table employee

  ```
  use company;
  show index from employee;
  
  -- multicolumn index 
  ALTER TABLE employee ADD INDEX idx_employee_full_name (Fname, Lname);
  ```

  

- Table departament

  ```
  use company;
  show index from departament;
  
  -- Unique index
  ALTER TABLE departament ADD UNIQUE idx_dname(Dname);
  ```

  

- Table dependent

  ```
  use company;
  show index from dependent;
  
  -- Unique index
  ALTER TABLE dependent ADD UNIQUE idx_dependent_name(dependent_name);
  ```

  

- Table dept_locations

  ```
  use company;
  show index from dept_locations;
  
  -- Unique index
  ALTER TABLE dept_locations ADD UNIQUE idx_dlocation(Dlocaton);
  ```

  

- Table project

  ```
  use company;
  show index from project;
  
  -- multicolumn index 
  ALTER TABLE project ADD INDEX idx_pname_plocation (Pname, Plocaton);
  ```

  

- Table works_on 

  ```
  use company;
  show index from works_on;
  
  -- Unique index
  ALTER TABLE works_on ADD UNIQUE idx_works_on_pno(Pno);
  ```

  



## **Queries**



Perguntas: 



- Qual o departamento com maior número de pessoas? 

  ```
  select d.Dname as Departament, count(*) as Nopessoas
  	from departament as d, employee as e
  	where (d.Dnumber = e.Dno)
      group by d.DNumber, d.Dname
      order by Nopessoas desc limit 1;
  ```

  

- Quais são os departamentos por cidade? 

  ```
  select d.Dname as Departament, l.Dlocation as Location
  	from departament as d, dept_locations l
  	where (d.Dnumber = l.Dnumber)
      order by l.Dlocation;
  ```

  

- Relação de empregrados por departamento 

  ```
  select concat(e.Fname,' ',e.Lname) as Manager,  d.Dname as Departament
  	from departament d, employee e
  	where (d.Dnumber = e.Dno)
      order by e.Fname;
  ```

  

 



**Entregável:** 

- Crie as queries para responder essas perguntas 
- Crie o índice para cada tabela envolvida (de acordo com a necessidade) 
- Tipo de indice utilizado e motivo da escolha (via comentário no script ou readme) 

 



## **Parte 2 - Utilização de procedures para manipular Banco de Dados**



Objetivo: 

Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de estruturas condicionais (como CASE ou IF). 

Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 

 

```
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

desc employee;

-- Consulta
call proc_opcoes_employee(1,null,null,null,null,null,null,null,null,null,null);

-- Insert
call proc_opcoes_employee(2,'Robson', 'B', 'Tazinaffo', '123769824', '1990-08-10', 'Rua Acre, 217-SP', 'M', '33000.00', '123456789', '1');
    
-- Update
call proc_opcoes_employee(3,'Robson', 'B', 'Tazinaffo', '123769824', '1990-08-10', 'Rua Acre, 217-SP', 'M', '1500.00', '123456789', '1');

-- Delete'
call proc_opcoes_employee(4,null,null,null,'123769824',null,null,null,null,null,null);
    
select * from employee;
```



**Entregável:** 

Script SQL com a procedure criada e chamada para manipular os dados de universidade e e-commerce. Podem ser criados dois arquivos distintos, assim como a utilização do mesmo script para criação das procedures. Fique atento para selecionar o banco de dados antes da criação da procedure. 
