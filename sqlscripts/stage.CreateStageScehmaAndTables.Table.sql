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

/****** Object:  Table [stage].[Verde_Products]    Script Date: 03.02.2023 14:32:19 ******/
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

/****** Object:  Table [stage].[Celeste_Products]    Script Date: 03.02.2023 14:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Celeste_Products](
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

/****** Object:  Table [stage].[Arancione_Sales]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Arancione_Sales](
	[OnlineRetailer] [nvarchar] (20) NULL,
	[SalesMonth] [nvarchar] (12) NULL,
	[Title] [nvarchar] (255) NULL,
	[Vintage] [int] NULL,
	[Variety] [nvarchar] (50) NULL,
	[Score] [int] NULL,
	[ListPrice] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [stage].[Verde_Sales]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Verde_Sales](
	[SalesMonth] [nvarchar] (12) NULL,
	[OnlineRetailer] [nvarchar] (20) NULL,
	[Title] [nvarchar] (255) NULL,
	[Vintage] [int] NULL,
	[Variety] [nvarchar] (50) NULL,
	[Score] [int] NULL,
	[ListPrice] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [stage].[Celeste_Sales]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Celeste_Sales](
	[OnlineRetailer] [nvarchar] (20) NULL,
	[SalesMonth] [nvarchar] (12) NULL,
	[SalesRegion] [nvarchar] (2) NULL,
	[SalesCurrency] [nvarchar] (3) NULL,
	[Title] [nvarchar] (255) NULL,
	[Vintage] [int] NULL,
	[Variety] [nvarchar] (50) NULL,
	[Score] [int] NULL,
	[ListPrice] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ADF_Metadata]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADF_Metadata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SourceType] [varchar](50) NOT NULL,
	[FolderName] [varchar](50) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[Delimiter] [varchar] (1) NOT NULL,
	[SinkType] [varchar](50) NOT NULL,
	[TableName] [varchar](500) NOT NULL
) ON [PRIMARY]
GO

INSERT INTO [dbo].[ADF_Metadata]
([SourceType],[FolderName],[FileName], [Delimiter], [SinkType],[TableName])
Values 
 ('ADLS',	'masterdata',	'Currency.csv',	',',  'Sql',	'Currency')
,('ADLS',	'masterdata',	'Dates.csv',	',',  'Sql',	'Dates')
,('ADLS',	'masterdata',	'Store.csv',	',',  'Sql',	'Store')
,('ADLS',	'masterdata',	'Territory.csv',	',',  'Sql',	'Territory')
,('ADLS',	'productdata',	'Arancione_Products.csv',	';',  'Sql',	'Arancione_Products')
,('ADLS',	'productdata',	'Verde_Products.csv',	';',  'Sql',	'Verde_Products')
,('ADLS',	'productdata',	'Celeste_Products.csv',	';',  'Sql',	'Celeste_Products')
,('ADLS',	'salesdata',	'Ara*.csv',	',',  'Sql',	'Arancione_Sales')
,('ADLS',	'salesdata',	'Ver*.csv',	',',  'Sql',	'Verde_Sales')
,('ADLS',	'salesdata',	'Cel*.csv',	',',  'Sql',	'Celeste_Sales')


/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeRates](
	[FromCurrency] [nvarchar](10) NULL,
	[ToCurrency] [nvarchar](10) NULL,
	[Date] [datetime] NULL,
	[YearMonth] nvarchar(12) NULL,
	[ExchangeRate] [float] NULL
) ON [PRIMARY]
GO

INSERT INTO dbo.ExchangeRates ([FromCurrency] ,
	[ToCurrency] ,
	[Date] ,
	[YearMonth],
	[ExchangeRate] 
)
VALUES	 ('GBP', 'EUR', '1/31/2022', '2022-01', 1.197303672)
		,('GBP', 'EUR', '2/28/2022', '2022-02', 1.192920257)
		,('GBP', 'EUR', '3/31/2022', '2022-03', 1.195951942)
		,('GBP', 'EUR', '4/30/2022', '2022-04', 1.196776363)
		,('GBP', 'EUR', '5/31/2022', '2022-05', 1.177099298)
		,('GBP', 'EUR', '6/30/2022', '2022-06', 1.165714472)
		,('GBP', 'EUR', '7/31/2022', '2022-07', 1.177547005)
		,('GBP', 'EUR', '8/31/2022', '2022-08', 1.182506938)