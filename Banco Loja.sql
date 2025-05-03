CREATE SEQUENCE Seq_Id_TablePessoa
AS INT
START WITH 1
INCREMENT BY 1;

CREATE TABLE Pessoa (
  idPessoa INTEGER   NOT NULL ,
  nome_razaoSocial VARCHAR(50)   NOT NULL ,
  logradouro VARCHAR(20)   NOT NULL ,
  cidade VARCHAR(20)   NOT NULL ,
  estado VARCHAR(2)   NOT NULL ,
  telefone VARCHAR(11)   NOT NULL ,
  email VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(idPessoa));




CREATE TABLE Produto (
  idProduto INTEGER   NOT NULL ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  precoVenda NUMERIC      ,
PRIMARY KEY(idProduto));




CREATE TABLE Usuario (
  idUsuario INTEGER   NOT NULL ,
  Nome VARCHAR(255)    ,
  Email VARCHAR(255)    ,
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


CREATE TABLE MovimentoCompra (
  idMovimentoCompra INTEGER   NOT NULL ,
  Usuario_idUsuario INTEGER   NOT NULL ,
  Produto_idProduto INTEGER   NOT NULL ,
  PessoaJuridica_Pessoa_idPessoa INTEGER   NOT NULL ,
  PessoaJuridica_idPessoaJuridica INTEGER   NOT NULL ,
  quantidade INTEGER    ,
  valorUnitario NUMERIC      ,
PRIMARY KEY(idMovimentoCompra, Usuario_idUsuario, Produto_idProduto, PessoaJuridica_Pessoa_idPessoa, PessoaJuridica_idPessoaJuridica)      ,
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario),
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto),
  FOREIGN KEY(PessoaJuridica_idPessoaJuridica, PessoaJuridica_Pessoa_idPessoa)
    REFERENCES PessoaJuridica(idPessoaJuridica, Pessoa_idPessoa));


CREATE INDEX MovimentoCompra_FKIndex1 ON MovimentoCompra (Usuario_idUsuario);
CREATE INDEX MovimentoCompra_FKIndex2 ON MovimentoCompra (Produto_idProduto);
CREATE INDEX MovimentoCompra_FKIndex3 ON MovimentoCompra (PessoaJuridica_idPessoaJuridica, PessoaJuridica_Pessoa_idPessoa);


CREATE INDEX IFK_Compra ON MovimentoCompra (Usuario_idUsuario);
CREATE INDEX IFK_ItemMovimentado ON MovimentoCompra (Produto_idProduto);
CREATE INDEX IFK_Compra_PJ ON MovimentoCompra (PessoaJuridica_idPessoaJuridica, PessoaJuridica_Pessoa_idPessoa);


CREATE TABLE MovimentoVenda (
  idMovimentoVenda INTEGER   NOT NULL ,
  Usuario_idUsuario INTEGER   NOT NULL ,
  Produto_idProduto INTEGER   NOT NULL ,
  PessoaFisica_Pessoa_idPessoa INTEGER   NOT NULL ,
  PessoaFisica_idPessoaFisica INTEGER   NOT NULL ,
  Pessoa_idPessoa INTEGER    ,
  quantidade INTEGER    ,
  ValorUnitario NUMERIC      ,
PRIMARY KEY(idMovimentoVenda, Usuario_idUsuario, Produto_idProduto, PessoaFisica_Pessoa_idPessoa, PessoaFisica_idPessoaFisica)      ,
  FOREIGN KEY(Usuario_idUsuario)
    REFERENCES Usuario(idUsuario),
  FOREIGN KEY(Produto_idProduto)
    REFERENCES Produto(idProduto),
  FOREIGN KEY(PessoaFisica_idPessoaFisica, PessoaFisica_Pessoa_idPessoa)
    REFERENCES PessoaFisica(idPessoaFisica, Pessoa_idPessoa));


CREATE INDEX MovimentoVenda_FKIndex1 ON MovimentoVenda (Usuario_idUsuario);
CREATE INDEX MovimentoVenda_FKIndex2 ON MovimentoVenda (Produto_idProduto);
CREATE INDEX MovimentoVenda_FKIndex3 ON MovimentoVenda (PessoaFisica_idPessoaFisica, PessoaFisica_Pessoa_idPessoa);


CREATE INDEX IFK_Venda ON MovimentoVenda (Usuario_idUsuario);
CREATE INDEX IFK_ItemMovimentado ON MovimentoVenda (Produto_idProduto);
CREATE INDEX IFK_Venda_PF ON MovimentoVenda (PessoaFisica_idPessoaFisica, PessoaFisica_Pessoa_idPessoa);



