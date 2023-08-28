create database Biblioteca;

use Biblioteca;

CREATE TABLE Pessoa (
pes_cod int PRIMARY KEY,
pes_nome varchar(40),
cpf bigint(11),
rg varchar(20),
email varchar(30)
);


CREATE TABLE Professor (
pes_cod int PRIMARY KEY,
titulacao varchar(20)
);

ALTER TABLE Professor ADD FOREIGN KEY(pes_cod) REFERENCES Pessoa (pes_cod);


CREATE TABLE Aluno (
pes_cod int PRIMARY KEY,
pes_nro_matricula bigint
);

ALTER TABLE ALUNO ADD FOREIGN KEY(pes_cod) REFERENCES Pessoa (pes_cod);


CREATE TABLE Telefone (
tel_cod int PRIMARY KEY,
tel_numero bigint(8),
tip_descricao varchar(20),
tel_ddd int(2),
pes_cod int
);

ALTER TABLE Telefone ADD FOREIGN KEY(pes_cod) REFERENCES Pessoa (pes_cod);


CREATE TABLE Editora (
edi_cod int PRIMARY KEY,
edi_descricao varchar(30)
);

CREATE TABLE Livro (
liv_cod int PRIMARY KEY,
liv_titulo varchar(20),
edicao int,
anopublicacao varchar(4),
edi_cod int references editora(edi_cod)
);

CREATE TABLE Exemplar (
exe_cod int PRIMARY KEY,
exe_descricao varchar(20),
liv_cod int references livro(liv_cod),
ex_status varchar(20)
);


CREATE TABLE Emprestimo (
emp_cod int PRIMARY KEY,
pes_cod int references pessoa(pes_cod),
emp_data_emprestimo date,
emp_data_PrevDev date
);

CREATE TABLE ITEM_EMPRESTIMO (
emp_cod int,
exe_cod int,
PRIMARY KEY(emp_cod,exe_cod),
FOREIGN KEY(emp_cod) REFERENCES Emprestimo (emp_cod),
FOREIGN KEY(exe_cod) REFERENCES exemplar (exe_cod)

);


CREATE TABLE Devolucao (
dev_cod int PRIMARY KEY,
data_dev date,
emp_cod int references emprestimo (emp_cod),
exe_cod int references exemplar (exe_cod)
);