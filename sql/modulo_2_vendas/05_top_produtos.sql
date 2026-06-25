-- =============================================
-- Projeto  : Contoso Retail — Análise Comercial
-- Módulo   : 2 — Análise de Vendas
-- Arquivo  : 05_top_produtos.sql
-- Objetivo : Identificar os 10 produtos que mais
--            geram receita no canal online
-- Autor    : Nilton Pereira dos Santos
-- =============================================
SELECT TOP (10)
	ProductName AS 'Nome Produto',
	SUM(SalesAmount) AS 'Receita'
FROM FactOnlineSales f
INNER JOIN DimProduct d
	ON f.ProductKey = d.ProductKey
GROUP BY ProductName
ORDER BY [Receita] DESC

-- =============================================
-- RESULTADO E INTERPRETAÇÃO:
-- O produto líder (TV LCD 26" Silver - 117,8 Mi)
-- vende quase 2x mais que o 2º colocado e mais
-- que a soma dos últimos 6 produtos da lista,
-- confirmando a concentração de receita em
-- eletrônicos de alto valor (TVs, câmeras, lentes)
-- já identificada na análise por categoria.
--
-- Ponto de atenção: "Washer & Dryer" (máquina de
-- lavar) aparece no top 10 do canal ONLINE, o que
-- é atípico — eletrodomésticos grandes costumam
-- vender mais em loja física pela logística de
-- entrega. Vale investigar no Módulo 3.
-- =============================================