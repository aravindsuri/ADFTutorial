IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoreList]') AND type in (N'U'))
DROP TABLE [dbo].[StoreList]
GO

CREATE TABLE [dbo].[StoreList](
	[StoreId] [int] NULL,
	[StoreName] [varchar](20) NULL
) ON [PRIMARY]
GO

insert into dbo.StoreList(StoreId, StoreName) values(1, 'Arancione')
insert into dbo.StoreList(StoreId, StoreName) values(2, 'Verde')
insert into dbo.StoreList(StoreId, StoreName) values(3, 'Celeste')

