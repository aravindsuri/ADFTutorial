USE [WineStoreDW]
GO
/****** Object:  Schema [stage]    Script Date: 03.02.2023 14:32:18 ******/
CREATE SCHEMA [stage]
GO

/****** Object:  Table [stage].[Currency]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Currency](
	[CurrencyCode] [nvarchar](3) NULL,
	[CurrencyName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stage].[Dates]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Dates](
	[DateYear] [smallint] NOT NULL,
	[DateMonth] [tinyint] NOT NULL,
	[YearMonth] [nvarchar](50) NOT NULL,
	[LastDayOfMonth] [date] NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[Season] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stage].[Product]    Script Date: 03.02.2023 14:32:19 ******/
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
/****** Object:  Table [stage].[Sales]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Sales](
	[ProductNo] [nvarchar](50) NOT NULL,
	[OnlineRetailer] [nvarchar](20) NULL,
	[SalesMonth] [nvarchar](12) NULL,
	[SalesTerritory] [nvarchar](2) NULL,
	[SalesCurrency] [nvarchar](3) NULL,
	[Title] [nvarchar](255) NULL,
	[Vintage] [int] NULL,
	[Variety] [nvarchar](50) NULL,
	[Score] [int] NULL,
	[ListPrice] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stage].[Store]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Store](
	[StoreName] [nvarchar](20) NOT NULL,
	[StoreType] [nvarchar](10) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stage].[Territory]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Territory](
	[TerritoryCode] [nvarchar](2) NOT NULL,
	[TerritoryName] [nvarchar](50) NOT NULL,
	[TradeRegion] [nvarchar](10) NOT NULL,
	[Continent] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stage].[Arancione_Products]    Script Date: 03.02.2023 14:32:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Arancione_Products](
	[ProductNo] [nvarchar](50) NOT NULL,
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

/****** Object:  Table [stage].[Verde_Products]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Verde_Products](
	[ProductNo] [nvarchar](50) NOT NULL,
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

/****** Object:  Table [stage].[Celeste_Products]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Celeste_Products](
	[ProductNo] [nvarchar](50) NOT NULL,
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
