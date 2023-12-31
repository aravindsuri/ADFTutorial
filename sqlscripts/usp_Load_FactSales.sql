USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadFactSales]    Script Date: 01.02.2023 16:52:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Load_FactSales]
AS
BEGIN

	
	--Delete all Fact records if the stage data contains Sales Month and Store data already in the fact table 
	DELETE	Fact
	FROM	dbo.FactSales Fact
	INNER JOIN
	(
			SELECT DISTINCT		D.DateId, 
								St.StoreId
			FROM	stage.Sales S
			INNER JOIN 
					dimDate D
			ON		S.SalesMonth = D.YearMonth
			INNER JOIN 
					dimStore St
			ON S.OnlineRetailer = St.StoreName
		) Sales
	ON	Fact.DateId = Sales.DateId
	AND	Fact.StoreId = Sales.StoreId

	--Load new Fact records from the stage.Sales table
	--Derive all the dimension key
	--Translate the List price to the local currenty based on the exchange rates before calculating salesamount and margin 
	INSERT INTO		[dbo].[factSales]
	(
					 [StoreId]
					,[TerritoryId]
					,[ProductId]
					,[DateId]
					,[CurrencyId]
					,[SalesQty]
					,[SalesAmount]
					,[CostAmount]
					,[MarginAmount]
					,[InsertDate]
					,[BatchId]
	)
	SELECT			IsNull(Store.StoreId, -1),
					IsNull(Territory.TerritoryId, -1),
					IsNull(Product.ProductId, -1),
					IsNull(DD.DateId, -1),
					IsNull(Currency.CurrencyId, -1),
					Sales.Quantity,
					Sales.Quantity * Sales.ConvertedListPrice,
					Sales.Quantity * Product.DealerPrice,
					(Sales.Quantity * Sales.ConvertedListPrice - Sales.Quantity * Product.DealerPrice),
					getdate(),
					-1
	FROM	(
	
			SELECT 		S.ProductNo, S.OnlineRetailer, S.SalesMonth, S.SalesTerritory,
						S.SalesCurrency, S.ListPrice,
				CASE	WHEN S.SalesCurrency = Exch.FromCurrency THEN Round(S.ListPrice*Exch.ExchangeRate, 0)
						ELSE	S.ListPrice
				END AS 'ConvertedListPrice',
						S.Quantity
			FROM		Stage.Sales S
			LEFT OUTER JOIN
						dbo.ExchangeRates Exch
			ON			S.SalesMonth = Exch.YearMonth

	)	Sales

	LEFT OUTER JOIN
			[dbo].[dimStore] Store
	ON		Sales.OnlineRetailer = Store.StoreName

	LEFT OUTER JOIN 
			[dbo].[dimTerritory] Territory
	ON		Sales.SalesTerritory = Territory.TerritoryCode

	LEFT OUTER JOIN
			[dbo].[dimProduct] Product
	ON		Sales.ProductNo = Product.ProductNo

	LEFT OUTER JOIN 
			[dbo].[dimDate] DD
	ON		Sales.SalesMonth = DD.YearMonth

	LEFT OUTER JOIN
			[dbo].[dimCurrency] Currency
	ON		Sales.SalesCurrency = Currency. CurrencyCode


END
GO


