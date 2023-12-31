USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_dimStore]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE usp_Load_dimStore
AS
BEGIN
	
	--Implements an Upsert logic for Type 1 dimensions
	--In this case the StoreName is the field which is used to match the stage.Store with dimStore
    MERGE [dbo].[dimStore] AS [Target]
        USING ( SELECT  StoreName, 
                        StoreType, 
                        Description 
                FROM    [stage].[Store]
              ) AS [Source] 
    ON  [Target].[StoreName] = [Source].[StoreName] --- specifies the condition
    WHEN MATCHED THEN
        UPDATE SET 
                [Target].[StoreType] = [Source].[StoreType], 
                [Target].[Description] = [Source].[Description],
                [Target].[UpdatedDate] = getdate()
    WHEN NOT MATCHED THEN
        INSERT (StoreName, StoreType, Description, InsertedDate, UpdatedDate ) 
        VALUES ([Source].[StoreName], [Source].[StoreType], [Source].[Description], getdate(), getdate() ); --INSERT STATEMENT

END


