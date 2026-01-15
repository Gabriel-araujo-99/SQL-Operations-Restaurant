-- ======================================================
-- AUTOMAÇÃO E LÓGICA SQL AVANÇADA
-- Uso de Views e Functions para otimização de consultas
-- ======================================================

USE restaurante;

-- View para facilitar a visualização de faturamento por pedido
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT  
    p.id_pedido, c.nome AS cliente, pr.nome AS produto,
    (p.quantidade * pr.preco) AS total_venda
FROM pedidos p 
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN produtos pr ON p.id_produto = pr.id_produto;

-- Função para buscar os ingredientes de um produto pelo ID
DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto (Idproduto INT)
RETURNS TEXT READS SQL DATA
BEGIN
    DECLARE lista_ingredientes TEXT;
    SELECT GROUP_CONCAT(ingredientes SEPARATOR ', ') INTO lista_ingredientes
    FROM info_produtos WHERE id_produto = Idproduto;
    RETURN lista_ingredientes;
END //
DELIMITER ;

-- Função para validar se o pedido está acima da média de faturamento
DELIMITER //
CREATE FUNCTION mediaPedido (IdPedido INT)
RETURNS TEXT READS SQL DATA
BEGIN
    DECLARE valor_pedido DECIMAL(10,2);
    DECLARE media_geral DECIMAL(10,2);
    
    SELECT (quantidade * preco) INTO valor_pedido FROM pedidos WHERE id_pedido = IdPedido;
    SELECT AVG(quantidade * preco) INTO media_geral FROM pedidos;
    
    IF valor_pedido > media_geral THEN RETURN 'Valor ACIMA da média';
    ELSE RETURN 'Valor ABAIXO da média';
    END IF;
END //
DELIMITER ;
