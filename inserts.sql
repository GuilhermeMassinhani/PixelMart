INSERT INTO Lojas_fornecedoras VALUES(1,'Fornecedora Teste','Rua Teste,4477','499956874','te4ste@lojateste.com','9999499999');
INSERT INTO Produto VALUES(1,'Jogo Teste','Jogo para testar jogos',	'teste', 14.99, 'Teste jogos');
INSERT INTO Catálogo_de_produtos VALUES(1,0,0, 14.99, '2024-06-02');
INSERT INTO Estoque VALUES(1,0,0, 5);
INSERT INTO Cliente_final VALUES(1,'Cliente teste','Qualquer coisa teste','49494949', 'testteste@teste.com', '458487576-84');
INSERT INTO Pedido VALUES(1,0,'2024-06-02','ativo');
INSERT INTO Faturamento VALUES(1,0,14.99,'2024-06-02');
INSERT INTO entrega VALUES(1,0,'2024-06-02','2024-06-10','enviado','sedex');

Select * from entrega;

