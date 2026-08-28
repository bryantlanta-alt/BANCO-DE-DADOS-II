use BancoPedidos;

select *
from cliente
order by codcliente desc
limit 2;

select  min(salariofixo)
from vendedor;

select nomevendedor, salariofixo
from vendedor
order by salariofixo
limit 3;

select *
from produto
limit 11;

select *
from vendedor
order by nomevendedor
limit 2,5;

select all unidade
from produto;

-------------------------

select *
from pedido join cliente
on pedido.codcliente = cliente.codcliente;