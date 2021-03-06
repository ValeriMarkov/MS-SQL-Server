USE [master]
GO
/****** Object:  Database [Football Tournament]    Script Date: 9/27/2021 12:39:49 PM ******/
CREATE DATABASE [Football Tournament]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Football Tournament', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Football Tournament.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Football Tournament_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Football Tournament_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Football Tournament] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Football Tournament].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Football Tournament] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Football Tournament] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Football Tournament] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Football Tournament] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Football Tournament] SET ARITHABORT OFF 
GO
ALTER DATABASE [Football Tournament] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Football Tournament] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Football Tournament] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Football Tournament] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Football Tournament] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Football Tournament] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Football Tournament] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Football Tournament] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Football Tournament] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Football Tournament] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Football Tournament] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Football Tournament] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Football Tournament] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Football Tournament] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Football Tournament] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Football Tournament] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Football Tournament] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Football Tournament] SET RECOVERY FULL 
GO
ALTER DATABASE [Football Tournament] SET  MULTI_USER 
GO
ALTER DATABASE [Football Tournament] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Football Tournament] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Football Tournament] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Football Tournament] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Football Tournament] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Football Tournament] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Football Tournament', N'ON'
GO
ALTER DATABASE [Football Tournament] SET QUERY_STORE = OFF
GO
USE [Football Tournament]
GO
/****** Object:  Table [dbo].[Football Players]    Script Date: 9/27/2021 12:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Football Players](
	[player_id] [int] IDENTITY(1,1) NOT NULL,
	[player_name] [nvarchar](max) NULL,
	[team_id] [int] NULL,
 CONSTRAINT [PK_Football Players] PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 9/27/2021 12:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Judges]    Script Date: 9/27/2021 12:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judges](
	[judge_id] [int] IDENTITY(1,1) NOT NULL,
	[judge_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Judges] PRIMARY KEY CLUSTERED 
(
	[judge_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 9/27/2021 12:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[manager_name] [nvarchar](50) NULL,
	[team_id] [int] NULL,
	[contract] [date] NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 9/27/2021 12:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[match_id] [int] IDENTITY(1,1) NOT NULL,
	[home_team_id] [int] NULL,
	[away_team_id] [int] NULL,
	[game_date] [date] NULL,
	[home_team_score] [int] NULL,
	[away_team_score] [int] NULL,
	[judge_id] [int] NULL,
 CONSTRAINT [PK_Matches and results] PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 9/27/2021 12:39:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[team_id] [int] IDENTITY(1,1) NOT NULL,
	[team_name] [nvarchar](50) NULL,
	[group_id] [int] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Football Players] ON 

INSERT [dbo].[Football Players] ([player_id], [player_name], [team_id]) VALUES (1, N'Cristiano Ronaldo', 1)
INSERT [dbo].[Football Players] ([player_id], [player_name], [team_id]) VALUES (2, N'Romelu Lukaku', 2)
INSERT [dbo].[Football Players] ([player_id], [player_name], [team_id]) VALUES (3, N'Masahide Hiraoka', 3)
INSERT [dbo].[Football Players] ([player_id], [player_name], [team_id]) VALUES (4, N'Kaloyan Krastev', 4)
INSERT [dbo].[Football Players] ([player_id], [player_name], [team_id]) VALUES (5, N'Antoine Griezmann', 5)
INSERT [dbo].[Football Players] ([player_id], [player_name], [team_id]) VALUES (6, N'Ansu Fati', 6)
SET IDENTITY_INSERT [dbo].[Football Players] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([group_id], [group_name]) VALUES (1, N'UEFA Champions League')
INSERT [dbo].[Groups] ([group_id], [group_name]) VALUES (2, N'The UEFA European Championship')
INSERT [dbo].[Groups] ([group_id], [group_name]) VALUES (3, N'First Professional Football League')
INSERT [dbo].[Groups] ([group_id], [group_name]) VALUES (4, N'Premier League')
INSERT [dbo].[Groups] ([group_id], [group_name]) VALUES (5, N'LaLiga')
INSERT [dbo].[Groups] ([group_id], [group_name]) VALUES (6, N'Japan Football League')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Judges] ON 

INSERT [dbo].[Judges] ([judge_id], [judge_name]) VALUES (1, N'Daniele Orsato')
INSERT [dbo].[Judges] ([judge_id], [judge_name]) VALUES (2, N'Felix Brych')
INSERT [dbo].[Judges] ([judge_id], [judge_name]) VALUES (3, N'Bjorn Kuipers')
INSERT [dbo].[Judges] ([judge_id], [judge_name]) VALUES (4, N'Damir Skomina')
INSERT [dbo].[Judges] ([judge_id], [judge_name]) VALUES (5, N'Anthony Taylor')
INSERT [dbo].[Judges] ([judge_id], [judge_name]) VALUES (6, N'Nestor Pitana')
SET IDENTITY_INSERT [dbo].[Judges] OFF
GO
SET IDENTITY_INSERT [dbo].[Managers] ON 

INSERT [dbo].[Managers] ([manager_id], [manager_name], [team_id], [contract]) VALUES (1, N'Ole Gunnar Solskjær', 1, CAST(N'2024-03-06' AS Date))
INSERT [dbo].[Managers] ([manager_id], [manager_name], [team_id], [contract]) VALUES (2, N'Thomas Tuchel', 2, CAST(N'2024-06-17' AS Date))
INSERT [dbo].[Managers] ([manager_id], [manager_name], [team_id], [contract]) VALUES (3, N'Yuzo Tamura', 3, CAST(N'2022-07-21' AS Date))
INSERT [dbo].[Managers] ([manager_id], [manager_name], [team_id], [contract]) VALUES (4, N'Stoycho Mladenov', 4, CAST(N'2023-01-07' AS Date))
INSERT [dbo].[Managers] ([manager_id], [manager_name], [team_id], [contract]) VALUES (5, N'Diego Simeone', 5, CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Managers] ([manager_id], [manager_name], [team_id], [contract]) VALUES (6, N'Ronald Koeman', 6, CAST(N'2022-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[Managers] OFF
GO
SET IDENTITY_INSERT [dbo].[Matches] ON 

INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (1, 1, 2, CAST(N'2021-10-01' AS Date), 3, 1, 1)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (2, 2, 3, CAST(N'2021-10-02' AS Date), 2, 1, 2)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (3, 3, 4, CAST(N'2021-10-03' AS Date), 1, 3, 3)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (4, 4, 5, CAST(N'2021-10-04' AS Date), 1, 2, 4)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (5, 5, 6, CAST(N'2021-10-05' AS Date), 0, 1, 5)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (6, 6, 1, CAST(N'2021-10-06' AS Date), 2, 3, 1)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (7, 1, 4, CAST(N'2021-10-07' AS Date), 2, 0, 3)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (8, 3, 5, CAST(N'2021-10-08' AS Date), 1, 3, 2)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (9, 6, 2, CAST(N'2021-10-09' AS Date), 2, 2, 5)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (10, 4, 2, CAST(N'2021-10-10' AS Date), 1, 0, 6)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (11, 3, 6, CAST(N'2021-10-11' AS Date), 3, 0, 3)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (12, 1, 5, CAST(N'2021-10-12' AS Date), 2, 1, 6)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (13, 4, 6, CAST(N'2021-10-13' AS Date), 0, 3, 2)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (14, 5, 2, CAST(N'2021-10-14' AS Date), 3, 2, 1)
INSERT [dbo].[Matches] ([match_id], [home_team_id], [away_team_id], [game_date], [home_team_score], [away_team_score], [judge_id]) VALUES (15, 3, 1, CAST(N'2021-10-15' AS Date), 1, 3, 4)
SET IDENTITY_INSERT [dbo].[Matches] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([team_id], [team_name], [group_id]) VALUES (1, N'Manchester United F.C.', 1)
INSERT [dbo].[Teams] ([team_id], [team_name], [group_id]) VALUES (2, N'Chelsea F.C.', 1)
INSERT [dbo].[Teams] ([team_id], [team_name], [group_id]) VALUES (3, N'Iwaki FC', 6)
INSERT [dbo].[Teams] ([team_id], [team_name], [group_id]) VALUES (4, N'PFC CSKA Sofia', 3)
INSERT [dbo].[Teams] ([team_id], [team_name], [group_id]) VALUES (5, N'Athletico Madrid', 5)
INSERT [dbo].[Teams] ([team_id], [team_name], [group_id]) VALUES (6, N'FC Barcelona', 4)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
ALTER TABLE [dbo].[Football Players]  WITH CHECK ADD  CONSTRAINT [FK_Football Players_Teams] FOREIGN KEY([player_id])
REFERENCES [dbo].[Teams] ([team_id])
GO
ALTER TABLE [dbo].[Football Players] CHECK CONSTRAINT [FK_Football Players_Teams]
GO
ALTER TABLE [dbo].[Managers]  WITH CHECK ADD  CONSTRAINT [FK_Managers_Teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[Teams] ([team_id])
GO
ALTER TABLE [dbo].[Managers] CHECK CONSTRAINT [FK_Managers_Teams]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches and results_Judges] FOREIGN KEY([judge_id])
REFERENCES [dbo].[Judges] ([judge_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches and results_Judges]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches and results_Teams] FOREIGN KEY([home_team_id])
REFERENCES [dbo].[Teams] ([team_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches and results_Teams]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches and results_Teams1] FOREIGN KEY([away_team_id])
REFERENCES [dbo].[Teams] ([team_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches and results_Teams1]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Groups] FOREIGN KEY([team_id])
REFERENCES [dbo].[Groups] ([group_id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Groups]
GO
USE [master]
GO
ALTER DATABASE [Football Tournament] SET  READ_WRITE 
GO
