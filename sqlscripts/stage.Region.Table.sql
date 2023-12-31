USE [WineStoreDW]
GO
/****** Object:  Table [stage].[Region]    Script Date: 9/15/2022 9:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[Region](
	[Province] [nvarchar] (50) NULL,
	[RegionName] [nvarchar](50)  NULL,
	[SubRegionName] [nvarchar](80) NULL,
	[Latitude] [geography] NULL,
	[Longitude] [geography] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
