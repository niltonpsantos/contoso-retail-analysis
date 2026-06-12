-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 03_receita_por_ano.sql
-- Objetivo : Analisar a evolução da receita
--            anual do canal online usando
--            JOIN com DimDate
-- Autor    : Nilton Pereira dos Santos
-- =============================================

SELECT 
d.CalendarYear,
SUM(f.SalesAmount)
FROM FactOnlineSales f
INNER JOIN DimDate d ON d.DateKey = f.DateKey
GROUP BY d.CalendarYear
ORDER BY d.CalendarYear ASC

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- 2007: R$ 1,01 Bi — maior receita do período
-- 2008: R$ 849 Mi — queda de ~16% (crise financeira global)
-- 2009: R$ 857 Mi — leve recuperação de ~1%
-- Hipóteses para investigar: variação de preço,
-- volume de pedidos e custo dos produtos
-- =============================================