/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5103)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
ALTER TABLE [dbo].[Books] DROP CONSTRAINT IF EXISTS [FK_Books_Publishers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
ALTER TABLE [dbo].[Books] DROP CONSTRAINT IF EXISTS [FK_Books_Genres]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
ALTER TABLE [dbo].[Books] DROP CONSTRAINT IF EXISTS [FK_Books_BookStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookRoyalties]') AND type in (N'U'))
ALTER TABLE [dbo].[BookRoyalties] DROP CONSTRAINT IF EXISTS [FK_BookRoyalties_Books]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAuthors]') AND type in (N'U'))
ALTER TABLE [dbo].[BookAuthors] DROP CONSTRAINT IF EXISTS [FK_BookAuthors_Books]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAuthors]') AND type in (N'U'))
ALTER TABLE [dbo].[BookAuthors] DROP CONSTRAINT IF EXISTS [FK_BookAuthors_Authors]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Publishers]
GO
/****** Object:  Table [dbo].[Magazines]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Magazines]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Genres]
GO
/****** Object:  Table [dbo].[BookStatuses]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[BookStatuses]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Books]
GO
/****** Object:  Table [dbo].[BookRoyalties]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[BookRoyalties]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[BookAuthors]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12/16/2021 10:00:37 AM ******/
DROP TABLE IF EXISTS [dbo].[Authors]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](15) NOT NULL,
	[LastName] [varchar](15) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[ZipCode] [char](6) NULL,
	[Country] [varchar](30) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAuthors]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookAuthors](
	[BookAuthorID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[AuthorOrder] [tinyint] NULL,
 CONSTRAINT [PK_BookAuthors] PRIMARY KEY CLUSTERED 
(
	[BookAuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BookRoyalties]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookRoyalties]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookRoyalties](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[RoyaltyRate] [money] NULL,
	[Advance] [money] NULL,
 CONSTRAINT [PK_BookRoyalties] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [char](14) NULL,
	[BookTitle] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[GenreID] [int] NULL,
	[Price] [money] NULL,
	[UnitsSold] [int] NULL,
	[PublishDate] [date] NULL,
	[PublisherID] [int] NOT NULL,
	[BookImage] [varchar](100) NULL,
	[IsSiteFeature] [bit] NOT NULL,
	[IsGenreFeature] [bit] NOT NULL,
	[BookStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BookStatuses]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookStatuses](
	[BookStatusID] [int] IDENTITY(1,1) NOT NULL,
	[BookStatusName] [varchar](25) NOT NULL,
	[Notes] [varchar](100) NULL,
 CONSTRAINT [PK_BookStatuses] PRIMARY KEY CLUSTERED 
(
	[BookStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Magazines]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Magazines]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Magazines](
	[MagazineID] [int] IDENTITY(1,1) NOT NULL,
	[MagazineTitle] [varchar](50) NOT NULL,
	[IssuesPerYear] [int] NOT NULL,
	[PricePerYear] [money] NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Circulation] [int] NULL,
	[PublishRate] [varchar](20) NULL,
 CONSTRAINT [PK_Magazines] PRIMARY KEY CLUSTERED 
(
	[MagazineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 12/16/2021 10:00:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Publishers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[State] [char](2) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (1, N'David', N'Matson', N'Columbus', N'OH', N'43204 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (2, N'Marie', N'Lu', N'Pasadena', N'CA', N'91182 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (3, N'Robert', N'Martin', N'South Berwick', N'ME', N'03908 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (4, N'Brad', N'Wilson', N'San Diego', N'CA', N'92110 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (5, N'Sean', N'Patrick', N'Albany', N'NY', N'12205 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (6, N'Jane', N'Goldman', N'London', NULL, NULL, N'UK')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (7, N'Eric', N'Lippert', N'Denver', N'CO', N'80208 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (8, N'Suzanne', N'Collins', N'Newtown', N'CT', N'06470 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (9, N'Filip', N'Wojcieszyn', N'Billings', N'MT', N'59105 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (10, N'Simone', N'Chiaretta', N'Indianapolis', N'IN', N'46220 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (11, N'Gregory', N'Maguire', N'Albany', N'NY', N'12214 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (12, N'Walter', N'Isaacson', N'San Francisco', N'CA', N'94107 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (13, N'Keyvan', N'Nayyeri', N'Los Angeles', N'CA', N'90005 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (14, N'Mohandas', N'Gandhi', N'New Delhi', NULL, NULL, N'India')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (15, N'Mark', N'Michaelis', N'Buffalo', N'NY', N'14200 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (16, N'Christian', N'Nagel', N'Blue Earth', N'MN', N'56013 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (17, N'Darren', N'White', N'Los Angeles', N'CA', N'90020 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (18, N'Veronica', N'Roth', N'Chicago', N'IL', N'60608 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (19, N'Jon', N'Galloway', N'Palo Alto', N'CA', N'94301 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (20, N'Clayborne', N'Carson', N'New York', N'NY', N'10012 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (21, N'Badrinarayanan', N'Lakshmiraghavan', N'Mumbai', NULL, NULL, N'India')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (22, N'Jon', N'Duckett', N'Providence ', N'RI', N'02905 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (23, N'Humphrey', N'Carpenter', N'San Diego', N'CA', N'92109 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (24, N'James', N'Dashner', N'Austell', N'GA', N'30106 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (25, N'Jamie', N'Kurtz', N'Portland', N'OR', N'97212 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (26, N'Robin', N'Cook', N'Naples', N'FL', N'34101 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (27, N'K. Scott', N'Allen', N'Boulder', N'CO', N'80303 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (28, N'William', N'Shakespeare', N'Stratford-upon-Avon', NULL, NULL, N'UK')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (29, N'Mahatma', N'Gandhi', N'New Delhi', NULL, NULL, N'India')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (30, N'Dr.', N'Seuss', N'La Jolla', N'CA', N'92037 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (31, N'Jeremy', N'Schaap', N'New York', N'NY', N'10016 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (32, N'Adam', N'Freeman', N'Walla Walla', N'WA', N'99362 ', N'USA')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName], [City], [State], [ZipCode], [Country]) VALUES (33, N'Crockett', N'Johnson', N'Orlando', N'FL', N'32801 ', N'USA')
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[BookAuthors] ON 
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (1, 33, 3, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (2, 10, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (3, 56, 8, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (4, 2, 27, 3)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (5, 37, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (6, 49, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (7, 19, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (8, 31, 18, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (9, 17, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (10, 13, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (11, 38, 8, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (12, 54, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (13, 34, 32, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (14, 4, 17, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (15, 46, 30, 2)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (16, 42, 22, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (17, 3, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (18, 12, 18, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (19, 6, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (20, 23, 15, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (21, 9, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (22, 41, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (23, 24, 9, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (24, 2, 4, 2)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (25, 29, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (26, 7, 8, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (27, 2, 1, 4)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (28, 1, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (29, 16, 18, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (30, 5, 20, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (31, 28, 25, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (32, 20, 2, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (33, 26, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (34, 35, 2, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (35, 47, 12, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (36, 22, 2, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (37, 2, 19, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (38, 50, 22, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (39, 4, 13, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (40, 44, 21, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (41, 43, 3, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (42, 36, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (43, 30, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (44, 8, 29, 2)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (45, 52, 5, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (46, 53, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (47, 45, 23, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (48, 15, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (49, 23, 7, 2)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (50, 25, 24, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (51, 40, 10, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (52, 18, 31, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (53, 55, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (54, 39, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (55, 8, 14, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (56, 48, 16, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (57, 14, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (58, 32, 30, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (59, 21, 28, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (60, 27, 21, 1)
GO
INSERT [dbo].[BookAuthors] ([BookAuthorID], [BookID], [AuthorID], [AuthorOrder]) VALUES (61, 51, 32, 1)
GO
SET IDENTITY_INSERT [dbo].[BookAuthors] OFF
GO
SET IDENTITY_INSERT [dbo].[BookRoyalties] ON 
GO
INSERT [dbo].[BookRoyalties] ([BookID], [RoyaltyRate], [Advance]) VALUES (2, 0.0900, 10000.0000)
GO
INSERT [dbo].[BookRoyalties] ([BookID], [RoyaltyRate], [Advance]) VALUES (22, NULL, 3000.0000)
GO
INSERT [dbo].[BookRoyalties] ([BookID], [RoyaltyRate], [Advance]) VALUES (50, 0.0500, NULL)
GO
INSERT [dbo].[BookRoyalties] ([BookID], [RoyaltyRate], [Advance]) VALUES (57, 0.1100, 1100.0000)
GO
SET IDENTITY_INSERT [dbo].[BookRoyalties] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (1, N'978-0451526793', N'The Taming of the Shrew', N'This controversial comedy--the inspiration for such modern works as Kiss Me, Kate and 10 Things I Hate About You--follows the tumultuous courtship and marriage of Petruchio and the headstrong Katherina. Also included in this editon are commentaries by Richard Hosley, Germaine Greer, and others, as well as a stage and screen history and an overview of Shakespeare''s life.', 8, 4.9500, 4787, CAST(N'1998-04-01' AS Date), 3, N'TheTamingOfTheShrew.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (2, N'978-1118794753', N'Professional ASP.NET MVC 5', N'MVC 5 is the newest update to the popular Microsoft technology that enables you to build dynamic, data-driven websites. Like previous versions, this guide shows you step-by-step techniques on using MVC to best advantage, with plenty of practical tutorials to illustrate the concepts. It covers controllers, views, and models; forms and HTML helpers; data annotation and validation; membership, authorization, and security.', 2, 34.9500, 3883, CAST(N'2014-08-04' AS Date), 3, N'AspNetMvc5.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (3, N'978-0385741439', N'The Game of Lives (The Mortality Doctrine, Book Three)', N'Michael used to live to game, but the games he was playing have become all too real. Only weeks ago, sinking into the Sleep was fun. The VirtNet combined the most cutting-edge technology and the most sophisticated gaming for a full mind-body experience. And it was Michael’s passion. But now every time Michael sinks, he risks his life.
    The games are over. The VirtNet has become a world of deadly consequences, and Kaine grows stronger by the day. The Mortality Doctrine—Kaine’s master plan—has nearly been realized, and little by little the line separating the virtual from the real is blurring. If Kaine succeeds, it will mean worldwide cyber domination. And it looks like Michael and his friends are the only ones who can put the monster back in the box—if Michael can figure out who his friends really are.', 5, 11.1600, 15732, CAST(N'2015-11-17' AS Date), 5, N'TheGameOfLives.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (4, N'978-1430263197', N'Pro ASP.NET SignalR: Real-Time Communication in .NET with SignalR 2.1', N'ASP.NET SignalR is the new solution to real-time communication between servers and clients in .NET. Use it to push new data to a web page or mobile device as soon as it becomes available, whether it’s a notification, live chat, up-to-the-minute financial data, or a range of other exciting applications. Innovations like Google live search and live Facebook and Twitter updates are pushing users’ expectations of the real-time web. With Pro ASP.NET SignalR, you can join this revolution and learn skills that will be valuable for years to come.

Pro ASP.NET SignalR starts with an introduction to the real-time web. Learn about the technologies underlying the SignalR library, such as WebSockets and long-polling, and how SignalR elegantly flips between them depending on the capabilities of the client. Next, meet the concepts of hubs and persistent connections and how to use them to build the components of an ASP.NET SignalR application. Find out how to extend, test, debug, configure, scale, and host your applications, and how to target a range of clients, including Windows and iOS', 2, 43.9400, 573, CAST(N'2014-12-04' AS Date), 1, N'ProSignalR.jpg', 1, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (5, N'978-0446676502', N'The Autobiography of Martin Luther King, Jr.', N'Using Stanford University''s voluminous collection of archival material, including previously unpublished writings, interviews, recordings, and correspondence, King scholar Clayborne Carson has constructed a remarkable first-person account of Dr. King''s extraordinary life.', 3, 9.7500, 8978, CAST(N'2001-01-01' AS Date), 1, N'MartinLutherKingJr.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (6, N'978-0679805274', N'Oh, The Places You''ll Go!', N'A perennial favorite, Dr. Seuss''s wonderfully wise graduation speech is the perfect send-off for children starting out in the world, be they nursery school, high school, or college grads! From soaring to high heights and seeing great sights to being left in a Lurch on a prickle-ly perch, Dr. Seuss addresses life’s ups and downs with his trademark humorous verse and illustrations, while encouraging readers to find the success that lies within.', 1, 10.0000, 34584, CAST(N'1990-01-22' AS Date), 5, N'OhThePlacesYoullGo.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (7, N'978-0439023528', N'The Hunger Games (Book 1)', N'In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. Long ago the districts waged war on the Capitol and were defeated. As part of the surrender terms, each district agreed to send one boy and one girl to appear in an annual televised event called, "The Hunger Games," a fight to the death on live TV. Sixteen-year-old Katniss Everdeen, who lives alone with her mother and younger sister, regards it as a death sentence when she is forced to represent her district in the Games. The terrain, rules, and level of audience participation may change but one thing is constant: kill or be killed.', 5, 6.7000, 17837, CAST(N'2010-07-03' AS Date), 5, N'TheHungerGames.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (8, N'978-0486245935', N'Mohandas K. Gandhi, Autobiography: The Story of My Experiments with Truth', N'"My purpose," Mahatma Gandhi writes of this book, "is to describe experiments in the science of Satyagraha, not to say how good I am." Satyagraha, Gandhi''s nonviolent protest movement (satya = true, agraha = firmness), came to stand, like its creator, as a moral principle and a rallying cry; the principle was truth and the cry freedom. The life of Gandhi has given fire and fiber to freedom fighters and to the untouchables of the world: hagiographers and patriots have capitalized on Mahatma myths. Yet Gandhi writes: "Often the title [Mahatma, Great Soul] has deeply pained me. . . . But I should certainly like to narrate my experiments in the spiritual field which are known only to myself, and from which I have derived such power as I possess for working in the political field." 
Clearly, Gandhi never renounced the world; he was neither pacifist nor cult guru. Who was Gandhi? In the midst of resurging interest in the man who freed India, inspired the American Civil Rights Movement, and is revered, respected, and misunderstood all over the world, the time is proper to listen to Gandhi himself — in his own words, his own "confessions," his autobiography. 
Gandhi made scrupulous truth-telling a religion and his Autobiography inevitably reminds one of other saints who have suffered and burned for their lapses. His simply narrated account of boyhood in Gujarat, marriage at age 13, legal studies in England, and growing desire for purity and reform has the force of a man extreme in all things. He details his gradual conversion to vegetarianism and ahimsa (non-violence) and the state of celibacy (brahmacharya, self-restraint) that became one of his more arduous spiritual trials. In the political realm he outlines the beginning of Satyagraha in South Africa and India, with accounts of the first Indian fasts and protests, his initial errors and misgivings, his jailings, and continued cordial dealings with the British overlords.  
Gandhi was a fascinating, complex man, a brilliant leader and guide, a seeker of truth who died for his beliefs but had no use for martyrdom or sainthood. His story, the path to his vision of Satyagraha and human dignity, is a critical work of the twentieth century, and timeless in its courage and inspiration. ', 3, 9.4600, 6859, CAST(N'1983-06-01' AS Date), 3, N'Gandhi.jpg', 1, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (9, N'978-0385738781', N'The Death Cure (Maze Runner, Book Three)', N'It’s the end of the line.
 
WICKED has taken everything from Thomas: his life, his memories, and now his only friends—the Gladers. But it’s finally over. The trials are complete, after one final test.
 
Will anyone survive?
 
What WICKED doesn’t know is that Thomas remembers far more than they think. And it’s enough to prove that he can’t believe a word of what they say.
 
The truth will be terrifying.
 
Thomas beat the Maze. He survived the Scorch. He’ll risk anything to save his friends. But the truth might be what ends it all.
 
The time for lies is over.', 5, 8.4900, 12323, CAST(N'2013-01-08' AS Date), 5, N'TheDeathCure.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (10, N'978-0385741408', N'The Eye of Minds (The Mortality Doctrine, Book One)', N'The VirtNet offers total mind and body immersion, and the more hacking skills you have, the more fun it is. Why bother following the rules when it’s so easy to break them? But some rules were made for a reason. Some technology is too dangerous to fool with. And one gamer has been doing exactly that, with murderous results.
     The government knows that to catch a hacker, you need a hacker. And they’ve been watching Michael. If he accepts their challenge, Michael will need to go off the VirtNet grid, to the back alleys and corners of the system human eyes have never seen—and it’s possible that the line between game and reality will be blurred forever.
   The author who brought you the #1 New York Times bestselling MAZE RUNNER series and two #1 movies—The Maze Runner and The Scorch Trials—now brings you The Eye of Minds, the first book in THE MORTALITY DOCTRINE series, an edge-of-your-seat adventure that takes you into a world of hyperadvanced technology, cyber terrorists, and gaming beyond your wildest dreams . . . and your worst nightmares.', 5, 7.9900, 12827, CAST(N'2014-07-22' AS Date), 5, N'TheEyeOfMinds.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (11, N'978-1503250789', N'A Midsummer Night''s Dream', N'A Midsummer Night''s Dream is a comedy play by William Shakespeare, believed to have been written between 1590 and 1596. It portrays the events surrounding the marriage of the Duke of Athens, Theseus, and Hippolyta. These include the adventures of four young Athenian lovers and a group of six amateur actors (mechanical), who are controlled and manipulated by the fairies who inhabit the forest in which most of the play is set. The play is one of Shakespeare''s most popular works for the stage and is widely performed across the world.', 8, 5.9900, 3928, CAST(N'2014-11-28' AS Date), 3, N'AMidsummerNightsDream.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (12, N'978-0062024077', N'Allegiant (Divergent Series)', N'One choice will define you. What if your whole world was a lie? What if a single revelation—like a single choice—changed everything? What if love and loyalty made you do things you never expected?

Told from a riveting dual perspective, this third installment in the series follows Tris and Tobias as they battle to comprehend the complexities of human nature—and their selves—while facing impossible choices of courage, allegiance, sacrifice, and love.', 5, 9.3400, 12857, CAST(N'2016-01-19' AS Date), 5, N'Allegiant.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (13, N'978-0394800783', N'Horton Hears A Who!', N'Horton is back! After his first appearance in Horton Hatches the Egg, everyone’s favorite elephant returns in this timeless, moving, and comical classic in which we discover that “a person’s a person, no matter how small.” Thanks to the irrepressible rhymes and eye-catching illustrations, young readers will learn kindness and perseverance (as well as the importance of a good “Yopp”) from the very determined—and very endearing—Horton the elephant.', 1, 12.0100, 26351, CAST(N'1954-08-12' AS Date), 5, N'HortonHearsAWho.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (14, N'978-1505259568', N'Romeo and Juliet', N'Romeo and Juliet is a tragedy written by William Shakespeare early in his career about two young star-crossed lovers whose deaths ultimately reconcile their feuding families. It was among Shakespeare''s most popular plays during his lifetime and, along with Hamlet, is one of his most frequently performed plays. Today, the title characters are regarded as archetypal young lovers. Romeo and Juliet belongs to a tradition of tragic romances stretching back to antiquity. Its plot is based on an Italian tale, translated into verse as The Tragical History of Romeus and Juliet by Arthur Brooke in 1562 and retold in prose in Palace of Pleasure by William Painter in 1567. Shakespeare borrowed heavily from both but, to expand the plot, developed supporting characters, particularly Mercutio and Paris. Believed to have been written between 1591 and 1595, the play was first published in a quarto version in 1597. This text was of poor quality, and later editions corrected it, bringing it more in line with Shakespeare''s original. Shakespeare''s use of his poetic dramatic structure, especially effects such as switching between comedy and tragedy to heighten tension, his expansion of minor characters, and his use of sub-plots to embellish the story, has been praised as an early sign of his dramatic skill. The play ascribes different poetic forms to different characters, sometimes changing the form as the character develops. Romeo, for example, grows more adept at the sonnet over the course of the play.', 8, 6.9900, 3988, CAST(N'2014-11-29' AS Date), 2, N'RomeoAndJuliet.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (15, N'978-0385738767', N'The Scorch Trials (Maze Runner, Book 2)', N'Solving the Maze was supposed to be the end.
 
Thomas was sure that escape from the Maze would mean freedom for him and the Gladers. But WICKED isn’t done yet. Phase Two has just begun. The Scorch.
 
There are no rules. There is no help. You either make it or you die.
 
The Gladers have two weeks to cross through the Scorch—the most burned-out section of the world. And WICKED has made sure to adjust the variables and stack the odds against them.
 
Friendships will be tested. Loyalties will be broken. All bets are off.
 
There are others now. Their survival depends on the Gladers’ destruction—and they’re determined to survive.', 5, 7.9900, 10283, CAST(N'2011-09-13' AS Date), 5, N'TheScorchTrials.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (16, N'978-0062387240', N'Divergent (Divergent Series)', N'One choice can transform you. Beatrice Prior''s society is divided into five factions—Candor (the honest), Abnegation (the selfless), Dauntless (the brave), Amity (the peaceful), and Erudite (the intelligent). Beatrice must choose between staying with her Abnegation family and transferring factions. Her choice will shock her community and herself. But the newly christened Tris also has a secret, one she''s determined to keep hidden, because in this world, what makes you different makes you dangerous.', 5, 7.9200, 13454, CAST(N'2014-09-30' AS Date), 5, N'Divergent.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (17, N'978-0394800790', N'How the Grinch Stole Christmas', N'"Every Who down in Who-ville liked Christmas a lot . . . but the Grinch, who lived just north of Who-ville, did NOT!" Not since "''Twas the night before Christmas" has the beginning of a Christmas tale been so instantly recognizable. No holiday season is complete without the Grinch, Max, Cindy-Lou, and all the residents of Who-ville, in this heartwarming story about the effects of the Christmas spirit on even the smallest and coldest of hearts. Like mistletoe, candy canes, and caroling, the Grinch is a mainstay of the holidays, and his story is the perfect gift for young and old.', 1, 8.2500, 65854, CAST(N'1957-10-12' AS Date), 5, N'HowTheGrinchStoleChristmas.jpg', 1, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (18, N'978-0618919109', N'Triumph: The Untold Story of Jesse Owens and Hitler''s Olympics', N'At the 1936 Olympics, against a backdrop of swastikas and goose-stepping storm troopers, an African-American son of sharecroppers won a staggering four gold medals and single-handedly demonstrated that Hitler’s myth of Aryan supremacy was a lie. The story of Jesse Owens at the Berlin games is that of an athletic performance that transcends sports. It is also the intimate and complex tale of one remarkable man''s courage. Drawing on unprecedented access to the Owens family, previously unpublished interviews, and exhaustive archival research, Jeremy Schaap transports us to Germany and tells the dramatic tale of Owens and his fellow athletes at the contest dubbed the Nazi Olympics.

With his incisive reporting and rich storytelling, Schaap reveals what really happened over those tense, exhilarating weeks in a nuanced and riveting work of sports history.', 3, 11.4500, 4399, CAST(N'2008-02-05' AS Date), 2, N'Triumph.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (19, N'978-0451527127', N'The Tempest', N'Prospero, sorcerer and rightful Duke of Milan, along with his daughter Miranda, has lived on an island for many years since his position was usurped by his brother Antonio. Then, as Antonio''s ship passes near the island one day, Prospero conjures up a terrible storm...This play, combining elements of both tragedy and comedy, is believed by some to be the last Shakespeare wrote on his own, as well as one of his most fascinating works. The Signet edition also features an overview of Shakespeare''s life and times, commentary by William Strachey, Montaigne, and others, and a stage and screen history, among other special content.', 8, 4.9500, 3822, CAST(N'1998-09-01' AS Date), 3, N'TheTempest.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (20, N'978-0147512284', N'Champion', N'June and Day have sacrificed so much for the people of the Republic—and each other—and now their country is on the brink of a new existence. June is back in the good graces of the Republic, working within the government’s elite circles as Princeps Elect while Day has been assigned a high level military position. But neither could have predicted the circumstances that will reunite them once again. Just when a peace treaty is imminent, a plague outbreak causes panic in the Colonies, and war threatens the Republic’s border cities. This new strain of plague is deadlier than ever, and June is the only one who knows the key to her country’s defense. But saving the lives of thousands will mean asking the one she loves to give up everything he has. With heart-pounding action and suspense, Marie Lu’s bestselling trilogy draws to a stunning conclusion.', 5, 6.3500, 5890, CAST(N'2014-09-09' AS Date), 5, N'Champion.jpg', 1, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (21, N'978-1514630587', N'Macbeth', N'Macbeth (full title The Tragedy of Macbeth) is a tragedy written by William Shakespeare, and is considered one of his darkest and most powerful works. Set in Scotland, the play illustrates the damaging physical and psychological effects of political ambition on those who seek power for its own sake. The play is believed to have been written between 1599 and 1606, and is most commonly dated 1606. The earliest account of a performance of what was probably Shakespeare''s play is the Summer of 1606, when Simon Forman recorded seeing such a play at the Globe Theatre. It was first published in the Folio of 1623, possibly from a prompt book. It was most likely written during the reign of James I, who had been James VI of Scotland before he succeeded to the English throne in 1603. James was a patron of Shakespeare''s acting company, and of all the plays Shakespeare wrote during James''s reign, Macbeth most clearly reflects the playwright''s relationship with the sovereign.', 8, 6.5000, 8847, CAST(N'1995-06-20' AS Date), 1, N'Macbeth.jpg', 1, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (22, N'978-0142427552', N'Prodigy', N'June and Day arrive in Vegas just as the unthinkable happens: the Elector Primo dies, and his son Anden takes his place. With the Republic edging closer to chaos, the two join a group of Patriot rebels eager to help Day rescue his brother and offer passage to the Colonies. They have only one request—June and Day must assassinate the new Elector.

It’s their chance to change the nation, to give voice to a people silenced for too long. 

But as June realizes this Elector is nothing like his father, she’s haunted by the choice ahead. What if Anden is a new beginning? What if revolution must be more than loss and vengeance, anger and blood—what if the Patriots are wrong?', 5, 8.9900, 7847, CAST(N'2014-04-08' AS Date), 5, N'Prodigy.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (23, N'978-0134141046', N'Essential C# 6.0 (5th Edition)', N'Essential C# 6.0 is a well-organized, no-fluff guide to the latest versions of C# for programmers at all levels of experience. Fully updated to reflect new C# 6.0 and .NET 4.6 features and patterns, it will help you write C# code that’s simple, powerful, robust, secure, and maintainable.', 2, 48.6200, 2847, CAST(N'2015-10-04' AS Date), 4, N'EssentialCsharp6.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (24, N'978-1430259800', N'ASP.NET Web API 2 Recipes: A Problem-Solution Approach', N'ASP.NET Web API 2 Recipes provides you with the code to solve a full range of Web API problems and question marks that you might face when developing line-of-business applications. ASP.NET Web API 2 Recipes gives you an in-depth explanation for each of these scenarios and shows you how to use Web API with a vast array of .NET application development tools and external libraries, to solve common business problems. Find out how you can build custom web services with ASP.NET Web API more efficiently than ever.', 2, 44.4300, 398, CAST(N'2014-08-01' AS Date), 2, N'WebApi2Recipes.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (25, N'978-0385737951', N'The Maze Runner (Book 1)', N'If you ain’t scared, you ain’t human.
 
When Thomas wakes up in the lift, the only thing he can remember is his name. He’s surrounded by strangers—boys whose memories are also gone.
 
Nice to meet ya, shank. Welcome to the Glade.
 
Outside the towering stone walls that surround the Glade is a limitless, ever-changing maze. It’s the only way out—and no one’s ever made it through alive.
 
Everything is going to change.
 
Then a girl arrives. The first girl ever. And the message she delivers is terrifying.
 
Remember. Survive. Run.', 5, 7.6400, 10453, CAST(N'2010-08-24' AS Date), 5, N'TheMazeRunner.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (26, N'978-0394800295', N'Hop On Pop', N'Loved by generations, this “simplest Seuss for youngest use” is a Beginner Book classic. See Red and Ned and Ted and Ed in a bed. And giggle as Pat sits on a hat and on a cat and on a bat . . . but a cactus? Pat must NOT sit on that! This classic Beginner Book makes an ideal gift for Seuss fans and is an especially good way to show Pop some love on Father’s Day!

Originally created by Dr. Seuss, Beginner Books encourage children to read all by themselves, with simple words and illustrations that give clues to their meaning.', 1, 5.0800, 8457, CAST(N'1963-02-12' AS Date), 5, N'HopOnPop.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (27, N'978-1430261759', N'Practical ASP.NET Web API', N'Practical ASP.NET Web API provides you with a hands-on and code-focused demonstration of the ASP.NET Web API in action. From the very beginning, you''ll be writing working code in order to see best practices and concepts in action. As the book progresses, the concepts and code will become more sophisticated. Beginning with an overview of the web service model in general and Web API in particular, you''ll progress quickly to a detailed exploration of the request binding and response formatting that lie at the heart of Web API. You''ll investigate various scenarios and see how they can be manipulated to achieve the results you need.

Later in the book more sophisticated themes will be introduced that will set your applications apart from the crowd. You’ll learn how you can validate the request messages on arrival, how you can create loosely coupled controllers, extend the pipeline processing to compartmentalize your code for security and unit testing before being put onto a live hosting server.', 2, 45.6300, 382, CAST(N'2013-08-23' AS Date), 6, N'PracticalWebApi.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (28, N'978-1430249771', N'ASP.NET MVC 4 and the Web API: Building a REST Service from Start to Finish', N'This one hundred page book focuses exclusively on how you can best use the ASP.NET MVC 4 Framework to build world-class REST services using the Web API. It sets aside much of what the ASP.NET MVC Framework can do, and focuses exclusively on how the Web API can help you build web services. You will not find any help on CSS, HTML, JavaScript, or jQuery. Nor will you find any help on the Razor view engine, HTML Helpers, or model binding. If you need this information then Pro ASP.NET MVC 4 is your perfect book.

ASP.NET MVC 4 and the Web API: Building a REST Service from Start to Finish helps you build cutting-edge REST services using ASP.NET MVC 4 and the Web API in more depth and detail than any other resource. ASP.NET MVC has always been a good platform on which to implement REST, but with the advent of the Web API it has now become even better. This book will show you why it''s great and how to get the most from it.', 2, 17.1300, 1324, CAST(N'2013-01-31' AS Date), 3, N'Mvc4WebApi.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (29, N'978-0451528391', N'The Comedy of Errors', N'Based on a pair of comic dramas from ancient Rome, The Comedy of Errors presents a spectacle of pure farce in the spirit of utmost fun and — as the title suggests — hilarious confusion. Two sets of identical twins provide the basis for ongoing incidents of mistaken identity, within a lively plot of quarrels, arrests, and a grand courtroom denouement. One of Shakespeare''s earliest dramatic efforts, the play abounds in his trademark conceits, puns, and other forms of fanciful wordplay. It also foreshadows his later and greater comedies, offering students and scholars a valuable key to the playwright''s development.', 8, 3.0000, 2184, CAST(N'2002-09-19' AS Date), 4, N'TheComedyOfErrors.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (30, N'978-0385741415', N'The Rule of Thoughts (The Mortality Doctrine, Book Two)', N'Michael thought he understood the VirtNet, but the truth he discovered is more terrifying than anyone at VirtNet Security could have anticipated.
   The cyber terrorist Kaine isn’t human. It’s a Tangent, a computer program that has become sentient. And Michael just completed the first step in turning Kaine’s master plan, the Mortality Doctrine, into a reality. The Mortality Doctrine will populate Earth entirely with human bodies harboring Tangent minds. The VNS would like to pretend the world is perfectly safe, but Michael and his friends know that the takeover has already begun. And if they don’t stop Kaine soon, it will be game over for humanity.
   From the author who brought you the #1 New York Times bestselling MAZE RUNNER series and two #1 movies—The Maze Runner and The Scorch Trials—comes an electrifying adventure that takes you into a world of hyperadvanced technology, cyber terrorists, and gaming beyond your wildest dreams . . . and your worst nightmares.', 5, 7.8400, 11932, CAST(N'2016-05-03' AS Date), 5, N'TheRuleOfThoughts.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (31, N'978-0062024053', N'Insurgent (Divergent Series)', N'As war surges in the factions of dystopian Chicago all around her, Tris attempts to save those she loves—and herself—while grappling with haunting questions of grief and forgiveness, identity and loyalty, politics and love.', 5, 9.3500, 13123, CAST(N'2015-01-20' AS Date), 5, N'Insurgent.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (32, N'978-0394800134', N'One Fish Two Fish Red Fish Blue Fish', N'"From there to here, from here to there, funny things are everywhere" . . . So begins this classic Beginner Book by Dr. Seuss. Beginning with just five fish and continuing into flights of fancy, One Fish Two Fish Red Fish Blue Fish celebrates how much fun imagination can be. From the can-opening Zans to the boxing Gox to the winking Yink who drinks pink ink, the silly rhymes and colorful cast of characters create an entertaining approach to reading that will have every child giggling from morning to night: “Today is gone. Today was fun. Tomorrow is another one.” 

Originally created by Dr. Seuss, Beginner Books encourage children to read all by themselves, with simple words and illustrations that give clues to their meaning.', 1, 4.9800, 5487, CAST(N'1960-03-12' AS Date), 5, N'OneFishTwoFish.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (33, N'978-0132350884', N'Clean Code: A Handbook of Agile Software Craftsmanship', N'Even bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.', 2, 29.9500, 473, CAST(N'2008-08-11' AS Date), 3, N'CleanCode.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (34, N'978-1484200865', N'Expert ASP.NET Web API 2 for MVC Developers', N'Web API 2 is the latest evolution of Microsoft''s web services toolkit, which allows the creation of RESTful applications built on the ASP.NET platform. It provides a standards-based approach and a high-productivity development model that makes it easy to deliver services to a wide-range of clients, including mobile devices.
This book puts Web API into context for the experienced MVC Framework developer and dives deep into the tools and techniques required to build Web API applications that integrate with the MVC Framework and shows you how to create single-page applications to consume them.', 2, 44.3500, 5783, CAST(N'2014-08-18' AS Date), 2, N'WebApi2MvcDevelopers.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (35, N'978-0142422076', N'Legend', N'What was once the western United States is now home to the Republic, a nation perpetually at war with its neighbors. Born into an elite family in one of the Republic''s wealthiest districts, fifteen-year-old June is a prodigy being groomed for success in the Republic''s highest military circles. Born into the slums, fifteen-year-old Day is the country''s most wanted criminal. But his motives may not be as malicious as they seem.

From very different worlds, June and Day have no reason to cross paths - until the day June''s brother, Metias, is murdered and Day becomes the prime suspect. Caught in the ultimate game of cat and mouse, Day is in a race for his family''s survival, while June seeks to avenge Metias''s death. But in a shocking turn of events, the two uncover the truth of what has really brought them together, and the sinister lengths their country will go to keep its secrets.', 5, 6.0200, 8938, CAST(N'2013-04-16' AS Date), 5, N'Legend.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (36, N'978-0394800165', N'Green Eggs and Ham', N'"Do you like green eggs and ham?" asks Sam-I-am in this Beginner Book by Dr. Seuss. In a house or with a mouse? In a boat or with a goat? On a train or in a tree? Sam keeps asking persistently. With unmistakable characters and signature rhymes, Dr. Seuss’s beloved favorite has cemented its place as a children’s classic. In this most famous of cumulative tales, the list of places to enjoy green eggs and ham, and friends to enjoy them with, gets longer and longer. Follow Sam-I-am as he insists that this unusual treat is indeed a delectable snack to be savored everywhere and in every way. 

Originally created by Dr. Seuss, Beginner Books encourage children to read all by themselves, with simple words and illustrations that give clues to their meaning.', 1, 4.9800, 10245, CAST(N'1960-08-12' AS Date), 5, N'GreenEggsAndHam.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (37, N'978-0553513097', N'The Fever Code (Maze Runner, Book Five; Prequel)', N'A prequel to the worldwide Maze Runner phenomenon, The Fever Code is the book that holds all the answers. How did WICKED find the Gladers? Who are Group B? And what side are Thomas and Teresa really on? Lies will be exposed. Secrets will be uncovered. Loyalties will be proven. Fans will never see the truth coming. Before there was the Maze, there was The Fever Code.', 5, 12.3400, 0, NULL, 5, N'TheFeverCode.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (38, N'978-0545663267', N'Mockingjay (The Third Book of the Hunger Games)', N'
Katniss Everdeen, girl on fire, has survived, even though her home has been destroyed. There are rebels. There are new leaders. A revolution is unfolding.

District 13 has come out of the shadows and is plotting to overthrow the Capitol. Though she''s long been a part of the revolution, Katniss hasn''t known it. Now it seems that everyone has had a hand in the carefully laid plans but her.

The success of the rebellion hinges on Katniss''s willingness to be a pawn, to accept responsibility for countless lives, and to change the course of the future of Panem. To do this, she must put aside her feelings of anger and distrust. She must become the rebels'' Mockingjay - no matter what the cost.', 5, 7.4800, 16432, CAST(N'2014-02-25' AS Date), 5, N'Mockingjay.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (39, N'978-1619491946', N'Julius Caesar', N'Roman dictator Julius Caesar returns from a victorious campaign in Spain, causing his fellow-citizens to mistrust the scope of his political ambitions. Afraid that he will accept the title of king , a group of conspirators persuade Marcus Brutus to join their plot against Caesar. William Shakespeare s play revolves around Marcus Brutus as he grapples with issues of friendship, honor, and patriotism.', 8, 7.4900, 4829, CAST(N'2012-04-27' AS Date), 4, N'JuliusCeasar.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (40, N'978-1119181316', N'Front-end Development with ASP.NET MVC 6, AngularJS, and Bootstrap', N'NFront-End Development with ASP.NET MVC 6, AngularJS, and Bootstrap is the professional''s guide to fast, responsive web development. Utilizing the most popular combination of web technologies for Microsoft developers, this guide provides the latest best practices and ASP.NET MVP guidance to get you up to speed quickly. The newest ASP.NET MVC is leaner, easier to use, and less bound to the operating system and IDE.colle, giving you the perfect opportunity to leverage third-party frameworks and libraries that provide functionalities not native to ASP.NET MVC and Visual Studio. This book shows you how to integrate ASP.NET MVC with Angular JS, Bootstrap, and similar frameworks, with a bit of JQuery Mobile, Nuget, continuous deployment, Bower dependencies, and Gulp/Grunt build systems, including development beyond Windows on Mac and Linux. With clear, concise instruction and expert insight, this guide is an invaluable resource for meeting the demands of modern web development.ULL', 2, 32.6800, 0, NULL, 1, N'FrontendDevelopment.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (41, N'978-0394800387', N'Fox In Socks', N'"This Fox is a tricky fox. He''ll try to get your tongue in trouble." Dr. Seuss gives fair warning to anyone brave enough to read along with the Fox in Socks, who likes to play tongue-twisting games with his friend Mr. Knox. "Here''s an easy game to play. Here''s an easy thing to say.... New socks. Two socks. Whose socks? Sue''s socks." But Mr. Fox Socks isn''t about to let Knox off so easy. Soon Goo-Goose is choosing to chew chewy gluey blue goo, while tweetle beetles battle with paddles in a puddle (in case you were wondering, that''s called a "tweetle beetle puddle paddle battle"). Mr. Knox gets exasperated: "I can''t blab such blibber blubber! My tongue isn''t made of rubber." But he catches on to the game before it''s all through. One of Seuss''s best, this must-read-aloud classic is guaranteed to get many giggles out of readers young and old. ', 1, 5.0800, 4587, CAST(N'1965-01-12' AS Date), 5, N'FoxInSocks.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (42, N'978-1118008188', N'HTML and CSS: Design and Build Websites', N'A full-color introduction to the basics of HTML and CSS from the publishers of Wrox! 
Every day, more and more people want to learn some HTML and CSS. Joining the professional web designers and programmers are new audiences who need to know a little bit of code at work (update a content management system or e-commerce store) and those who want to make their personal blogs more attractive. Many books teaching HTML and CSS are dry and only written for those who want to become programmers, which is why this book takes an entirely new approach.', 2, 17.1900, 1048, CAST(N'2011-11-08' AS Date), 4, N'HtmlCss.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (43, N'978-0137081073', N'The Clean Coder: A Code of Conduct for Professional Programmers', N'In The Clean Coder: A Code of Conduct for Professional Programmers, legendary software expert Robert C. Martin introduces the disciplines, techniques, tools, and practices of true software craftsmanship. This book is packed with practical advice–about everything from estimating and coding to refactoring and testing. It covers much more than technique: It is about attitude. Martin shows how to approach software development with honor, self-respect, and pride; work well and work clean; communicate and estimate faithfully; face difficult decisions with clarity and honesty; and understand that deep knowledge comes with a responsibility to act.', 2, 29.3300, 487, CAST(N'2011-05-23' AS Date), 4, N'CleanCoder.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (44, N'978-1430257820', N'Pro ASP.NET Web API Security: Securing ASP.NET Web API', N'ASP.NET Web API is a key part of ASP.NET MVC 4 and the platform of choice for building RESTful services that can be accessed by a wide range of devices. Everything from JavaScript libraries to RIA plugins, RFID readers to smart phones can consume your services using platform-agnostic HTTP.

With such wide accessibility, securing your code effectively needs to be a top priority. You will quickly find that the WCF security protocols you’re familiar with from .NET are less suitable than they once were in this new environment, proving themselves cumbersome and limited in terms of the standards they can work with.', 2, 44.6900, 287, CAST(N'2013-03-26' AS Date), 6, N'ProWebApiSecurity.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (45, N'978-0618057023', N'J.R.R. Tolkien: A Biography', N'The authorized biography of the creator of Middle-earth. In the decades since his death in September 1973, millions have read THE HOBBIT, THE LORD OF THE RINGS, and THE SILMARILLION and become fascinated about the very private man behind the books. Born in South Africa in January 1892, John Ronald Reuel Tolkien was orphaned in childhood and brought up in near-poverty. He served in the first World War, surviving the Battle of the Somme, where he lost many of the closest friends he''d ever had. After the war he returned to the academic life, achieving high repute as a scholar and university teacher, eventually becoming Merton Professor of English at Oxford where he was a close friend of C.S. Lewis and the other writers known as The Inklings.

Then suddenly his life changed dramatically. One day while grading essay papers he found himself writing ''In a hole in the ground there lived a hobbit'' -- and worldwide renown awaited him. 

Humphrey Carpenter was given unrestricted access to all Tolkien''s papers, and interviewed his friends and family. From these sources he follows the long and painful process of creation that produced THE LORD OF THE RINGS and THE SILMARILLION and offers a wealth of information about the life and work of the twentieth century''s most cherished author.', 3, 10.7100, 10298, CAST(N'2000-06-06' AS Date), 5, N'JrrTolkien.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (46, N'978-0394823379', N'The Lorax', N'"Unless someone like you...cares a whole awful lot...nothing is going to get better...It''s not." 

Long before saving the earth became a global concern, Dr. Seuss, speaking through his character the Lorax, warned against mindless progress and the danger it posed to the earth''s natural beauty. 

"The big, colorful pictures and the fun images, word plays and rhymes make this an amusing exposition of the ecology crisis."', 1, 8.4400, 6548, CAST(N'1971-01-12' AS Date), 5, N'TheLorax.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (47, N'978-0743264747', N'Einstein: His Life and Universe', N'By the author of the acclaimed bestsellers Benjamin Franklin and Steve Jobs, this is the definitive biography of Albert Einstein. 

How did his mind work? What made him a genius? Isaacson’s biography shows how his scientific imagination sprang from the rebellious nature of his personality. His fascinating story is a testament to the connection between creativity and freedom.

Based on newly released personal letters of Einstein, this book explores how an imaginative, impertinent patent clerk—a struggling father in a difficult marriage who couldn’t get a teaching job or a doctorate—became the mind reader of the creator of the cosmos, the locksmith of the mysteries of the atom, and the universe. His success came from questioning conventional wisdom and marveling at mysteries that struck others as mundane. This led him to embrace a morality and politics based on respect for free minds, free spirits, and free individuals.

These traits are just as vital for this new century of globalization, in which our success will depend on our creativity, as they were for the beginning of the last century, when Einstein helped usher in the modern age.', 3, 12.1900, 12898, CAST(N'2008-05-13' AS Date), 1, N'Einstein.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (48, N'978-1119096603', N'Professional C# 6.0 and .NET Core 1.0', N'Professional C# 6 and .NET Core 1.0 provides complete coverage of the latest updates, features, and capabilities, giving you everything you need for C#. Get expert instruction on the latest changes to Visual Studio 2015, Windows Runtime, ADO.NET, ASP.NET, Windows Store Apps, Windows Workflow Foundation, and more, with clear explanations, no-nonsense pacing, and valuable expert insight. This incredibly useful guide serves as both tutorial and desk reference, providing a professional-level review of C# architecture and its application in a number of areas. You''ll gain a solid background in managed code and .NET constructs within the context of the 2015 release, so you can get acclimated quickly and get back to work.', 2, 33.5700, 324, CAST(N'2016-04-11' AS Date), 5, N'Csharp6NetCore1.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (49, N'978-1508480464', N'Othello', N'The Tragedy of Othello, the Moor of Venice is a tragedy by William Shakespeare, believed to have been written in approximately 1603, and based on the short story Un Capitano Moro ("A Moorish Captain") by Cinthio, a disciple of Boccaccio, first published in 1565. The work revolves around four central characters: Othello, a Moorish general in the Venetian army; his beloved wife, Desdemona; his loyal lieutenant, Cassio; and his trusted but unfaithful ensign, Iago. Because of its varied and current themes of racism, love, jealousy, betrayal, revenge and repentance, Othello is still often performed in professional and community theatres alike and has been the basis for numerous operatic, film, and literary adaptations.', 8, 6.9900, 5930, CAST(N'2015-02-04' AS Date), 3, N'Othello.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (50, N'978-1118531648', N'JavaScript and JQuery: Interactive Front-End Web Development', N'By the end of the book, not only will you be able to use the thousands of scripts, JavaScript APIs, and jQuery plugins that are freely available on the web, and be able to customize them - you will also be able to create your own scripts from scratch.

If you''re looking to create more enriching web experiences, then this is the book for you.', 2, 28.8500, 753, CAST(N'2014-06-30' AS Date), 1, N'JavascriptJquery.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (51, N'978-1430264484', N'Pro AngularJS', N'AngularJS is the leading framework for building dynamic JavaScript applications that take advantage of the capabilities of modern browsers and devices. AngularJS, which is maintained by Google, brings the power of the Model-View-Controller (MVC) pattern to the client, providing the foundation for complex and rich web apps. It allows you to build applications that are smaller, faster, and with a lighter resource footprint than ever before.
Best-selling author Adam Freeman explains how to get the most from AngularJS. He begins by describing the MVC pattern and the many benefits that can be gained from separating your logic and presentation code. He then shows how you can use AngularJS''s features within in your projects to produce professional-quality results. Starting from the nuts-and-bolts and building up to the most advanced and sophisticated features AngularJS is carefully unwrapped, going in-depth to give you the knowledge you need.', 2, 38.6100, 348, CAST(N'2014-03-27' AS Date), 3, N'ProAngularJs.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (52, NULL, N'Nikola Tesla: Imagination and the Man That Invented the 20th Century', N'Imagination amplifies and colors every other element of genius, and unlocks our potential for understanding and ability. 

It’s no coincidence that geniuses not only dare to dream of the impossible for their work, but do the same for their lives. They’re audacious enough to think that they’re not just ordinary players. 

Few stories better illustrate this better than the life of the father of the modern world, a man of legendary imaginative power and wonder: Nikola Tesla. 

In this book, you’ll be taken on a whirlwind journey through Tesla’s life and work, and not only learn about the successes and mistakes of one of history’s greatest inventors, but also how to look at the world in a different, more imaginative way. ', 3, 8.9900, 2283, CAST(N'2013-04-09' AS Date), 6, N'NikolaTesla.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (53, N'978-0394800011', N'The Cat in the Hat', N'Poor Dick and Sally. It''s cold and wet and they''re stuck in the house with nothing to do . . . until a giant cat in a hat shows up, transforming the dull day into a madcap adventure and almost wrecking the place in the process! Written by Dr. Seuss in 1957 in response to the concern that "pallid primers [with] abnormally courteous, unnaturally clean boys and girls'' were leading to growing illiteracy among children, The Cat in the Hat (the first Random House Beginner Book) changed the way our children learn how to read.', 1, 4.9800, 15245, CAST(N'1957-03-12' AS Date), 5, N'TheCatInTheHat.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (54, N'978-0385742894', N'The Kill Order (Maze Runner, Book Four; Origin) (The Maze Runner Series)', N'They thought the end came in a flash.
 
Before WICKED was formed, before the Glade was built, before Thomas entered the Maze, sun flares hit the earth, killing most of the population.
 
The worst is yet to come.
 
Mark and Trina were there when it happened. They survived. But now a virus is spreading. A virus that fills humans with murderous rage.
 
There is no cure. No escape.
 
They’re convinced that there’s a way to save those who are left—if they can stay alive. Because in this new, devastated world, every life has a price. And to some you’re worth more dead than alive.
 
The end is only the beginning.', 5, 8.4800, 4930, CAST(N'2014-01-07' AS Date), 5, N'TheKillOrder.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (55, N'978-0486280585', N'King Lear', N'First performed about 1805, King Lear is one of the most relentlessly bleak of Shakespeare''s tragedies. Probably written between Othello and Macbeth, when the playwright was at the peak of his tragic power, Lear''s themes of filial ingratitude, injustice, and the meaninglessness of life in a seemingly indifferent universe are explored with unsurpassed power and depth.
The plot concerns a monarch betrayed by his daughters, robbed of his kingdom, descending into madness. Greed, treachery, and cruelty are rife and the denouement of the play is both brutal and heartbreaking. In fact, so troubling is its vision of man''s life that, until the mid-19th century, the play was performed most often with a non-Shakespearean happy ending, with Lear back on his throne and Cordelia, the daughter nearest his heart, happily married to the noble Edgar. But there is a dark magnificence to Shakespeare''s original vision of the Lear story, and the play is performed today essentially as he wrote it, uncompromised by later "improvements." King Lear is reprinted here from an authoritative British edition, complete with explanatory footnotes.', 8, 3.1500, 4992, CAST(N'1994-06-16' AS Date), 2, N'KingLear.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (56, N'978-0545586177', N'Catching Fire (The Second Book of the Hunger Games)', N'Against all odds, Katniss Everdeen has won the annual Hunger Games with fellow district tribute Peeta Mellark. But it was a victory won by defiance of the Capitol and their harsh rules. Katniss and Peeta should be happy. After all, they have just won for themselves and their families a life of safety and plenty. But there are rumors of rebellion among the subjects, and Katniss and Peeta, to their horror, are the faces of that rebellion. The Capitol is angry. The Capitol wants revenge.', 5, 7.9200, 17213, CAST(N'2013-06-04' AS Date), 5, N'CatchingFire.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (57, N'978-0064430227', N'Harold and the Purple Crayon', N'"One evening, after thinking it over for some time, Harold decided to go for a walk in the moonlight."

Armed only with an oversized purple crayon, young Harold draws himself a landscape full of wonder and excitement.

Full of funny twists and surprises, this joyful story shows just how far your imagination can take you. Harold and the Purple Crayon has delighted readers of all ages since 1955', 1, 6.0000, 18439, CAST(N'1955-09-29' AS Date), 5, N'HaroldPurpleCrayon.jpg', 0, 0, 1)
GO
INSERT [dbo].[Books] ([BookID], [ISBN], [BookTitle], [Description], [GenreID], [Price], [UnitsSold], [PublishDate], [PublisherID], [BookImage], [IsSiteFeature], [IsGenreFeature], [BookStatusID]) VALUES (58, NULL, N'Developers In Development', NULL, NULL, 9.9900, 0, NULL, 1, N'NoImage.png', 0, 0, 3)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BookStatuses] ON 
GO
INSERT [dbo].[BookStatuses] ([BookStatusID], [BookStatusName], [Notes]) VALUES (1, N'In stock', N'Units are available for purchase and immediate shipment.')
GO
INSERT [dbo].[BookStatuses] ([BookStatusID], [BookStatusName], [Notes]) VALUES (2, N'Out of stock', N'Units can be purchased, but shipment will be delayed as sourced.')
GO
INSERT [dbo].[BookStatuses] ([BookStatusID], [BookStatusName], [Notes]) VALUES (3, N'Backordered', N'Units can be purchased, but shipment will be delayed - already awaiting arrival.')
GO
INSERT [dbo].[BookStatuses] ([BookStatusID], [BookStatusName], [Notes]) VALUES (4, N'Discontinued', N'Units no longer available for purchase - cannot be sourced.')
GO
SET IDENTITY_INSERT [dbo].[BookStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 
GO
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (1, N'Childrens')
GO
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (2, N'Computer')
GO
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (3, N'Auto/Biographies')
GO
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (5, N'SciFi')
GO
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (8, N'Classic Literature')
GO
INSERT [dbo].[Genres] ([GenreID], [GenreName]) VALUES (9, N'History')
GO
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Magazines] ON 
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (1, N'Better Homes and Gardens', 12, 47.8800, N'Home', 7624, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (2, N'ESPN The Magazine', 26, 29.9500, N'Sports', 2153, N'Semi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (3, N'Family Circle', 12, 23.8800, N'Home', 4051, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (4, N'Sports Illustrated', 54, 39.0000, N'Sports', 5306, N'Weekly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (5, N'HGTV Magazine', 10, 19.9900, N'Home', 4501, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (6, N'Scientific American', 12, 34.9900, N'Science', 1025, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (7, N'Southern Living', 13, 19.9500, N'Home', 3025, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (8, N'Popular Science', 6, 12.0000, N'Science', 2031, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (9, N'National Geographic', 12, 39.0000, N'Science', 4684, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (10, N'National Geographic Kids', 10, 24.9500, N'Kids', 2056, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (11, N'Popular Mechanics', 10, 12.0000, N'Science', 1768, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (12, N'Ranger Rick', 10, 24.9500, N'Kids', 2541, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (13, N'Discover', 10, 19.9500, N'Science', 1764, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (14, N'Zoobooks', 9, 29.9500, N'Kids', 2982, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (15, N'Air & Space', 7, 29.0000, N'Science', 1375, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (16, N'Highlights', 12, 39.9900, N'Kids', 3781, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (17, N'Boys'' Life', 12, 24.0000, N'Kids', 2674, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (18, N'Girls'' Life', 6, 19.9500, N'Kids', 2594, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (19, N'Good Housekeeping', 12, 10.0000, N'Home', 4351, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (20, N'Country Living', 10, 15.0000, N'Home', 3957, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (22, N'Runner''s World', 11, 20.0000, N'Sports', 4215, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (23, N'Field & Stream', 12, 9.9700, N'Sports', 5715, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (24, N'Climbing', 9, 14.9500, N'Sports', 3841, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (25, N'Trail Runner', 8, 21.9500, N'Sports', 2941, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (26, N'Triathlete', 11, 29.9500, N'Sports', 1674, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (27, N'Skiing', 4, 19.9700, N'Sports', 1975, N'Quarterly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (28, N'Cruise Travel', 6, 38.9500, N'Travel', 5674, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (29, N'Conde Nast Traveler', 11, 19.9900, N'Travel', 4674, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (30, N'Travel + Leisure', 12, 19.9500, N'Travel', 4311, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (31, N'Backpacker', 4, 9.9700, N'Travel', 3512, N'Quarterly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (32, N'Trailer Life', 12, 17.9700, N'Travel', 2841, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (33, N'MotorHome', 12, 19.9700, N'Travel', 2756, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (34, N'Cabin Living', 8, 24.9500, N'Home', 1645, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (35, N'Adventure Cyclist', 9, 40.0000, N'Travel', 1212, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (36, N'Cooking Light', 12, 18.0000, N'Food', 4215, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (37, N'Food Network Magazine', 10, 12.0000, N'Food', 5142, N'Seasonally')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (38, N'Food & Wine', 12, 19.9500, N'Food', 4641, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (39, N'Weight Watchers', 6, 14.9900, N'Food', 3414, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (40, N'Bon Appetit', 11, 19.9900, N'Food', 3461, N'Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (41, N'Taste of Home', 6, 15.0000, N'Food', 2674, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (42, N'Fine Cooking', 6, 30.0000, N'Food', 1648, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (43, N'Eating Well', 6, 16.9900, N'Food', 1241, N'Bi-Monthly')
GO
INSERT [dbo].[Magazines] ([MagazineID], [MagazineTitle], [IssuesPerYear], [PricePerYear], [Category], [Circulation], [PublishRate]) VALUES (44, N'Rachael Ray Every Day', 10, 14.9900, N'Food', 1943, N'Seasonally')
GO
SET IDENTITY_INSERT [dbo].[Magazines] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (1, N'Academia Books', N'New York', N'NY', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (2, N'Mountain Range Publishers', N'Denver', N'CO', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (3, N'Lakeside Books', N'Salt Lake City', N'UT', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (4, N'Upstate Publishers', N'Albany', N'NY', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (5, N'The Oceanview Group', N'Long Beach', N'CA', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (6, N'Southern Book Publishers', N'San Diego', N'CA', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (7, N'Presley Publishers', N'Kansas City', N'KS', 1)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (8, N'Ye Olde Printworks', N'New York', N'NY', 0)
GO
INSERT [dbo].[Publishers] ([PublisherID], [PublisherName], [City], [State], [IsActive]) VALUES (9, N'Centriq Training', N'Kansas City', N'MO', 1)
GO
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAuthors_Authors]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAuthors]'))
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAuthors_Authors]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAuthors]'))
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Authors]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAuthors_Books]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAuthors]'))
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAuthors_Books]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAuthors]'))
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Books]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookRoyalties_Books]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookRoyalties]'))
ALTER TABLE [dbo].[BookRoyalties]  WITH CHECK ADD  CONSTRAINT [FK_BookRoyalties_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookRoyalties_Books]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookRoyalties]'))
ALTER TABLE [dbo].[BookRoyalties] CHECK CONSTRAINT [FK_BookRoyalties_Books]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Books_BookStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Books]'))
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_BookStatuses] FOREIGN KEY([BookStatusID])
REFERENCES [dbo].[BookStatuses] ([BookStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Books_BookStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Books]'))
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_BookStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Books_Genres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Books]'))
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Books_Genres]') AND parent_object_id = OBJECT_ID(N'[dbo].[Books]'))
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Books_Publishers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Books]'))
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Books_Publishers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Books]'))
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
