USE [WineStore]
GO

/****** Object:  Table [dbo].[dimCurrency]    Script Date: 10/14/2022 2:07:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimCurrency](
	[CurrencyId] [smallint] NOT NULL,
	[CurrencyName] [nvarchar](50) NULL
) ON [PRIMARY]
GO


