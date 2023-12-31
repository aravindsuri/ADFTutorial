USE [WineStoreDW]
GO

/****** Object:  Table [dbo].[dimDate]    Script Date: 01.02.2023 09:54:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimDate](
	[DateId] [int] IDENTITY(1,1) NOT NULL,
	[DateYear] [smallint] NOT NULL,
	[DateMonth] [smallint] NOT NULL,
	[YearMonth] [nvarchar](12) NULL,
	[LastDayOfMonth] [datetime] NULL,
	[Quarter] [tinyint] NOT NULL,
	[Season] [nvarchar](12) NULL,
	[InsertedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dimDate] PRIMARY KEY CLUSTERED 
(
	[DateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
