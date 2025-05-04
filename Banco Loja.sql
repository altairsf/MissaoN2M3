CREATE SEQUENCE Seq_Id_TablePessoa
AS INT
START WITH 1
INCREMENT BY 1;

CREATE TABLE Produto (
  idProduto INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  precoVenda NUMERIC      ,
PRIMARY KEY(idProduto));

CREATE TABLE Pessoa (
  idPessoa INTEGER   NOT NULL ,
  nome_razaoSocial VARCHAR(50)   NOT NULL ,
  logradouro VARCHAR(20)   NOT NULL ,
  cidade VARCHAR(20)   NOT NULL ,
  estado VARCHAR(2)   NOT NULL ,
  telefone VARCHAR(11)   NOT NULL ,
  email VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(idPessoa));


CREATE TABLE Usuario (
  idUsuario INTEGER   NOT NULL ,
  Login VARCHAR(15)    ,
  Senha VARCHAR(8)      ,
PRIMARY KEY(idUsuario));

CREATE TABLE PessoaJuridica (
  idPessoaJuridica INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  cnpj VARCHAR(14)      ,
PRIMARY KEY(idPessoaJuridica, Pessoa_idPessoa)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));

CREATE INDEX PessoaJuridica_FKIndex1 ON PessoaJuridica (Pessoa_idPessoa);

CREATE INDEX IFK_Rel_09 ON PessoaJuridica (Pessoa_idPessoa);

CREATE TABLE PessoaFisica (
  idPessoaFisica INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  cpf VARCHAR(11)      ,
PRIMARY KEY(idPessoaFisica, Pessoa_idPessoa)  ,
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));

CREATE INDEX PessoaFisica_FKIndex1 ON PessoaFisica (Pessoa_idPessoa);

CREATE INDEX IFK_Rel_08 ON PessoaFisica (Pessoa_idPessoa);

CREATE TABLE Movimento (
  idMovimento INTEGER   NOT NULL ,
  Usuario_idUsuario INTEGER   NOT NULL ,
  Produto_idProduto INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER   NOT NULL ,
  quantidade INTEGER    ,
  tipo VARCHAR(1)    ,
  valorUnitario NUMERIC      ,
PRIMARY KEY(idMovimento, Usuario_idUsuario, Produto_idProduto, Pessoa_idPessoa)      ,
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario),
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto),
  FOREIGN KEY(Pessoa_idPessoa)
    REFERENCES Pessoa(idPessoa));


CREATE INDEX Movimento_FKIndex1 ON Movimento (Usuario_idUsuario);
CREATE INDEX Movimento_FKIndex2 ON Movimento (Produto_idProduto);
CREATE INDEX Movimento_FKIndex3 ON Movimento (Pessoa_idPessoa);


CREATE INDEX IFK_Movimentacao ON Movimento (Usuario_idUsuario);
CREATE INDEX IFK_ItemMovimentado ON Movimento (Produto_idProduto);
CREATE INDEX IFK_Responsavel ON Movimento (Pessoa_idPessoa);


