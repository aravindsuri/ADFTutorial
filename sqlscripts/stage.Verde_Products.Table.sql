USE [WineStoreDW]
GO
/****** Object:  Table [stage].[Verde_Products]    Script Date: 04.02.2023 11:25:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stage].[Verde_Products](
	[ProductId] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Score] [tinyint] NULL,
	[DealerPrice] [smallint] NULL,
	[Markup] [float] NULL,
	[ListPrice] [float] NULL,
	[Province] [nvarchar](50) NULL,
	[Region_1] [nvarchar](100) NULL,
	[Region_2] [nvarchar](1) NULL,
	[Title] [nvarchar](150) NULL,
	[Vintage] [smallint] NULL,
	[Variety] [nvarchar](50) NULL,
	[Winery] [nvarchar](50) NULL,
	[Year] [smallint] NULL
) ON [PRIMARY]
GO

