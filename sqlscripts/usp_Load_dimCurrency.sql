USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_dimCurrency]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Load_dimCurrency]
AS
BEGIN
	
	--Implements an Upsert logic for Type 1 dimensions
	--In this case the CurrencyCode is the field which is used to match the stage.Currency with dimCurrency
    MERGE [dbo].[dimCurrency] AS [Target]
        USING ( SELECT  CurrencyCode, 
                        CurrencyName
                FROM    [stage].[Currency]
              ) AS [Source] 
    ON  [Target].[CurrencyCode] = [Source].[CurrencyCode] --- specifies the condition
    WHEN MATCHED THEN
        UPDATE SET 
                [Target].[CurrencyName] = [Source].[CurrencyName], 
                [Target].[UpdatedDate] = getdate()
    WHEN NOT MATCHED THEN
        INSERT (CurrencyCode, CurrencyName, InsertedDate, UpdatedDate ) 
        VALUES ([Source].[CurrencyCode], [Source].[CurrencyName], getdate(), getdate() ); --INSERT STATEMENT
END
GO



