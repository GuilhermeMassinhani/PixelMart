--1)
SELECT 
    id_cliente, 
    nome_cliente, 
    endereco, 
    telefone, 
    email, 
    cpf,
    data_nasc
FROM 
    cliente_final
WHERE 
    EXTRACT(YEAR FROM AGE(data_nasc)) BETWEEN 20 AND 30
    AND sexo_cliente = 'M'
ORDER BY 
    nome_cliente DESC;


--2)
SELECT 
    pedido.id_pedido,
    cliente_final.nome_cliente,
    cliente_final.cidade_cliente AS cidade,
    pedido.data_pedido,
    pedido.status_pedido
FROM 
    pedido
JOIN 
    cliente_final ON pedido.id_cliente = cliente_final.id_cliente
WHERE 
    EXTRACT(MONTH FROM pedido.data_pedido) IN (1, 3, 5, 7, 9, 11)
    AND EXTRACT(YEAR FROM pedido.data_pedido) = 2023
    AND cliente_final.cidade_cliente IN ('São Miguel do Oeste', 'Descanso')
ORDER BY 
    pedido.data_pedido ASC;

 

--3)

SELECT 
    lf.endereco AS cidade,
    lf.nome_loja,
    COUNT(lf.id_loja) OVER(PARTITION BY lf.endereco) AS total_lojas
FROM 
    lojas_Fornecedoras lf
JOIN 
    catalogo_de_produtos cp ON lf.id_loja = cp.id_loja
JOIN 
    produto p ON cp.id_produto = p.id_produto
WHERE 
    lf.endereco IN ('Maravilha', 'Descanso', 'Itapiranga', 'Guaraciaba')
    AND p.categoria = 'games para xbox'
ORDER BY 
    total_lojas DESC, cidade, lf.nome_loja;

   
--4) 
   
SELECT 
    p.categoria AS tipo_game,
    lf.nome_loja,
    COUNT(p.id_produto) AS total_games
FROM 
    lojas_Fornecedoras lf
JOIN 
    catalogo_de_produtos cp ON lf.id_loja = cp.id_loja
JOIN 
    produto p ON cp.id_produto = p.id_produto
WHERE 
    p.categoria LIKE '%game%'
GROUP BY 
    p.categoria, lf.nome_loja
ORDER BY 
    total_games DESC, lf.nome_loja;








