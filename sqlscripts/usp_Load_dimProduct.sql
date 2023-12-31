USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_dimProduct]    Script Date: 01.02.2023 10:50:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_dimProduct]
AS
BEGIN
	
	--Implements an update logic for Type 2 dimensions and inserts new records
	--ProductNo is the field which is used to match the stage.Product with dimProduct
	--use Active Products from dimProduct
	--compare whether Type 2 attribute Score has changed between stage.Product and dimProduct
	MERGE [dbo].[dimProduct]   	AS [Target]
	 	USING [stage].[Product] AS [Source]
    	ON Target.ProductNo = Source.ProductNo
   		AND Target.IsRowCurrent = 1
	--if there is a match then check if there is a Type 2 change and if yes, then expire the product
 	WHEN MATCHED AND   
     (
    	Target.Score <> Source.Score
     )
    	THEN UPDATE SET
			IsRowCurrent    = 0
			,UpdatedDate    = GETDATE()
			,EndDate    	= GETDATE()
	--if there is no match i.e. it is a new product then expire the product
 	WHEN NOT MATCHED BY TARGET
    	THEN INSERT (
			ProductNo, ProductName, Province, Region, Type, Winery
			,Vintage, Score, DealerPrice, Markup, ListPrice
			,UpdatedDate, IsRowCurrent, EffectiveDate, EndDate
       ) VALUES (
         	Source.ProductNo, Source.Title, Source.Province, Source.Region_1, Source.Varietal, Source.Winery
			,Source.Vintage, Source.Score, Source.DealerPrice, Source.Markup, Source.ListPrice
			,GETDATE()      --UpdatedDate
			,1              --IsRowCurrent
			,GETDATE()      --EffectiveDate
			,'2099-12-31'   --EndDate
       );
	--if the product doesnt exist in the stage.Product but exists in dimProduct, then expire the Product
	--this is to expire obsolete products. In our implementation we will not use this logic 
 	/* WHEN NOT MATCHED BY SOURCE AND Target.IsRowCurrent = 1
     	THEN UPDATE SET
			IsRowCurrent 	= 0
			,UpdatedDate 	= GETDATE()
			,EndDate      	= GETDATE() */
	

	--Implements the insert logic for Type 2 dimensions to create active record
	--ProductNo is the field which is used to match the stage.Product with dimProduct
	--use Active Products from dimProduct
	--compare whether Type 2 attribute Score has changed between stage.Product and dimProduct
	INSERT INTO dimProduct
	( 	
		ProductNo, ProductName, Province, Region, Type, Winery
		,Vintage, Score, DealerPrice, Markup, ListPrice
		,UpdatedDate, IsRowCurrent, EffectiveDate, EndDate
	)
	SELECT
		ProductNo, Title, Province, Region_1, Varietal, Winery
		,Vintage, Score, DealerPrice, Markup, ListPrice
		,GETDATE()      --UpdatedDate
		,1              --IsRowCurrent
		,GETDATE()      --EffectiveDate
		,'2099-12-31'   --EndDate

	FROM (
		MERGE	dimProduct      AS [Target]
		USING	stage.Product 	AS [Source]
		ON		Target.ProductNo   = Source.ProductNo
		AND		Target.IsRowCurrent = 1
		WHEN MATCHED AND
		(
			Target.Score <> Source.Score
		)
		THEN	UPDATE SET
				IsRowCurrent     = 0
				,UpdatedDate      = GETDATE()
				,EndDate          = GETDATE()
		WHEN	NOT MATCHED BY TARGET
		THEN INSERT (
						ProductNo, ProductName, Province, Region, Type, Winery
						,Vintage, Score, DealerPrice, Markup, ListPrice
						,UpdatedDate, IsRowCurrent, EffectiveDate, EndDate 
				) 
			VALUES (
						Source.ProductNo, Source.Title, Source.Province, Source.Region_1, Source.Varietal, Source.Winery
						,Source.Vintage, Source.Score, Source.DealerPrice, Source.Markup, Source.ListPrice
						,GETDATE()      --UpdatedDate
						,1              --IsRowCurrent
						,GETDATE()      --EffectiveDate
						,'2099-12-31'   --EndDate
					)
		/*WHEN NOT MATCHED BY SOURCE AND Target.IsRowCurrent = 1
		THEN UPDATE SET
			IsRowCurrent = 0
			,UpdatedDate  = GETDATE()
			,EndDate      = GETDATE()*/
		OUTPUT $action AS Action
				,[Source].*
	) AS MergeOutput
	WHERE MergeOutput.Action = 'UPDATE'
	AND ProductNo IS NOT NULL;

END
GO