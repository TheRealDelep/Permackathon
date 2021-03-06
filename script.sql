USE [master]
GO
/****** Object:  Database [Python]    Script Date: 11-03-20 15:19:40 ******/
CREATE DATABASE [Python]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Python', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLHACKATHON\MSSQL\DATA\Python.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Python_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLHACKATHON\MSSQL\DATA\Python_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Python] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Python].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Python] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Python] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Python] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Python] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Python] SET ARITHABORT OFF 
GO
ALTER DATABASE [Python] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Python] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Python] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Python] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Python] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Python] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Python] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Python] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Python] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Python] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Python] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Python] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Python] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Python] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Python] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Python] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Python] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Python] SET RECOVERY FULL 
GO
ALTER DATABASE [Python] SET  MULTI_USER 
GO
ALTER DATABASE [Python] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Python] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Python] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Python] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Python] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Python', N'ON'
GO
ALTER DATABASE [Python] SET QUERY_STORE = OFF
GO
USE [Python]
GO
/****** Object:  User [PythonUser]    Script Date: 11-03-20 15:19:40 ******/
CREATE USER [PythonUser] FOR LOGIN [PythonUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [PythonUser]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priorities]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Priorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[LocationId] [int] NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDos]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DateStart] [datetime2](7) NOT NULL,
	[DateEnd] [datetime2](7) NULL,
	[AuthorId] [int] NULL,
	[ResponsableId] [int] NULL,
	[SiteId] [int] NULL,
	[PrioritiyId] [int] NULL,
	[CategorieId] [int] NULL,
	[StateId] [int] NULL,
 CONSTRAINT [PK_ToDos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[innerJoinToDoToOthers]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[innerJoinToDoToOthers]
AS
SELECT        dbo.ToDos.Id, dbo.ToDos.Name, dbo.ToDos.Description, dbo.ToDos.DateStart, dbo.ToDos.DateEnd, dbo.ToDos.AuthorId, dbo.ToDos.ResponsableId, dbo.ToDos.SiteId, dbo.ToDos.PrioritiyId, dbo.ToDos.CategorieId, 
                         dbo.ToDos.StateId
FROM            dbo.Sites INNER JOIN
                         dbo.States ON dbo.Sites.Id = dbo.States.Id INNER JOIN
                         dbo.ToDos ON dbo.Sites.Id = dbo.ToDos.SiteId AND dbo.States.Id = dbo.ToDos.StateId INNER JOIN
                         dbo.Priorities ON dbo.ToDos.PrioritiyId = dbo.Priorities.Id INNER JOIN
                         dbo.Categories ON dbo.ToDos.CategorieId = dbo.Categories.Id
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](max) NULL,
	[Number] [nvarchar](max) NULL,
	[Zipcode] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11-03-20 15:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[MemberId] [int] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200310142058_v1', N'3.1.2')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Production')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Entretien & travaux')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Gestion')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'G. RH')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Communication')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [Street], [Number], [Zipcode], [City]) VALUES (2, N'Avenue du Port', N'86C/99', N'1000', N'Bruxelles')
INSERT [dbo].[Locations] ([Id], [Street], [Number], [Zipcode], [City]) VALUES (3, N'Permafungistraat', N'56', N'2000', N'Anvers')
INSERT [dbo].[Locations] ([Id], [Street], [Number], [Zipcode], [City]) VALUES (4, N'Avenue du Général michel', N'2', N'6000', N'Charleroi')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [LastName], [FirstName], [Email], [Password]) VALUES (2, N'Remi', N'Dupont', N'remi@permafungi.be', N'12345')
INSERT [dbo].[Members] ([Id], [LastName], [FirstName], [Email], [Password]) VALUES (3, N'Bob', N'Smith', N'bob@permafungi.be', N'678910')
INSERT [dbo].[Members] ([Id], [LastName], [FirstName], [Email], [Password]) VALUES (4, N'Alain', N'Vandeveld', N'alain@permafungi.be', N'111213')
INSERT [dbo].[Members] ([Id], [LastName], [FirstName], [Email], [Password]) VALUES (5, N'Nathan', N'Sylvain', N'nathan@permafungi.be', N'141516')
INSERT [dbo].[Members] ([Id], [LastName], [FirstName], [Email], [Password]) VALUES (6, N'Alice', N'Bernier', N'alice@permafongi.be', N'171819')
INSERT [dbo].[Members] ([Id], [LastName], [FirstName], [Email], [Password]) VALUES (7, N'Arianne', N'Lothier', N'arianne@permafongi.be', N'202122')
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[Priorities] ON 

INSERT [dbo].[Priorities] ([Id], [Name]) VALUES (1, N'Hight')
INSERT [dbo].[Priorities] ([Id], [Name]) VALUES (2, N'Middle')
INSERT [dbo].[Priorities] ([Id], [Name]) VALUES (3, N'Low')
SET IDENTITY_INSERT [dbo].[Priorities] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name], [MemberId]) VALUES (1, N'Admin', 2)
INSERT [dbo].[Roles] ([Id], [Name], [MemberId]) VALUES (2, N'Projecteddataleader', 3)
INSERT [dbo].[Roles] ([Id], [Name], [MemberId]) VALUES (3, N'Realdataleader', 4)
INSERT [dbo].[Roles] ([Id], [Name], [MemberId]) VALUES (4, N'Userlimited', 5)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Sites] ON 

INSERT [dbo].[Sites] ([Id], [Name], [Phone], [LocationId]) VALUES (2, N'Bruxelles', N'025201236', 2)
INSERT [dbo].[Sites] ([Id], [Name], [Phone], [LocationId]) VALUES (3, N'Anvers', N'013870255', 3)
INSERT [dbo].[Sites] ([Id], [Name], [Phone], [LocationId]) VALUES (6, N'Charleroi', N'025388945', 4)
SET IDENTITY_INSERT [dbo].[Sites] OFF
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([Id], [Name]) VALUES (1, N'available')
INSERT [dbo].[States] ([Id], [Name]) VALUES (2, N'in progress')
INSERT [dbo].[States] ([Id], [Name]) VALUES (3, N'done')
SET IDENTITY_INSERT [dbo].[States] OFF
SET IDENTITY_INSERT [dbo].[ToDos] ON 

INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (2, N'Panne', N'le frigo est en panne, il faut le changer le plus rapidement', CAST(N'2020-03-10T00:00:00.0000000' AS DateTime2), NULL, 2, 3, 2, 1, 2, 2)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (3, N'Déménagement', N'Machine à déplacer', CAST(N'2020-03-01T00:00:00.0000000' AS DateTime2), NULL, 3, 2, 2, 2, 2, 2)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (4, N'Envoi du produit', N'Besoin rapide de champignon (3T)', CAST(N'2020-03-02T00:00:00.0000000' AS DateTime2), NULL, 2, 3, 3, 1, 2, 2)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (6, N'Stock', N'Manque marc de café', CAST(N'2020-02-29T00:00:00.0000000' AS DateTime2), CAST(N'2020-03-10T00:00:00.0000000' AS DateTime2), 7, 3, 3, 2, 1, 3)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (7, N'Panne', N'le frigo coule', CAST(N'2020-02-18T00:00:00.0000000' AS DateTime2), CAST(N'2020-02-25T00:00:00.0000000' AS DateTime2), 6, 4, 2, 1, 2, 2)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (15, N'Stock', N'Manque engrais', CAST(N'2020-03-01T00:00:00.0000000' AS DateTime2), NULL, 5, 4, 2, 3, 1, 1)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (17, N'Formation', N'Local indisponible', CAST(N'2020-03-06T00:00:00.0000000' AS DateTime2), NULL, 6, 2, 6, 1, 5, 2)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (18, N'Manque collaborateur', N'Trouver stagiaire', CAST(N'2020-02-20T00:00:00.0000000' AS DateTime2), CAST(N'2020-03-06T00:00:00.0000000' AS DateTime2), 4, 2, 2, 1, 4, 3)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (19, N'Manque collaborateur', N'Sous effectif', CAST(N'2020-02-20T00:00:00.0000000' AS DateTime2), NULL, 4, 2, 2, 1, 4, 2)
INSERT [dbo].[ToDos] ([Id], [Name], [Description], [DateStart], [DateEnd], [AuthorId], [ResponsableId], [SiteId], [PrioritiyId], [CategorieId], [StateId]) VALUES (20, N'Panne', N'Lumière couloir defectueuse', CAST(N'2020-03-11T00:00:00.0000000' AS DateTime2), NULL, 5, 4, 6, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[ToDos] OFF
/****** Object:  Index [IX_Roles_MemberId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_Roles_MemberId] ON [dbo].[Roles]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sites_LocationId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_Sites_LocationId] ON [dbo].[Sites]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDos_AuthorId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_ToDos_AuthorId] ON [dbo].[ToDos]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDos_CategorieId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_ToDos_CategorieId] ON [dbo].[ToDos]
(
	[CategorieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDos_PrioritiyId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_ToDos_PrioritiyId] ON [dbo].[ToDos]
(
	[PrioritiyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDos_ResponsableId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_ToDos_ResponsableId] ON [dbo].[ToDos]
(
	[ResponsableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDos_SiteId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_ToDos_SiteId] ON [dbo].[ToDos]
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ToDos_StateId]    Script Date: 11-03-20 15:19:40 ******/
CREATE NONCLUSTERED INDEX [IX_ToDos_StateId] ON [dbo].[ToDos]
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Members_MemberId] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Members_MemberId]
GO
ALTER TABLE [dbo].[Sites]  WITH CHECK ADD  CONSTRAINT [FK_Sites_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[Sites] CHECK CONSTRAINT [FK_Sites_Locations_LocationId]
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_Categories_CategorieId] FOREIGN KEY([CategorieId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_Categories_CategorieId]
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_Members_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_Members_AuthorId]
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_Members_ResponsableId] FOREIGN KEY([ResponsableId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_Members_ResponsableId]
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_Priorities_PrioritiyId] FOREIGN KEY([PrioritiyId])
REFERENCES [dbo].[Priorities] ([Id])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_Priorities_PrioritiyId]
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_Sites_SiteId] FOREIGN KEY([SiteId])
REFERENCES [dbo].[Sites] ([Id])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_Sites_SiteId]
GO
ALTER TABLE [dbo].[ToDos]  WITH CHECK ADD  CONSTRAINT [FK_ToDos_States_StateId] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[ToDos] CHECK CONSTRAINT [FK_ToDos_States_StateId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sites"
            Begin Extent = 
               Top = 25
               Left = 55
               Bottom = 155
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "States"
            Begin Extent = 
               Top = 212
               Left = 310
               Bottom = 308
               Right = 518
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ToDos"
            Begin Extent = 
               Top = 6
               Left = 530
               Bottom = 136
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Priorities"
            Begin Extent = 
               Top = 6
               Left = 776
               Bottom = 102
               Right = 984
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categories"
            Begin Extent = 
               Top = 187
               Left = 752
               Bottom = 283
               Right = 960
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'innerJoinToDoToOthers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'innerJoinToDoToOthers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'innerJoinToDoToOthers'
GO
USE [master]
GO
ALTER DATABASE [Python] SET  READ_WRITE 
GO
