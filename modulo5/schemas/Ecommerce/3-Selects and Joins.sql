-- -----------------------------------------------------
-- Filtros com Clausula where:
-- Consultas tabelas sem clausalas:
-- Obs.: Não muito indicado por motivo de performance:
-- -----------------------------------------------------
select * from ecommerce.pessoa;
select * from ecommerce.produto;


-- -----------------------------------------------------
-- Filtros com Clausula where:
-- Consultas:
-- -----------------------------------------------------
select * from ecommerce.pessoa where idPessoa=5;
select * from ecommerce.produto where upper(descricao) like '%MOUSE%';
select * from ecommerce.pedido where idPedido=2;


-- -----------------------------------------------------
-- Empressões para atributos com derivação
-- Concatenizações:
-- -----------------------------------------------------

-- Crie expressões para gerar atributos derivados
select (sum(valor_pedido)+sum(Frete)) as TotalPedido from ecommerce.pedido where idPedido=2;


-- -----------------------------------------------------
-- Ordenação:
-- Defina ordenações dos dados com ORDER BY
-- -----------------------------------------------------
select descricao, Valor from ecommerce.Produto order by valor desc;
select descricao, Valor from ecommerce.Produto order by valor asc;

-- -----------------------------------------------------
-- Filtragem:
-- HAVING Statement
-- -----------------------------------------------------
select categoria_produto, sum(Valor) from ecommerce.Produto group by categoria_produto having count(categoria_produto) > 1;

-- -----------------------------------------------------
-- Junçoes (JOIN):
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- -----------------------------------------------------
select c.descricao as Categoria, p.Descricao, p.Valor
    from ecommerce.produto p
    inner join ecommerce.categoria_produto c on p.categoria_produto = c.idCategoria	
	
	
	
-- -----------------------------------------------------
-- PERGUNTAS
-- -----------------------------------------------------

-- 1) Qual o total de pedidos por cliente?
select count(p.idCliente), c.Nome
    from ecommerce.Pedido p
    inner join ecommerce.Cliente c on p.idCliente = c.id
    group by p.idCliente, c.Nome

-- 2) Pessoa é cliente, vendedor, ou ambos?
SELECT p.Nome, p.endereco, p.email,
	CASE p.tipo_pessoa 
	WHEN 1 THEN ('CLIENTE') 
	WHEN 2 THEN ('VENDEDOR')
	ELSE ('AMBOS') END AS cliente_ou_vendedor
	FROM pessoa p
 
-- 3) Relação de produtos fornecedores e estoques;
select f.razao_social, p.descricao, pe.quantidade
    from ecommerce.produto p
    inner join ecommerce.produto_fornecedor pf on p.idProduto = pf.idProduto
    inner join ecommerce.Fornecedor f on f.idFornecedor = pf.idFornecedor
    inner join ecommerce.produto_estoque pe on p.idProduto = pe.Produto_idProduto
	
-- 4) Relação de nomes dos fornecedores e nomes dos produtos;
select f.RazaoSocial as Fornecedor, p.Identificacao as Produto
    from ecommerce.Produto p
    inner join ecommerce.ProdutoFornecedor pf on p.id = pf.idProduto
    inner join ecommerce.Fornecedor f on f.id = pf.idFornecedor
	
-- 5-Total de lançamentos por tipo de lançamento	
select count(p.tipo_pedido) as total, t.descricao
    from ecommerce.Pedido p
    inner join ecommerce.tipo_pedido t on p.tipo_pedido = t.idtipo_pedido
    group by t.descricao
	
	
	
-- OUTRAS PERGUNTAS 

select c.id_cliente,nome_cliente,count(*) as quantidade from cliente c
inner join pedido p where c.id_cliente = p.id_cliente group by
c.id_cliente;

-- seleciona todos os cliente em que uma única compra gastaram mais do que R$ 1.200,00
select c.id_cliente,nome_cliente,p.valor_total from cliente c 
inner join pedido p on c.id_cliente = p.id_cliente
and p.valor_total > 1200.0;

-- todos os produtos que são vendidos na loja
select concat(nome_produto,' - ',marca) as Nome_do_Produto, descricao,preco from produto;

-- Todos os produtos fornecidos por determinados fornecedores
select f.id_fornecedor,nome_fornecedor,endereco from fornecedor as f
inner join fonecimento_produto as fp on f.id_fornecedor = fp.id_fornecedor
inner join produto as p on fp.id_produto = p.id_produto order by f.id_fornecedor;

-- quantos produtos cada fornecedor fornece para a loja
select count(distinct(p.id_produto)) as quantidade_produto,f.id_fornecedor,
f.nome_fornecedor,f.endereco from fornecedor f inner join 
fonecimento_produto ftp on f.id_fornecedor = ftp.id_fornecedor inner join 
produto p on ftp.id_produto = p.id_produto group by f.id_fornecedor;

-- produtos disponíveis no estoque ordenando pelo estoque e quantidade de produto disponível
select p.id_produto,nome_produto,descricao,etp.quantidade_produto from produto as p
inner join estoque_tem_produto as etp on p.id_produto = etp.id_produto
inner join estoque as e on etp.id_estoque = e.id_estoque
order by e.id_estoque,etp.quantidade_produto;

-- nome dos cliente em que suas entregas foram entregues com atraso
select c.id_cliente, nome_cliente,c.endereco,codigo_rastreio,t.id_transportadora,
t.nome_transportadora from cliente c inner join pedido p on c.id_cliente = p.id_cliente
inner join transportadora t on p.id_transportadora = t.id_transportadora inner join
entrega e on t.id_transportadora = e.id_transportadora and data_entrega > data_prevista;

-- quantidade de clientes que pagaram o produto exclusivamente com o metodo de pagamento pix
select count(*) as quantidade_de_pix from cliente as c
inner join pedido as p on c.id_cliente = p.id_cliente
and p.status_pedido='Concluido' inner join pagamento as pg 
where p.id_pagamento = pg.id_pagamento and pg.metodo_pagamento = 
'Pix';
	
	
	
