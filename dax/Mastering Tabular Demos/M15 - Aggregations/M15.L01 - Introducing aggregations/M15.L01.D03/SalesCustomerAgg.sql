-- Create the aggregation table SalesCustomerAgg
-- by executing the following code on Contoso 10M database
SELECT 
    s.CustomerKey,
    SUM ( s.Quantity ) AS Quantity
INTO SalesCustomerAgg
FROM Sales s
GROUP BY s.CustomerKey
