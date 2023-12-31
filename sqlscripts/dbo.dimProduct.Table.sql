USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[dimProduct]    Script Date: 01.02.2023 10:49:54 ******/
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


