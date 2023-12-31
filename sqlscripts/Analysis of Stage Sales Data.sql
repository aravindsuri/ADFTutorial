USE [WineStoreDW]
GO

SELECT TOP (1000) [OnlineRetailer]
      ,[SalesMonth]
      ,[SalesRegion]
      ,[SalesCurrency]
      ,[Title]
      ,[Vintage]
      ,[Variety]
      ,[Score]
      ,[ListPrice]
      ,[Quantity]
  FROM [WineStoreDW].[stage].[Sales]

  --Total Sales
  SELECT	SUM([Quantity]) AS TotalSales,
			SUM([Quantity]*[ListPrice]) AS TotalAmount
  FROM		[WineStoreDW].[stage].[Sales]

  --Total Sales by SalesMonth
  SELECT	[SalesMonth],
			SUM([Quantity]) AS TotalSales,
			SUM([Quantity]*[ListPrice]) AS TotalAmount
  FROM		[WineStoreDW].[stage].[Sales]
  GROUP BY	[SalesMonth]
  ORDER BY	[SalesMonth]

  --Total Sales by SalesRegion
  SELECT	[SalesRegion],
			SUM([Quantity]) AS TotalSales,
			SUM([Quantity]*[ListPrice]) AS TotalAmount
  FROM		[WineStoreDW].[stage].[Sales]
  GROUP BY	[SalesRegion]
  ORDER BY	[SalesRegion]

   --Total Sales by Variety
  SELECT	[Variety],
			SUM([Quantity]) AS TotalSales,
			SUM([Quantity]*[ListPrice]) AS TotalAmount
  FROM		[WineStoreDW].[stage].[Sales]
  GROUP BY	[Variety]
  ORDER BY	TotalSales DESC

     --Total Sales by Variety and Wine ordered by most sold in descending
  SELECT	[Variety],
			[Title],
			SUM([Quantity]) AS TotalSales,
			SUM([Quantity]*[ListPrice]) AS TotalAmount
  FROM		[WineStoreDW].[stage].[Sales]
  GROUP BY	[Variety],
			[Title]
  ORDER BY	TotalSales DESC

       --Total Sales by Variety and Wine order by highest to lowest gross sales
  SELECT	[Variety],
			[Title],
			SUM([Quantity]) AS TotalSales,
			SUM([Quantity]*[ListPrice]) AS TotalAmount
  FROM		[WineStoreDW].[stage].[Sales]
  GROUP BY	[Variety],
			[Title]
  ORDER BY	TotalAmount DESC

