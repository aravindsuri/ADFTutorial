USE [WineStoreDW]
GO
/****** Object:  Table [stage].[Country]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Country](
	[CountryCode] [nvarchar] (2) NULL,
	[CountryName] [nvarchar](50) NULL,
	[TradeRegion] [nvarchar] (10) NULL,
	[Continent]  [nvarchar] (10) NULL
) ON [PRIMARY]
GO
