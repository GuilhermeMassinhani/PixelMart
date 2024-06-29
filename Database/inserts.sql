INSERT INTO loja_fornecedora (id_loja, nome_loja, endereco, telefone, email, cnpj) VALUES
(1, 'Fornecedora Teste', 'Rua Teste,4477', '499956874', 'teste@lojateste.com', '9999499999');

INSERT INTO produto (id_produto, nome_produto, descricao, categoria, preco_base, fabricante) VALUES
(1, 'Jogo Teste', 'Jogo para testar jogos', 'teste', 14.99, 'Teste jogos');

INSERT INTO catalogo_produto (id_catalogo, id_produto, id_loja, preco, data_inclusao) VALUES
(1, 1, 1, 14.99, '2024-06-02');

INSERT INTO estoque (id_estoque, id_produto, id_loja, quantidade_disponivel) VALUES
(1, 1, 1, 5);

INSERT INTO cliente_final (id_cliente, nome_cliente, endereco, telefone, email, cpf) VALUES
(1, 'Cliente teste', 'Qualquer coisa teste', '49494949', 'testteste@teste.com', '458487576-84');

INSERT INTO pedido (id_pedido, id_cliente, data_pedido, status_pedido) VALUES
(1, 1, '2024-06-02', 'ativo'),
(2, 1, '2024-06-03', 'ativo');

INSERT INTO faturamento (id_faturamento, id_pedido, valor_total, data_faturamento) VALUES
(1, 1, 14.99, '2024-06-02');

INSERT INTO entrega (id_entrega, id_pedido, data_envio, data_entrega, status_entrega, metodo_entrega) VALUES
(1, 1, '2024-06-02', '2024-06-10', 'enviado', 'sedex'),
(2, 1, '2024-06-03', '2024-06-11', 'pendente', 'PAC'),
(3, 1, '2024-06-04', '2024-06-12', 'entregue', 'sedex');


Select * from entrega;

