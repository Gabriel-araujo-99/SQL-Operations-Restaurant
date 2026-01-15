-- ======================================================
-- ANÁLISE DE DADOS E RELATÓRIOS OPERACIONAIS
-- Consultas focadas em métricas de desempenho e filtros
-- ======================================================

USE restaurante;

-- 1. FILTRAGEM DE DADOS
-- Identificando produtos com preço acima de 30 reais
SELECT nome, categoria FROM produtos WHERE preco > 30;

-- Clientes nascidos antes de 1985
SELECT nome, telefone FROM clientes WHERE data_nascimento < '1985-01-01';

-- 2. AGREGAÇÃO DE DADOS (MÉTRICAS)
-- Total de pedidos registrados
SELECT count(*) AS total_pedidos FROM pedidos;

-- Média de preço por categoria (ordenado do maior para o menor)
SELECT categoria, ROUND(AVG(preco), 2) AS media_preco
FROM produtos GROUP BY categoria ORDER BY media_preco DESC;

-- Top 5 produtos mais caros (Ranking)
SELECT nome, preco, RANK() OVER (ORDER BY preco DESC) AS ranking
FROM produtos LIMIT 5;

-- 3. RELATÓRIOS COM JOINS (TABELAS MÚLTIPLAS)
-- Relatório detalhado: Pedido, Cliente, Funcionário e Produto
SELECT 
  pe.id_pedido,
  c.nome AS cliente,
  f.nome AS funcionario,
  p.nome AS produto,
  (pe.quantidade * p.preco) AS faturamento_total
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id_cliente
INNER JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
INNER JOIN produtos p ON pe.id_produto = p.id_produto;

-- 4. LÓGICA CONDICIONAL
-- Classificação de salários dos funcionários
SELECT nome, cargo, salario,
  CASE WHEN salario > 3000 THEN 'Acima da Média' 
  ELSE 'Abaixo da Média' END AS status_financeiro
FROM funcionarios;
