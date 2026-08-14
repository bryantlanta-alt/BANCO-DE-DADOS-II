DROP DATABASE IF EXISTS BancoPedidos;
CREATE DATABASE BancoPedidos;
USE BancoPedidos;

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `CodCliente` decimal(10,0) NOT NULL default '0',
  `Nome` char(20) default NULL,
  `Endereco` char(30) default NULL,
  `Cidade` char(15) default NULL,
  `CEP` char(8) default NULL,
  `UF` char(2) default NULL,
  `CGC` char(20) default NULL,
  `IE` char(20) default NULL,
  PRIMARY KEY  (`CodCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE `vendedor` (
  `CodVendedor` decimal(10,0) NOT NULL default '0',
  `NomeVendedor` char(20) default NULL,
  `SalarioFixo` decimal(10,2) default NULL,
  `FaixaComissao` char(1) default NULL,
  PRIMARY KEY  (`CodVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `CodProduto` decimal(10,0) NOT NULL default '0',
  `DescricaoProduto` char(30) default NULL,
  `Unidade` char(3) default NULL,
  `ValUnit` decimal(10,2) default NULL,
  PRIMARY KEY  (`CodProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `NumPedido` decimal(10,0) NOT NULL default '0',
  `PrazoEntrega` decimal(10,0) default NULL,
  `CodCliente` decimal(10,0) default NULL,
  `CodVendedor` decimal(10,0) default NULL,
  PRIMARY KEY  (`NumPedido`),
  KEY `CodCliente` (`CodCliente`),
  KEY `CodVendedor` (`CodVendedor`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`CodVendedor`) REFERENCES `vendedor` (`CodVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `itemdopedido`;
CREATE TABLE `itemdopedido` (
  `NumPedido` decimal(10,0) NOT NULL default '0',
  `CodigoProduto` decimal(10,0) NOT NULL default '0',
  `Quantidade` decimal(10,0) default NULL,
  PRIMARY KEY  (`NumPedido`,`CodigoProduto`),
  KEY `CodigoProduto` (`CodigoProduto`),
  CONSTRAINT `itemdopedido_ibfk_1` FOREIGN KEY (`NumPedido`) REFERENCES `pedido` (`NumPedido`),
  CONSTRAINT `itemdopedido_ibfk_2` FOREIGN KEY (`CodigoProduto`) REFERENCES `produto` (`CodProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cliente` VALUES ('20','Beth','Av. Climerio n. 45','Sao Paulo','25679300','SP','32485126/7326-8','9280');
INSERT INTO `cliente` VALUES ('110','Jorge','Rua Caiapo 13','Curitiba','30078500','PR','14512764/9834-9',NULL);
INSERT INTO `cliente` VALUES ('130','Edmar','Rua da praia s/n','Salvador','30079300','BA','23463284/234-9','7121');
INSERT INTO `cliente` VALUES ('157','Paulo','Tv. Moraes c/ 3','Londrina','','PR','32848223/324-2','1923');
INSERT INTO `cliente` VALUES ('180','Livio','Av. Beira Mar n. 1256','Florianopolis','30077500','SC','12736571/2347-4',NULL);
INSERT INTO `cliente` VALUES ('222','Lucia','Rua Itabira 123 loja 9','Belo Horizonte','22124391','MG','28315213/9348-8','2985');
INSERT INTO `cliente` VALUES ('234','Jose','Quadra 3 bl.3 sl. 1003','Brasilia','22841650','DF','21763576/1232-3','2931');
INSERT INTO `cliente` VALUES ('260','Susana','Rua Lopes Mendes 12','Niteroi','30046500','RJ','21763571/232-9','2530');
INSERT INTO `cliente` VALUES ('290','Renato','Rua Meireles n.123 bl.2 sl.345','Sao Paulo','30225900','SP','13276571/1231-4','1820');
INSERT INTO `cliente` VALUES ('390','Sebastiao','Rua da Igreja n. 10','Uberaba','30438700','MG','32176547/213-3','9071');
INSERT INTO `cliente` VALUES ('410','Rodolfo','Largo da Lapa 27 sobrado','Rio de Janeiro','30078900','RJ','12835128/2346-9','7431');
INSERT INTO `cliente` VALUES ('720','Ana','Rua 17 n 19','Niteroi','24358310','RJ','12113231/0001-34','2134');
INSERT INTO `cliente` VALUES ('830','Mauricio','Av. Paulista 1236 sl/ 2345','Sao Paulo','3012683','SP','32816985/7465-6','9343');
INSERT INTO `cliente` VALUES ('870','Flavio','Av. Pres. Vargas','Sao Paulo','22763931','SP','22534126/9387-9','4631');

INSERT INTO `vendedor` VALUES ('11','Joao','2780.00','C');
INSERT INTO `vendedor` VALUES ('101','Joao','2650.00','C');
INSERT INTO `vendedor` VALUES ('111','Carlos','2490.00','A');
INSERT INTO `vendedor` VALUES ('209','Jose','1800.00','C');
INSERT INTO `vendedor` VALUES ('213','Jonas','2300.00','A');
INSERT INTO `vendedor` VALUES ('240','Antonio','9500.00','C');
INSERT INTO `vendedor` VALUES ('250','Mauricio','2930.00','B');
INSERT INTO `vendedor` VALUES ('310','Josias','870.00','B');
INSERT INTO `vendedor` VALUES ('720','Felipe','4600.00','A');

INSERT INTO `produto` VALUES ('13','Ouro','G','6.18');
INSERT INTO `produto` VALUES ('22','Linho','M','0.11');
INSERT INTO `produto` VALUES ('25','Queijo','Kg','0.97');
INSERT INTO `produto` VALUES ('30','Acucar','SAC','0.30');
INSERT INTO `produto` VALUES ('31','Chocolate','Bar','0.87');
INSERT INTO `produto` VALUES ('45','Madeira','M','0.25');
INSERT INTO `produto` VALUES ('53','Linha','M','1.80');
INSERT INTO `produto` VALUES ('77','Papel','M','1.05');
INSERT INTO `produto` VALUES ('78','Vinho','L','2.00');
INSERT INTO `produto` VALUES ('87','Cano','M','1.97');

INSERT INTO `pedido` VALUES ('91','20','260','11');
INSERT INTO `pedido` VALUES ('97','20','720','101');
INSERT INTO `pedido` VALUES ('98','20','410','209');
INSERT INTO `pedido` VALUES ('101','15','720','101');
INSERT INTO `pedido` VALUES ('103','20','260','11');
INSERT INTO `pedido` VALUES ('104','30','110','101');
INSERT INTO `pedido` VALUES ('105','15','180','240');
INSERT INTO `pedido` VALUES ('108','15','290','310');
INSERT INTO `pedido` VALUES ('111','20','260','240');
INSERT INTO `pedido` VALUES ('119','30','390','250');
INSERT INTO `pedido` VALUES ('121','20','410','209');
INSERT INTO `pedido` VALUES ('127','10','410','11');
INSERT INTO `pedido` VALUES ('137','20','720','720');
INSERT INTO `pedido` VALUES ('138','20','260','11');
INSERT INTO `pedido` VALUES ('143','30','20','111');
INSERT INTO `pedido` VALUES ('148','20','720','101');
INSERT INTO `pedido` VALUES ('189','15','870','213');
INSERT INTO `pedido` VALUES ('203','30','830','250');

INSERT INTO `itemdopedido` VALUES ('91','77','40');
INSERT INTO `itemdopedido` VALUES ('97','77','20');
INSERT INTO `itemdopedido` VALUES ('98','77','5');
INSERT INTO `itemdopedido` VALUES ('101','13','5');
INSERT INTO `itemdopedido` VALUES ('101','31','9');
INSERT INTO `itemdopedido` VALUES ('101','78','18');
INSERT INTO `itemdopedido` VALUES ('103','53','37');
INSERT INTO `itemdopedido` VALUES ('104','53','32');
INSERT INTO `itemdopedido` VALUES ('105','78','10');
INSERT INTO `itemdopedido` VALUES ('108','13','17');
INSERT INTO `itemdopedido` VALUES ('111','25','10');
INSERT INTO `itemdopedido` VALUES ('111','78','70');
INSERT INTO `itemdopedido` VALUES ('119','13','6');
INSERT INTO `itemdopedido` VALUES ('119','22','10');
INSERT INTO `itemdopedido` VALUES ('119','53','43');
INSERT INTO `itemdopedido` VALUES ('119','77','40');
INSERT INTO `itemdopedido` VALUES ('121','25','10');
INSERT INTO `itemdopedido` VALUES ('121','31','35');
INSERT INTO `itemdopedido` VALUES ('137','13','8');
INSERT INTO `itemdopedido` VALUES ('138','22','10');
INSERT INTO `itemdopedido` VALUES ('138','53','18');
INSERT INTO `itemdopedido` VALUES ('138','77','35');
INSERT INTO `itemdopedido` VALUES ('143','31','20');
INSERT INTO `itemdopedido` VALUES ('143','78','10');
INSERT INTO `itemdopedido` VALUES ('148','25','10');
INSERT INTO `itemdopedido` VALUES ('148','31','7');
INSERT INTO `itemdopedido` VALUES ('148','45','8');
INSERT INTO `itemdopedido` VALUES ('148','77','3');
INSERT INTO `itemdopedido` VALUES ('148','78','30');
INSERT INTO `itemdopedido` VALUES ('189','78','45');
INSERT INTO `itemdopedido` VALUES ('203','31','6');