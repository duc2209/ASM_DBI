USE [master]
GO
/****** Object:  Database [ASM_DBI]    Script Date: 7/17/2022 10:08:10 PM ******/
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
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[G_Student]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[Info_Assessment]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[Lecture]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[ScoreTable]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 7/17/2022 10:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[seid] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[gid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[seid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/17/2022 10:08:11 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 7/17/2022 10:08:11 PM ******/
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
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (1, 1, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (2, 1, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (3, 1, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (4, 1, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (5, 1, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (6, 2, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (7, 2, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (8, 2, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (9, 2, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (10, 2, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (11, 3, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (12, 3, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (13, 3, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (14, 3, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (15, 3, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (16, 4, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (17, 4, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (18, 4, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (19, 4, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (20, 4, 5)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (21, 5, 1)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (22, 5, 2)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (23, 5, 3)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (24, 5, 4)
INSERT [dbo].[Assessment] ([aid], [suid], [Category_ID]) VALUES (25, 5, 5)
GO
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (1, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (2, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (3, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (4, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (5, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (5, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (5, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (5, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (5, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (6, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (6, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (6, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (6, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (6, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (7, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (8, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (8, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (8, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (8, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (8, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (9, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (10, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (11, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (11, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (11, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (11, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (11, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (12, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (13, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (13, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (13, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (13, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (13, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (14, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (15, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (15, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (15, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (15, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (15, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (16, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (16, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (16, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (16, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (16, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (17, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (17, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (17, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (17, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (17, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (18, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (19, 5)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 1)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 2)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 3)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 4)
INSERT [dbo].[G_Student] ([sid], [gid]) VALUES (20, 5)
GO
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (1, N'Iaculis Odio Nam Company', 5, 1)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (2, N'Suspendisse Limited', 1, 2)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (3, N'Lacinia Vitae Limited', 3, 3)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (4, N'Ipsum Porta Associates', 4, 4)
INSERT [dbo].[Group] ([gid], [gname], [lid], [suid]) VALUES (5, N'Mollis Incorporated', 5, 5)
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
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (1, 1, 1, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (2, 1, 2, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (3, 1, 3, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (4, 1, 4, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (5, 1, 5, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (6, 1, 6, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (7, 1, 7, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (8, 1, 8, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (9, 1, 9, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (10, 1, 10, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (11, 1, 11, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (12, 1, 12, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (13, 1, 13, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (14, 1, 14, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (15, 1, 15, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (16, 1, 16, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (17, 1, 17, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (18, 1, 18, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (19, 1, 19, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (20, 1, 20, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (21, 2, 1, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (22, 2, 2, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (23, 2, 3, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (24, 2, 4, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (25, 2, 5, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (26, 2, 6, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (27, 2, 7, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (28, 2, 8, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (29, 2, 9, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (30, 2, 10, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (31, 2, 11, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (32, 2, 12, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (33, 2, 13, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (34, 2, 14, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (35, 2, 15, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (36, 2, 16, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (37, 2, 17, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (38, 2, 18, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (39, 2, 19, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (40, 2, 20, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (41, 3, 1, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (42, 3, 2, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (43, 3, 3, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (44, 3, 4, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (45, 3, 5, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (46, 3, 6, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (47, 3, 7, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (48, 3, 8, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (49, 3, 9, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (50, 3, 10, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (51, 3, 11, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (52, 3, 12, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (53, 3, 13, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (54, 3, 14, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (55, 3, 15, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (56, 3, 16, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (57, 3, 17, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (58, 3, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (59, 3, 19, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (60, 3, 20, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (61, 4, 1, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (62, 4, 2, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (63, 4, 3, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (64, 4, 4, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (65, 4, 5, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (66, 4, 6, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (67, 4, 7, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (68, 4, 8, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (69, 4, 9, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (70, 4, 10, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (71, 4, 11, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (72, 4, 12, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (73, 4, 13, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (74, 4, 14, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (75, 4, 15, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (76, 4, 16, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (77, 4, 17, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (78, 4, 18, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (79, 4, 19, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (80, 4, 20, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (81, 5, 1, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (82, 5, 2, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (83, 5, 3, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (84, 5, 4, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (85, 5, 5, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (86, 5, 6, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (87, 5, 7, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (88, 5, 8, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (89, 5, 9, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (90, 5, 10, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (91, 5, 11, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (92, 5, 12, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (93, 5, 13, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (94, 5, 14, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (95, 5, 15, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (96, 5, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (97, 5, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (98, 5, 18, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (99, 5, 19, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (100, 5, 20, 3)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (101, 6, 1, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (102, 6, 2, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (103, 6, 3, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (104, 6, 4, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (105, 6, 5, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (106, 6, 6, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (107, 6, 7, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (108, 6, 8, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (109, 6, 9, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (110, 6, 10, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (111, 6, 11, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (112, 6, 12, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (113, 6, 13, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (114, 6, 14, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (115, 6, 15, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (116, 6, 16, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (117, 6, 17, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (118, 6, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (119, 6, 19, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (120, 6, 20, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (121, 7, 1, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (122, 7, 2, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (123, 7, 3, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (124, 7, 4, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (125, 7, 5, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (126, 7, 6, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (127, 7, 7, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (128, 7, 8, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (129, 7, 9, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (130, 7, 10, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (131, 7, 11, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (132, 7, 12, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (133, 7, 13, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (134, 7, 14, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (135, 7, 15, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (136, 7, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (137, 7, 17, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (138, 7, 18, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (139, 7, 19, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (140, 7, 20, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (141, 8, 1, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (142, 8, 2, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (143, 8, 3, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (144, 8, 4, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (145, 8, 5, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (146, 8, 6, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (147, 8, 7, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (148, 8, 8, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (149, 8, 9, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (150, 8, 10, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (151, 8, 11, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (152, 8, 12, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (153, 8, 13, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (154, 8, 14, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (155, 8, 15, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (156, 8, 16, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (157, 8, 17, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (158, 8, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (159, 8, 19, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (160, 8, 20, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (161, 9, 1, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (162, 9, 2, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (163, 9, 3, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (164, 9, 4, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (165, 9, 5, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (166, 9, 6, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (167, 9, 7, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (168, 9, 8, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (169, 9, 9, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (170, 9, 10, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (171, 9, 11, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (172, 9, 12, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (173, 9, 13, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (174, 9, 14, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (175, 9, 15, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (176, 9, 16, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (177, 9, 17, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (178, 9, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (179, 9, 19, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (180, 9, 20, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (181, 10, 1, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (182, 10, 2, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (183, 10, 3, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (184, 10, 4, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (185, 10, 5, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (186, 10, 6, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (187, 10, 7, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (188, 10, 8, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (189, 10, 9, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (190, 10, 10, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (191, 10, 11, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (192, 10, 12, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (193, 10, 13, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (194, 10, 14, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (195, 10, 15, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (196, 10, 16, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (197, 10, 17, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (198, 10, 18, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (199, 10, 19, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (200, 10, 20, 6)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (201, 11, 1, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (202, 11, 2, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (203, 11, 3, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (204, 11, 4, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (205, 11, 5, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (206, 11, 6, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (207, 11, 7, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (208, 11, 8, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (209, 11, 9, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (210, 11, 10, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (211, 11, 11, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (212, 11, 12, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (213, 11, 13, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (214, 11, 14, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (215, 11, 15, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (216, 11, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (217, 11, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (218, 11, 18, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (219, 11, 19, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (220, 11, 20, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (221, 12, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (222, 12, 2, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (223, 12, 3, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (224, 12, 4, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (225, 12, 5, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (226, 12, 6, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (227, 12, 7, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (228, 12, 8, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (229, 12, 9, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (230, 12, 10, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (231, 12, 11, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (232, 12, 12, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (233, 12, 13, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (234, 12, 14, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (235, 12, 15, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (236, 12, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (237, 12, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (238, 12, 18, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (239, 12, 19, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (240, 12, 20, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (241, 13, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (242, 13, 2, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (243, 13, 3, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (244, 13, 4, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (245, 13, 5, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (246, 13, 6, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (247, 13, 7, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (248, 13, 8, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (249, 13, 9, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (250, 13, 10, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (251, 13, 11, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (252, 13, 12, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (253, 13, 13, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (254, 13, 14, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (255, 13, 15, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (256, 13, 16, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (257, 13, 17, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (258, 13, 18, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (259, 13, 19, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (260, 13, 20, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (261, 14, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (262, 14, 2, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (263, 14, 3, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (264, 14, 4, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (265, 14, 5, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (266, 14, 6, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (267, 14, 7, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (268, 14, 8, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (269, 14, 9, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (270, 14, 10, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (271, 14, 11, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (272, 14, 12, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (273, 14, 13, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (274, 14, 14, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (275, 14, 15, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (276, 14, 16, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (277, 14, 17, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (278, 14, 18, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (279, 14, 19, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (280, 14, 20, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (281, 15, 1, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (282, 15, 2, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (283, 15, 3, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (284, 15, 4, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (285, 15, 5, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (286, 15, 6, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (287, 15, 7, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (288, 15, 8, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (289, 15, 9, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (290, 15, 10, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (291, 15, 11, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (292, 15, 12, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (293, 15, 13, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (294, 15, 14, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (295, 15, 15, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (296, 15, 16, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (297, 15, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (298, 15, 18, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (299, 15, 19, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (300, 15, 20, 8)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (301, 16, 1, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (302, 16, 2, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (303, 16, 3, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (304, 16, 4, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (305, 16, 5, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (306, 16, 6, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (307, 16, 7, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (308, 16, 8, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (309, 16, 9, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (310, 16, 10, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (311, 16, 11, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (312, 16, 12, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (313, 16, 13, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (314, 16, 14, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (315, 16, 15, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (316, 16, 16, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (317, 16, 17, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (318, 16, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (319, 16, 19, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (320, 16, 20, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (321, 17, 1, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (322, 17, 2, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (323, 17, 3, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (324, 17, 4, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (325, 17, 5, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (326, 17, 6, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (327, 17, 7, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (328, 17, 8, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (329, 17, 9, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (330, 17, 10, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (331, 17, 11, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (332, 17, 12, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (333, 17, 13, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (334, 17, 14, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (335, 17, 15, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (336, 17, 16, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (337, 17, 17, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (338, 17, 18, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (339, 17, 19, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (340, 17, 20, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (341, 18, 1, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (342, 18, 2, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (343, 18, 3, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (344, 18, 4, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (345, 18, 5, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (346, 18, 6, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (347, 18, 7, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (348, 18, 8, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (349, 18, 9, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (350, 18, 10, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (351, 18, 11, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (352, 18, 12, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (353, 18, 13, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (354, 18, 14, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (355, 18, 15, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (356, 18, 16, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (357, 18, 17, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (358, 18, 18, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (359, 18, 19, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (360, 18, 20, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (361, 19, 1, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (362, 19, 2, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (363, 19, 3, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (364, 19, 4, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (365, 19, 5, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (366, 19, 6, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (367, 19, 7, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (368, 19, 8, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (369, 19, 9, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (370, 19, 10, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (371, 19, 11, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (372, 19, 12, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (373, 19, 13, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (374, 19, 14, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (375, 19, 15, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (376, 19, 16, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (377, 19, 17, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (378, 19, 18, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (379, 19, 19, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (380, 19, 20, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (381, 20, 1, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (382, 20, 2, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (383, 20, 3, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (384, 20, 4, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (385, 20, 5, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (386, 20, 6, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (387, 20, 7, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (388, 20, 8, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (389, 20, 9, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (390, 20, 10, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (391, 20, 11, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (392, 20, 12, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (393, 20, 13, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (394, 20, 14, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (395, 20, 15, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (396, 20, 16, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (397, 20, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (398, 20, 18, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (399, 20, 19, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (400, 20, 20, 3)
GO
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (401, 21, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (402, 21, 2, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (403, 21, 3, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (404, 21, 4, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (405, 21, 5, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (406, 21, 6, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (407, 21, 7, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (408, 21, 8, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (409, 21, 9, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (410, 21, 10, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (411, 21, 11, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (412, 21, 12, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (413, 21, 13, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (414, 21, 14, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (415, 21, 15, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (416, 21, 16, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (417, 21, 17, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (418, 21, 18, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (419, 21, 19, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (420, 21, 20, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (421, 22, 1, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (422, 22, 2, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (423, 22, 3, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (424, 22, 4, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (425, 22, 5, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (426, 22, 6, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (427, 22, 7, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (428, 22, 8, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (429, 22, 9, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (430, 22, 10, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (431, 22, 11, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (432, 22, 12, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (433, 22, 13, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (434, 22, 14, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (435, 22, 15, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (436, 22, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (437, 22, 17, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (438, 22, 18, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (439, 22, 19, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (440, 22, 20, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (441, 23, 1, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (442, 23, 2, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (443, 23, 3, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (444, 23, 4, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (445, 23, 5, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (446, 23, 6, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (447, 23, 7, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (448, 23, 8, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (449, 23, 9, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (450, 23, 10, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (451, 23, 11, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (452, 23, 12, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (453, 23, 13, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (454, 23, 14, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (455, 23, 15, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (456, 23, 16, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (457, 23, 17, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (458, 23, 18, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (459, 23, 19, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (460, 23, 20, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (461, 24, 1, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (462, 24, 2, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (463, 24, 3, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (464, 24, 4, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (465, 24, 5, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (466, 24, 6, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (467, 24, 7, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (468, 24, 8, 7)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (469, 24, 9, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (470, 24, 10, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (471, 24, 11, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (472, 24, 12, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (473, 24, 13, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (474, 24, 14, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (475, 24, 15, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (476, 24, 16, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (477, 24, 17, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (478, 24, 18, 6)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (479, 24, 19, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (480, 24, 20, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (481, 25, 1, 3)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (482, 25, 2, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (483, 25, 3, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (484, 25, 4, 5)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (485, 25, 5, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (486, 25, 6, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (487, 25, 7, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (488, 25, 8, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (489, 25, 9, 1)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (490, 25, 10, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (491, 25, 11, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (492, 25, 12, 0)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (493, 25, 13, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (494, 25, 14, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (495, 25, 15, 8)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (496, 25, 16, 2)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (497, 25, 17, 9)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (498, 25, 18, 4)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (499, 25, 19, 10)
INSERT [dbo].[ScoreTable] ([stid], [aid], [sid], [score]) VALUES (500, 25, 20, 5)
GO
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (1, CAST(N'2021-12-22T21:14:46.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (2, CAST(N'2021-02-15T13:48:49.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (3, CAST(N'2020-08-22T06:37:40.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (4, CAST(N'2021-12-08T05:03:32.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (5, CAST(N'2021-05-18T18:47:35.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (6, CAST(N'2021-01-07T06:37:54.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (7, CAST(N'2021-03-25T22:24:54.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (8, CAST(N'2021-11-05T08:22:53.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (9, CAST(N'2021-10-02T06:34:58.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (10, CAST(N'2021-12-16T00:38:11.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (11, CAST(N'2020-10-08T14:25:45.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (12, CAST(N'2021-09-13T11:39:53.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (13, CAST(N'2021-03-04T23:32:41.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (14, CAST(N'2020-12-27T03:23:03.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (15, CAST(N'2022-03-12T06:13:36.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (16, CAST(N'2021-07-30T12:31:07.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (17, CAST(N'2020-12-27T02:17:53.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (18, CAST(N'2020-08-21T07:38:01.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (19, CAST(N'2022-02-09T00:50:25.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (20, CAST(N'2021-08-05T20:41:39.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (21, CAST(N'2021-11-20T08:45:48.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (22, CAST(N'2021-02-16T05:48:45.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (23, CAST(N'2021-05-17T05:02:05.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (24, CAST(N'2020-12-31T02:52:13.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (25, CAST(N'2021-01-13T03:43:11.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (26, CAST(N'2021-07-04T00:37:06.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (27, CAST(N'2021-02-21T08:09:51.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (28, CAST(N'2021-08-25T15:10:35.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (29, CAST(N'2021-03-06T19:48:39.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (30, CAST(N'2021-01-21T13:20:13.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (31, CAST(N'2020-11-27T18:00:49.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (32, CAST(N'2021-08-07T21:26:48.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (33, CAST(N'2021-12-06T12:38:40.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (34, CAST(N'2021-06-03T21:11:04.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (35, CAST(N'2021-11-15T00:58:36.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (36, CAST(N'2020-10-12T07:26:50.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (37, CAST(N'2021-05-23T11:29:57.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (38, CAST(N'2021-05-06T00:51:14.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (39, CAST(N'2021-03-01T03:57:40.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (40, CAST(N'2021-06-13T12:53:34.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (41, CAST(N'2020-12-27T17:09:38.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (42, CAST(N'2020-12-08T11:20:02.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (43, CAST(N'2021-12-30T20:40:27.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (44, CAST(N'2021-08-04T04:03:21.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (45, CAST(N'2020-11-12T12:09:05.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (46, CAST(N'2021-07-07T22:17:23.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (47, CAST(N'2021-09-30T12:25:40.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (48, CAST(N'2020-10-05T07:40:06.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (49, CAST(N'2020-10-30T16:40:43.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (50, CAST(N'2022-03-01T20:27:46.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (51, CAST(N'2020-09-02T06:12:33.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (52, CAST(N'2020-08-25T08:41:46.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (53, CAST(N'2020-07-30T09:30:34.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (54, CAST(N'2022-01-22T18:51:05.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (55, CAST(N'2020-12-18T17:27:21.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (56, CAST(N'2022-01-18T03:25:35.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (57, CAST(N'2020-09-21T15:52:02.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (58, CAST(N'2021-11-05T03:31:31.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (59, CAST(N'2021-05-01T13:52:52.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (60, CAST(N'2021-08-03T18:54:52.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (61, CAST(N'2020-07-28T04:36:14.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (62, CAST(N'2022-02-26T07:59:21.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (63, CAST(N'2021-09-24T00:39:51.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (64, CAST(N'2021-02-02T11:09:26.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (65, CAST(N'2021-09-28T21:52:57.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (66, CAST(N'2020-08-15T14:15:43.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (67, CAST(N'2021-06-14T21:40:10.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (68, CAST(N'2020-12-17T09:30:55.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (69, CAST(N'2021-02-22T00:02:27.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (70, CAST(N'2020-08-07T20:51:52.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (71, CAST(N'2021-09-09T23:33:26.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (72, CAST(N'2021-03-23T04:40:52.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (73, CAST(N'2021-07-03T18:43:16.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (74, CAST(N'2020-12-19T02:06:36.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (75, CAST(N'2022-01-04T05:26:43.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (76, CAST(N'2022-02-21T05:01:26.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (77, CAST(N'2021-05-21T21:04:07.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (78, CAST(N'2021-11-26T07:28:22.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (79, CAST(N'2020-08-19T16:53:52.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (80, CAST(N'2020-12-29T14:12:07.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (81, CAST(N'2021-07-09T01:51:50.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (82, CAST(N'2021-05-23T13:22:19.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (83, CAST(N'2020-12-03T13:09:42.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (84, CAST(N'2021-08-07T11:20:56.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (85, CAST(N'2022-01-17T00:28:17.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (86, CAST(N'2020-11-13T13:04:56.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (87, CAST(N'2020-12-06T02:17:27.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (88, CAST(N'2020-11-22T14:17:11.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (89, CAST(N'2020-07-25T12:28:46.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (90, CAST(N'2021-07-10T18:06:31.000' AS DateTime), 1)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (91, CAST(N'2021-02-15T11:32:41.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (92, CAST(N'2021-08-22T17:53:10.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (93, CAST(N'2021-01-03T20:59:15.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (94, CAST(N'2021-08-08T09:22:04.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (95, CAST(N'2020-11-11T15:09:05.000' AS DateTime), 4)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (96, CAST(N'2021-11-01T04:37:43.000' AS DateTime), 5)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (97, CAST(N'2021-08-06T05:29:21.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (98, CAST(N'2020-08-28T20:19:26.000' AS DateTime), 2)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (99, CAST(N'2021-08-24T15:13:04.000' AS DateTime), 3)
INSERT [dbo].[Section] ([seid], [date], [gid]) VALUES (100, CAST(N'2021-08-09T03:31:28.000' AS DateTime), 5)
GO
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (1, N'Jason Mcgee', 0, N'eu@protonmail.couk', CAST(N'2015-11-16T02:43:39.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (2, N'Whitney West', 1, N'aliquam.nisl@google.org', CAST(N'2014-06-07T14:04:00.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (3, N'Brooke Willis', 1, N'pulvinar.arcu.et@aol.couk', CAST(N'2014-07-17T16:51:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (4, N'Emmanuel Pollard', 0, N'molestie.dapibus@google.ca', CAST(N'2014-03-12T10:11:31.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (5, N'Olivia Fry', 0, N'nulla@protonmail.edu', CAST(N'2016-03-06T10:21:37.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (6, N'Slaaa Nguyen', 1, N'sed.hendrerit@yahoo.com', CAST(N'2012-03-21T13:54:56.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (7, N'Indigo Porter', 0, N'blandit@icloud.edu', CAST(N'2012-05-23T04:07:56.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (8, N'Fredericka Battle', 1, N'libero.dui@google.edu', CAST(N'2012-07-21T05:57:42.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (9, N'Ali Mendez', 0, N'dolor.dapibus@aol.org', CAST(N'2012-05-09T11:56:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (10, N'Maia Estrada', 1, N'facilisis@protonmail.org', CAST(N'2012-07-12T02:11:01.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (11, N'Silas Bridges', 0, N'consectetuer.mauris.id@aol.edu', CAST(N'2012-03-21T20:59:22.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (12, N'Hayfa Woodward', 0, N'nulla.integer.urna@icloud.net', CAST(N'2012-04-12T23:24:52.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (13, N'Harper Lawson', 1, N'in@aol.couk', CAST(N'2012-05-02T04:45:44.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (14, N'Garth Gillespie', 1, N'nunc.risus.varius@protonmail.edu', CAST(N'2012-06-11T20:55:20.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (15, N'Donovan Livingston', 0, N'duis.mi@aol.net', CAST(N'2012-08-02T10:38:03.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (16, N'Aiko Hewitt', 0, N'netus.et@hotmail.com', CAST(N'2012-03-12T00:25:07.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (17, N'Farrah Cochran', 0, N'tellus.non.magna@icloud.org', CAST(N'2012-04-23T00:50:08.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (18, N'Macy Dotson', 0, N'dolor.sit.amet@hotmail.ca', CAST(N'2012-07-01T03:50:22.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (19, N'Marshall Lane', 1, N'arcu.vestibulum@protonmail.org', CAST(N'2012-03-18T13:31:59.000' AS DateTime))
INSERT [dbo].[Student] ([sid], [sname], [gender], [address], [dob]) VALUES (20, N'Slade Nguyen', 0, N'phasellus@hotmail.ca', CAST(N'2012-07-19T05:55:20.000' AS DateTime))
GO
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (1, N'MAD')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (2, N'DBI')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (3, N'PRO')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (4, N'PRF')
INSERT [dbo].[Subject] ([suid], [suname]) VALUES (5, N'MAE')
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
ALTER TABLE [dbo].[Section]  WITH CHECK ADD FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
USE [master]
GO
ALTER DATABASE [ASM_DBI] SET  READ_WRITE 
GO
