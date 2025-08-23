SELECT 
    d.[Year],
    SUM ( s.Quantity ) AS [Quantity]
INTO SalesByYear
FROM Sales s
LEFT JOIN Date d
    ON d.Date = s.[Order Date]
GROUP BY d.[Year]
