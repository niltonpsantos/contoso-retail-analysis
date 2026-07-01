-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 06_impacto_promocoes.sql
-- Objetivo : Comparar receita e volume de pedidos
--            entre vendas com e sem promoção
--            usando CASE WHEN condicional
-- Autor    : Nilton Pereira dos Santos
-- =============================================

-- Nota: PromotionKey = 1 representa "No Discount"
-- na DimPromotion — ou seja, vendas sem promoção
SELECT
    SUM(CASE WHEN PromotionKey = 1 THEN SalesAmount ELSE 0 END) AS receita_sem_promocao,
    SUM(CASE WHEN PromotionKey <> 1 THEN SalesAmount ELSE 0 END) AS receita_com_promocao,
    COUNT(CASE WHEN PromotionKey = 1 THEN 1 END) AS pedidos_sem_promocao,
    COUNT(CASE WHEN PromotionKey <> 1 THEN 1 END)  AS pedidos_com_promocao
FROM FactOnlineSales;

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- Com promoção  : R$ 1,78 Bi | 8,7 Mi pedidos (69%)
-- Sem promoção  : R$ 935 Mi  | 3,9 Mi pedidos (31%)
-- 
-- A Contoso depende fortemente de promoções:
-- 65% da receita e 69% dos pedidos vêm de
-- vendas promocionais.
-- Próxima investigação: calcular impacto na
-- margem — mais pedidos com desconto compensam
-- a perda de margem unitária?
-- =============================================