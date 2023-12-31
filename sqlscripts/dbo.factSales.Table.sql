USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[factSales]    Script Date: 01.02.2023 12:27:28 ******/
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

ALTER TABLE [dbo].[factSales]  WITH CHECK ADD  CONSTRAINT [FK_factSales_dimTerritory] FOREIGN KEY([TerritoryId])
REFERENCES [dbo].[dimTerritory] ([TerritoryId])
GO

ALTER TABLE [dbo].[factSales] CHECK CONSTRAINT [FK_factSales_dimTerritory]
GO

ALTER TABLE [dbo].[factSales]  WITH CHECK ADD  CONSTRAINT [FK_factSales_dimCurrency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[dimCurrency] ([CurrencyId])
GO

ALTER TABLE [dbo].[factSales] CHECK CONSTRAINT [FK_factSales_dimCurrency]
GO

ALTER TABLE [dbo].[factSales]  WITH CHECK ADD  CONSTRAINT [FK_factSales_dimDate] FOREIGN KEY([DateId])
REFERENCES [dbo].[dimDate] ([DateId])
GO

ALTER TABLE [dbo].[factSales] CHECK CONSTRAINT [FK_factSales_dimDate]
GO

ALTER TABLE [dbo].[factSales]  WITH CHECK ADD  CONSTRAINT [FK_factSales_dimProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[dimProduct] ([ProductId])
GO

ALTER TABLE [dbo].[factSales] CHECK CONSTRAINT [FK_factSales_dimProduct]
GO

ALTER TABLE [dbo].[factSales]  WITH CHECK ADD  CONSTRAINT [FK_factSales_dimStore] FOREIGN KEY([StoreId])
REFERENCES [dbo].[dimStore] ([StoreId])
GO

ALTER TABLE [dbo].[factSales] CHECK CONSTRAINT [FK_factSales_dimStore]
GO


