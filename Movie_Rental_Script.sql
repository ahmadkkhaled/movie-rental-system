USE [master]
GO
/****** Object:  Database [MovieRental]    Script Date: 5/2/2019 3:22:28 PM ******/
CREATE DATABASE [MovieRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieRental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieRental.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieRental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieRental_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieRental] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieRental] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieRental] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieRental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieRental] SET  MULTI_USER 
GO
ALTER DATABASE [MovieRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieRental] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MovieRental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MovieRental]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/2/2019 3:22:28 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 5/2/2019 3:22:28 PM ******/
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
/****** Object:  Table [dbo].[ContributesIn]    Script Date: 5/2/2019 3:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContributesIn](
	[MovieID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Role] [varchar](45) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Crew]    Script Date: 5/2/2019 3:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Crew](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/2/2019 3:22:28 PM ******/
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
/****** Object:  Table [dbo].[Movie]    Script Date: 5/2/2019 3:22:28 PM ******/
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
	[PicturePath] [varchar](45) NULL,
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
/****** Object:  Table [dbo].[Rating]    Script Date: 5/2/2019 3:22:28 PM ******/
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
/****** Object:  Table [dbo].[Rents]    Script Date: 5/2/2019 3:22:28 PM ******/
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
	[IsReturned] [bit] NULL,
	[RentalDate] [datetime] NULL,
	[Expiration] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Rents] ADD  DEFAULT ((0)) FOR [IsReturned]
GO
ALTER TABLE [dbo].[Rents] ADD  DEFAULT (getdate()) FOR [RentalDate]
GO
ALTER TABLE [dbo].[ContributesIn]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[Crew] ([MemberID])
GO
ALTER TABLE [dbo].[ContributesIn]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([AdminID])
REFERENCES [dbo].[Admin] ([AdminID])
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Rents]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
USE [master]
GO
ALTER DATABASE [MovieRental] SET  READ_WRITE 
GO
