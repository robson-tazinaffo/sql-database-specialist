CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_produto`
--

DROP TABLE IF EXISTS `categoria_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto`
--

LOCK TABLES `categoria_produto` WRITE;
/*!40000 ALTER TABLE `categoria_produto` DISABLE KEYS */;
INSERT INTO `categoria_produto` VALUES (1,'Informatica'),(2,'Papelaria'),(3,'Vestuário'),(4,'Livraria');
/*!40000 ALTER TABLE `categoria_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_entrega`
--

DROP TABLE IF EXISTS `endereco_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `endereco` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_entrega`
--

LOCK TABLES `endereco_entrega` WRITE;
/*!40000 ALTER TABLE `endereco_entrega` DISABLE KEYS */;
INSERT INTO `endereco_entrega` VALUES (1,'Rua Teste 1, 123','São Joaquim da Barra','SP','14.600-000'),(2,'Rua Teste 2, 123','Guara','SP','14.540-000'),(3,'Rua Teste 3, 123','Orlandia','SP','15.520-000'),(4,'Rua Teste 4, 123','Ipua','SP','14.580-000'),(5,'Rua Teste 5, 123','Morro Agudo','SP','15.120-000');
/*!40000 ALTER TABLE `endereco_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE KEY `localizacao_UNIQUE` (`localizacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Setor A'),(2,'Setor B'),(3,'Setor C'),(4,'Setor D');
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `idforma_pagamento` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idforma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,'Dinheiro'),(2,'Debito'),(3,'Credito'),(4,'Boleto');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idfornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idfornecedor`),
  UNIQUE KEY `CNPJ_UNIQUE` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Osmar Bonfim Ltda.','22.866.136/0001-11','Rua Acre, 217','Campinas','SP','15.680-000'),(2,'Valdomiro Espíndola','92.813.647/0001-50','Av. Palmares, 1830','Ribeirão Preto','SP','16.320-000');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  `pessoa` int NOT NULL,
  `tipo_pedido` int NOT NULL,
  `Frete` float DEFAULT NULL,
  `Entrega_idEntrega` int NOT NULL,
  `valor_pedido` decimal(18,2) NOT NULL DEFAULT '0.00',
  `valor_total` decimal(18,2) DEFAULT NULL,
  `status_pedido` int NOT NULL,
  PRIMARY KEY (`idPedido`,`pessoa`),
  KEY `fk_Pedido_Pessoa_idx` (`pessoa`),
  KEY `fk_Pedido_tipo_pedido_idx` (`tipo_pedido`),
  KEY `fk_Pedido_Entrega_idx` (`Entrega_idEntrega`),
  KEY `fk_Pedido_status_pedido_idx` (`status_pedido`),
  CONSTRAINT `fk_Pedido_Entrega` FOREIGN KEY (`Entrega_idEntrega`) REFERENCES `pedido_entrega` (`idEntrega`),
  CONSTRAINT `fk_Pedido_Pessoa` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `fk_Pedido_status_pedido` FOREIGN KEY (`status_pedido`) REFERENCES `status_pedido` (`idstatus_pedido`),
  CONSTRAINT `fk_Pedido_tipo_pedido` FOREIGN KEY (`tipo_pedido`) REFERENCES `tipo_pedido` (`idtipo_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Venda',1,1,12,2,150.50,162.50,1),(2,'Venda',1,2,12,3,150.50,162.50,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_entrega`
--

DROP TABLE IF EXISTS `pedido_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_entrega` (
  `idEntrega` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `Previsao` date DEFAULT NULL,
  `entrega_status` varchar(45) DEFAULT NULL,
  `Data_status` timestamp NULL DEFAULT NULL,
  `Cod_rastreio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_entrega`
--

LOCK TABLES `pedido_entrega` WRITE;
/*!40000 ALTER TABLE `pedido_entrega` DISABLE KEYS */;
INSERT INTO `pedido_entrega` VALUES (2,1,'2022-10-25','Aguardando separação','2022-10-29 04:59:29','123456789'),(3,2,'2022-10-26','Aguardando separação','2022-10-29 05:03:48','456789012');
/*!40000 ALTER TABLE `pedido_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_pagamento`
--

DROP TABLE IF EXISTS `pedido_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_pagamento` (
  `idpedido_pagamento` int NOT NULL AUTO_INCREMENT,
  `vencimento` datetime DEFAULT NULL,
  `parcela` int DEFAULT NULL,
  `valor` decimal(18,2) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  `idPedido` int NOT NULL,
  `tipo_pagamento` int NOT NULL,
  PRIMARY KEY (`idpedido_pagamento`,`idPedido`,`tipo_pagamento`),
  KEY `fk_pedido_pagamento_Pedido1_idx` (`idPedido`),
  CONSTRAINT `fk_pedido_pagamento_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_pagamento`
--

LOCK TABLES `pedido_pagamento` WRITE;
/*!40000 ALTER TABLE `pedido_pagamento` DISABLE KEYS */;
INSERT INTO `pedido_pagamento` VALUES (3,'2022-12-21 00:00:00',1,5.75,'12345',1,1);
/*!40000 ALTER TABLE `pedido_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idPessoa` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Identificacao` varchar(8) DEFAULT 'Juridica',
  `Endereco` varchar(45) DEFAULT NULL,
  `Cpf_cnpj` varchar(14) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `endereco_entrega` int NOT NULL,
  `tipo_pessoa` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `Cpf_cnpj_UNIQUE` (`Cpf_cnpj`),
  KEY `fk_Pessoa_endereco_entrega1_idx` (`endereco_entrega`),
  CONSTRAINT `fk_Pessoa_endereco_entrega1` FOREIGN KEY (`endereco_entrega`) REFERENCES `endereco_entrega` (`idEntrega`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Joaquim Manuel da Silva','Fisica','Rua Quinze, 233','749.951.988-06','joaquim@uol.br',NULL,1,1),(2,'Natalino Lopez','Fisica','Rua Tal, 233','749.951.555-06','natalino02@ig.com',NULL,2,1),(3,'Rhuan  Martinez','Fisica','Av Marg. Direita, 400','749.951.123-06','martimez005@hotmail.com',NULL,3,2),(4,'Leticia Lellipe','Fisica','Rua Felipe Escolari, 21','749.951.456-06','leticiafellipe01@outlook.com',NULL,4,1),(5,'Pablo de Carvalho','Fisica','Rua Sagalo, 123','749.951.789-06','plabloecommerce2022@gmail.com',NULL,5,3);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `categoria_produto` int NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_produto_categoria_produto1_idx` (`categoria_produto`),
  CONSTRAINT `fk_produto_categoria_produto1` FOREIGN KEY (`categoria_produto`) REFERENCES `categoria_produto` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Mouse Multilaser Helmans',25.5,1),(2,'Teclado Slim Logitech',45.8,1),(3,'Pacote Papel A4',8.5,2),(4,'Camiseta Polo',25,3),(5,'Calça Jeans Masculina Tam. 42',115.6,3),(6,'MySQl do básico ao avançado 3a Edição',70.8,4);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_estoque`
--

DROP TABLE IF EXISTS `produto_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_estoque` (
  `Produto_idProduto` int NOT NULL,
  `Estoque_idEstoque` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Estoque_idEstoque`),
  KEY `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque`),
  KEY `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_estoque`
--

LOCK TABLES `produto_estoque` WRITE;
/*!40000 ALTER TABLE `produto_estoque` DISABLE KEYS */;
INSERT INTO `produto_estoque` VALUES (1,1,30),(2,2,50);
/*!40000 ALTER TABLE `produto_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_fornecedor` (
  `idfornecedor` int NOT NULL,
  `idProduto` int NOT NULL,
  PRIMARY KEY (`idfornecedor`,`idProduto`),
  KEY `fk_fornecedor_has_Produto_Produto1_idx` (`idProduto`),
  KEY `fk_fornecedor_has_Produto_fornecedor_idx` (`idfornecedor`),
  CONSTRAINT `fk_fornecedor_has_Produto_fornecedor` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`),
  CONSTRAINT `fk_fornecedor_has_Produto_Produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pedido`
--

DROP TABLE IF EXISTS `produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_pedido` (
  `Produto_idProduto` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Pedido_idPedido`),
  KEY `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Produto_has_Pedido_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pedido`
--

LOCK TABLES `produto_pedido` WRITE;
/*!40000 ALTER TABLE `produto_pedido` DISABLE KEYS */;
INSERT INTO `produto_pedido` VALUES (1,1,5),(2,1,3),(2,2,6);
/*!40000 ALTER TABLE `produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_pedido`
--

DROP TABLE IF EXISTS `status_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_pedido` (
  `idstatus_pedido` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_pedido`
--

LOCK TABLES `status_pedido` WRITE;
/*!40000 ALTER TABLE `status_pedido` DISABLE KEYS */;
INSERT INTO `status_pedido` VALUES (1,'ABERTO'),(2,'EM ANDAMENTO'),(3,'EM PAUSA'),(4,'CANCELADO'),(5,'CONCLUÍDO'),(6,'ABERTO'),(7,'EM ANDAMENTO'),(8,'EM PAUSA'),(9,'CANCELADO'),(10,'CONCLUÍDO');
/*!40000 ALTER TABLE `status_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pedido`
--

DROP TABLE IF EXISTS `tipo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pedido` (
  `idtipo_pedido` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `ativo` int DEFAULT NULL,
  PRIMARY KEY (`idtipo_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pedido`
--

LOCK TABLES `tipo_pedido` WRITE;
/*!40000 ALTER TABLE `tipo_pedido` DISABLE KEYS */;
INSERT INTO `tipo_pedido` VALUES (1,'Venda',NULL),(2,'Orçamento',NULL),(3,'Condicional',NULL),(4,'Troca',NULL),(5,'Venda',NULL),(6,'Orçamento',NULL),(7,'Condicional',NULL),(8,'Troca',NULL);
/*!40000 ALTER TABLE `tipo_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-27 13:44:59
