USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteDuplicateStageProducts]    Script Date: 01.02.2023 13:16:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteDuplicateStageProducts]
AS
BEGIN

	WITH CTE AS
	(
	SELECT *, ROW_NUMBER() OVER (PARTITION BY Title, Vintage, Score ORDER BY Title, Vintage, Score ) AS RN1
	FROM [WineStoreDW].[stage].[Arancione_Products]
	)
	DELETE FROM CTE WHERE RN1 <> 1;

	WITH CTE AS
	(
	SELECT *, ROW_NUMBER() OVER (PARTITION BY Title, Vintage, Score ORDER BY Title, Vintage, Score ) AS RN2
	FROM [WineStoreDW].[stage].[Celeste_Products]
	)
	DELETE FROM CTE WHERE RN2 <> 1;

	WITH CTE AS
	(
	SELECT *, ROW_NUMBER() OVER (PARTITION BY Title, Vintage, Score ORDER BY Title, Vintage, Score ) AS RN3
	FROM [WineStoreDW].[stage].[Verde_Products]
	)
	DELETE FROM CTE WHERE RN3 <> 1;

END
GO


