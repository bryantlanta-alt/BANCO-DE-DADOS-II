DROP DATABASE IF EXISTS BancoBiblioteca;
CREATE DATABASE IF NOT EXISTS BancoBiblioteca;
USE BancoBiblioteca;


CREATE TABLE Usuarios(
      Cod_Usu   int auto_increment,
	  Nome		char(30),
	  Endereco	char(50),
	  Telefone	char(11),
      Cidade    char(20),
      Estado    char(2),
	  primary key(Cod_Usu)
)engine=innodb;


CREATE TABLE Livros(
      Cod_Liv   int auto_increment,
      Titulo    char(25),
      Autor     char(25),
      Editora   char(20),
      primary key(Cod_Liv)
)engine=innodb;

CREATE TABLE Emprestimos(
      Cod_Emp   int auto_increment,
      Cod_Usu   int, 
      Cod_Liv   int,
      Data_Emp  date,
      Data_Dev  date,
	  primary key(Cod_Emp),
	  foreign key(Cod_Usu) references Usuarios(Cod_Usu),
	  index(Cod_Usu),
      foreign key(Cod_Liv) references Livros(Cod_Liv),
      index(Cod_Liv)
)engine=innodb;

CREATE TABLE Reservas(
      Cod_Res   int auto_increment,
      Cod_Liv   integer,
      Cod_Usu   integer,
      Data_Res  date,
      primary key(Cod_Res),
      foreign key(Cod_Liv) references Livros(Cod_Liv),
      index(Cod_Liv),
      foreign key(Cod_Usu) references Usuarios(Cod_Usu),
  	  index(Cod_Usu)
)engine=innodb;


INSERT INTO Usuarios VALUES (1,'aurelio marinho','tv. rafael greca,98','243-2871','curitiba','PR');
INSERT INTO Usuarios VALUES (2,'joao da silva','r. das alagoas, 533','233-3428','curitiba','PR');
INSERT INTO Usuarios VALUES (3,'maria jose aparecida','av. garibaldi, 334','222-2145','sao paulo','SP');
INSERT INTO Usuarios VALUES (4,'andreia almeida','r. principal, 33','233-4441','santo amaro','SP');
INSERT INTO Usuarios VALUES (5,'jose pereira','r. palmeiras, 365','344-2982','porto alegre','RS');
INSERT INTO Usuarios VALUES (6,'karla jargas','av. das flores, 777','253-2561','curitiba','PR');
INSERT INTO Usuarios VALUES (7,'antonio bueno','r. trivial, 305','973-4321','sao paulo','SP');
INSERT INTO Usuarios VALUES (8,'pedro h. cunha','r. gauchos, 396 ap 576','942-2771','porto alegre','RS');
INSERT INTO Usuarios VALUES (9,'paulo oliveira','r. estou cansado, 23','333-3831','curitiba','PR');
INSERT INTO Usuarios VALUES (10,'andressa','r. dep. nilson ribas, 855','244-3476','curitiba','PR');



INSERT INTO Livros VALUES (1,'fernao capelo gaivota','fernando simao','editora ativa');
INSERT INTO Livros VALUES (2,'aprendendo C','prof. manoel','FTD');
INSERT INTO Livros VALUES (3,'aprendendo java','prof. manoel','FTD');
INSERT INTO Livros VALUES (4,'dominando o linux','fulano doente','o reily');
INSERT INTO Livros VALUES (5,'barsa','varios','barsa');
INSERT INTO Livros VALUES (6,'chapeuzinho vermelho','adriano de tal','contos encantados');
INSERT INTO Livros VALUES (7,'fisica aplicada','prof. manoel','physics');
INSERT INTO Livros VALUES (8,'mundo da musica','maestro mozart','classicos');
INSERT INTO Livros VALUES (9,'aprendendo HTML','ferdinando luiz','amazon');
INSERT INTO Livros VALUES (10,'aprendendo C++','prof. manoel','FTD');
INSERT INTO Livros VALUES (11,'matematica facil','prof. orlando','FTD');


INSERT INTO Emprestimos VALUES (1,10,4,'1997-12-25','1998-12-04');
INSERT INTO Emprestimos VALUES (2,3,5,'1998-04-16','1998-05-28');
INSERT INTO Emprestimos VALUES (3,1,1,'1998-07-22','1998-07-27');
INSERT INTO Emprestimos VALUES (4,2,6,'1998-08-09','1998-08-10');
INSERT INTO Emprestimos VALUES (5,4,7,'1998-10-10','1998-10-16');
INSERT INTO Emprestimos VALUES (6,2,2,'1998-10-22','1998-10-25');
INSERT INTO Emprestimos VALUES (7,9,8,'1998-12-04',NULL);
INSERT INTO Emprestimos VALUES (8,3,10,'1998-12-05',NULL);
INSERT INTO Emprestimos VALUES (9,7,9,'1998-12-07',NULL);
INSERT INTO Emprestimos VALUES (10,8,3,'1998-12-07',NULL);




INSERT INTO Reservas VALUES (1,3,5,'1998-12-05');
INSERT INTO Reservas VALUES (2,3,2,'1998-12-05');
INSERT INTO Reservas VALUES (3,3,1,'1998-12-06');
INSERT INTO Reservas VALUES (4,4,8,'1998-12-06');
INSERT INTO Reservas VALUES (5,4,2,'1998-12-06');
INSERT INTO Reservas VALUES (6,7,5,'1998-12-06');
INSERT INTO Reservas VALUES (7,7,9,'1998-12-06');
INSERT INTO Reservas VALUES (8,7,3,'1998-12-07');
INSERT INTO Reservas VALUES (9,3,6,'1998-12-07');
INSERT INTO Reservas VALUES (10,4,4,'1998-12-07');
