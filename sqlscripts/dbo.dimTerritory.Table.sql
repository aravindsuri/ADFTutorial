USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[dimTerritory]    Script Date: 01.02.2023 10:37:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimTerritory](
	[TerritoryId] [smallint] IDENTITY(1,1) NOT NULL,
	[TerritoryCode] [nvarchar](2) NOT NULL,
	[TerritoryName] [nvarchar](50) NOT NULL,
	[TradeRegion] [nvarchar](10) NOT NULL,
	[Continent] [nvarchar](20) NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dimTerritory] PRIMARY KEY CLUSTERED 
(
	[TerritoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


