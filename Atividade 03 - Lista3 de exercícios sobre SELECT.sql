USE BancoBiblioteca;

-- 1
select count(*)
from emprestimos
where data_emp between '1998-01-01' and '1998-12-07';
-- 1 - B
select count(*)
from emprestimos
where year(data_emp) = 1998;

-- 2
select count(*)
from emprestimos
where data_dev is null;

-- 3
select
	e.cod_emp,
    e.cod_usu,
    u.nome,
    e.cod_liv,
	l.titulo,
    l.autor,
    l.editora,
    e.data_emp,
    e.data_dev
from emprestimos e join usuarios u
	on e.cod_usu = u.cod_usu join livros l
    on e.cod_liv = l.cod_liv
where e.data_dev is not null;

-- 4
SELECT
	L.COD_LIV,
    L.TITULO,
    L.AUTOR,
    L.EDITORA
FROM EMPRESTIMOS E RIGHT JOIN LIVROS L
	ON E.COD_LIV = L.COD_LIV
WHERE E.COD_EMP IS NULL;

-- 5
SELECT 
    l.Cod_Liv,
    l.Titulo,
    l.Autor,
    l.Editora
FROM Livros l JOIN Reservas r
	ON l.Cod_Liv = r.Cod_Liv
GROUP BY l.Cod_Liv
HAVING COUNT(r.Cod_Res) >= 4;

-- 6
SELECT COUNT(*) AS Total_Usuarios
FROM Usuarios;

 -- 7
SELECT *
FROM Livros
WHERE Autor LIKE '%JOAO%';

-- 8
SELECT 
    r.Cod_Res,
    r.Cod_Liv,
    l.Titulo,
    l.Autor,
    l.Editora,
    r.Cod_Usu,
    u.Nome
FROM Reservas r
JOIN Livros l ON r.Cod_Liv = l.Cod_Liv
JOIN Usuarios u ON r.Cod_Usu = u.Cod_Usu
WHERE r.Data_Res = '1998-12-06'
ORDER BY l.Titulo ASC;

-- 9
SELECT COUNT(*) AS Total_Reservas_Curitiba
FROM Reservas r
JOIN Usuarios u ON r.Cod_Usu = u.Cod_Usu
WHERE u.Cidade = 'curitiba' 
  AND u.Estado = 'PR';

-- 10
SELECT  u.Nome, COUNT(*)
FROM Usuarios u JOIN Emprestimos e
	ON u.Cod_Usu = e.Cod_Usu
GROUP BY u.Cod_Usu
HAVING COUNT(e.Cod_Emp) >= 2;

-- 11
SELECT Estado, COUNT(*)
FROM Usuarios
GROUP BY Estado;


