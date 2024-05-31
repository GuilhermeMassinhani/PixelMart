-- Tabela Lojas_fornecedoras
CREATE TABLE Lojas_fornecedoras (
    ID_Loja SERIAL PRIMARY KEY,
    Nome_Loja VARCHAR(80) NOT NULL,
    Endereço VARCHAR(80),
    Telefone VARCHAR(15),
    Email VARCHAR(50) UNIQUE,
    CNPJ VARCHAR(15) UNIQUE
);

-- Tabela Produto
CREATE TABLE Produto (
    ID_Produto SERIAL PRIMARY KEY,
    Nome_Produto VARCHAR(45) NOT NULL,
    Descrição VARCHAR(100),
    Categoria VARCHAR(30),
    Preço_Base DECIMAL(10, 2),
    Fabricante VARCHAR(50)
);

-- Tabela Catálogo_de_produtos
CREATE TABLE Catálogo_de_produtos (
    ID_Catalogo SERIAL PRIMARY KEY,
    ID_Produto INT NOT NULL,
    ID_Loja INT NOT NULL,
    Preço DECIMAL(10, 2),
    Data_Inclusão DATE,
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto),
    FOREIGN KEY (ID_Loja) REFERENCES Lojas_fornecedoras(ID_Loja)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    ID_Estoque SERIAL PRIMARY KEY,
    ID_Produto INT NOT NULL,
    ID_Loja INT NOT NULL,
    Quantidade_Disponível INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto),
    FOREIGN KEY (ID_Loja) REFERENCES Lojas_fornecedoras(ID_Loja)
);

-- Tabela Cliente_final
CREATE TABLE Cliente_final (
    ID_Cliente SERIAL PRIMARY KEY,
    Nome_Cliente VARCHAR(50) NOT NULL,
    Endereço VARCHAR(120),
    Telefone VARCHAR(15),
    Email VARCHAR(120) UNIQUE,
    CPF VARCHAR(20) UNIQUE
);

-- Tabela Pedido
CREATE TABLE Pedido (
    ID_Pedido SERIAL PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Data_Pedido DATE,
    Status_Pedido VARCHAR(50),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente_final(ID_Cliente)
);

-- Tabela Faturamento
CREATE TABLE Faturamento (
    ID_Faturamento SERIAL PRIMARY KEY,
    ID_Pedido INT NOT NULL,
    Valor_Total DECIMAL(10, 2),
    Data_Faturamento DATE,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    ID_Entrega SERIAL PRIMARY KEY,
    ID_Pedido INT NOT NULL,
    Data_Envio DATE,
    Data_Entrega DATE,
    Status_Entrega VARCHAR(50),
    Método_Entrega VARCHAR(50),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);