USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadStageProduct]    Script Date: 01.02.2023 10:05:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[usp_LoadStageProduct]
AS
BEGIN
	TRUNCATE TABLE [stage].[Product]
	
    INSERT INTO stage.Product
            (
                [ProductNo],[Country],[Score],[DealerPrice],[Markup],[ListPrice],[Province],[Region_1],[Title],[Vintage],[Varietal],[Winery]
            )
    SELECT  	[ProductId],[Country],[Score],[DealerPrice],[Markup],[ListPrice],[Province],[Region_1], [Title],ISNULL([Vintage], 9999),[Variety],[Winery]
    FROM    	[stage].[Arancione_Products]

    INSERT INTO stage.Product
            (
                [ProductNo],[Country],[Score],[DealerPrice],[Markup],[ListPrice],[Province],[Region_1],[Title],[Vintage],[Varietal],[Winery]
            )
    SELECT  	[ProductId],[Country],[Score],[DealerPrice],[Markup],[ListPrice],[Province],[Region_1], [Title],ISNULL([Vintage], 9999),[Variety],[Winery]
    FROM    	[stage].[Verde_Products]

    INSERT INTO stage.Product
            (
                [ProductNo],[Country],[Score],[DealerPrice],[Markup],[ListPrice],[Province],[Region_1],[Title],[Vintage],[Varietal],[Winery]
            )
    SELECT  	[ProductId],[Country],[Score],[DealerPrice],[Markup],[ListPrice],[Province],[Region_1], [Title],ISNULL([Vintage], 9999),[Variety],[Winery]
    FROM   		[stage].[Celeste_Products]

	DELETE Stage.Product WHERE Title is NULL

	UPDATE Stage.Product SET Region_1 = Province WHERE Region_1 Is NULL

  END

