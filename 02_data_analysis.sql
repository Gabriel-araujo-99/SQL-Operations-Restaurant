-- ==========================================
-- ANÁLISE DE DADOS E FILTRAGEM
-- ==========================================
USE restaurante;

-- Filtros Básicos
SELECT nome, categoria FROM produtos WHERE preco > 30;
SELECT nome, telefone FROM clientes WHERE data_nascimento < '1985-01-01';

-- Agregações e Métricas
SELECT count(*) AS total_pedidos FROM pedidos;

SELECT categoria, ROUND(AVG(preco), 2) AS media_preco
FROM produtos GROUP BY categoria ORDER BY media_preco DESC;

-- Ranking e Top de Vendas
SELECT nome, preco, RANK() OVER (ORDER BY preco DESC) AS ranking
FROM produtos LIMIT 5;

-- Joins de Múltiplas Tabelas (Relatório Geral)
SELECT 
  pe.id_pedido,
  c.nome AS cliente,
  f.nome AS funcionario,
  p.nome AS produto,
  (pe.quantidade * p.preco) AS faturamento_pedido
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
INNER JOIN produtos p ON pe.id_produto = p.id_produto;

-- Lógica Condicional (Case When)
SELECT nome, cargo, salario,
  CASE WHEN salario > 3000 THEN 'Acima da média' ELSE 'Abaixo da média' END AS status_salarial
FROM funcionarios;
