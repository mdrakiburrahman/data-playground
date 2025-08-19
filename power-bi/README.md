# Power BI tutorials

## User Defined Aggregations

![link](https://dax.tips/2021/09/06/intro-to-power-bi-aggregations/)

Aggregation query:

```sql
SELECT
     OrderDateKey, 
     ProductKey,
     SUM(SalesAmount)   AS SalesAmount,
     SUM(OrderQuantity) AS OrderQuantity,
     COUNT(*)           AS CountOfRows
FROM dbo.FactInternetSales
GROUP BY
    OrderDateKey, 
    ProductKey
```
