
-- Criação do banco
create database projeto3_mysql;
use projeto3_mysql;

-- Criação das tabelas ( Usuarios, Buscas realizadas, Colaborador, Contato, Perfil e Postagem)
create table usuarios(
	id int not null auto_increment,
	nome varchar (255) not null,
    senha varchar (255) not null,
    email varchar (255) not null,
    primary key (id)
);

create table buscas_realizadas(
	id int not null auto_increment,
	data_hora datetime not null,
    hashtag varchar (255) not null,
    id_usuario int not null,
    primary key (id),
    foreign key (id_usuario) references usuarios(id)
);

create table colaborador(
	id int not null auto_increment,
	nome varchar (255) not null,
    descricao varchar (255) not null,
    primary key (id)
);

create table contato(
	id int not null auto_increment,
	plataforma varchar (255) not null,
    link varchar (255) not null,
    id_colaborador int not null,
    primary key (id),
    foreign key (id_colaborador) references colaborador(id)
);

create table perfil(
	id int not null auto_increment,
	nome varchar (255) not null,
    imagem varchar (255) not null,
    primary key (id)
);


create table post(
	id int not null auto_increment,
	hashtag varchar (255) not null,
    texto varchar (255) not null,
	imagem varchar (255) not null,
    id_perfil int not null,
    primary key (id), 
    foreign key (id_perfil) references perfil(id)
);

alter table post add index filter_post (hashtag, texto);

-- Inserção de dados
insert into usuarios (nome, senha, email)
 values ("Fabiano", "123456", "fabiano@yahoo.com");
 
insert into buscas_realizadas (data_hora, hashtag, id_usuario)
 values (now(),"pesquisa", "1");
 
insert into colaborador (nome, descricao) 
values ("Jaqueline","adklsfaçksjfaçskfjçaksfçaskljdlçkasjaçjkçajçafjaçkfaçkfjaçkfaçkf");

insert into contato (id_colaborador, link, plataforma) values ("1", "http://soaoskaoks", "instagram");

insert into perfil (nome, imagem) 
values ("@joao", "http://aksjakldjaasd");

insert into post (hashtag, id_perfil, texto, imagem) 
values ("@panda", "3", "asda", "http://aksjakldjaasd"); 

-- Selects
select b.hashtag, b.data_hora from buscas_realizadas as b;

select c.nome, c.descricao, t.plataforma, t.link from colaborador as c join contato as t on c.id = t.id_colaborador;

select p.hashtag, p.texto, p.imagem, u.nome from post as p join perfil as u on p.id_perfil = u.id;

select * from post join perfil on perfil.id = post.id_perfil where hashtag <> "aula" and texto = "natureza";









