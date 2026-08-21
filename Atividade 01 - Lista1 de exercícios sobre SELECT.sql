USE BancoPedidos;

-- 1 
SELECT DescricaoProduto 
FROM produto 
WHERE Unidade = 'M' AND ValUnit = 1.05;

-- 2
SELECT Nome, CEP 
FROM cliente 
WHERE CEP BETWEEN 30077500 AND 30079000
ORDER BY CEP ASC;

-- 3
SELECT MIN(SalarioFixo) AS MenorSalario, MAX(SalarioFixo) AS MaiorSalario 
FROM vendedor;

-- 4
SELECT *
FROM ITEMDOPEDIDO;

SELECT SUM(i.Quantidade) AS "Quantidade Total"
FROM itemdopedido i
JOIN produto p ON i.CodigoProduto = p.CodProduto
WHERE p.DescricaoProduto = 'Vinho';

-- 5
SELECT NumPedido, COUNT(*) AS QTOSPRODUTOSDIFERENTES
FROM itemdopedido
GROUP BY NumPedido
HAVING COUNT(CodigoProduto) > 3;

-- 6
SELECT * 
FROM cliente 
WHERE Cidade = 'Niteroi';

-- 7
SELECT NumPedido, CodigoProduto, Quantidade 
FROM itemdopedido 
WHERE Quantidade = 35;

-- 8
SELECT NomeVendedor
FROM vendedor 
WHERE NomeVendedor NOT LIKE 'Jo%';

-- 9
SELECT Nome 
FROM cliente 
WHERE IE IS NULL;

-- 10
SELECT NOMEVENDEDOR
FROM vendedor 
WHERE FaixaComissao IN ('A', 'B');