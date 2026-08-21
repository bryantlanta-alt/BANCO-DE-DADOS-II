USE BancoPedidos;

SELECT DescricaoProduto 
FROM produto 
WHERE Unidade = 'M' AND ValUnit = 1.05;

SELECT Nome, CEP 
FROM cliente 
WHERE CEP BETWEEN '30077500' AND '30079000';

SELECT MIN(SalarioFixo) AS MenorSalario, MAX(SalarioFixo) AS MaiorSalario 
FROM vendedor;

SELECT SUM(i.Quantidade) AS "Quantidade Total"
FROM itemdopedido i
JOIN produto p ON i.CodigoProduto = p.CodProduto
WHERE p.DescricaoProduto = 'Vinho';

SELECT NumPedido, COUNT(CodigoProduto) AS "Qtos Produtos Diferentes"
FROM itemdopedido
GROUP BY NumPedido
HAVING COUNT(CodigoProduto) > 3;

SELECT * 
FROM cliente 
WHERE Cidade = 'Niteroi';

SELECT NumPedido, CodigoProduto, Quantidade 
FROM itemdopedido 
WHERE Quantidade = 35;

SELECT NomeVendedor AS "Nome Vendedor" 
FROM vendedor 
WHERE NomeVendedor NOT LIKE 'Jo%';

SELECT Nome 
FROM cliente 
WHERE IE IS NULL;

SELECT NomeVendedor AS "Nome Vendedor" 
FROM vendedor 
WHERE FaixaComissao IN ('A', 'B');