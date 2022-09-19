USE [WineStore]
GO

/****** Object:  Table [stage].[Product]    Script Date: 9/19/2022 7:17:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stage].[Product](
	[ProductNo] [nvarchar] (50) NULL,
	[Country] [nvarchar](50) NULL,
	[Description] [nchar](255) NULL,
    [Designation] [nvarchar](4000) NULL,
	[Score] [nvarchar] (50) NULL,
    [Price] [nvarchar] (50) NULL,
    [Province] [nvarchar] (50) NULL,
    [Region_1] [nvarchar] (50) NULL,
    [Region_2] [nvarchar] (50) NULL,
    [Varietal] [nvarchar](50) NULL,
    [Taster] [nvarchar] (100) NULL,
    [Twitter] [nvarchar] (255) NULL,
    [Title]  [nvarchar] (100) NULL,
    [Vintage] [nvarchar] (50) NULL,
    [Variety] [nvarchar] (100) NULL,
	[Winery] [nvarchar](50) NULL
) ON [PRIMARY]
GO


