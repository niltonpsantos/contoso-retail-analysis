# 📊 Contoso Retail — Análise Comercial Completa

> Projeto de análise de dados desenvolvido com SQL Server e Power BI sobre o banco de dados **Contoso Retail DW** da Microsoft, simulando o trabalho de um analista de dados em uma empresa de varejo.

---

## 🎯 Objetivo

Responder perguntas estratégicas de negócio da Contoso Retail, uma empresa fictícia de varejo com operações em múltiplos canais (online e físico) e territórios. O projeto cobre desde a exploração inicial dos dados até um dashboard executivo interativo.

**Perguntas que o projeto responde:**
- A receita da empresa está crescendo? Em quais canais?
- Quais produtos e categorias geram mais receita e margem?
- As lojas estão atingindo suas metas de vendas?
- Quais territórios performam melhor?
- Existem padrões de sazonalidade nas vendas?
- Quais clientes têm maior valor para o negócio (LTV)?

---

## 🗂️ Estrutura do Projeto

```
contoso-retail-analysis/
│
├── README.md
├── /sql
│   ├── /modulo_1_exploracao       ← qualidade e período dos dados
│   ├── /modulo_2_vendas           ← análise de receita e canais
│   ├── /modulo_3_avancado         ← metas, rankings e LTV
│   └── /modulo_4_powerbi          ← queries base para o dashboard
├── /docs
│   └── modelo_dimensional.png     ← diagrama do banco de dados
└── /resultados
    └── insights_modulo1.md        ← interpretações e conclusões
```

---

## 🗃️ Banco de Dados

| Item | Detalhe |
|---|---|
| Fonte | [Contoso Retail DW — Microsoft](https://www.microsoft.com/en-us/download/details.aspx?id=18279) |
| Plataforma | SQL Server |
| Tabelas de Fato | FactOnlineSales (12,6M linhas), FactSales (3,4M linhas), FactInventory, FactSalesQuota |
| Dimensões principais | DimProduct, DimDate, DimStore, DimCustomer, DimSalesTerritory, DimPromotion |
| Período dos dados | Janeiro/2007 a Dezembro/2009 (36 meses completos) |
| Qualidade | Zero nulos nos campos críticos de análise |

---

## 📐 Modelo Dimensional

O banco segue arquitetura **Star Schema**, com tabelas de fato conectadas a dimensões via chaves surrogate (sufixo `Key`):

- `FactOnlineSales` → vendas pelo canal online (B2C)
- `FactSales` → vendas por lojas físicas e revendedores
- `DimDate` → dimensão de tempo com granularidade dia/mês/trimestre/ano
- `DimProduct` → produtos com hierarquia Categoria → Subcategoria → Produto

---

## 📦 Módulos do Projeto

### ✅ Módulo 1 — Exploração e Qualidade dos Dados
Reconhecimento do banco, verificação de integridade e mapeamento do período disponível.

**Principais achados:**
- 36 meses completos de dados (2007–2009), ideais para análise YoY e sazonalidade
- Zero valores nulos nos campos críticos (`SalesAmount`, `DateKey`, `ProductKey`, `CustomerKey`)
- Dados prontos para análise sem necessidade de tratamento ou imputação

**Conceitos SQL praticados:** `MIN()`, `MAX()`, `DATEDIFF()`, `UNION ALL`, `CASE WHEN` para contagem de nulos

---

### ✅ Módulo 2 — Análise de Vendas
Análise completa de receita comparando canais, categorias, evolução temporal e impacto de promoções.

**Análises realizadas:**
- Receita total, volume e ticket médio por canal (online vs físico)
- Distribuição de receita por categoria de produto
- Evolução anual de receita por canal (2007–2009)
- Sazonalidade mensal — identificação de picos e vales
- Top 10 produtos por receita no canal online
- Impacto de promoções na receita e volume de pedidos

**Principais insights:**
- Lojas físicas geram 4,5x mais receita que o online, com ticket médio 17x maior
- Online mostrou resiliência em 2009 (+1%) enquanto físico continuou caindo (-9%)
- Maio e Julho são os meses de maior receita — padrão "back-to-school"
- 65% da receita online vem de vendas promocionais

**Conceitos SQL praticados:** `UNION ALL`, `INNER JOIN` encadeado, `GROUP BY`, `CASE WHEN`, `TOP(N)`, `MONTH()`, `DimDate`

---

### 🔄 Módulo 3 — Análise Avançada *(em desenvolvimento)*
Real vs. Meta, crescimento MoM/YoY, ranking de lojas, LTV de clientes.

---

### 🔄 Módulo 4 — Dashboard Power BI *(em desenvolvimento)*
Painel executivo com KPIs, drill-down por categoria e filtros por período e território.

---

## 🛠️ Ferramentas Utilizadas

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

---

## 👤 Autor

**Nilton Pereira dos Santos**  
Analista em transição para Dados | 7+ anos em ERP e Customer Success  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/niltonpereirasantos)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/niltonpereirasantos)

---

*Projeto desenvolvido para portfólio profissional na área de Dados.*
