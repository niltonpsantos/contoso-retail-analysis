-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 02_receita_por_categoria.sql
-- Objetivo : Comparar a distribuição de receita
--            por categoria de produto entre os
--            canais online e físico
-- Autor    : Nilton Pereira dos Santos
-- =============================================
SELECT 
'Canal Online' AS Canal,
cat.ProductCategoryName AS Categoria,
SUM(f.SalesAmount) AS 'Receita Total'
FROM FactOnlineSales f
INNER JOIN DimProduct p ON f.ProductKey = p.ProductKey
INNER JOIN DimProductSubcategory sub ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
INNER JOIN DimProductCategory cat ON sub.ProductCategoryKey = cat.ProductCategoryKey
GROUP BY cat.ProductCategoryName

UNION ALL

SELECT 
'Canal Físico' AS canal,
cat.ProductCategoryName AS Categoria,
SUM(f.SalesAmount) AS 'Receita Total'
FROM FactSales f
INNER JOIN DimProduct p ON f.ProductKey = p.ProductKey
INNER JOIN DimProductSubcategory sub ON p.ProductSubcategoryKey = sub.ProductSubcategoryKey
INNER JOIN DimProductCategory cat ON sub.ProductCategoryKey = cat.ProductCategoryKey
GROUP BY cat.ProductCategoryName
ORDER BY canal, [Receita Total] DESC; 

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- A distribuição por categoria é praticamente
-- igual nos dois canais — Home Appliances lidera
-- nos dois, seguido de Computers e Cameras.
-- A diferença de receita não está no mix de
-- categorias, mas no volume vendido por canal.
-- Lojas físicas vendem em média 4-5x mais por
-- categoria do que o canal online.
-- =============================================