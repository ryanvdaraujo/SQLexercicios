-- Questão 1
select distinct grav_codigo, grav_nome
from gravadora g
where not exists ( 
    select 1 from cd c
    where c.grav_codigo = g.grav_codigo and c.cd_preco_venda < 80.00
);

-- Questão 2
select cd_codigo, cd_nome, cd_preco_venda
from cd
where cd_preco_venda in (
    select max(cd_preco_venda) 
    from cd group by grav_codigo
);

-- Questão 3
select cd_codigo, cd_nome, cd_preco_venda
from cd
where cd_preco_venda < any ( 
    select cd_preco_venda from cd
    where grav_codigo = 10
);

-- Questão 4
select cd_codigo, cd_nome, cd_preco_venda from cd
where cd_preco_venda < all (
    select AVG(cd_preco_venda) from cd
group by grav_codigo
);

-- Questão 5
select UPPER(cd.cd_nome) as cd_nome from cd
where (cd.cd_preco_venda > 10.00 OR cd.grav_codigo = 3)
order by cd_nome DESC;  

-- Questão 6
select cd.cd_nome, cd.cd_data_lancamento, g.grav_nome
from gravadora g, cd
where cd.grav_codigo=g.grav_codigo and not exists (select * from cd 
where date(cd_data_lancamento > "2023-09-10")); 

-- Questão 7
select cd.cd_nome, g.grav_nome from cd
left outer join gravadora g on g.grav_codigo=cd.grav_codigo; 


-- Questão 8
SELECT cd.cd_codigo, cd.cd_nome, COUNT(faixa.mus_codigo) AS quantidade_de_musicas
FROM cd
LEFT JOIN faixa ON cd.cd_codigo = faixa.cd_codigo
GROUP BY cd.cd_codigo, cd.cd_nome; 

-- Questão 9
SELECT cd.cd_codigo AS Codigo_do_CD, 
    CASE 
        WHEN cd.cd_preco_venda BETWEEN cat.menor_preco AND cat.maior_preco THEN cat.cat_codigo
        ELSE 0 
    END AS Codigo_da_Categoria
FROM cd
LEFT JOIN cd_categoria AS cat ON cd.cd_preco_venda BETWEEN cat.menor_preco AND cat.maior_preco; 

-- Questão 10
SELECT cd1.cd_nome AS Nome_do_CD, COALESCE(cd2.cd_nome, 'Nenhum') AS CD_Indicado
FROM cd AS cd1
LEFT JOIN cd AS cd2 ON cd1.cd_indicado = cd2.cd_codigo; 



-- Questão 11

cat_codigo | menor_preco | maior_preco
-------------------------------------
7                 | 52.00            | 40.00


-- Questão 12
select cd.cd_codigo, cd.cd_nome, cd.cd_preco_venda, SUM(musica.mus_duracao) 
as duracao_total, gravadora.grav_nome as nome_gravadora
from cd
join gravadora on cd.grav_codigo = gravadora.grav_codigo
left join faixa on cd.cd_codigo = faixa.cd_codigo
left join musica on faixa.mus_codigo = musica.mus_codigo
where cd.cd_codigo = 2
group by cd.cd_codigo, cd.cd_nome, cd.cd_preco_venda, gravadora.grav_nome; 

-- Questão 13
select g.grav_nome
from gravadora g
join cd c on g.grav_codigo = c.grav_codigo
group by g.grav_nome
having COUNT(c.cd_codigo) > 2; 

-- Questão 14
select mus_nome
from musica
order by mus_duracao desc
limit 1;

-- Questão 15
select m.mus_nome, f.faixa_numero, c.cd_nome
from cd c
join faixa f on c.cd_codigo = f.cd_codigo
join musica m on f.mus_codigo = m.mus_codigo
where c.cd_codigo in (1, 2);

-- Questão 16
select aut_codigo as codigo, aut_nome as nome from autor where aut_codigo < 10
union
select mus_codigo as codigo, mus_nome as nome from musica where mus_codigo < 15;