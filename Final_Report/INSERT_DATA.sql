USE [master]
GO
/****** Object:  Database [ASM_DBI]    Script Date: 7/17/2022 8:11:03 PM ******/
CREATE DATABASE [ASM_DBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM_DBI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASM_DBI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASM_DBI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ASM_DBI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ASM_DBI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM_DBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM_DBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM_DBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM_DBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM_DBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM_DBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM_DBI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASM_DBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM_DBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM_DBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM_DBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM_DBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM_DBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM_DBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM_DBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM_DBI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASM_DBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM_DBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM_DBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM_DBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM_DBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM_DBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASM_DBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM_DBI] SET RECOVERY FULL 
GO
ALTER DATABASE [ASM_DBI] SET  MULTI_USER 
GO
ALTER DATABASE [ASM_DBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM_DBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM_DBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM_DBI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASM_DBI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ASM_DBI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASM_DBI', N'ON'
GO
ALTER DATABASE [ASM_DBI] SET QUERY_STORE = OFF
GO
USE [ASM_DBI]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[aid] [int] NOT NULL,
	[suid] [int] NOT NULL,
	[Category_ID] [int] NOT NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G_Student]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G_Student](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_G_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [nvarchar](50) NOT NULL,
	[lid] [int] NOT NULL,
	[suid] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Assessment]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Assessment](
	[Category_ID] [int] NOT NULL,
	[Category_name] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Part] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[Completion criteria] [nvarchar](50) NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Question type] [nvarchar](50) NOT NULL,
	[No question] [int] NOT NULL,
	[Knowledge and Skill] [nvarchar](150) NOT NULL,
	[Grading guide] [nvarchar](150) NOT NULL,
	[Note] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[lid] [int] NOT NULL,
	[lname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [datetime] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Lecture] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreTable]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreTable](
	[stid] [int] NOT NULL,
	[aid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_ScoreTable] PRIMARY KEY CLUSTERED 
(
	[stid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[seid] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[seid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[dob] [datetime] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/17/2022 8:11:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[suid] [int] NOT NULL,
	[suname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[suid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (1, 7, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (2, 5, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (3, 4, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (4, 7, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (5, 2, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (6, 6, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (7, 8, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (8, 10, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (9, 2, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (10, 5, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (11, 7, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (12, 9, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (13, 3, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (14, 2, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (15, 4, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (16, 3, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (17, 9, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (18, 4, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (19, 6, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (20, 9, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (21, 7, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (22, 9, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (23, 3, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (24, 2, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (25, 4, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (26, 3, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (27, 9, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (28, 4, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (29, 6, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (30, 9, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (31, 7, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (32, 9, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (33, 3, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (34, 2, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (35, 4, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (36, 3, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (37, 9, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (38, 4, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (39, 6, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (40, 9, 3)
GO
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (5, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (6, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (8, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (11, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (15, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (21, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (22, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (22, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (22, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (23, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (23, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (24, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (24, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (25, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (25, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (27, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (28, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (28, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (28, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (28, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (29, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (30, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (30, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (30, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (31, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (31, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (31, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (32, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (33, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (33, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (33, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (33, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (33, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (34, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (35, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (35, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (35, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (35, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (35, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (36, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (36, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (36, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (37, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (37, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (37, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (37, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (38, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (39, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (40, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (40, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (41, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (42, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (43, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (43, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (43, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (43, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (43, 20)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (44, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (44, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (45, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (46, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (46, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (46, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (47, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (48, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (49, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (50, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (51, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (52, 2)
GO
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (52, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (52, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (52, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (53, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (53, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (53, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (53, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (54, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (54, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (55, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (55, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (55, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (55, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (56, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (57, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (57, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (57, 20)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (58, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (58, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (59, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (59, 9)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (59, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (60, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (61, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (61, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (62, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (62, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (63, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (63, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (63, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (64, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (65, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (65, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (65, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (66, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (66, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (67, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (68, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (68, 17)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (69, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (69, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (69, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (69, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (69, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (70, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (70, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (70, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (70, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (72, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (72, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (72, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (72, 20)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (73, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (73, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (73, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (74, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (74, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (74, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (75, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (75, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (76, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (77, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (77, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (77, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (78, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (78, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (78, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (78, 18)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (79, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (80, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (81, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (82, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (84, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (84, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (85, 10)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (85, 14)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (85, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (86, 15)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (88, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (89, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (89, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (90, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (90, 20)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (92, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (92, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (92, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (93, 7)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (93, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (93, 16)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (94, 8)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (94, 20)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (95, 6)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (95, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (95, 13)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (96, 11)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (98, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (98, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (98, 19)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (99, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (99, 8)
GO
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (99, 12)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (100, 17)
GO
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (1, N'Iaculis Odio Nam Company', 15, 6)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (2, N'Suspendisse Limited', 7, 4)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (3, N'Lacinia Vitae Limited', 3, 8)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (4, N'Ipsum Porta Associates', 15, 9)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (5, N'Mollis Incorporated', 5, 4)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (6, N'Nec Tellus Nunc Institute', 19, 4)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (7, N'Lacus LLP', 9, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (8, N'Sed Et Libero Corp.', 1, 3)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (9, N'Nullam Limited', 5, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (10, N'Nisi Mauris LLP', 13, 9)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (11, N'A Foundation', 17, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (12, N'Quis Industries', 19, 3)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (13, N'Fringilla Donec Feugiat Corporation', 9, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (14, N'Urna Suscipit Nonummy Limited', 15, 3)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (15, N'Pharetra Quisque Ac Industries', 7, 10)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (16, N'Justo Faucibus Company', 19, 3)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (17, N'Lorem Ipsum Associates', 13, 4)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (18, N'Est Nunc Associates', 15, 4)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (19, N'Eu Turpis Company', 19, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (20, N'Facilisis Suspendisse Commodo Inc.', 13, 10)
GO
INSERT [dbo].[Info_Assessment] ([Category_ID], [Category_name], [Type], [Part], [Weight], [Completion criteria], [Duration], [Question type], [No question], [Knowledge and Skill], [Grading guide], [Note]) VALUES (1, N'Progress Test', N'quiz', 2, 0.1, N'0', N'20''', N'Muitil choice', 20, N'sdadawsd', N'asdasd', N'asdasd')
INSERT [dbo].[Info_Assessment] ([Category_ID], [Category_name], [Type], [Part], [Weight], [Completion criteria], [Duration], [Question type], [No question], [Knowledge and Skill], [Grading guide], [Note]) VALUES (2, N'Assignment', N'on-going', 1, 0.2, N'0', N'at home', N'design', 0, N'sa', N'asd', N'aasadd')
INSERT [dbo].[Info_Assessment] ([Category_ID], [Category_name], [Type], [Part], [Weight], [Completion criteria], [Duration], [Question type], [No question], [Knowledge and Skill], [Grading guide], [Note]) VALUES (3, N'labs', N'on-going', 5, 0.15, N'0', N'in lab', N'pratical', 0, N'fdc', N'asc', N'cas')
INSERT [dbo].[Info_Assessment] ([Category_ID], [Category_name], [Type], [Part], [Weight], [Completion criteria], [Duration], [Question type], [No question], [Knowledge and Skill], [Grading guide], [Note]) VALUES (4, N'PE', N'pe', 1, 0.25, N'0', N'85''', N'scrips', 0, N'sad', N'asd', N'ad')
INSERT [dbo].[Info_Assessment] ([Category_ID], [Category_name], [Type], [Part], [Weight], [Completion criteria], [Duration], [Question type], [No question], [Knowledge and Skill], [Grading guide], [Note]) VALUES (5, N'FE', N'FE', 1, 0.3, N'4', N'60', N'muitlple choice ', 60, N'sc', N'asc', N'as')
GO
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (1, N'Jason Mcgee', 0, CAST(N'2015-11-16T02:43:39.000' AS DateTime), N'eu@protonmail.couk')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (2, N'Whitney West', 1, CAST(N'2014-06-07T14:04:00.000' AS DateTime), N'aliquam.nisl@google.org')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (3, N'Brooke Willis', 1, CAST(N'2014-07-17T16:51:52.000' AS DateTime), N'pulvinar.arcu.et@aol.couk')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (4, N'Emmanuel Pollard', 0, CAST(N'2014-03-12T10:11:31.000' AS DateTime), N'molestie.dapibus@google.ca')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (5, N'Olivia Fry', 0, CAST(N'2016-03-06T10:21:37.000' AS DateTime), N'nulla@protonmail.edu')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (6, N'Darryl Banks', 1, CAST(N'2014-05-03T00:03:12.000' AS DateTime), N'ligula@hotmail.net')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (7, N'Aiko Hunter', 1, CAST(N'2016-05-23T11:07:43.000' AS DateTime), N'sed@icloud.couk')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (8, N'Craig Drake', 1, CAST(N'2014-02-23T23:54:38.000' AS DateTime), N'convallis.erat@icloud.net')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (9, N'William Mccormick', 1, CAST(N'2016-06-16T11:06:53.000' AS DateTime), N'egestas.nunc@google.com')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (10, N'Jacqueline Alexander', 0, CAST(N'2015-03-15T01:28:12.000' AS DateTime), N'risus.quis.diam@protonmail.couk')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (11, N'Katell Martinez', 1, CAST(N'2016-06-06T04:44:13.000' AS DateTime), N'ullamcorper.nisl@aol.com')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (12, N'Ciaran Dejesus', 1, CAST(N'2014-01-07T18:44:30.000' AS DateTime), N'orci.phasellus@outlook.edu')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (13, N'Lars Fox', 0, CAST(N'2014-03-08T14:36:44.000' AS DateTime), N'aliquet.phasellus.fermentum@icloud.org')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (14, N'Quamar Carter', 1, CAST(N'2014-08-27T19:23:01.000' AS DateTime), N'non.luctus.sit@protonmail.couk')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (15, N'Linus Washington', 0, CAST(N'2014-03-10T10:36:29.000' AS DateTime), N'cum@aol.org')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (16, N'Bruce Blackwell', 0, CAST(N'2014-08-12T21:37:36.000' AS DateTime), N'non.hendrerit@icloud.ca')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (17, N'Nash Reese', 0, CAST(N'2015-01-26T04:27:59.000' AS DateTime), N'lorem.eu@outlook.com')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (18, N'Kaitlin Dennis', 1, CAST(N'2015-04-24T21:06:21.000' AS DateTime), N'et.netus.et@icloud.couk')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (19, N'Veda Parker', 1, CAST(N'2015-02-07T01:40:01.000' AS DateTime), N'molestie@protonmail.org')
INSERT [dbo].[Lecture] ([lid], [lname], [gender], [dob], [address]) VALUES (20, N'Jason Mcgee', 0, CAST(N'2015-11-16T02:43:39.000' AS DateTime), N'eu@protonmail.couk')
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (1, 11, 22, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (2, 25, 76, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (3, 12, 81, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (4, 36, 30, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (5, 10, 78, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (6, 18, 34, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (7, 36, 42, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (8, 24, 95, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (9, 38, 77, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (10, 11, 55, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (11, 21, 79, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (12, 34, 9, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (13, 31, 52, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (14, 3, 76, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (15, 38, 93, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (16, 36, 45, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (17, 19, 95, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (18, 22, 97, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (19, 17, 84, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (20, 16, 69, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (21, 11, 78, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (22, 25, 91, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (23, 3, 31, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (24, 6, 49, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (25, 6, 24, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (26, 7, 86, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (27, 10, 27, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (28, 11, 21, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (29, 22, 21, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (30, 17, 14, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (31, 16, 44, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (32, 36, 53, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (33, 32, 81, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (34, 33, 5, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (35, 34, 31, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (36, 20, 90, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (37, 15, 68, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (38, 17, 64, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (39, 34, 32, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (40, 1, 20, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (41, 35, 22, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (42, 33, 55, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (43, 11, 2, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (44, 19, 54, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (45, 23, 7, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (46, 20, 71, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (47, 12, 77, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (48, 3, 50, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (49, 6, 10, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (50, 19, 11, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (51, 12, 30, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (52, 10, 37, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (53, 34, 21, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (54, 22, 55, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (55, 13, 70, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (56, 23, 52, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (57, 22, 87, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (58, 4, 44, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (59, 28, 62, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (60, 33, 11, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (61, 12, 30, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (62, 10, 37, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (63, 34, 21, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (64, 22, 55, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (65, 13, 70, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (66, 23, 52, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (67, 22, 87, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (68, 4, 44, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (69, 28, 62, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (70, 33, 11, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (71, 37, 84, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (72, 19, 17, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (73, 30, 50, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (74, 1, 23, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (75, 39, 44, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (76, 5, 82, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (77, 1, 60, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (78, 37, 96, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (79, 17, 99, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (80, 10, 89, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (81, 35, 14, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (82, 16, 62, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (83, 7, 82, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (84, 2, 43, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (85, 34, 48, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (86, 28, 16, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (87, 28, 42, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (88, 12, 72, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (89, 15, 100, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (90, 23, 83, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (91, 23, 34, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (92, 10, 73, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (93, 9, 90, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (94, 8, 95, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (95, 11, 9, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (96, 39, 61, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (97, 9, 38, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (98, 26, 37, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (99, 31, 75, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (100, 34, 49, 6)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (101, 19, 73, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (102, 30, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (103, 16, 15, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (104, 16, 81, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (105, 18, 73, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (106, 22, 64, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (107, 4, 83, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (108, 6, 11, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (109, 15, 56, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (110, 36, 82, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (111, 6, 83, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (112, 16, 6, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (113, 8, 79, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (114, 2, 25, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (115, 3, 71, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (116, 3, 71, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (117, 1, 20, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (118, 10, 18, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (119, 10, 1, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (120, 29, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (121, 32, 34, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (122, 33, 60, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (123, 14, 22, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (124, 32, 9, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (125, 18, 52, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (126, 39, 10, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (127, 14, 14, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (128, 23, 39, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (129, 21, 34, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (130, 25, 94, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (131, 2, 77, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (132, 36, 65, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (133, 37, 9, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (134, 22, 76, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (135, 17, 21, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (136, 28, 47, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (137, 38, 26, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (138, 15, 87, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (139, 1, 23, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (140, 36, 15, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (141, 23, 22, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (142, 22, 42, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (143, 24, 86, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (144, 14, 27, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (145, 37, 47, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (146, 8, 96, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (147, 40, 8, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (148, 27, 41, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (149, 32, 74, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (150, 22, 60, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (151, 17, 11, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (152, 19, 45, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (153, 12, 76, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (154, 26, 33, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (155, 9, 5, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (156, 8, 54, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (157, 30, 77, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (158, 35, 98, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (159, 26, 33, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (160, 15, 75, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (161, 11, 88, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (162, 15, 12, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (163, 22, 32, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (164, 37, 55, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (165, 11, 42, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (166, 4, 52, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (167, 34, 96, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (168, 3, 39, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (169, 6, 44, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (170, 3, 45, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (171, 6, 67, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (172, 10, 16, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (173, 29, 38, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (174, 22, 74, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (175, 34, 80, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (176, 38, 3, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (177, 20, 30, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (178, 21, 53, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (179, 24, 30, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (180, 12, 53, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (181, 39, 12, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (182, 6, 36, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (183, 33, 24, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (184, 14, 26, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (185, 9, 35, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (186, 12, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (187, 11, 59, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (188, 30, 65, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (189, 24, 82, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (190, 32, 7, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (191, 22, 89, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (192, 16, 90, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (193, 26, 10, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (194, 18, 89, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (195, 15, 97, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (196, 32, 35, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (197, 2, 76, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (198, 14, 63, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (199, 13, 89, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (200, 36, 94, 6)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (201, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (202, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (203, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (204, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (205, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (206, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (207, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (208, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (209, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (210, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (211, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (212, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (213, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (214, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (215, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (216, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (217, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (218, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (219, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (220, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (221, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (222, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (223, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (224, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (225, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (226, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (227, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (228, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (229, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (230, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (231, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (232, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (233, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (234, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (235, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (236, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (237, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (238, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (239, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (240, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (241, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (242, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (243, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (244, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (245, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (246, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (247, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (248, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (249, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (250, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (251, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (252, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (253, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (254, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (255, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (256, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (257, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (258, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (259, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (260, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (261, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (262, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (263, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (264, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (265, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (266, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (267, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (268, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (269, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (270, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (271, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (272, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (273, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (274, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (275, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (276, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (277, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (278, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (279, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (280, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (281, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (282, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (283, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (284, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (285, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (286, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (287, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (288, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (289, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (290, 34, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (291, 19, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (292, 28, 87, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (293, 16, 55, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (294, 32, 45, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (295, 38, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (296, 1, 65, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (297, 4, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (298, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (299, 10, 54, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (300, 34, 6, 9)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (311, 31, 36, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (312, 18, 27, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (313, 29, 25, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (314, 4, 37, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (315, 21, 56, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (316, 24, 44, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (317, 29, 73, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (318, 15, 97, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (319, 34, 31, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (320, 15, 69, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (321, 35, 48, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (322, 5, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (323, 18, 66, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (324, 11, 73, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (325, 29, 36, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (326, 36, 18, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (327, 11, 78, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (328, 24, 15, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (329, 37, 49, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (330, 21, 97, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (331, 20, 53, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (332, 21, 76, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (333, 17, 27, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (334, 34, 68, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (335, 36, 55, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (336, 23, 67, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (337, 31, 58, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (338, 16, 100, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (339, 37, 69, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (340, 8, 61, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (341, 20, 83, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (342, 34, 30, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (343, 13, 93, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (344, 2, 83, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (345, 6, 31, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (346, 25, 25, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (347, 31, 13, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (348, 15, 90, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (349, 14, 76, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (350, 4, 66, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (351, 38, 79, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (352, 38, 53, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (353, 26, 27, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (354, 29, 53, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (355, 10, 13, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (356, 25, 6, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (357, 15, 23, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (358, 27, 95, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (359, 1, 76, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (360, 2, 51, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (361, 36, 67, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (362, 38, 42, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (363, 17, 96, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (364, 5, 7, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (365, 33, 90, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (366, 34, 21, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (367, 30, 78, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (368, 24, 69, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (369, 5, 32, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (370, 30, 81, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (371, 24, 46, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (372, 29, 99, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (373, 3, 49, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (374, 30, 99, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (375, 21, 74, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (376, 18, 87, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (377, 15, 8, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (378, 19, 62, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (379, 7, 50, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (380, 27, 57, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (381, 33, 8, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (382, 32, 72, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (383, 27, 99, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (384, 9, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (385, 26, 87, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (386, 5, 51, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (387, 16, 70, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (388, 37, 48, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (389, 11, 94, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (390, 6, 60, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (391, 40, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (392, 36, 21, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (393, 3, 81, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (394, 16, 98, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (395, 26, 92, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (396, 22, 88, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (397, 15, 32, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (398, 37, 21, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (399, 20, 59, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (400, 15, 72, 4)
GO
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (1, CAST(N'2015-11-16T02:43:39.000' AS DateTime), 17)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (2, CAST(N'2014-06-07T14:04:00.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (3, CAST(N'2014-07-17T16:51:52.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (4, CAST(N'2014-03-12T10:11:31.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (5, CAST(N'2016-03-06T10:21:37.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (6, CAST(N'2014-05-03T00:03:12.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (7, CAST(N'2016-05-23T11:07:43.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (8, CAST(N'2014-02-23T23:54:38.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (9, CAST(N'2016-06-16T11:06:53.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (10, CAST(N'2015-03-15T01:28:12.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (11, CAST(N'2016-06-06T04:44:13.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (12, CAST(N'2014-01-07T18:44:30.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (13, CAST(N'2014-03-08T14:36:44.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (14, CAST(N'2014-08-27T19:23:01.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (15, CAST(N'2014-03-10T10:36:29.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (16, CAST(N'2014-08-12T21:37:36.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (17, CAST(N'2015-01-26T04:27:59.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (18, CAST(N'2015-04-24T21:06:21.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (19, CAST(N'2015-02-07T01:40:01.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (20, CAST(N'2015-11-16T02:43:39.000' AS DateTime), 7)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (21, CAST(N'2014-06-07T14:04:00.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (22, CAST(N'2014-07-17T16:51:52.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (23, CAST(N'2014-03-12T10:11:31.000' AS DateTime), 18)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (24, CAST(N'2016-03-06T10:21:37.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (25, CAST(N'2014-05-03T00:03:12.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (26, CAST(N'2016-05-23T11:07:43.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (27, CAST(N'2014-02-23T23:54:38.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (28, CAST(N'2016-06-16T11:06:53.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (29, CAST(N'2015-03-15T01:28:12.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (30, CAST(N'2016-06-06T04:44:13.000' AS DateTime), 18)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (31, CAST(N'2014-01-07T18:44:30.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (32, CAST(N'2014-03-08T14:36:44.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (33, CAST(N'2014-08-27T19:23:01.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (34, CAST(N'2014-03-10T10:36:29.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (35, CAST(N'2014-08-12T21:37:36.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (36, CAST(N'2015-01-26T04:27:59.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (37, CAST(N'2015-04-24T21:06:21.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (38, CAST(N'2015-02-07T01:40:01.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (39, CAST(N'2015-11-30T02:01:44.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (40, CAST(N'2015-09-07T01:44:51.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (41, CAST(N'2015-07-18T11:34:17.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (42, CAST(N'2014-07-15T10:48:30.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (43, CAST(N'2014-08-20T06:40:23.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (44, CAST(N'2016-04-05T12:01:44.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (45, CAST(N'2016-03-11T01:07:22.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (46, CAST(N'2015-05-08T13:49:10.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (47, CAST(N'2014-06-04T19:06:24.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (48, CAST(N'2015-04-06T06:39:38.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (49, CAST(N'2014-01-24T07:38:32.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (50, CAST(N'2014-04-16T05:22:19.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (51, CAST(N'2015-01-11T23:51:57.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (52, CAST(N'2015-05-23T06:17:06.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (53, CAST(N'2015-01-05T18:03:54.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (54, CAST(N'2015-10-04T06:16:02.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (55, CAST(N'2015-06-30T18:09:30.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (56, CAST(N'2015-07-26T02:56:26.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (57, CAST(N'2016-04-21T16:44:01.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (58, CAST(N'2015-05-10T00:00:40.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (59, CAST(N'2014-06-12T11:43:33.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (60, CAST(N'2014-06-10T23:34:37.000' AS DateTime), 19)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (61, CAST(N'2014-04-22T16:40:44.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (62, CAST(N'2016-05-21T21:31:58.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (63, CAST(N'2016-04-04T10:28:26.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (64, CAST(N'2015-04-09T00:48:13.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (65, CAST(N'2015-12-13T17:15:55.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (66, CAST(N'2015-03-30T19:41:04.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (67, CAST(N'2015-12-25T13:09:41.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (68, CAST(N'2016-01-03T18:07:16.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (69, CAST(N'2014-02-03T08:39:26.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (70, CAST(N'2014-11-09T20:08:10.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (71, CAST(N'2015-12-17T14:38:52.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (72, CAST(N'2015-01-11T01:28:52.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (73, CAST(N'2014-07-19T02:51:50.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (74, CAST(N'2016-05-18T05:33:21.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (75, CAST(N'2015-06-06T14:49:39.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (76, CAST(N'2016-03-04T21:54:11.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (77, CAST(N'2016-02-29T16:09:23.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (78, CAST(N'2016-05-04T12:36:24.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (79, CAST(N'2016-06-14T04:55:02.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (80, CAST(N'2015-07-18T21:17:30.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (81, CAST(N'2014-04-01T05:01:15.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (82, CAST(N'2015-05-16T15:10:23.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (83, CAST(N'2015-05-29T12:28:14.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (84, CAST(N'2014-08-16T10:09:38.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (85, CAST(N'2015-12-01T00:38:13.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (86, CAST(N'2014-10-28T13:26:06.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (87, CAST(N'2014-01-14T19:21:39.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (88, CAST(N'2016-01-02T10:15:20.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (89, CAST(N'2016-01-13T04:53:20.000' AS DateTime), 13)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (90, CAST(N'2015-10-01T08:44:44.000' AS DateTime), 12)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (91, CAST(N'2014-07-13T05:18:07.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (92, CAST(N'2015-05-07T11:54:31.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (93, CAST(N'2015-06-18T05:02:37.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (94, CAST(N'2015-06-25T05:20:09.000' AS DateTime), 14)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (95, CAST(N'2015-11-29T05:17:49.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (96, CAST(N'2015-05-13T00:48:59.000' AS DateTime), 12)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (97, CAST(N'2016-03-07T03:57:18.000' AS DateTime), 10)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (98, CAST(N'2021-10-06T08:38:14.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (99, CAST(N'2023-02-13T20:21:31.000' AS DateTime), 14)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (100, CAST(N'2022-07-30T11:35:44.000' AS DateTime), 20)
GO
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (101, CAST(N'2023-05-19T03:32:46.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (102, CAST(N'2022-06-18T07:14:50.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (103, CAST(N'2023-04-01T11:28:30.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (104, CAST(N'2022-03-13T11:15:45.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (105, CAST(N'2022-05-26T18:03:46.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (106, CAST(N'2023-01-01T09:18:27.000' AS DateTime), 18)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (107, CAST(N'2021-09-14T03:46:59.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (108, CAST(N'2022-07-07T14:36:35.000' AS DateTime), 12)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (109, CAST(N'2021-12-12T14:03:22.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (110, CAST(N'2022-01-21T17:20:29.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (111, CAST(N'2023-05-07T07:31:44.000' AS DateTime), 14)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (112, CAST(N'2022-03-19T04:36:42.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (113, CAST(N'2021-12-22T16:53:53.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (114, CAST(N'2021-07-22T03:28:32.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (115, CAST(N'2022-08-06T10:13:52.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (116, CAST(N'2022-08-06T10:31:20.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (117, CAST(N'2022-07-01T02:07:29.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (118, CAST(N'2021-10-06T08:38:14.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (119, CAST(N'2023-02-13T20:21:31.000' AS DateTime), 14)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (120, CAST(N'2022-07-30T11:35:44.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (121, CAST(N'2023-05-19T03:32:46.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (122, CAST(N'2022-06-18T07:14:50.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (123, CAST(N'2023-04-01T11:28:30.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (124, CAST(N'2022-03-13T11:15:45.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (125, CAST(N'2022-05-26T18:03:46.000' AS DateTime), 8)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (126, CAST(N'2023-01-01T09:18:27.000' AS DateTime), 18)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (127, CAST(N'2021-09-14T03:46:59.000' AS DateTime), 20)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (128, CAST(N'2022-07-07T14:36:35.000' AS DateTime), 12)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (129, CAST(N'2021-12-12T14:03:22.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (130, CAST(N'2022-01-21T17:20:29.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (131, CAST(N'2023-05-07T07:31:44.000' AS DateTime), 14)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (132, CAST(N'2022-03-19T04:36:42.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (133, CAST(N'2021-12-22T16:53:53.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (134, CAST(N'2021-07-22T03:28:32.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (135, CAST(N'2022-08-06T10:13:52.000' AS DateTime), 16)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (136, CAST(N'2022-08-06T10:31:20.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (137, CAST(N'2022-07-01T02:07:29.000' AS DateTime), 6)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (138, CAST(N'2021-10-06T08:38:14.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (139, CAST(N'2023-02-13T20:21:31.000' AS DateTime), 7)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (140, CAST(N'2022-07-30T11:35:44.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (141, CAST(N'2023-05-19T03:32:46.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (142, CAST(N'2022-06-18T07:14:50.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (143, CAST(N'2023-04-01T11:28:30.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (144, CAST(N'2022-03-13T11:15:45.000' AS DateTime), 17)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (145, CAST(N'2022-05-26T18:03:46.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (146, CAST(N'2023-01-01T09:18:27.000' AS DateTime), 19)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (147, CAST(N'2021-09-14T03:46:59.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (148, CAST(N'2022-07-07T14:36:35.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (149, CAST(N'2021-12-12T14:03:22.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (150, CAST(N'2022-01-21T17:20:29.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (151, CAST(N'2023-05-07T07:31:44.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (152, CAST(N'2022-03-19T04:36:42.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (153, CAST(N'2021-12-22T16:53:53.000' AS DateTime), 13)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (154, CAST(N'2021-07-22T03:28:32.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (155, CAST(N'2022-08-06T10:13:52.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (156, CAST(N'2022-08-06T10:31:20.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (157, CAST(N'2022-07-01T02:07:29.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (158, CAST(N'2021-10-06T08:38:14.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (159, CAST(N'2023-02-13T20:21:31.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (160, CAST(N'2022-07-30T11:35:44.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (161, CAST(N'2023-05-19T03:32:46.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (162, CAST(N'2022-06-18T07:14:50.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (163, CAST(N'2023-04-01T11:28:30.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (164, CAST(N'2022-03-13T11:15:45.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (165, CAST(N'2022-05-26T18:03:46.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (166, CAST(N'2023-01-01T09:18:27.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (167, CAST(N'2021-09-14T03:46:59.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (168, CAST(N'2022-07-07T14:36:35.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (169, CAST(N'2021-12-12T14:03:22.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (170, CAST(N'2022-01-21T17:20:29.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (171, CAST(N'2023-05-07T07:31:44.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (172, CAST(N'2022-03-19T04:36:42.000' AS DateTime), 7)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (173, CAST(N'2021-12-22T16:53:53.000' AS DateTime), 19)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (174, CAST(N'2021-07-22T03:28:32.000' AS DateTime), 19)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (175, CAST(N'2022-08-06T10:13:52.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (176, CAST(N'2022-08-06T10:31:20.000' AS DateTime), 17)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (177, CAST(N'2022-07-01T02:07:29.000' AS DateTime), 9)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (178, CAST(N'2021-10-06T08:38:14.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (179, CAST(N'2023-02-13T20:21:31.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (180, CAST(N'2022-07-30T11:35:44.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (181, CAST(N'2023-05-19T03:32:46.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (182, CAST(N'2022-06-18T07:14:50.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (183, CAST(N'2023-04-01T11:28:30.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (184, CAST(N'2022-03-13T11:15:45.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (185, CAST(N'2022-05-26T18:03:46.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (186, CAST(N'2023-01-01T09:18:27.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (187, CAST(N'2021-09-14T03:46:59.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (188, CAST(N'2022-07-07T14:36:35.000' AS DateTime), 15)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (189, CAST(N'2021-12-12T14:03:22.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (190, CAST(N'2022-01-21T17:20:29.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (191, CAST(N'2023-05-07T07:31:44.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (192, CAST(N'2022-03-19T04:36:42.000' AS DateTime), 7)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (193, CAST(N'2021-12-22T16:53:53.000' AS DateTime), 19)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (194, CAST(N'2021-07-22T03:28:32.000' AS DateTime), 19)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (195, CAST(N'2022-08-06T10:13:52.000' AS DateTime), 11)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (196, CAST(N'2022-08-06T10:31:20.000' AS DateTime), 17)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (197, CAST(N'2022-07-01T02:07:29.000' AS DateTime), 9)
GO
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (1, N'Jason Mcgee', 0, N'eu@protonmail.couk', CAST(N'2015-11-16T02:43:39.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (2, N'Whitney West', 1, N'aliquam.nisl@google.org', CAST(N'2014-06-07T14:04:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (3, N'Brooke Willis', 1, N'pulvinar.arcu.et@aol.couk', CAST(N'2014-07-17T16:51:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (4, N'Emmanuel Pollard', 0, N'molestie.dapibus@google.ca', CAST(N'2014-03-12T10:11:31.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (5, N'Olivia Fry', 0, N'nulla@protonmail.edu', CAST(N'2016-03-06T10:21:37.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (6, N'Darryl Banks', 1, N'ligula@hotmail.net', CAST(N'2014-05-03T00:03:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (7, N'Aiko Hunter', 1, N'sed@icloud.couk', CAST(N'2016-05-23T11:07:43.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (8, N'Craig Drake', 1, N'convallis.erat@icloud.net', CAST(N'2014-02-23T23:54:38.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (9, N'William Mccormick', 1, N'egestas.nunc@google.com', CAST(N'2016-06-16T11:06:53.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (10, N'Jacqueline Alexander', 0, N'risus.quis.diam@protonmail.couk', CAST(N'2015-03-15T01:28:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (11, N'Katell Martinez', 1, N'ullamcorper.nisl@aol.com', CAST(N'2016-06-06T04:44:13.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (12, N'Ciaran Dejesus', 1, N'orci.phasellus@outlook.edu', CAST(N'2014-01-07T18:44:30.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (13, N'Lars Fox', 0, N'aliquet.phasellus.fermentum@icloud.org', CAST(N'2014-03-08T14:36:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (14, N'Quamar Carter', 1, N'non.luctus.sit@protonmail.couk', CAST(N'2014-08-27T19:23:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (15, N'Linus Washington', 0, N'cum@aol.org', CAST(N'2014-03-10T10:36:29.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (16, N'Bruce Blackwell', 0, N'non.hendrerit@icloud.ca', CAST(N'2014-08-12T21:37:36.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (17, N'Nash Reese', 0, N'lorem.eu@outlook.com', CAST(N'2015-01-26T04:27:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (18, N'Kaitlin Dennis', 1, N'et.netus.et@icloud.couk', CAST(N'2015-04-24T21:06:21.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (19, N'Veda Parker', 1, N'molestie@protonmail.org', CAST(N'2015-02-07T01:40:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (20, N'Nathan Caldwell', 0, N'dictum.proin@google.ca', CAST(N'2015-12-21T04:09:06.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (21, N'Jason Mcgee', 0, N'eu@protonmail.couk', CAST(N'2015-11-16T02:43:39.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (22, N'Whitney West', 1, N'aliquam.nisl@google.org', CAST(N'2014-06-07T14:04:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (23, N'Brooke Willis', 1, N'pulvinar.arcu.et@aol.couk', CAST(N'2014-07-17T16:51:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (24, N'Emmanuel Pollard', 0, N'molestie.dapibus@google.ca', CAST(N'2014-03-12T10:11:31.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (25, N'Olivia Fry', 0, N'nulla@protonmail.edu', CAST(N'2016-03-06T10:21:37.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (26, N'Darryl Banks', 1, N'ligula@hotmail.net', CAST(N'2014-05-03T00:03:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (27, N'Aiko Hunter', 1, N'sed@icloud.couk', CAST(N'2016-05-23T11:07:43.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (28, N'Craig Drake', 1, N'convallis.erat@icloud.net', CAST(N'2014-02-23T23:54:38.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (29, N'William Mccormick', 1, N'egestas.nunc@google.com', CAST(N'2016-06-16T11:06:53.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (30, N'Jacqueline Alexander', 0, N'risus.quis.diam@protonmail.couk', CAST(N'2015-03-15T01:28:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (31, N'Katell Martinez', 1, N'ullamcorper.nisl@aol.com', CAST(N'2016-06-06T04:44:13.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (32, N'Ciaran Dejesus', 1, N'orci.phasellus@outlook.edu', CAST(N'2014-01-07T18:44:30.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (33, N'Lars Fox', 0, N'aliquet.phasellus.fermentum@icloud.org', CAST(N'2014-03-08T14:36:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (34, N'Quamar Carter', 1, N'non.luctus.sit@protonmail.couk', CAST(N'2014-08-27T19:23:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (35, N'Linus Washington', 0, N'cum@aol.org', CAST(N'2014-03-10T10:36:29.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (36, N'Bruce Blackwell', 0, N'non.hendrerit@icloud.ca', CAST(N'2014-08-12T21:37:36.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (37, N'Nash Reese', 0, N'lorem.eu@outlook.com', CAST(N'2015-01-26T04:27:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (38, N'Kaitlin Dennis', 1, N'et.netus.et@icloud.couk', CAST(N'2015-04-24T21:06:21.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (39, N'Veda Parker', 1, N'molestie@protonmail.org', CAST(N'2015-02-07T01:40:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (40, N'Nathan Caldwell', 0, N'dictum.proin@google.ca', CAST(N'2015-12-21T04:09:06.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (41, N' Lars Fox', 1, N'aawrrs@oos.com', CAST(N'2014-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (42, N'Jason Mcgee', 0, N'eu@protonmail.couk', CAST(N'2015-11-16T02:43:39.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (43, N'Whitney West', 1, N'aliquam.nisl@google.org', CAST(N'2014-06-07T14:04:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (44, N'Brooke Willis', 1, N'pulvinar.arcu.et@aol.couk', CAST(N'2014-07-17T16:51:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (45, N'Emmanuel Pollard', 0, N'molestie.dapibus@google.ca', CAST(N'2014-03-12T10:11:31.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (46, N'Olivia Fry', 0, N'nulla@protonmail.edu', CAST(N'2016-03-06T10:21:37.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (47, N'Darryl Banks', 1, N'ligula@hotmail.net', CAST(N'2014-05-03T00:03:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (48, N'Aiko Hunter', 1, N'sed@icloud.couk', CAST(N'2016-05-23T11:07:43.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (49, N'Craig Drake', 1, N'convallis.erat@icloud.net', CAST(N'2014-02-23T23:54:38.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (50, N'William Mccormick', 1, N'egestas.nunc@google.com', CAST(N'2016-06-16T11:06:53.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (51, N'Jacqueline Alexander', 0, N'risus.quis.diam@protonmail.couk', CAST(N'2015-03-15T01:28:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (52, N'Katell Martinez', 1, N'ullamcorper.nisl@aol.com', CAST(N'2016-06-06T04:44:13.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (53, N'Ciaran Dejesus', 1, N'orci.phasellus@outlook.edu', CAST(N'2014-01-07T18:44:30.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (54, N'Lars Fox', 0, N'aliquet.phasellus.fermentum@icloud.org', CAST(N'2014-03-08T14:36:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (55, N'Quamar Carter', 1, N'non.luctus.sit@protonmail.couk', CAST(N'2014-08-27T19:23:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (56, N'Linus Washington', 0, N'cum@aol.org', CAST(N'2014-03-10T10:36:29.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (57, N'Bruce Blackwell', 0, N'non.hendrerit@icloud.ca', CAST(N'2014-08-12T21:37:36.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (58, N'Nash Reese', 0, N'lorem.eu@outlook.com', CAST(N'2015-01-26T04:27:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (59, N'Kaitlin Dennis', 1, N'et.netus.et@icloud.couk', CAST(N'2015-04-24T21:06:21.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (60, N'Veda Parker', 1, N'molestie@protonmail.org', CAST(N'2015-02-07T01:40:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (61, N'Nathan Caldwell', 0, N'dictum.proin@google.ca', CAST(N'2015-12-21T04:09:06.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (62, N'Jason Mcgee', 0, N'eu@protonmail.couk', CAST(N'2015-11-16T02:43:39.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (63, N'Whitney West', 1, N'aliquam.nisl@google.org', CAST(N'2014-06-07T14:04:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (64, N'Brooke Willis', 1, N'pulvinar.arcu.et@aol.couk', CAST(N'2014-07-17T16:51:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (65, N'Emmanuel Pollard', 0, N'molestie.dapibus@google.ca', CAST(N'2014-03-12T10:11:31.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (66, N'Olivia Fry', 0, N'nulla@protonmail.edu', CAST(N'2016-03-06T10:21:37.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (67, N'Darryl Banks', 1, N'ligula@hotmail.net', CAST(N'2014-05-03T00:03:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (68, N'Aiko Hunter', 1, N'sed@icloud.couk', CAST(N'2016-05-23T11:07:43.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (69, N'Craig Drake', 1, N'convallis.erat@icloud.net', CAST(N'2014-02-23T23:54:38.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (70, N'William Mccormick', 1, N'egestas.nunc@google.com', CAST(N'2016-06-16T11:06:53.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (71, N'Jacqueline Alexander', 0, N'risus.quis.diam@protonmail.couk', CAST(N'2015-03-15T01:28:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (72, N'Katell Martinez', 1, N'ullamcorper.nisl@aol.com', CAST(N'2016-06-06T04:44:13.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (73, N'Ciaran Dejesus', 1, N'orci.phasellus@outlook.edu', CAST(N'2014-01-07T18:44:30.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (74, N'Lars Fox', 0, N'aliquet.phasellus.fermentum@icloud.org', CAST(N'2014-03-08T14:36:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (75, N'Quamar Carter', 1, N'non.luctus.sit@protonmail.couk', CAST(N'2014-08-27T19:23:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (76, N'Linus Washington', 0, N'cum@aol.org', CAST(N'2014-03-10T10:36:29.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (77, N'Bruce Blackwell', 0, N'non.hendrerit@icloud.ca', CAST(N'2014-08-12T21:37:36.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (78, N'Nash Reese', 0, N'lorem.eu@outlook.com', CAST(N'2015-01-26T04:27:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (79, N'Kaitlin Dennis', 1, N'et.netus.et@icloud.couk', CAST(N'2015-04-24T21:06:21.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (80, N'Veda Parker', 1, N'molestie@protonmail.org', CAST(N'2015-02-07T01:40:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (81, N'Nathan Caldwell', 0, N'dictum.proin@google.ca', CAST(N'2015-12-21T04:09:06.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (82, N'Jason Mcgee', 0, N'eu@protonmail.couk', CAST(N'2015-11-16T02:43:39.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (83, N'Whitney West', 1, N'aliquam.nisl@google.org', CAST(N'2014-06-07T14:04:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (84, N'Brooke Willis', 1, N'pulvinar.arcu.et@aol.couk', CAST(N'2014-07-17T16:51:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (85, N'Emmanuel Pollard', 0, N'molestie.dapibus@google.ca', CAST(N'2014-03-12T10:11:31.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (86, N'Olivia Fry', 0, N'nulla@protonmail.edu', CAST(N'2016-03-06T10:21:37.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (87, N'Darryl Banks', 1, N'ligula@hotmail.net', CAST(N'2014-05-03T00:03:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (88, N'Aiko Hunter', 1, N'sed@icloud.couk', CAST(N'2016-05-23T11:07:43.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (89, N'Craig Drake', 1, N'convallis.erat@icloud.net', CAST(N'2014-02-23T23:54:38.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (90, N'William Mccormick', 1, N'egestas.nunc@google.com', CAST(N'2016-06-16T11:06:53.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (91, N'Jacqueline Alexander', 0, N'risus.quis.diam@protonmail.couk', CAST(N'2015-03-15T01:28:12.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (92, N'Katell Martinez', 1, N'ullamcorper.nisl@aol.com', CAST(N'2016-06-06T04:44:13.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (93, N'Ciaran Dejesus', 1, N'orci.phasellus@outlook.edu', CAST(N'2014-01-07T18:44:30.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (94, N'Lars Fox', 0, N'aliquet.phasellus.fermentum@icloud.org', CAST(N'2014-03-08T14:36:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (95, N'Quamar Carter', 1, N'non.luctus.sit@protonmail.couk', CAST(N'2014-08-27T19:23:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (96, N'Linus Washington', 0, N'cum@aol.org', CAST(N'2014-03-10T10:36:29.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (97, N'Bruce Blackwell', 0, N'non.hendrerit@icloud.ca', CAST(N'2014-08-12T21:37:36.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (98, N'Nash Reese', 0, N'lorem.eu@outlook.com', CAST(N'2015-01-26T04:27:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (99, N'Kaitlin Dennis', 1, N'et.netus.et@icloud.couk', CAST(N'2015-04-24T21:06:21.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (100, N'Veda Parker', 1, N'molestie@protonmail.org', CAST(N'2015-02-07T01:40:01.000' AS DateTime))
GO
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (101, N'Giselle Collier', 1, N'tincidunt.nibh@icloud.couk', CAST(N'2012-07-28T18:21:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (102, N'Hayes Shelton', 0, N'quis.pede@outlook.com', CAST(N'2012-03-13T10:35:42.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (103, N'Adria Davis', 1, N'ipsum@hotmail.couk', CAST(N'2012-03-02T04:00:51.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (104, N'Bert Fletcher', 1, N'suspendisse.ac.metus@icloud.org', CAST(N'2012-02-18T17:49:27.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (105, N'Aiko Hewitt', 0, N'netus.et@hotmail.com', CAST(N'2012-03-12T00:25:07.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (106, N'Farrah Cochran', 0, N'tellus.non.magna@icloud.org', CAST(N'2012-04-23T00:50:08.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (107, N'Macy Dotson', 0, N'dolor.sit.amet@hotmail.ca', CAST(N'2012-07-01T03:50:22.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (108, N'Marshall Lane', 1, N'arcu.vestibulum@protonmail.org', CAST(N'2012-03-18T13:31:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (109, N'Slade Nguyen', 0, N'phasellus@hotmail.ca', CAST(N'2012-07-19T05:55:20.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (110, N'Russell Vasquez', 1, N'sed.hendrerit@yahoo.com', CAST(N'2012-03-21T13:54:56.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (111, N'Indigo Porter', 0, N'blandit@icloud.edu', CAST(N'2012-05-23T04:07:56.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (112, N'Fredericka Battle', 1, N'libero.dui@google.edu', CAST(N'2012-07-21T05:57:42.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (113, N'Alexandra Ashley', 1, N'sapien.gravida.non@icloud.couk', CAST(N'2012-06-11T11:17:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (114, N'Ali Mendez', 0, N'dolor.dapibus@aol.org', CAST(N'2012-05-09T11:56:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (115, N'Silas Bridges', 0, N'consectetuer.mauris.id@aol.edu', CAST(N'2012-03-21T20:59:22.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (116, N'Hayfa Woodward', 0, N'nulla.integer.urna@icloud.net', CAST(N'2012-04-12T23:24:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (117, N'Maia Estrada', 1, N'facilisis@protonmail.org', CAST(N'2012-07-12T02:11:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (118, N'Harper Lawson', 1, N'in@aol.couk', CAST(N'2012-05-02T04:45:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (119, N'Garth Gillespie', 1, N'nunc.risus.varius@protonmail.edu', CAST(N'2012-06-11T20:55:20.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (120, N'Donovan Livingston', 0, N'duis.mi@aol.net', CAST(N'2012-08-02T10:38:03.000' AS DateTime))
GO
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (1, N'MAD')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (2, N'DBI')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (3, N'PRO')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (4, N'PRF')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (5, N'MAE')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (6, N'LAB')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (7, N'CSD')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (8, N'SSG')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (9, N'OSG')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (10, N'JPD')
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Info_Assessment] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Info_Assessment] ([Category_ID])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Info_Assessment]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Subject] FOREIGN KEY([suid])
REFERENCES [dbo].[Subject] ([suid])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Subject]
GO
ALTER TABLE [dbo].[G_Student]  WITH CHECK ADD  CONSTRAINT [FK_G_Student_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[G_Student] CHECK CONSTRAINT [FK_G_Student_Group]
GO
ALTER TABLE [dbo].[G_Student]  WITH CHECK ADD  CONSTRAINT [FK_G_Student_Student1] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[G_Student] CHECK CONSTRAINT [FK_G_Student_Student1]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecture] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecture] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecture]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([suid])
REFERENCES [dbo].[Subject] ([suid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[ScoreTable]  WITH CHECK ADD  CONSTRAINT [FK_ScoreTable_Assessment] FOREIGN KEY([aid])
REFERENCES [dbo].[Assessment] ([aid])
GO
ALTER TABLE [dbo].[ScoreTable] CHECK CONSTRAINT [FK_ScoreTable_Assessment]
GO
ALTER TABLE [dbo].[ScoreTable]  WITH CHECK ADD  CONSTRAINT [FK_ScoreTable_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[ScoreTable] CHECK CONSTRAINT [FK_ScoreTable_Student]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Group]
GO
USE [master]
GO
ALTER DATABASE [ASM_DBI] SET  READ_WRITE 
GO
