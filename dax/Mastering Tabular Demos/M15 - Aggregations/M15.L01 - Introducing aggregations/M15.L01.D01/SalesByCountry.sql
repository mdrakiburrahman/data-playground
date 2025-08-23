-- Create the aggregation table SalesByCountry
-- by executing the following code on Contoso 10M database
SELECT 
    c.Country,
    SUM ( s.Quantity ) AS Quantity
INTO SalesByCountry
FROM Sales s
LEFT JOIN Customer c
    ON s.CustomerKey = c.CustomerKey
GROUP BY c.Country
