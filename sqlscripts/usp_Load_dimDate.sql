USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_dimDate]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Load_dimDate]
AS
BEGIN
	
	--Implements an Upsert logic for Type 1 dimensions
	--In this case the YearMonth is the field which is used to match the stage.Date with dimDate
    MERGE [dbo].[dimDate] AS [Target]
        USING ( SELECT  [DateYear], 
                        [DateMonth], 
                        [YearMonth],
						[LastDayOfMonth],
						[Quarter],
						[Season]
                FROM    [stage].[Dates]
              ) AS [Source] 
    ON  [Target].[YearMonth] = [Source].[YearMonth] --- specifies the condition
    WHEN MATCHED THEN
        UPDATE SET 
                [Target].[Quarter] = [Source].[Quarter], 
                [Target].[Season] = [Source].[Season],
                [Target].[UpdatedDate] = getdate()
    WHEN NOT MATCHED THEN
        INSERT ([DateYear], [DateMonth], [YearMonth], [LastDayOfMonth], [Quarter], [Season], InsertedDate, UpdatedDate ) 
        VALUES ([Source].[DateYear], [Source].[DateMonth], [Source].[YearMonth], [Source].[LastDayOfMonth], [Source].[Quarter], [Source].[Season], getdate(), getdate() ); --INSERT STATEMENT


END
GO


