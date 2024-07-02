-- Inserts
INSERT INTO lojas_Fornecedoras (id_loja, nome_loja, endereco, telefone, email, cnpj) VALUES
(1, 'Loja Maravilha', 'Maravilha', '499956874', 'maravilha@lojateste.com', '9999499999'),
(2, 'Loja Descanso', 'Descanso', '499956875', 'descanso@lojateste.com', '9999499998'),
(3, 'Loja Itapiranga', 'Itapiranga', '499956876', 'itapiranga@lojateste.com', '9999499997'),
(4, 'Loja Guaraciaba', 'Guaraciaba', '499956877', 'guaraciaba@lojateste.com', '9999499996');

-- Produtos
INSERT INTO produto (id_produto, nome_produto, descricao, categoria, preco_base, fabricante) VALUES
(1, 'Jogo A', 'Jogo para Xbox', 'games para xbox', 59.99, 'Fabricante A'),
(2, 'Jogo B', 'Jogo para PS5', 'games para ps5', 69.99, 'Fabricante B'),
(3, 'Jogo C', 'Jogo para PC', 'games para pc', 49.99, 'Fabricante C');

-- catálogo de produtos
INSERT INTO catalogo_de_produtos (id_catalogo, id_produto, id_loja, preco, data_inclusao, lojas_FornecedorID_Loja, produtoID_produto) VALUES
(1, 1, 1, 59.99, '2023-01-15', 1, 1),
(2, 1, 2, 59.99, '2023-03-20', 2, 1),
(3, 2, 2, 69.99, '2023-05-25', 2, 2),
(4, 3, 3, 49.99, '2023-07-30', 3, 3),
(5, 1, 4, 59.99, '2023-09-05', 4, 1);

-- clientes finais
INSERT INTO cliente_final (id_cliente, nome_cliente, endereco, telefone, email, cpf, data_nasc, cidade_cliente, sexo_cliente) VALUES
(1, 'João Silva', 'Rua A', '49494949', 'joao@teste.com', '45848757684', '1995-05-15', 'São Miguel do Oeste', 'M'),
(2, 'Maria Souza', 'Rua B', '49595959', 'maria@teste.com', '45848757685', '1998-08-20', 'Descanso', 'F');

-- Pedidos
INSERT INTO pedido (id_pedido, id_cliente, data_pedido, status_pedido, entregaID_entrega) VALUES
(1, 1, '2023-01-10', 'ativo', 1),
(2, 1, '2023-03-12', 'ativo', 2),
(3, 2, '2023-05-15', 'ativo', 3);

-- Faturamento
INSERT INTO faturamento (id_faturamento, id_pedido, valor_total, data_faturamento, pedidoID_pedido) VALUES
(1, 1, 59.99, '2023-01-15', 1),
(2, 2, 59.99, '2023-03-20', 2),
(3, 3, 69.99, '2023-05-25', 3);

-- Entregas
INSERT INTO entrega (id_entrega, id_pedido, data_envio, data_entrega, status_entrega, metodo_entrega, pedidoID_pedido) VALUES
(1, 1, '2023-01-12', '2023-01-20', 'entregue', 'sedex', 1),
(2, 2, '2023-03-15', '2023-03-22', 'entregue', 'PAC', 2),
(3, 3, '2023-05-18', '2023-05-25', 'entregue', 'sedex', 3);

-- Estoque
INSERT INTO estoque (id_estoque, id_produto, id_loja, qtd_disponivel, lojas_FornecedorID_Loja) VALUES
(1, 1, 1, 10, 1),
(2, 1, 2, 8, 2),
(3, 2, 2, 5, 2),
(4, 3, 3, 12, 3),
(5, 1, 4, 6, 4);






