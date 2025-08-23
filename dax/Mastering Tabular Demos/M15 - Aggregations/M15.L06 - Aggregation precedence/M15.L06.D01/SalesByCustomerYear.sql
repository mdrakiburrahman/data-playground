SELECT 
    d.[Year],
    s.CustomerKey,
    SUM ( s.Quantity ) AS [Quantity]
INTO SalesByCustomerYear
FROM Sales s
LEFT JOIN Date d
    ON d.Date = s.[Order Date]
GROUP BY d.[Year], s.CustomerKey
