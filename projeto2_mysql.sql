-- Criação do banco 
create database projeto2_mysql;

-- Seleção da tabela
use projeto2_mysql;

-- Criação da tabela de usuário
create table usuario(
 Id int not null auto_increment,
 Nome varchar(255) not null,
 Imagem varchar(255) not null,
 Nome_de_usuario varchar(255) not null,
 Data_de_cadastro date not null,
 primary key (Id)
 );
 
 -- Criação da tabela de cartão
create table cartao(
 Id int not null auto_increment,
 numero varchar(50) not null,
 cvv varchar(3) not null,
 Data_de_expiracao date not null,
 Valido enum("valido", "invalido") not null,
 Data_de_cadastro date not null,
 primary key (Id) 
 );
 
 -- Criação da tabela de Transação
create table transacao(
 Id int not null auto_increment,
 Id_usuario int not null,
 Id_cartao int not null,
 Valor decimal(9,2) not null,
 Data_de_cadastro date not null,
 primary key (Id),
 foreign key (Id_usuario) references usuario(id),
 foreign key (Id_cartao) references cartao(id)
 );
 
 -- Inserção de dados
 insert into usuario (Nome, Imagem, Nome_de_usuario, Data_de_cadastro) 
 values ("Fabiano","http:sdfsfsfdsfsfsf", "Fabiano", now());
 
 -- Select de usuarios cadastrados
 select * from usuario order by nome asc;
 
 -- Inserção de cartão
 insert into cartao (numero, cvv,  Data_de_expiracao,  Valido, Data_de_cadastro)
 values ("45557777732", "123", "2025-06-06","valido", now());
 
 -- Select dos cartões válidos em ordem crescente de data de cadastro
select * from cartao where Valido = "valido" order by Data_de_cadastro asc;

-- Inserção na tabela de transação.
insert into transacao (Id_usuario, Id_cartao, Valor, Data_de_cadastro)
values ("3", "1", "20.50", now());
 
 -- Select das transações em ordem decrescente da data de cadastro, contendo os dados do usuário e cartão.
select t.*, u.*, c.* from transacao as t join usuario as u join cartao as c
 on t.id_usuario = u.id and t.id_cartao = c.id 
 order by c.Data_de_cadastro desc;
 