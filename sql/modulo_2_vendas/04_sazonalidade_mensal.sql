-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 04_sazonalidade_mensal.sql
-- Objetivo : Identificar padrões de sazonalidade
--            na receita do canal online, somando
--            os 3 anos disponíveis por mês
-- Autor    : Nilton Pereira dos Santos
-- =============================================

SELECT 
	MONTH(d.Datekey) AS 'Mês',
	d.CalendarMonthLabel,
	SUM(f.SalesAmount) AS 'Receita Total'
FROM FactOnlineSales f
	INNER JOIN DimDate d ON f.DateKey = d.Datekey	
GROUP BY MONTH (d.Datekey), d.CalendarMonthLabel
ORDER BY [Mês] ASC

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- Maio (256 Mi) e Julho (261 Mi) são os meses
-- de maior receita no canal online — possíveis
-- causas: "back to school season" e eventos
-- promocionais de meio de ano (ex: Prime Day).
--
-- Novembro e Dezembro, tradicionalmente fortes
-- no varejo (Black Friday, Natal), aparecem
-- entre os meses de MENOR receita no período
-- analisado (2007-2009). Hipótese: o e-commerce
-- nesse período ainda não tinha a força que tem
-- hoje em eventos de fim de ano — necessário
-- investigar com dados de marketing/promoções
-- para confirmar.
-- =============================================