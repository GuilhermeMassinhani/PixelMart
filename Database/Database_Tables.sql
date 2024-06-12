-- Tabela loja_fornecedora
CREATE TABLE loja_fornecedora (
    id_loja SERIAL PRIMARY KEY, 
    nome_loja VARCHAR(80) NOT NULL,  
    endereco VARCHAR(80), 
    telefone VARCHAR(15),  
    email VARCHAR(50) UNIQUE,  
    cnpj VARCHAR(15) UNIQUE  
);

COMMENT ON COLUMN loja_fornecedora.id_loja IS 'Código da loja fornecedora';
COMMENT ON COLUMN loja_fornecedora.nome_loja IS 'Nome da loja fornecedora';
COMMENT ON COLUMN loja_fornecedora.endereco IS 'Endereço da loja fornecedora';
COMMENT ON COLUMN loja_fornecedora.telefone IS 'Telefone de contato da loja fornecedora';
COMMENT ON COLUMN loja_fornecedora.email IS 'Email da loja fornecedora';
COMMENT ON COLUMN loja_fornecedora.cnpj IS 'CNPJ da loja fornecedora';

-- Tabela produto
CREATE TABLE produto (
    id_produto SERIAL PRIMARY KEY,  
    nome_produto VARCHAR(45) NOT NULL,  
    descricao VARCHAR(100), 
    categoria VARCHAR(30),  
    preco_base DECIMAL(10, 2),  
    fabricante VARCHAR(50)  
);

COMMENT ON COLUMN produto.id_produto IS 'Código do produto';
COMMENT ON COLUMN produto.nome_produto IS 'Nome do produto';
COMMENT ON COLUMN produto.descricao IS 'Descrição do produto';
COMMENT ON COLUMN produto.categoria IS 'Categoria do produto';
COMMENT ON COLUMN produto.preco_base IS 'Preço base do produto';
COMMENT ON COLUMN produto.fabricante IS 'Fabricante do produto';

-- Tabela catalogo_produto
CREATE TABLE catalogo_produto (
    id_catalogo SERIAL PRIMARY KEY,  
    id_produto INT NOT NULL,  
    id_loja INT NOT NULL,  
    preco DECIMAL(10, 2),  
    data_inclusao DATE,  
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto), 
    FOREIGN KEY (id_loja) REFERENCES loja_fornecedora(id_loja)  
);

COMMENT ON COLUMN catalogo_produto.id_catalogo IS 'Código do catálogo de produto';
COMMENT ON COLUMN catalogo_produto.id_produto IS 'Código do produto';
COMMENT ON COLUMN catalogo_produto.id_loja IS 'Código da loja fornecedora';
COMMENT ON COLUMN catalogo_produto.preco IS 'Preço do produto na loja fornecedora';
COMMENT ON COLUMN catalogo_produto.data_inclusao IS 'Data de inclusão do produto no catálogo';

-- Tabela estoque
CREATE TABLE estoque (
    id_estoque SERIAL PRIMARY KEY,  
    id_produto INT NOT NULL,  
    id_loja INT NOT NULL,  
    quantidade_disponivel INT,  
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto), 
    FOREIGN KEY (id_loja) REFERENCES loja_fornecedora(id_loja) 
);

COMMENT ON COLUMN estoque.id_estoque IS 'Código do estoque';
COMMENT ON COLUMN estoque.id_produto IS 'Código do produto';
COMMENT ON COLUMN estoque.id_loja IS 'Código da loja fornecedora';
COMMENT ON COLUMN estoque.quantidade_disponivel IS 'Quantidade disponível do produto no estoque';

-- Tabela cliente_final
CREATE TABLE cliente_final (
    id_cliente SERIAL PRIMARY KEY,  
    nome_cliente VARCHAR(50) NOT NULL,  
    endereco VARCHAR(120),  
    telefone VARCHAR(15),  
    email VARCHAR(120) UNIQUE,  
    cpf VARCHAR(20) UNIQUE  
);

COMMENT ON COLUMN cliente_final.id_cliente IS 'Código do cliente final';
COMMENT ON COLUMN cliente_final.nome_cliente IS 'Nome do cliente final';
COMMENT ON COLUMN cliente_final.endereco IS 'Endereço do cliente final';
COMMENT ON COLUMN cliente_final.telefone IS 'Telefone de contato do cliente final';
COMMENT ON COLUMN cliente_final.email IS 'Email do cliente final';
COMMENT ON COLUMN cliente_final.cpf IS 'CPF do cliente final';

-- Tabela pedido
CREATE TABLE pedido (
    id_pedido SERIAL PRIMARY KEY,  
    id_cliente INT NOT NULL,  
    data_pedido DATE,  
    status_pedido VARCHAR(50),  
    FOREIGN KEY (id_cliente) REFERENCES cliente_final(id_cliente)  
);

COMMENT ON COLUMN pedido.id_pedido IS 'Código do pedido';
COMMENT ON COLUMN pedido.id_cliente IS 'Código do cliente final';
COMMENT ON COLUMN pedido.data_pedido IS 'Data em que o pedido foi realizado';
COMMENT ON COLUMN pedido.status_pedido IS 'Status atual do pedido';

-- Tabela faturamento
CREATE TABLE faturamento (
    id_faturamento SERIAL PRIMARY KEY,  
    id_pedido INT NOT NULL,  
    valor_total DECIMAL(10, 2),  
    data_faturamento DATE,  
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)  
);

COMMENT ON COLUMN faturamento.id_faturamento IS 'Código do faturamento';
COMMENT ON COLUMN faturamento.id_pedido IS 'Código do pedido';
COMMENT ON COLUMN faturamento.valor_total IS 'Valor total faturado no pedido';
COMMENT ON COLUMN faturamento.data_faturamento IS 'Data em que o faturamento foi realizado';

-- Tabela entrega
CREATE TABLE entrega (
    id_entrega SERIAL PRIMARY KEY,  
    id_pedido INT NOT NULL,  
    data_envio DATE,  
    data_entrega DATE,  
    status_entrega VARCHAR(50), 
    metodo_entrega VARCHAR(50), 
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) 
);

COMMENT ON COLUMN entrega.id_entrega IS 'Código da entrega';
COMMENT ON COLUMN entrega.id_pedido IS 'Código do pedido';
COMMENT ON COLUMN entrega.data_envio IS 'Data de envio da entrega';
COMMENT ON COLUMN entrega.data_entrega IS 'Data de entrega ao cliente final';
COMMENT ON COLUMN entrega.status_entrega IS 'Status atual da entrega';
COMMENT ON COLUMN entrega.metodo_entrega IS 'Método de entrega utilizado';


DROP TABLE IF EXISTS entrega CASCADE;
DROP TABLE IF EXISTS faturamento CASCADE;
DROP TABLE IF EXISTS pedido CASCADE;
DROP TABLE IF EXISTS estoque CASCADE;
DROP TABLE IF EXISTS catalogo_produto CASCADE;
DROP TABLE IF EXISTS cliente_final CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS loja_fornecedora CASCADE;
