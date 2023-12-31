USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[dimRegion]    Script Date: 01.02.2023 10:21:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimRegion](
	[RegionId] [smallint] IDENTITY(1,1) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[RegionName] [nvarchar](50) NOT NULL,
	[SubRegionName] [nvarchar](80) NULL,
	[Latitude] [geography] NULL,
	[Longitude] [geography] NULL,
 CONSTRAINT [PK_dimRegion] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

