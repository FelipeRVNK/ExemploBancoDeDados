/*questao1 */
create database biblioteca;

use biblioteca;

/* questao 2 */
create table autor(
autorID int auto_increment primary key,
Nome varchar(50) not null);

create table categoria(
categoriaID int auto_increment primary key,
nomeCategoria varchar(50) unique not null);

create table livro(
livroID int auto_increment primary key,
autorID int,
titulo varchar(200) not null,
categoriaID int,
anoPubli int,
numeroExemplares int,
foreign key(autorID) references autor(autorID),
foreign key(categoriaID) references categoria(categoriaID));

create table membro(
membroID int auto_increment primary key,
nomeMembro varchar(100) not null,
rgMembro varchar(12) not null unique,
endereço varchar(200) not null);

create table emprestimo(
emprestimoID int auto_increment primary key,
membroID int,
livroID int,
dataDeEmprestimo date,
dataDevoluçaoPrevista date,
dataDevoluçaoReal date,
foreign key (membroID) references membro(membroID),
foreign key (livroID) references livro(livroID));

/* questao 3*/
insert into autor (nome)
values
('João de Souza'),
('Maria Julia'),
('Pedro Sampaio'),
('Ana Maria Camargo'),
('Carlos Junior'),
('Fernanda Pereira'),
('Rafael Camargo'),
('Safira Silva'),
('Luiza Moedas'),
('Chico Sonza');
select * from autor;

insert into categoria (nomeCategoria)
values
('Ficção Científica'),
('Romance'),
('Mistério'),
('Fantasia'),
('Suspense'),
('Aventura'),
('História'),
('Autoajuda'),
('Biografia'),
('Policial');
select * from categoria order by categoriaID; 

 insert into livro (titulo, autorID, anoPubli, numeroExemplares, categoriaID)
values
('Aventuras de pi',1, 1989, 5,6),
('Sempre juntos',2, 2020, 3,2),
('O Mistério das bruxas',3, 2007, 11,3),
('O Rei do gado',4, 2019, 4,7),
('A culpa é das estrelas',5, 2017, 32,2),
('Piratas do caribe',6, 2013, 11,6),
('Até o ultimo homem',7, 2016, 7,7),
('Coringa',8, 2021, 15,5),
('Homem-aranha',9, 2008, 22,2),
('Thor',10, 2007, 10,1);
select * from livro order by titulo;

insert into membro (rgMembro, nomeMembro, endereço)
values
(11111111111, 'Lucas Moura', 'Rua das Lojas, 56'),
(22222222222, 'Julia Jhonhathan', 'Avenida Paraná, 66'),
(33333333333, 'Ricardo Bento', 'Travessa Pirariqui, 72'),
(44444444444, 'Isabela Pereira', 'Rua 25 de março, 122'),
(55555555555, 'Paulo Plinio', 'Avenida parque dos principes, 999'),
(66666666666, 'Larissa Manoela', 'Rua Aparecido Franco, 3'),
(77777777777, 'Gustavo Cotoquinho', 'Rua XV, 324'),
(88888888888, 'Camila Cabello', 'Avenida dos piratas, 877'),
(99999999999, 'Abel Ferreira', 'Rua champs elysees, 165'),
(12345678910, 'Manoel Gomes', 'Rua maringá, 88');
select * from membro order by nomeMembro;

insert into emprestimo (membroID, livroID, dataDeEmprestimo, dataDevoluçaoPrevista, dataDevoluçaoReal)
values
(1, 1, '2023-01-20', '2023-02-15', '2023-02-13'),
(2, 2, '2023-02-10', '2023-03-10', null),
(3, 3, '2023-03-05', '2023-04-05', null),
(4, 4, '2023-04-15', '2023-05-15', '2023-05-02'),
(5, 5, '2023-05-25', '2023-06-25', '2023-06-12'),
(6, 6, '2023-06-10', '2023-07-10', NULL),
(7, 7, '2023-07-20', '2023-08-20', null),
(8, 8, '2023-08-05', '2023-09-05', '2023-09-04'),
(9, 9, '2023-09-15', '2023-10-15', NULL),
(10, 10, '2023-10-01', '2023-11-01', '2023-10-29');
select * from emprestimo;

/* questao 4 */
select nome from autor where nome like 'a%';

/* questao 5 */
select titulo from livro where titulo like '%sistema%';

/* questao 6 */
select livroID, titulo from livro where anoPubli < 2018;

/* questao 7 */
select titulo from livro where numeroExemplares < 5 order by titulo;

/* questao 8 */
select titulo from livro where livroID not in (select distinct livroID from emprestimo);

/* questao 9 */
UPDATE emprestimo SET dataDevoluçaoReal = CURRENT_DATE();

/* questao 10*/
update emprestimo set dataDevoluçaoPrevista = date_add(dataDevoluçaoPrevista, interval 1 month);

/* questao 11*/
delete from membro where membroID not in (select distinct membroID from emprestimo);

/* questao 12*/
delete from categoria where categoriaID not in (select distinct categoriaID from livro);

select count(*) as TotalCategoria from categoria;