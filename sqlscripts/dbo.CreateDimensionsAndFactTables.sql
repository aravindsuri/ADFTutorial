USE [WineStoreDW]
GO
/****** Object:  Table [dbo].[dimCurrency]    Script Date: 02.02.2023 15:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimCurrency](
	[CurrencyId] [smallint] IDENTITY(1,1) NOT NULL,
	[CurrencyCode] [nvarchar](3) NOT NULL,
	[CurrencyName] [nvarchar](50) NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL
 CONSTRAINT [PK_dimCurrency] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimDate]    Script Date: 02.02.2023 15:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimDate](
	[DateId] [int] IDENTITY(1,1) NOT NULL,
	[DateYear] [smallint] NOT NULL,
	[DateMonth] [smallint] NOT NULL,
	[YearMonth] [nvarchar](12) NULL,
	[LastDayOfMonth] [datetime] NULL,
	[Quarter] [tinyint] NOT NULL,
	[Season] [nvarchar](12) NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,

 CONSTRAINT [PK_dimDate] PRIMARY KEY CLUSTERED 
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimProduct]    Script Date: 02.02.2023 15:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductNo] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Winery] [nchar](50) NULL,
	[Vintage] [smallint] NOT NULL,
	[Score] [smallint] NOT NULL,
	[DealerPrice] [int] NOT NULL,
	[Markup] [float] NOT NULL,
	[ListPrice] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[IsRowCurrent] [tinyint] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimStore]    Script Date: 02.02.2023 15:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimStore](
	[StoreId] [smallint] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](20) NOT NULL,
	[StoreType] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dimStore] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimTerritory]    Script Date: 02.02.2023 15:04:28 ******/
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
/****** Object:  Table [dbo].[factSales]    Script Date: 02.02.2023 15:04:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factSales](
	[StoreId] [smallint] NOT NULL,
	[TerritoryId] [smallint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[DateId] [int] NOT NULL,
	[CurrencyId] [smallint] NOT NULL,
	[SalesQty] [int] NULL,
	[SalesAmount] [int] NULL,
	[CostAmount] [int] NULL,
	[MarginAmount] [int] NULL,
	[InsertDate] [datetime] NOT NULL,
	[BatchId] [int] NOT NULL
) ON [PRIMARY]
GO
