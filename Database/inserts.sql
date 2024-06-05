INSERT INTO Lojas_fornecedoras VALUES(1,'Fornecedora Teste','Rua Teste,4477','499956874','te4ste@lojateste.com','9999499999');
INSERT INTO Produto VALUES(1,'Jogo Teste','Jogo para testar jogos',	'teste', 14.99, 'Teste jogos');
INSERT INTO Catalogo_de_produtos VALUES(1,1,1, 14.99, '2024-06-02');
INSERT INTO Estoque VALUES(1,1,1, 5);
INSERT INTO Cliente_final VALUES(1,'Cliente teste','Qualquer coisa teste','49494949', 'testteste@teste.com', '458487576-84');
INSERT INTO Pedido VALUES(1,1,'2024-06-02','ativo');
INSERT INTO Faturamento VALUES(1,1,14.99,'2024-06-02');
INSERT INTO entrega VALUES(1,1,'2024-06-02','2024-06-10','enviado','sedex');
INSERT INTO entrega VALUES(3, 1, '2024-06-04', '2024-06-12', 'entregue', 'sedex');
INSERT INTO entrega VALUES(4, 2, '2024-06-05', '2024-06-13', 'enviado', 'expresso');

Select * from entrega;

