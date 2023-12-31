USE [WineStoreDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadRegionDimension]    Script Date: 01.02.2023 10:08:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadRegionDimension]
AS
BEGIN
	TRUNCATE TABLE [dbo].[dimRegion]

	INSERT INTO [dbo].[dimRegion]
			([Province], [RegionName], [SubRegionName], [Latitude], [Longitude])
	SELECT	[Province], [RegionName], [SubRegionName], [Latitude], [Longitude]
	FROM	[stage].[Region]
	ORDER BY [Province], [RegionName]
END
GO



