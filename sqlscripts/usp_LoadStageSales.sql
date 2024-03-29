USE [WineStoreDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_LoadStageSales]
  AS
  BEGIN

    --Insert stage.Sales
    TRUNCATE TABLE stage.Sales

    --Insert stage.Arancione_Sales into stage.Sales
    --Set ProductNo as -1 and SalesTerritory as EU and SalesCurrency as EUR
    INSERT INTO stage.Sales
            (
                [ProductNo],[OnlineRetailer],[SalesMonth],[SalesTerritory],[SalesCurrency],[Title],[Vintage],[Variety],[Score],[ListPrice],[Quantity]
            )
    SELECT      -1 	,
                sales.[OnlineRetailer],
                sales.[SalesMonth],
                'EU',
                'EUR',
                sales.[Title],
                sales.[Vintage],
                sales.[Variety],
                sales.[Score],
                sales.[ListPrice],
                sales.[Quantity]
    FROM    	[stage].[Arancione_Sales] sales
    
   --Insert stage.Verde_Sales into stage.Sales
   --Set ProductNo as -1 and SalesTerritory as EU and SalesCurrency as EUR
    INSERT INTO stage.Sales
            (
                [ProductNo],[OnlineRetailer],[SalesMonth],[SalesTerritory],[SalesCurrency],[Title],[Vintage],[Variety],[Score],[ListPrice],[Quantity]
            )
    SELECT      -1 	,
                sales.[OnlineRetailer],
                sales.[SalesMonth],
                'EU',
                'EUR',
                sales.[Title],
                sales.[Vintage],
                sales.[Variety],
                sales.[Score],
                sales.[ListPrice],
                sales.[Quantity]
    FROM    	[stage].[Verde_Sales] sales
    
    --Insert stage.Celeste_Sales into stage.Sales and set the Vintage to 9999 if it is NULL
    --Set ProductNo as -1 
    INSERT INTO stage.Sales
            (
                [ProductNo],[OnlineRetailer],[SalesMonth],[SalesTerritory],[SalesCurrency],[Title],[Vintage],[Variety],[Score],[ListPrice],[Quantity]
            )
    SELECT      -1 	,
                sales.[OnlineRetailer],
                sales.[SalesMonth],
                sales.[SalesRegion] ,
                sales.[SalesCurrency],
                sales.[Title],
                ISNULL(sales.[Vintage], 9999),
                sales.[Variety],
                sales.[Score],
                sales.[ListPrice],
                sales.[Quantity]
    FROM    	[stage].[Celeste_Sales] sales
    
    --Update the ProductNo from the stage.Product Table by joining on Title, Vintage and Score
    UPDATE      stage.[Sales] 
    SET         stage.[Sales].[ProductNo]   = b.[ProductNo]
    FROM        stage.Sales a
    INNER JOIN  [stage].[Product] b
    ON          a.[Title] = b.[Title]
    AND         a.[Vintage] = b.[Vintage]
    AND         a.[Score] = b.[Score]

	DELETE 	Stage.Sales WHERE ProductNo = -1

	DELETE Stage.Sales WHERE Quantity = 0
    
    


  END
GO