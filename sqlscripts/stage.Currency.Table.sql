USE [WineStoreDW]
GO

/****** Object:  Table [stage].[Currency]    Script Date: 10/14/2022 2:07:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [stage].[Currency](
	[CurrencyCode] [nvarchar](3) NULL,
	[CurrencyName] [nvarchar](50) NULL
) ON [PRIMARY]
GO


