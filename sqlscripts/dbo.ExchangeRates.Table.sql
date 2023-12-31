USE [WineStoreDW]
GO
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

TRUNCATE TABLE dbo.ExchangeRates 
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
