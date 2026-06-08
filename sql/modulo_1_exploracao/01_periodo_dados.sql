-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 1 — Exploração e Qualidade dos Dados
-- Arquivo  : 01_periodo_dados.sql
-- Objetivo : Identificar o horizonte temporal
--            disponível nas tabelas de vendas
-- Autor    : Nilton Pereira dos Santos
-- =============================================

SELECT 
    'FactOnlineSales'                               AS tabela,
    MIN(DateKey)                                    AS data_inicio,
    MAX(DateKey)                                    AS data_fim,
    DATEDIFF(MONTH, MIN(DateKey), MAX(DateKey))     AS meses_disponiveis
FROM FactOnlineSales

UNION ALL

SELECT 
    'FactSales'                                     AS tabela,
    MIN(DateKey)                                    AS data_inicio,
    MAX(DateKey)                                    AS data_fim,
    DATEDIFF(MONTH, MIN(DateKey), MAX(DateKey))     AS meses_disponiveis
FROM FactSales;

-- =============================================
-- RESULTADO OBTIDO:
-- Ambas as tabelas cobrem Jan/2007 a Dez/2009
-- 36 meses completos — ideal para análise YoY
-- e identificação de sazonalidade mensal
-- =============================================
