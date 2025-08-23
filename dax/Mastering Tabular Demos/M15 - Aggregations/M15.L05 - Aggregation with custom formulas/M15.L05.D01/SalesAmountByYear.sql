SELECT 
    d.[Year],
    SUM ( s.Quantity * s.[Net Price] ) AS [Line Amount]
INTO SalesAmountByYear
FROM Sales s
LEFT JOIN Date d
    ON d.Date = s.[Order Date]
GROUP BY d.[Year]
