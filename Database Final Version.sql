USE [MovieRental]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/4/2019 2:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NULL,
	[Password] [varchar](45) NULL,
	[Birthdate] [date] NULL,
	[Salary] [float] NULL,
	[Sex] [varchar](10) NULL,
	[Username] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/4/2019 2:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [varchar](5) NOT NULL,
	[Name] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/4/2019 2:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NULL,
	[Username] [varchar](45) NULL,
	[Birthdate] [date] NULL,
	[Sex] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 5/4/2019 2:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NULL,
	[Description] [varchar](255) NULL,
	[PgRating] [varchar](10) NULL,
	[Price] [real] NULL,
	[Duration] [int] NULL,
	[PicturePath] [varchar](255) NULL,
	[Year] [int] NULL,
	[Quantity] [smallint] NULL,
	[CategoryID] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 5/4/2019 2:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rating](
	[MovieID] [int] NOT NULL,
	[CriticName] [varchar](45) NOT NULL,
	[Rate] [real] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rents]    Script Date: 5/4/2019 2:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rents](
	[RentID] [int] IDENTITY(1,1) NOT NULL,
	[AdminID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[Price] [real] NULL,
	[IsReturned] [bit] NULL DEFAULT ((0)),
	[RentalDate] [datetime] NULL DEFAULT (getdate()),
	[Expiration] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
