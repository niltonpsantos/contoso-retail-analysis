-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 01_receita_por_canal.sql
-- Objetivo : Comparar receita, volume e ticket
--            médio entre canal online e físico
-- Autor    : Nilton Pereira dos Santos
-- =============================================

SELECT 'Canal Online' AS  canal, 
SUM(salesAmount) AS Receita,
COUNT(*) AS 'Total de Pedidos',
SUM(SalesAmount) / COUNT(*) AS 'Ticket Médio'
FROM FactOnlineSales

UNION ALL

SELECT 'Lojas Física'AS canal, 
SUM(SalesAmount) AS Receita,
COUNT(*) AS 'Total de Pedidos',
SUM(SalesAmount) / COUNT(*) AS 'Ticket Médio'
FROM FactSales

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- Lojas físicas: receita 4,5x maior que online
-- apesar de ter 3,7x menos pedidos
-- Ticket médio físico (3.644) é 17x maior
-- que o online (215) — indica venda de produtos
-- de alto valor nas lojas físicas
-- =============================================