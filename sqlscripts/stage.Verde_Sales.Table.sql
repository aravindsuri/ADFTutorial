USE [WineStoreDW]
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

