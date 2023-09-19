
select p.pes_nome, em.emp_cod from Pessoa p, Emprestimo em
where p.pes_cod=em.pes_cod and emp_cod=1;

-- 2
select edi_descricao from Editora
order by edi_descricao;

-- 3
select liv_titulo from Livro
where liv_titulo like "a%";

-- 4
select liv_titulo from Livro
where liv_titulo like "A%" and anopublicacao > 2013;

-- 5
select count(*) from Telefone
where tel_ddd=12;

-- 6
select a.pes_nro_matricula, count(a.pes_nro_matricula) from Emprestimo em, Aluno a
where a.pes_cod=em.pes_cod group by a.pes_nro_matricula;

-- 7
select e.edi_cod, e.edi_descricao, l.liv_cod from Editora e, Livro l
where l.edi_cod=e.edi_cod;

-- 8
select ex.exe_cod, ex.exe_descricao from Exemplar ex, Item_emprestimo it, Emprestimo em
where ex.exe_cod=it.exe_cod and it.emp_cod=em.emp_cod and em.emp_data_emprestimo='2015-10-10';



-- 13
select l.liv_titulo, count(ex.exe_cod)"Quantidade de exemplares" from exemplar ex, livro l
where ex.liv_cod = l.liv_cod group by l.liv_cod;

-- 14
select liv_titulo from Livro
where liv_titulo like "A%" and anopublicacao > 2011;

-- 15
select p.pes_cod, p.pes_nome, l.liv_titulo from Livro l, Pessoa p, emprestimo em, item_emprestimo it, exemplar ex
where p.pes_cod=em.pes_cod and em.emp_cod=it.emp_cod and it.exe_cod=ex.exe_cod and p.pes_cod = 1;