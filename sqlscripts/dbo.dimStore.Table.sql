USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[dimStore]    Script Date: 01.02.2023 10:29:04 ******/
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




