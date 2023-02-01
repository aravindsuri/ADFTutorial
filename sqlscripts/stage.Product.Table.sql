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
	[Description] [nchar](1000) NULL,
    [Designation] [nvarchar](100) NULL,
	[Score] [nvarchar] (50) NULL,
    [DealerPrice] [int] NULL,
    [Markup] [float]  NULL,
    [ListPrice] [int]  NULL,
    [Province] [nvarchar] (50) NULL,
    [Region_1] [nvarchar] (50) NULL,
    [Region_2] [nvarchar] (50) NULL,
    [Varietal] [nvarchar](50) NULL,
    [Taster] [nvarchar] (100) NULL,
    [Twitter] [nvarchar] (1000) NULL,
    [Title]  [nvarchar] (255) NULL,
    [Vintage] [smallint] NULL,
	[Winery] [nvarchar](50) NULL
) ON [PRIMARY]
GO


