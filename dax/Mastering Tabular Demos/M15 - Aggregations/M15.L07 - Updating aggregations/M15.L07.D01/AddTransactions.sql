USE [Contoso 10M]
GO

select top 10 * from sales order by [Order Number] DESC

BEGIN TRAN

INSERT INTO [Data].[Orders]
           ([OrderKey]
           ,[CustomerKey]
           ,[StoreKey]
           ,[Order Date]
           ,[Delivery Date]
           ,[Currency Code])
     VALUES
           (371501664,
            1012405,
            370,
            '2020-03-04',
            '2020-03-04',
            'USD'
            )
GO

INSERT INTO [Data].[OrderRows]
           ([OrderKey]
           ,[Line Number]
           ,[ProductKey]
           ,[Quantity]
           ,[Unit Price]
           ,[Net Price]
           ,[Unit Cost])
     VALUES
           (371501664,
            0,
            540,
            8,
            2499.00,
            2399.00,
            827.97)
GO
select top 10 * from sales order by [Order Number] DESC

COMMIT TRAN