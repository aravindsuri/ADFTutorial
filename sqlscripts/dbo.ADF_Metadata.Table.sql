USE [WineStoreDW]
GO

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
