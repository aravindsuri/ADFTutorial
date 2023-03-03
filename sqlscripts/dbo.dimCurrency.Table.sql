USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[dimCurrency]    Script Date: 10/14/2022 2:07:49 PM ******/
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
) ON [PRIMARY]
GO


