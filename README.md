# SQL Operations: Análise de Desempenho de Restaurante 🍽️

## 🛠️ Tecnologias e Técnicas Utilizadas
- **Linguagem:** SQL (MySQL/PostgreSQL)
- **Joins Complexos:** Conexão entre tabelas de Clientes, Pedidos, Funcionários e Produtos.
- **Views:** Criação de tabelas virtuais para simplificar relatórios de faturamento recorrentes.
- **Stored Functions:** Desenvolvimento de funções personalizadas para:
    - Recuperação dinâmica de ingredientes por produto.
    - Cálculo automático de status de faturamento (Acima/Abaixo da média).
- **Data Analytics:** Uso de funções de agregação (`AVG`, `SUM`) e comandos de performance (`EXPLAIN`).

## 📋 Funcionalidades Principais
1. **View `resumo_pedido`**: Consolida ID do pedido, cliente, produto, quantidade e valor total em uma única visualização.
2. **Function `BuscaIngredientesProduto`**: Retorna todos os ingredientes de um prato específico via ID.
3. **Function `mediaPedido`**: Uma lógica condicional que compara o valor de um pedido específico com a média de faturamento de toda a casa, classificando-o automaticamente.
