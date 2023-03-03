USE [WineStoreDW]
GO

/****** Object:  Table [stage].[Product]    Script Date: 9/19/2022 7:17:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stage].[Product](
	[ProductNo] [nvarchar] (50) NULL,
	[Country] [nvarchar](50) NULL,
	[Score] [nvarchar] (50) NULL,
    [DealerPrice] [int] NULL,
    [Markup] [float]  NULL,
    [ListPrice] [int]  NULL,
    [Province] [nvarchar] (50) NULL,
    [Region_1] [nvarchar] (100) NULL,
    [Title]  [nvarchar] (150) NULL,
    [Vintage] [smallint] NULL,
    [Varietal] [nvarchar](50) NULL,
	[Winery] [nvarchar](50) NULL
) ON [PRIMARY]
GO


