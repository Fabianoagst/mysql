-- Criação do banco 
create database projeto1_mysql;

-- Seleção da tabela
use projeto1_mysql;

-- Criação da tabela
create table transacao(
 Id int not null auto_increment,
 Tipo varchar(6) not null,
 Nome varchar(45) not null,
 Valor decimal(9,2) not null,
 Data_de_cadastro varchar(45) not null,
 primary key (Id)
 );
 
 -- Inserção de dados
 insert into transacao (Tipo, Nome, Valor, Data_de_cadastro) values ("compra", "Fabiano", "10.50", now());
 
 -- Select dos dados ordenados de forma crescente.
 select * from transacao order by Data_de_cadastro asc;
 
 -- Select do saldo das transações.
 select sum(Valor) from transacao;
 
 -- Delete da tabela.
 drop table transacao;
 
 
 
 
