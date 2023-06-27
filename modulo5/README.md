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
## Desafios modulo 5:



1. **Criando Transações, Executando Backup e Recovery de Banco de Dados.**

   Neste desafio você irá lidar com transações para executar modificações na base de dados. Sendo assim, vamos relembrar como executar uma transação. Primeiramente, é preciso desabilitar o autocommit do MySQL. Caso contrário, cada instrução SQL executada será confirmada.



**PARTE 1 – TRANSAÇÕES** 

Objetivo:  

Neste desafio você irá lidar com transações para executar modificações na base de dados. Sendo assim, vamos relembrar como executar uma transação. Primeiramente, é preciso desabilitar o autocommit do MySQL. Caso contrário, cada instrução SQL executada será confirmada. 

CODE 1

```

```

Essa primeira transação pode ser executada sem utilizar outros recursos como procedures. Dessa forma, você irá executar statements de consultas e modificações de dados persistidos no banco de dados via transações.  

 

CODE 2

```

```







**PARTE 2 - TRANSAÇÃO COM PROCEDURE** 

Você deverá criar outra transação, contudo, esta será definida dentro de uma procedure. Neste caso, assim como no exemplo em aula, deverá haver uma verificação de erro. Essa verificação irá acarretar um ROLLBACK, total ou parcial (SAVEPOINT). 

CODE 3

```

```

**PARTE 3 – BACKUP E RECOVERY** 

Objetivo: 

Neste etapa do desafio, você irá executar o backup do banco de dados e-commerce. Realize o backup e recovery do banco de dados; 

- Utilize o mysqdump para realizar o backup e recovery do banco de dados e-commerce; 
- Realize o backup de diferentes bancos de dados e inseria os recursos como: procedures, eventos e outros. 
- Adicione o arquivo de backup ao github juntamente com o script; 

```

```

