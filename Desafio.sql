-- Qual o Top 5 produtos que mais geraram faturamento?
SELECT 
    produto,
    SUM(valor_venda * quantidade) AS faturamento_total
FROM vendas
GROUP BY produto
ORDER BY faturamento_total DESC
LIMIT 5;


-- Qual o Top 5 clientes que mais gastaram na loja?
SELECT 
    c.id_cliente,
    c.nome_cliente,
    SUM(v.valor_venda * v.quantidade) AS total_gasto
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY total_gasto DESC
LIMIT 5;



-- Qual o faturamento médio por cliente que é assinante do "ZOOP Prime" em comparação com os não assinantes?
SELECT 
    c.plano_assinatura,
    AVG(total_cliente) AS faturamento_medio
FROM (
    SELECT 
        v.id_cliente,
        SUM(v.valor_venda * v.quantidade) AS total_cliente
    FROM vendas v
    GROUP BY v.id_cliente
) v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.plano_assinatura;