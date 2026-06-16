-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 03_receita_por_ano.sql
-- Objetivo : Analisar a evolução da receita
--            anual comparando canal online e
--            lojas físicas usando JOIN com DimDate
-- Autor    : Nilton Pereira dos Santos
-- =============================================

SELECT 
	'Canal Online' AS canal, 
	d.CalendarYear,
	SUM(f.SalesAmount) AS 'Receita Total'
FROM FactOnlineSales f
INNER JOIN DimDate d ON f.DateKey = d.DateKey
GROUP BY d.CalendarYear

UNION ALL

SELECT 
	'Lojas Físicas' AS canal,
	d.CalendarYear,
	SUM(s.SalesAmount) AS 'Receita Total'
FROM FactSales s
INNER JOIN DimDate d ON s.DateKey = d.DateKey
GROUP BY d.CalendarYear 

ORDER BY d.CalendarYear ASC, canal

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- 2007: Online 1,01 Bi | Físico 4,56 Bi
-- 2008: Online 849 Mi  | Físico 4,11 Bi (crise financeira global)
-- 2009: Online 857 Mi  | Físico 3,74 Bi
-- Insight: online se recuperou em 2009 (+1%)
-- enquanto físico continuou caindo (-9%).
-- Possível migração de consumidores para o
-- canal digital em busca de preços menores.
-- =============================================