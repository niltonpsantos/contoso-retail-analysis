-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 1 — Exploração e Qualidade dos Dados
-- Arquivo  : 02_qualidade_dados.sql
-- Objetivo : Verificar integridade dos campos
--            críticos antes de iniciar as análises
-- Autor    : Nilton Pereira dos Santos
-- =============================================

SELECT
    'FactOnlineSales'                                           AS tabela,
    COUNT(*)                                                    AS total_registros,
    SUM(CASE WHEN SalesAmount IS NULL THEN 1 ELSE 0 END)        AS nulos_SalesAmount,
    SUM(CASE WHEN DateKey     IS NULL THEN 1 ELSE 0 END)        AS nulos_DateKey,
    SUM(CASE WHEN ProductKey  IS NULL THEN 1 ELSE 0 END)        AS nulos_ProductKey,
    SUM(CASE WHEN CustomerKey IS NULL THEN 1 ELSE 0 END)        AS nulos_CustomerKey
FROM FactOnlineSales

UNION ALL

SELECT
    'FactSales'                                                 AS tabela,
    COUNT(*)                                                    AS total_registros,
    SUM(CASE WHEN SalesAmount IS NULL THEN 1 ELSE 0 END)        AS nulos_SalesAmount,
    SUM(CASE WHEN DateKey     IS NULL THEN 1 ELSE 0 END)        AS nulos_DateKey,
    SUM(CASE WHEN ProductKey  IS NULL THEN 1 ELSE 0 END)        AS nulos_ProductKey,
    NULL   -- FactSales não possui coluna CustomerKey
FROM FactSales;

-- =============================================
-- RESULTADO OBTIDO:
-- Zero nulos em todos os campos críticos
-- FactOnlineSales : 12.627.608 registros
-- FactSales       :  3.406.089 registros
-- Dados prontos para análise sem tratamento
-- =============================================
