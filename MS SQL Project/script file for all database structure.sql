USE [master]
GO
/****** Object:  Database [examination_system]    Script Date: 8/31/2023 12:20:24 AM ******/
CREATE DATABASE [examination_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'examination_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examination_system.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FG1] 
( NAME = N'examfile1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examfile1.ndf' , SIZE = 30720KB , MAXSIZE = 204800KB , FILEGROWTH = 5120KB ),
( NAME = N'examfile2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examfile2.ndf' , SIZE = 20480KB , MAXSIZE = 102400KB , FILEGROWTH = 5120KB ), 
 FILEGROUP [FG2] 
( NAME = N'examfile3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examfile3.ndf' , SIZE = 30720KB , MAXSIZE = 204800KB , FILEGROWTH = 5120KB ),
( NAME = N'examfile4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examfile4.ndf' , SIZE = 20480KB , MAXSIZE = 102400KB , FILEGROWTH = 5120KB ), 
 FILEGROUP [FG3] 
( NAME = N'examfile5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examfile5.ndf' , SIZE = 30720KB , MAXSIZE = 204800KB , FILEGROWTH = 5120KB ),
( NAME = N'examfile6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examfile6.ndf' , SIZE = 20480KB , MAXSIZE = 102400KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'examination_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\examination_system_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [examination_system] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [examination_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [examination_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [examination_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [examination_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [examination_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [examination_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [examination_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [examination_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [examination_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [examination_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [examination_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [examination_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [examination_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [examination_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [examination_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [examination_system] SET  ENABLE_BROKER 
GO
ALTER DATABASE [examination_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [examination_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [examination_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [examination_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [examination_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [examination_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [examination_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [examination_system] SET RECOVERY FULL 
GO
ALTER DATABASE [examination_system] SET  MULTI_USER 
GO
ALTER DATABASE [examination_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [examination_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [examination_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [examination_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [examination_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [examination_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'examination_system', N'ON'
GO
ALTER DATABASE [examination_system] SET QUERY_STORE = ON
GO
ALTER DATABASE [examination_system] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [examination_system]
GO
/****** Object:  User [std]    Script Date: 8/31/2023 12:20:25 AM ******/
CREATE USER [std] FOR LOGIN [std] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [mng]    Script Date: 8/31/2023 12:20:25 AM ******/
CREATE USER [mng] FOR LOGIN [mng] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [inst]    Script Date: 8/31/2023 12:20:25 AM ******/
CREATE USER [inst] FOR LOGIN [inst] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[checkIfTotalQuestionsDegreesEqualMaxDegreeOfCourse]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[checkIfTotalQuestionsDegreesEqualMaxDegreeOfCourse](
@mcq_num int,
@mcq_deg numeric(18,1),       
@tf_num int, @tf_deg numeric(18,1),     
@text_num int,@text_deg numeric(18,1) 
)
RETURNS NUMERIC(18,2)
AS
BEGIN
    DECLARE @result NUMERIC(18,2)
    SET @result = (@mcq_num * @mcq_deg) +(@tf_num*@tf_deg)+(@text_num*@text_deg);
	
	RETURN @result;
END
GO
/****** Object:  Table [dbo].[students]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[std_ssn] [char](14) NOT NULL,
	[std_email] [varchar](50) NULL,
	[full_name] [varchar](50) NOT NULL,
	[std_phone] [char](11) NOT NULL,
	[std_address] [varchar](100) NULL,
	[round_num] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[std_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[displayAllStudents]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[displayAllStudents]
AS
SELECT [std_ssn] as [Student SSN],
[full_name] as [Full Name],
[std_email] as [Email],
[std_phone] as [Phone],
[std_address] as [Address],
[round_num] as [Intake Round Number]
FROM students;
GO
/****** Object:  Table [dbo].[instructors]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructors](
	[inst_ssn] [char](14) NOT NULL,
	[full_name] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](11) NULL,
	[inst_address] [varchar](100) NULL,
	[hire_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[inst_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[displayAllInstructors]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[displayAllInstructors]
AS
	SELECT [inst_ssn] as [Instructor SSN],
	[full_name] as [Full Name],
    [email] as [Email],
	[phone] as [Phone],
	[inst_address] as [Address],
	[hire_date] as [Hire Date] 
	FROM instructors
GO
/****** Object:  Table [dbo].[exams]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[ex_id] [int] IDENTITY(1,1) NOT NULL,
	[ex_type] [char](10) NOT NULL,
	[ex_year] [date] NOT NULL,
	[str_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[total_time] [numeric](18, 2) NOT NULL,
	[inst_ssn] [char](14) NOT NULL,
	[round_num] [int] NOT NULL,
	[crs_code] [varchar](25) NOT NULL,
 CONSTRAINT [PK__exams__F6D3E4893FE844E6] PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG2]
) ON [FG2]
GO
/****** Object:  UserDefinedFunction [dbo].[getInfoAboutSpecificExam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION  [dbo].[getInfoAboutSpecificExam] (@ex_id INT)
RETURNS TABLE
AS
  RETURN(
		SELECT * FROM exams WHERE ex_id=@ex_id
		);
GO
/****** Object:  Table [dbo].[branches]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branches](
	[branch_name] [varchar](100) NOT NULL,
	[inst_ssn] [char](14) NOT NULL,
 CONSTRAINT [PK_branches_1] PRIMARY KEY CLUSTERED 
(
	[branch_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG1]
) ON [FG1]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[crs_code] [varchar](25) NOT NULL,
	[crs_name] [varchar](50) NOT NULL,
	[crs_desc] [varchar](max) NULL,
	[min_deg] [numeric](5, 2) NOT NULL,
	[max_deg] [numeric](5, 2) NOT NULL,
	[inst_ssn] [char](14) NOT NULL,
 CONSTRAINT [PK__courses__D7EC4AED56C5BF00] PRIMARY KEY CLUSTERED 
(
	[crs_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[dep_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dep_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG1]
) ON [FG1]
GO
/****** Object:  Table [dbo].[exam_questions]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_questions](
	[q_id] [int] NOT NULL,
	[ex_id] [int] NOT NULL,
	[q_degree] [numeric](2, 1) NOT NULL,
 CONSTRAINT [qID_exID] PRIMARY KEY CLUSTERED 
(
	[q_id] ASC,
	[ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams_audit]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams_audit](
	[ex_id] [int] NOT NULL,
	[ex_type] [char](10) NOT NULL,
	[ex_year] [date] NULL,
	[str_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[total_time] [numeric](18, 2) NULL,
	[inst_ssn] [char](14) NOT NULL,
	[round_num] [int] NOT NULL,
	[crs_code] [varchar](25) NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[operation] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[intakes]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[intakes](
	[round_num] [int] NOT NULL,
	[str_date] [date] NULL,
	[end_date] [date] NULL,
	[dep_name] [varchar](100) NOT NULL,
	[track_name] [varchar](100) NOT NULL,
	[branch_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[round_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[q_id] [int] NOT NULL,
	[q_text] [varchar](max) NOT NULL,
	[crs_code] [varchar](25) NOT NULL,
	[q_type] [varchar](5) NOT NULL,
	[correct_ans] [varchar](100) NOT NULL,
	[op_a] [varchar](100) NULL,
	[op_b] [varchar](100) NULL,
	[op_c] [varchar](100) NULL,
	[op_d] [varchar](100) NULL,
 CONSTRAINT [PK__question__3D59B310FC87E2C3] PRIMARY KEY CLUSTERED 
(
	[q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG3]
) ON [FG3] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_answers]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_answers](
	[ex_id] [int] NOT NULL,
	[q_id] [int] NOT NULL,
	[std_ssn] [char](14) NOT NULL,
	[std_ans] [varchar](100) NULL,
	[degree] [numeric](18, 2) NULL,
 CONSTRAINT [PK_student_answers_1] PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC,
	[q_id] ASC,
	[std_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_courses]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_courses](
	[std_ssn] [char](14) NOT NULL,
	[crs_code] [varchar](25) NOT NULL,
 CONSTRAINT [stdSSN_crsCODE] PRIMARY KEY CLUSTERED 
(
	[std_ssn] ASC,
	[crs_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG3]
) ON [FG3]
GO
/****** Object:  Table [dbo].[student_exam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_exam](
	[ex_id] [int] NOT NULL,
	[std_ssn] [char](14) NOT NULL,
	[inst_ssn] [char](14) NOT NULL,
 CONSTRAINT [exID_stdSSN_instSSN] PRIMARY KEY CLUSTERED 
(
	[ex_id] ASC,
	[std_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_audit]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_audit](
	[std_ssn] [char](14) NOT NULL,
	[std_email] [varchar](50) NULL,
	[full_name] [varchar](50) NOT NULL,
	[std_phone] [char](11) NOT NULL,
	[std_address] [varchar](100) NULL,
	[round_num] [int] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[operation] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[std_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracks]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracks](
	[track_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[track_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG1]
) ON [FG1]
GO
/****** Object:  Table [dbo].[works_for]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[works_for](
	[branch_name] [varchar](100) NOT NULL,
	[inst_ssn] [char](14) NOT NULL,
 CONSTRAINT [inst_worksfor_branch] PRIMARY KEY CLUSTERED 
(
	[branch_name] ASC,
	[inst_ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [FG2]
) ON [FG2]
GO
INSERT [dbo].[branches] ([branch_name], [inst_ssn]) VALUES (N'minya', N'123456        ')
GO
INSERT [dbo].[courses] ([crs_code], [crs_name], [crs_desc], [min_deg], [max_deg], [inst_ssn]) VALUES (N'cs22', N'copmuter science', N'this talk about programming and different lang', CAST(50.00 AS Numeric(5, 2)), CAST(100.00 AS Numeric(5, 2)), N'123456789     ')
INSERT [dbo].[courses] ([crs_code], [crs_name], [crs_desc], [min_deg], [max_deg], [inst_ssn]) VALUES (N'CSS101', N'CSS', N'this couse discuss thw styling of html page and how display our ui', CAST(50.00 AS Numeric(5, 2)), CAST(100.00 AS Numeric(5, 2)), N'123           ')
INSERT [dbo].[courses] ([crs_code], [crs_name], [crs_desc], [min_deg], [max_deg], [inst_ssn]) VALUES (N'geo02', N'geography', N'about geographi hestory of earth ', CAST(50.00 AS Numeric(5, 2)), CAST(100.00 AS Numeric(5, 2)), N'123456        ')
INSERT [dbo].[courses] ([crs_code], [crs_name], [crs_desc], [min_deg], [max_deg], [inst_ssn]) VALUES (N'his01', N'history', N'general questions about history of world', CAST(50.00 AS Numeric(5, 2)), CAST(100.00 AS Numeric(5, 2)), N'12345678912345')
GO
INSERT [dbo].[Departments] ([dep_name]) VALUES (N'web development')
GO
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (34, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (40, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (45, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (60, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (64, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (65, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (65, 3, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (67, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (68, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (69, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (70, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (71, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (74, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (76, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (83, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (84, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (85, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (86, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (88, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (95, 2, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[exam_questions] ([q_id], [ex_id], [q_degree]) VALUES (98, 2, CAST(5.0 AS Numeric(2, 1)))
GO
SET IDENTITY_INSERT [dbo].[exams] ON 

INSERT [dbo].[exams] ([ex_id], [ex_type], [ex_year], [str_time], [end_time], [total_time], [inst_ssn], [round_num], [crs_code]) VALUES (2, N'exam      ', CAST(N'2023-08-29' AS Date), CAST(N'20:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(2.00 AS Numeric(18, 2)), N'123           ', 1, N'CSS101')
INSERT [dbo].[exams] ([ex_id], [ex_type], [ex_year], [str_time], [end_time], [total_time], [inst_ssn], [round_num], [crs_code]) VALUES (3, N'exam      ', CAST(N'2023-08-29' AS Date), CAST(N'20:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(2.00 AS Numeric(18, 2)), N'123           ', 1, N'CSS101')
INSERT [dbo].[exams] ([ex_id], [ex_type], [ex_year], [str_time], [end_time], [total_time], [inst_ssn], [round_num], [crs_code]) VALUES (20, N'exam      ', CAST(N'2023-08-30' AS Date), CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(3.00 AS Numeric(18, 2)), N'123           ', 1, N'CSS101')
SET IDENTITY_INSERT [dbo].[exams] OFF
GO
INSERT [dbo].[exams_audit] ([ex_id], [ex_type], [ex_year], [str_time], [end_time], [total_time], [inst_ssn], [round_num], [crs_code], [updated_at], [operation]) VALUES (20, N'exam      ', CAST(N'2023-08-30' AS Date), CAST(N'1900-01-01T09:00:00.000' AS DateTime), CAST(N'1900-01-01T12:00:00.000' AS DateTime), CAST(3.00 AS Numeric(18, 2)), N'123           ', 1, N'CSS101', CAST(N'2023-08-30T20:30:30.593' AS DateTime), N'INS')
GO
INSERT [dbo].[instructors] ([inst_ssn], [full_name], [email], [phone], [inst_address], [hire_date]) VALUES (N'123           ', N'mahmoud', N'mah@gmail.com', N'01234569874', N'alex', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[instructors] ([inst_ssn], [full_name], [email], [phone], [inst_address], [hire_date]) VALUES (N'123456        ', N'ahmed refaat', N'ahmed@gmail.com', N'01123496085', N'minya', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[instructors] ([inst_ssn], [full_name], [email], [phone], [inst_address], [hire_date]) VALUES (N'123456789     ', N'ahmed mhmd', N'ahmd@gmail.com', N'01023496091', N'assiut', CAST(N'2023-01-01' AS Date))
INSERT [dbo].[instructors] ([inst_ssn], [full_name], [email], [phone], [inst_address], [hire_date]) VALUES (N'12345678912345', N'mhmd ali', N'mo@gmail.com', N'01123496091', N'sohag', CAST(N'2022-10-29' AS Date))
GO
INSERT [dbo].[intakes] ([round_num], [str_date], [end_date], [dep_name], [track_name], [branch_name]) VALUES (1, CAST(N'2023-07-01' AS Date), CAST(N'2023-11-01' AS Date), N'web development', N'.Net', N'minya')
GO
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (1, N'In which ocean GC?Bermuda TriangleGC? region is located? ', N'geo02', N'mcq', N'Atlantic', N'Atlantic', N'Indian', N'America', N'Arctic')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (2, N'Which one is the smallest ocean in the world? ', N'geo02', N'mcq', N'Arctic', N'Indian', N'Pacific', N'Atlantic', N'Arctic')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (3, N'In which ocean GÇÿBermuda TriangleGÇÖ region is located? ', N'his01', N'mcq', N'Atlantic', N'Atlantic', N'Indian', N'Pacific', N'Arctic')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (4, N'In which country statue of liberty is located?', N'his01', N'mcq', N'USA', N'Spain', N'Portugal', N'Italy', N'USA')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (5, N'Total number of oceans in the world', N'his01', N'mcq', N'5', N'3', N'5', N'7', N'12')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (7, N'The worldGÇÖs longest straight road is located in`', N'his01', N'mcq', N'Saudi Arabia', N'USA', N'Australia', N'Saudi Arabia', N'China')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (8, N'Which one is the biggest island in the world?', N'his01', N'mcq', N'Greenland', N'Borneo', N'Finland', N'Sumatra', N'Greenland')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (9, N'Which one is the largest tropical rain forest in the world?', N'his01', N'mcq', N'Amazon', N'Amazon', N'Bosawas', N'Southeast Asian Rain Forest', N'Daintree Rain Forest')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (11, N'Which one is the captial of Spain?', N'his01', N'mcq', N'Madrid', N'Barcelona', N'Madrid', N'Seville', N'Lisbon')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (12, N'Which country has the most number of lakes?', N'geo02', N'mcq', N'Canada', N'Canada', N'USA', N'Finland', N'Brazil')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (13, N'Emu bird is found in the country?', N'geo02', N'mcq', N'Autralia', N'New Zealand', N'Japan', N'Australia', N'Thailand')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (14, N'Which one is the capital city of of Canada?', N'geo02', N'mcq', N'Ottawa', N'Toronto', N'Montreal', N'Ottawa', N'Vancouver')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (15, N'Which day is celebrated as world environment day?', N'geo02', N'mcq', N'5th June', N'13th August', N'26th January', N'30th September', N'5th June')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (16, N'First American President to win a Nobel Prize?', N'geo02', N'mcq', N'Theodore Roosevelt', N'Theodore Roosevelt', N'Woodrow Wilson', N'Barack Obama', N'Jimmy Carter')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (17, N'''SofiaGÇÖ is the Capital City of which country?', N'geo02', N'mcq', N'Bulgaria', N'Hungary', N'Poland', N'Romania', N'Bulgaria')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (18, N'Nobel Peace Prize is awarded in the city?', N'geo02', N'mcq', N'Oslo', N'Bern', N'Lisbon', N'Oslo', N'Berlin')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (19, N'Which country gifted the GÇÿStatue of LibertyGÇÖ to USA in 1886?', N'cs22', N'mcq', N'France', N'France', N'Canada', N'Brazil', N'England')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (20, N'Which country is known as the GÇÿLand of Rising SunGÇÖ?', N'cs22', N'mcq', N'Japan', N'Japan', N'New Zealand', N'Fiji', N'China')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (21, N'Which country is the heigest producer of wine in the World?', N'cs22', N'mcq', N'France', N'France', N'Italy', N'USA', N'Protugal')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (22, N'Lisbon is the capital of?', N'cs22', N'mcq', N'Portugal', N'Canada', N'France', N'Germany', N'Portugal')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (23, N'Where is the WorldGÇÖs longest sea bridge?', N'cs22', N'mcq', N'China', N'Japan', N'Russia', N'China', N'None of the avobe')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (24, N'Who was the first man to fly into space?', N'cs22', N'mcq', N'Yuri Gagarin', N'Yuri Gagarin', N'Robert Walpole', N'Henry Waterloo', N'George Bush')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (25, N'Which country is the largest producer of coffee in the world?', N'cs22', N'mcq', N'Brazil', N'Vietnam', N'Brazil', N'Colombia', N'Mexico')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (28, N'"CSS stands for ""Cascading Style Sheets."""', N'CSS101', N't/f', N'TRUE
', N'', N'', N'', N'')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (30, N'Media queries in CSS can be used to create responsive designs.', N'CSS101', N't/f', N'TRUE
', N'', N'', N'', N'')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (32, N'"The ""box-model"" in CSS refers to the way elements are laid out in a box-like structure."', N'CSS101', N't/f', N'TRUE
', N'', N'', N'', N'')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (34, N'"The CSS property ""float"" is used for positioning elements horizontally."', N'CSS101', N't/f', N'TRUE
', N' ', N' ', N' ', N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (36, N'"CSS variables are also known as ""custom properties"" in CSS."', N'CSS101', N't/f', N'TRUE
', N' ', N' ', N' ', N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (38, N'Normalize.css is a CSS library that provides consistent default styles across different browsers.', N'CSS101', N't/f', N'TRUE
', N' ', N' ', N' ', N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (40, N'"The ""pseudo-class"" is indicated in CSS using the "":"" symbol."', N'CSS101', N't/f', N'TRUE
', N' ', N'  ', N' ', N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (42, N'Gradients in CSS allow for the smooth transition between two or more colors.', N'CSS101', N't/f', N'TRUE
', N' ', N' ', N' ', N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (44, N'"The ""font-weight"" property in CSS controls the spacing between characters."', N'CSS101', N't/f', N'FALSE
', N' ', N' ', N' ', N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (45, N'"The ""flexbox"" layout in CSS is designed for complex grid-based layouts."', N'CSS101', N't/f', N'FALSE', NULL, NULL, NULL, N' ')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (46, N'CSS3 is the latest version of the Cascading Style Sheets language.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (47, N'CSS stands for "Cascading Script Stylesheets."', N'CSS101', N't/f', N'False', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (48, N'CSS Grid Layout is designed primarily for creating grid-based layouts.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (49, N'The CSS "position" property with a value of "relative" places an element at an absolute position within its parent container.', N'CSS101', N't/f', N'False', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (50, N'The "flexbox" layout in CSS is used for creating one-dimensional layouts.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (51, N'The "transition" property in CSS is used for creating smooth animations between different states of an element.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (52, N'Media queries are used to define the style rules for different devices and screen sizes.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (53, N'The "margin" property in CSS defines the space outside the border of an element.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (54, N'The "border-radius" property is used to control the curvature of the corners of an element.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (55, N'The CSS "float" property is used to position elements vertically within their parent containers.', N'CSS101', N't/f', N'False', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (56, N'The "box-shadow" property in CSS is used to add shadows to the corners of elements.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (57, N'The "font-weight" property in CSS is used to control the spacing between characters.', N'CSS101', N't/f', N'False', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (58, N'The "display" property with a value of "block" makes an element take up the full width of its parent container.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (59, N'The "text-transform" property can be used to change the font style of text.', N'CSS101', N't/f', N'False', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (60, N'The CSS "opacity" property can be used to make an element fully transparent.', N'CSS101', N't/f', N'False', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (61, N'An external CSS file can be linked to an HTML document using the <link> element.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (62, N'The "box-model" in CSS describes the process of arranging boxes on a web page.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (63, N'The "color" property in CSS is used to define the color of the text inside an element.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (64, N'CSS selectors determine the elements to which a set of CSS rules should be applied.', N'CSS101', N't/f', N'True', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (65, N'What does CSS stand for?', N'CSS101', N'mcq', N'cascading style sheets', N'Cascading Script Stylesheets', N'cascading style sheets', N'Creative Style Sheets', N'Cascading Stylus Styles')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (66, N'Which property is used to change the color of the text?', N'CSS101', N'mcq', N'color', N'background-color', N'text-color', N'font-color', N'Cascading Stylus Styles')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (67, N'"What does the ""float"" property do in CSS?"', N'CSS101', N'mcq', N'positions an element to the left or right of its container', N'Floats the element above other elements', N'Makes the element transparent', N'Aligns the element vertically', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (68, N'Which of the following is NOT a valid unit of measurement in CSS?', N'CSS101', N'mcq', N'degree', N'px', N'em', N'rem', N'd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (69, N'Which CSS property is used to control the spacing between characters?', N'CSS101', N'mcq', N'letter-spacing', N'word-spacing', N'line-spacing', N'char-spacing', N'letter')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (70, N'Which CSS property is used to create rounded corners on elements?', N'CSS101', N'mcq', N'border-radius', N'corner-radius', N'rounded-corners', N'element-rounding', N'better')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (71, N'What is the purpose of a media query in CSS?', N'CSS101', N'mcq', N'to apply different styles based on the device and screen size', N'To apply animations to elements', N'To create navigation menus', N'To define font styles', N'setter')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (72, N'"What does the ""box-model"" refer to in CSS?"', N'CSS101', N'mcq', N'the way elements are laid out in a box-like structure', N'The model used for 3D animations', N'The layout of text within a box', N'The positioning of images on a page', N'getter')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (73, N'Which CSS property is used to change the background color of an element?', N'CSS101', N'mcq', N'background-color', N'background-image', N'element-color', N'background-style', N'cool')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (74, N'"What is the purpose of the ""z-index"" property in CSS?"', N'CSS101', N'mcq', N'to control the stacking order of elements', N'To change the font size', N'To control element visibility', N'To set the margin of an element', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (75, N'Which type of CSS selector selects all elements of a specific type?', N'CSS101', N'mcq', N'element selector', N'ID selector', N'Class selector', N'Attribute selector', N'Lol')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (76, N'Which layout system in CSS is designed for creating two-dimensional layouts?', N'CSS101', N'mcq', N'grid layout', N'Flexbox', N'Table Layout', N'Positioned Layout', N'qwert')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (77, N'Which CSS property is used to create drop shadows for elements?', N'CSS101', N'mcq', N'box-shadow', N'element-shadow', N'shadow-effect', N'drop-shadow', N'zxcv')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (78, N'Which property is used to control the order of flex items in a flex container?', N'CSS101', N'mcq', N'order', N'position', N'alignment', N'layout', N'asd4')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (79, N'"What is the purpose of the CSS ""overflow"" property?"', N'CSS101', N'mcq', N'to control how content overflows an element''s box', N'To control font styles', N'To set the background image', N'To add a border to an element', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (80, N'Which of the following is a valid way to link an external CSS file to an HTML document?', N'CSS101', N'mcq', N'"<link rel=""stylesheet"" type=""text/css"" href=""styles.css"">"', N'"<css src=""styles.css"">"', N'"<style href=""styles.css"">"', N'"<external-css file=""styles.css"">"', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (81, N'Which CSS property is used to create animations and transitions?', N'CSS101', N'mcq', N'transition', N'animation', N'effect', N'transform', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (82, N'"What does the ""visibility"" property in CSS control?"', N'CSS101', N'mcq', N'element visibility', N'Text color', N'Element size', N'Element spacing', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (83, N'Which CSS pseudo-class selects the first child element?', N'CSS101', N'mcq', N':first-child', N':first', N':child-first', N':first-element', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (84, N'Which CSS property is used to control the size of fonts?', N'CSS101', N'mcq', N'font-size', N'text-size', N'letter-size', N'element-size', N'asd')
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (85, N'What does CSS stand for?', N'CSS101', N'text', N'cascading style sheets', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (86, N'Name one property used to change the color of the text.', N'CSS101', N'text', N'color', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (87, N'Explain the purpose of the "float" property in CSS.', N'CSS101', N'text', N'positions an element to the left or right of its container', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (88, N'Which unit of measurement is NOT valid in CSS?', N'CSS101', N'text', N'degree', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (89, N'Describe the function of the "letter-spacing" CSS property.', N'CSS101', N'text', N'controls the spacing between characters', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (90, N'What is the purpose of the "border-radius" property in CSS?', N'CSS101', N'text', N'creates rounded corners on elements', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (91, N'Why are media queries used in CSS?', N'CSS101', N'text', N'to apply different styles based on the device and screen size', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (92, N'What is meant by the term "box-model" in CSS?', N'CSS101', N'text', N'refers to how elements are laid out in a box-like structure', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (93, N'How can you change the background color of an element using CSS?', N'CSS101', N'text', N'by using the "background-color" property', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (94, N'Explain the use of the "z-index" property in CSS.', N'CSS101', N'text', N'controls the stacking order of elements', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (95, N'What does an "element selector" in CSS target?', N'CSS101', N'text', N'targets all elements of a specific type', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (96, N'Which layout system in CSS is designed for creating two-dimensional layouts?', N'CSS101', N'text', N'grid layout', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (97, N'How is a drop shadow created for elements in CSS?', N'CSS101', N'text', N'using the "box-shadow" property', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (98, N'What property controls the order of flex items in a flex container?', N'CSS101', N'text', N'the "order" property', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (99, N'Define the purpose of the CSS "overflow" property.', N'CSS101', N'text', N'controls how content overflows an element''s box', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (100, N'Provide an example of linking an external CSS file to an HTML document.', N'CSS101', N'text', N'<link rel="stylesheet" type="text/css" href="styles.css">', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (101, N'Which CSS property is used for creating animations and transitions?', N'CSS101', N'text', N'the "transition" property', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (102, N'What aspect of an element''s appearance does the "visibility" property control?', N'CSS101', N'text', N'element visibility', NULL, NULL, NULL, NULL)
INSERT [dbo].[questions] ([q_id], [q_text], [crs_code], [q_type], [correct_ans], [op_a], [op_b], [op_c], [op_d]) VALUES (103, N'Explain the function of the ":first-child" pseudo-class in CSS.', N'CSS101', N'text', N'selects the first child element of a parent', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (2, 34, N'456           ', N'FALSE', CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (2, 40, N'456           ', N'FALSE', CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (2, 45, N'456           ', N'TRUE', CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (2, 60, N'456           ', N'FALSE', CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (2, 64, N'456           ', N'TRUE', CAST(5.00 AS Numeric(18, 2)))
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (2, 65, N'456           ', N'Cascad Style Sheets', CAST(0.00 AS Numeric(18, 2)))
INSERT [dbo].[student_answers] ([ex_id], [q_id], [std_ssn], [std_ans], [degree]) VALUES (3, 65, N'123           ', N'cascading style sheets', CAST(5.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[student_courses] ([std_ssn], [crs_code]) VALUES (N'456           ', N'CSS101')
INSERT [dbo].[student_courses] ([std_ssn], [crs_code]) VALUES (N'789           ', N'CSS101')
GO
INSERT [dbo].[student_exam] ([ex_id], [std_ssn], [inst_ssn]) VALUES (2, N'456           ', N'123           ')
INSERT [dbo].[student_exam] ([ex_id], [std_ssn], [inst_ssn]) VALUES (3, N'123           ', N'123           ')
GO
INSERT [dbo].[students] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num]) VALUES (N'1125463       ', N'ahmed@gmail.com', N'ahmed refaat', N'01140651558', N'cairo', 1)
INSERT [dbo].[students] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num]) VALUES (N'123           ', N'asd3gmail.com', N'mahmoud ali', N'01123496092', N'aasiut', 1)
INSERT [dbo].[students] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num]) VALUES (N'1234          ', N'H@GA.COM', N'ALI', N'01123496091', N'cairo', 1)
INSERT [dbo].[students] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num]) VALUES (N'456           ', N'asd2@gmail.com', N'ahmed ali', N'01551217736', N'minia', 1)
INSERT [dbo].[students] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num]) VALUES (N'654321        ', N'aligmail.com', N'ali ahmed', N'01023496091', N'alex', 1)
INSERT [dbo].[students] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num]) VALUES (N'789           ', N'asd@g.com', N'mohamed ali', N'01123496091', N'suhag', 1)
GO
INSERT [dbo].[students_audit] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num], [updated_at], [operation]) VALUES (N'1125463       ', N'ahmedrefaa99@gmail.com', N'ahmed refaat', N'01140651558', N'cairo', 1, CAST(N'2023-08-30T22:44:26.397' AS DateTime), N'INS')
INSERT [dbo].[students_audit] ([std_ssn], [std_email], [full_name], [std_phone], [std_address], [round_num], [updated_at], [operation]) VALUES (N'654321        ', N'aligmail.com', N'ali ahmed', N'01023496091', N'alex', 1, CAST(N'2023-08-30T19:12:55.577' AS DateTime), N'INS')
GO
INSERT [dbo].[Tracks] ([track_name]) VALUES (N'.Net')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__courses__775BF427F67A494B]    Script Date: 8/31/2023 12:20:25 AM ******/
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [UQ__courses__775BF427F67A494B] UNIQUE NONCLUSTERED 
(
	[crs_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__instruct__AB6E6164FD0F7A3D]    Script Date: 8/31/2023 12:20:25 AM ******/
ALTER TABLE [dbo].[instructors] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__students__C0DA53B11B9E8BA1]    Script Date: 8/31/2023 12:20:25 AM ******/
ALTER TABLE [dbo].[students] ADD UNIQUE NONCLUSTERED 
(
	[std_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__students__C0DA53B12082B7B4]    Script Date: 8/31/2023 12:20:25 AM ******/
ALTER TABLE [dbo].[students_audit] ADD UNIQUE NONCLUSTERED 
(
	[std_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[exam_questions] ADD  CONSTRAINT [DF_exam_questions_q_degree]  DEFAULT ((0)) FOR [q_degree]
GO
ALTER TABLE [dbo].[student_answers] ADD  CONSTRAINT [DF__student_a__degre__6C190EBB]  DEFAULT ((0)) FOR [degree]
GO
ALTER TABLE [dbo].[branches]  WITH CHECK ADD FOREIGN KEY([inst_ssn])
REFERENCES [dbo].[instructors] ([inst_ssn])
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK__courses__inst_ss__5DCAEF64] FOREIGN KEY([inst_ssn])
REFERENCES [dbo].[instructors] ([inst_ssn])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK__courses__inst_ss__5DCAEF64]
GO
ALTER TABLE [dbo].[exam_questions]  WITH CHECK ADD  CONSTRAINT [FK__question___ex_id__75A278F5] FOREIGN KEY([ex_id])
REFERENCES [dbo].[exams] ([ex_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exam_questions] CHECK CONSTRAINT [FK__question___ex_id__75A278F5]
GO
ALTER TABLE [dbo].[exam_questions]  WITH CHECK ADD  CONSTRAINT [FK__question_e__q_id__74AE54BC] FOREIGN KEY([q_id])
REFERENCES [dbo].[questions] ([q_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[exam_questions] CHECK CONSTRAINT [FK__question_e__q_id__74AE54BC]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK__exams__inst_ssn__5629CD9C] FOREIGN KEY([inst_ssn])
REFERENCES [dbo].[instructors] ([inst_ssn])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK__exams__inst_ssn__5629CD9C]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK__exams__round_num__571DF1D5] FOREIGN KEY([round_num])
REFERENCES [dbo].[intakes] ([round_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK__exams__round_num__571DF1D5]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_course] FOREIGN KEY([crs_code])
REFERENCES [dbo].[courses] ([crs_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_course]
GO
ALTER TABLE [dbo].[exams_audit]  WITH CHECK ADD FOREIGN KEY([inst_ssn])
REFERENCES [dbo].[instructors] ([inst_ssn])
GO
ALTER TABLE [dbo].[exams_audit]  WITH CHECK ADD FOREIGN KEY([round_num])
REFERENCES [dbo].[intakes] ([round_num])
GO
ALTER TABLE [dbo].[intakes]  WITH CHECK ADD FOREIGN KEY([branch_name])
REFERENCES [dbo].[branches] ([branch_name])
GO
ALTER TABLE [dbo].[intakes]  WITH CHECK ADD FOREIGN KEY([dep_name])
REFERENCES [dbo].[Departments] ([dep_name])
GO
ALTER TABLE [dbo].[intakes]  WITH CHECK ADD FOREIGN KEY([track_name])
REFERENCES [dbo].[Tracks] ([track_name])
GO
ALTER TABLE [dbo].[questions]  WITH NOCHECK ADD  CONSTRAINT [FK_question_course] FOREIGN KEY([crs_code])
REFERENCES [dbo].[courses] ([crs_code])
GO
ALTER TABLE [dbo].[questions] CHECK CONSTRAINT [FK_question_course]
GO
ALTER TABLE [dbo].[student_answers]  WITH CHECK ADD  CONSTRAINT [FK__student_a__ex_id__693CA210] FOREIGN KEY([ex_id])
REFERENCES [dbo].[exams] ([ex_id])
GO
ALTER TABLE [dbo].[student_answers] CHECK CONSTRAINT [FK__student_a__ex_id__693CA210]
GO
ALTER TABLE [dbo].[student_answers]  WITH CHECK ADD  CONSTRAINT [FK__student_a__std_s__6B24EA82] FOREIGN KEY([std_ssn])
REFERENCES [dbo].[students] ([std_ssn])
GO
ALTER TABLE [dbo].[student_answers] CHECK CONSTRAINT [FK__student_a__std_s__6B24EA82]
GO
ALTER TABLE [dbo].[student_answers]  WITH CHECK ADD  CONSTRAINT [FK__student_an__q_id__6A30C649] FOREIGN KEY([q_id])
REFERENCES [dbo].[questions] ([q_id])
GO
ALTER TABLE [dbo].[student_answers] CHECK CONSTRAINT [FK__student_an__q_id__6A30C649]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK__student_c__crs_c__66603565] FOREIGN KEY([crs_code])
REFERENCES [dbo].[courses] ([crs_code])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK__student_c__crs_c__66603565]
GO
ALTER TABLE [dbo].[student_courses]  WITH CHECK ADD  CONSTRAINT [FK__student_c__std_s__656C112C] FOREIGN KEY([std_ssn])
REFERENCES [dbo].[students] ([std_ssn])
GO
ALTER TABLE [dbo].[student_courses] CHECK CONSTRAINT [FK__student_c__std_s__656C112C]
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD  CONSTRAINT [FK__student_e__ex_id__6EF57B66] FOREIGN KEY([ex_id])
REFERENCES [dbo].[exams] ([ex_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[student_exam] CHECK CONSTRAINT [FK__student_e__ex_id__6EF57B66]
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD FOREIGN KEY([inst_ssn])
REFERENCES [dbo].[instructors] ([inst_ssn])
GO
ALTER TABLE [dbo].[student_exam]  WITH CHECK ADD FOREIGN KEY([std_ssn])
REFERENCES [dbo].[students] ([std_ssn])
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD FOREIGN KEY([round_num])
REFERENCES [dbo].[intakes] ([round_num])
GO
ALTER TABLE [dbo].[students_audit]  WITH CHECK ADD FOREIGN KEY([round_num])
REFERENCES [dbo].[intakes] ([round_num])
GO
ALTER TABLE [dbo].[works_for]  WITH CHECK ADD FOREIGN KEY([branch_name])
REFERENCES [dbo].[branches] ([branch_name])
GO
ALTER TABLE [dbo].[works_for]  WITH CHECK ADD FOREIGN KEY([inst_ssn])
REFERENCES [dbo].[instructors] ([inst_ssn])
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [CK__exams__ex_type__5535A963] CHECK  (([ex_type]='corrective' OR [ex_type]='exam'))
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [CK__exams__ex_type__5535A963]
GO
ALTER TABLE [dbo].[exams_audit]  WITH CHECK ADD CHECK  (([ex_type]='corrective' OR [ex_type]='exam'))
GO
ALTER TABLE [dbo].[exams_audit]  WITH CHECK ADD CHECK  (([operation]='INS'))
GO
ALTER TABLE [dbo].[questions]  WITH NOCHECK ADD  CONSTRAINT [check_Quest_type] CHECK  (([q_type]='text' OR [q_type]='t/f' OR [q_type]='mcq'))
GO
ALTER TABLE [dbo].[questions] CHECK CONSTRAINT [check_Quest_type]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD CHECK  ((len([std_phone])=(11)))
GO
ALTER TABLE [dbo].[students_audit]  WITH CHECK ADD CHECK  (([operation]='INS' OR [operation]='DEL'))
GO
ALTER TABLE [dbo].[students_audit]  WITH CHECK ADD CHECK  ((len([std_phone])=(11)))
GO
/****** Object:  StoredProcedure [dbo].[ADD_BRANCHES]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ADD_BRANCHES](@branch_name as varchar(100) , @inst_ssn as char(14))
as 
begin 
if  exists (select 1 from dbo.branches where branch_name =@branch_name)
begin
	print 'This Branch is Already exists'
end
else
begin 
	INSERT INTO dbo.branches(branch_name, inst_ssn)
	VALUES (@branch_name ,@inst_ssn );
end
end
GO
/****** Object:  StoredProcedure [dbo].[ADD_DEPARTMENT]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ADD_DEPARTMENT](@DEPARTMENT_NAME as varchar(100))
as 
begin 
IF EXISTS (select 1 from dbo.Departments where dep_name =@DEPARTMENT_NAME )
begin 
	print 'this department is already found'
end
else 
begin
INSERT INTO dbo.Departments(dep_name)
VALUES (@DEPARTMENT_NAME );
end
end
GO
/****** Object:  StoredProcedure [dbo].[add_new_intake]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[add_new_intake] (@round_num int ,
@str_date date,
@end_date date , 
@dep_name varchar(100) , 
@track_name varchar(100) ,
@branche_name varchar(100))
as	
begin
if exists (select 1 from dbo.intakes where round_num = @round_num)
begin
	
print 'This intake is Already exists'
end
else 
insert into dbo.intakes (round_num,str_date,end_date,dep_name,track_name,branch_name)
values (@round_num, @str_date , @end_date , @dep_name  , @track_name , @branche_name )
end
GO
/****** Object:  StoredProcedure [dbo].[add_question_To_pool]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[add_question_To_pool]
	(@q_id int ,
	@q_text varchar(max),
	@crs_code varchar(25),
	@q_type varchar(5),
	@correct_ans varchar(100),
	@op_a varchar(100) ,
	@op_b varchar(100),
	@op_c varchar(100) ,
	@op_d varchar(100))

AS
begin try
	IF EXISTS (SELECT 1 FROM dbo.questions WHERE [q_id]= @q_id OR [q_text]=@q_text )
	BEGIN
	PRINT 'This question has been entered previously'
	END
	
	ELSE 
	BEGIN
	insert into dbo.questions (q_id,q_text,crs_code,q_type,correct_ans,op_a,op_b,op_c,op_d)
	values (@q_id , @q_text , @crs_code , @q_type , @correct_ans , @op_a , @op_b , @op_c,@op_d)
	END
end try
begin catch
    SELECT ERROR_MESSAGE() AS errorMessage;
end catch
GO
/****** Object:  StoredProcedure [dbo].[ADD_TRACKS]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[ADD_TRACKS](@TRACK_name as varchar(100))
as 
begin 
if  exists(select 1 from dbo.Tracks where track_name=@TRACK_name)
begin
	print 'this track is Already found'
end
else 
begin 
INSERT INTO dbo.Tracks(track_name)
VALUES (@TRACK_name );
end
end
GO
/****** Object:  StoredProcedure [dbo].[AddCourse]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCourse]
    @crs_code VARCHAR(25),
    @crs_name NVARCHAR(50),
    @crs_desc VARCHAR(MAX),
    @min_deg numeric(18, 0),
    @max_deg numeric(18, 0),
    @inst_ssn CHAR(14)
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@crs_code, '') = '' OR ISNULL(@crs_name, '') = '')
        BEGIN
            THROW 50030, 'Please provide course code and name!', 16;
        END
		 IF (EXISTS (SELECT 1 FROM [dbo].[courses] WHERE [inst_ssn] = @inst_ssn))
        BEGIN
            THROW 50033, 'Instructor is already teaching another course!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[instructors] WHERE [inst_ssn] = @inst_ssn))
        BEGIN
            THROW 50031, 'Instructor not found!', 16;
        END
		 IF (EXISTS (SELECT 1 FROM [dbo].[courses] WHERE [crs_code] = @crs_code))
        BEGIN
            THROW 50032, 'Course already exists!', 16;
        END
        
        INSERT INTO [dbo].[courses] ([crs_code], [crs_name], [crs_desc], [min_deg], [max_deg], [inst_ssn])
        VALUES (@crs_code, @crs_name, @crs_desc, @min_deg, @max_deg, @inst_ssn);
        
        PRINT 'Course added successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[Addinstructor]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Addinstructor]
    @instssn CHAR(14),
    @Name VARCHAR(50),
    @Email VARCHAR(50),
    @Phone VARCHAR(11),
	@Adress VARCHAR(100),
    @Hiredate DATE
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@instssn, '') = '' OR ISNULL(@Name, '') = '')
        BEGIN
            THROW 50005, 'Please be sure to enter your ID number and name!', 16;
        END
        
        IF (ISNULL(@Phone, '') = '' OR LEN(@Phone) != 11)
        BEGIN
            THROW 50006, 'The phone number must be 11 digits long!', 16;
        END
        
        
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[instructors] WHERE [inst_ssn] = @instssn))
        BEGIN
            INSERT INTO [dbo].[instructors]([inst_ssn], [full_name], [email], [phone], [inst_address], [hire_date])
            VALUES (@instssn, @Name, @Email, @Phone, @Adress, @Hiredate);
            PRINT 'Instractor added successfully.';
        END
        ELSE
        BEGIN
            THROW 50008, 'Instractor is already there.', 16;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddStudent] (@std_ssn char(14) , @str_email varchar(50), @full_name varchar(50) , @std_phone char(11) , @std_address varchar(100) ,@round_num int)
as	
begin
if exists( select 1 from dbo.students where  std_ssn=@std_ssn)
begin
	print 'this student is Already exist'
end
else 
begin 
	insert into dbo.students (std_ssn, std_email,full_name,std_phone,std_address,round_num)
	values (@std_ssn  , @str_email , @full_name , @std_phone , @std_address  ,@round_num)
end
end
GO
/****** Object:  StoredProcedure [dbo].[answerQuestionToSpecificExam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[answerQuestionToSpecificExam]
@ex_id int ,
@q_id int,
@std_ssn CHAR(14),
@std_answer varchar(100)
AS
BEGIN TRY
	DECLARE @Q_degree numeric(2,1);
	IF((SELECT COUNT(*) FROM exam_questions --check if this question exits in this exam
	WHERE q_id=@q_id AND ex_id=@ex_id)=0)    
		 BEGIN 
			print 'This Question does not exit in this exam!';
		 END
	 ELSE IF((SELECT COUNT(*) FROM student_exam AS SC
			WHERE SC.ex_id =@ex_id AND SC.std_ssn=@std_ssn)=0)
			BEGIN 
				PRINT 'This Student does not Selected to do this Exam';
			END
     ELSE IF((CONVERT(VARCHAR ,(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),112) = CONVERT(VARCHAR ,GETDATE(),112))
		  AND( (CONVERT(TIME ,GETDATE(),114) >= CONVERT(TIME ,(SELECT str_time FROM getInfoAboutSpecificExam (@ex_id)),114) 
		  AND (CONVERT(TIME ,GETDATE(),114) <= CONVERT(TIME ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),114)))
		  ))
			BEGIN
				 IF(LOWER(@std_answer) =LOWER((SELECT Q.correct_ans FROM questions AS Q
									WHERE Q.q_id = @q_id)))
				 BEGIN
					  set @Q_degree = (SELECT EQ.q_degree FROM [dbo].[exam_questions] as EQ
									where EQ.ex_id=@ex_id and Eq.q_id=@q_id)
				END
				ELSE
					BEGIN 
						set @Q_degree =0.0;
					END

				INSERT INTO student_answers(ex_id,q_id,std_ssn,std_ans,degree)
				VALUES(@ex_id,@q_id,@std_ssn,@std_answer,@Q_degree);
				PRINT 'you have answered the question.'
			END
			ELSE 
			BEGIN
			    SELECT CONCAT('the Exam date in ',(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),
				' and its Start Time in ' ,CONVERT(varchar(8) ,(SELECT str_time FROM getInfoAboutSpecificExam (@ex_id)),108),
				' and its End Time in ' ,CONVERT(varchar(8) ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),108)
				) AS 'Note'
			END
END TRY
BEGIN CATCH
	    SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[CreateExamWithBasicInfo]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateExamWithBasicInfo]
@type char(10), ----type Exam (exam , corrective)
@year date, ----------------(Date of an exam)
@str_time time(7), ----------Start time--------
@end_time time(7), ----------End time--------
@total_time numeric(2,1), --------total time of Exam ---------
@inst_ssn char(14),    -----------Instructor SSN ---------
@round_num int,       ------------intake round number -----
@crs_code varchar(25)
As
BEGIN TRY 
	   IF NOT EXISTS(SELECT * FROM courses where crs_code = @crs_code)
			BEGIN 
					SELECT 'This course does not exist' AS 'Error'; 
			END
		ELSE IF NOT EXISTS(SELECT * FROM courses where inst_ssn = @inst_ssn)
			BEGIN 
					SELECT 'This instructor does not  teach this corse' AS 'Error'; 
			END
		ELSE IF NOT EXISTS(SELECT * FROM intakes where round_num = @round_num)
			BEGIN 
					SELECT 'This intake does not exist' AS 'Error'; 
			END
		ELSE
			BEGIN
			----------insert info about exam
			 INSERT INTO exams(ex_type,ex_year,str_time,end_time,
			 total_time,inst_ssn,round_num,crs_code)
			VALUES(@type,@year,@str_time,@end_time,@total_time,
			@inst_ssn,@round_num,@crs_code);
			END
END TRY

BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[delete_branch]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_branch]  @branch_name varchar(100)
as
begin
	IF EXISTS (select 1 from dbo.branches where branch_name =@branch_name )
	BEGIN
			DELETE FROM dbo.branches WHERE branch_name=@branch_name	
	END
	
	ELSE 
	BEGIN
	PRINT 'THIS branch is  NOT FOUNT'
	END
	
end
GO
/****** Object:  StoredProcedure [dbo].[delete_department]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_department] @DEPARTMENT_NAME varchar(100)
as
begin
	IF EXISTS (select 1 from dbo.Departments where dep_name =@DEPARTMENT_NAME )
	BEGIN
			DELETE FROM dbo.Departments WHERE dep_name=@DEPARTMENT_NAME	
	END
	
	ELSE 
	BEGIN
	PRINT 'THIS department is  NOT FOUNT'
	END
	
end
GO
/****** Object:  StoredProcedure [dbo].[delete_intake]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_intake] (@round_num int )
as
begin 

	delete from dbo.intakes where round_num=@round_num
end
GO
/****** Object:  StoredProcedure [dbo].[delete_question]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_question] 
	@q_id INT 
as
begin try
 	IF EXISTS (select 1 from dbo.questions where [q_id] =@q_id )
	BEGIN
			DELETE FROM dbo.questions WHERE q_id =@q_id	
	END
	
	ELSE 
	BEGIN
	PRINT 'THIS QUESTION NOT FOUNT'
	END
end try
begin catch
    SELECT ERROR_MESSAGE() AS errorMessage;
end catch
GO
/****** Object:  StoredProcedure [dbo].[delete_student]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[delete_student] 
	@std_ssn char(14)
as
begin
	IF EXISTS (select 1 from dbo.students where std_ssn =@std_ssn )
	BEGIN
			DELETE FROM dbo.students WHERE std_ssn =@std_ssn	
	END
	
	ELSE 
	BEGIN
	PRINT 'THIS student is  NOT FOUNT'
	END
	
end
GO
/****** Object:  StoredProcedure [dbo].[delete_track]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_track] @track_name varchar(100)
as
begin
	IF EXISTS (select 1 from dbo.Tracks where track_name =@track_name )
	BEGIN
			DELETE FROM dbo.Tracks WHERE track_name=@track_name	
	END
	
	ELSE 
	BEGIN
	PRINT 'THIS track is  NOT FOUNT'
	END
	
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCourse]
    @crs_code VARCHAR(25)
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@crs_code, '') = '')
        BEGIN
            THROW 50040, 'Please provide course code!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[courses] WHERE [crs_code] = @crs_code))
        BEGIN
            THROW 50041, 'Course not found!', 16;
        END
        
        DELETE FROM [dbo].[courses] WHERE [crs_code] = @crs_code;
        
        PRINT 'Course deleted successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[deleteExamByCourseInstructor]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteExamByCourseInstructor]
@ex_id int , 
@inst_ssn char(14)
AS
BEGIN TRY
	IF NOT EXISTS (SELECT COUNT(*) FROM exams 
		where inst_ssn =@inst_ssn AND ex_id =@ex_id)
			BEGIN 
				SELECT 'This instructor does not teach this corse ,
				then not allow to delete this exam' AS 'Error'; 
			END
	ELSE
		BEGIN 
			delete from exams where ex_id = @ex_id
		END

END TRY
BEGIN CATCH
			SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[DeleteInstructor]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteInstructor]
    @instssn CHAR(14)
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@instssn, '') = '')
        BEGIN
            THROW 50020, 'Please provide the instructor ID!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[instructors] WHERE [inst_ssn] = @instssn))
        BEGIN
            THROW 50021, 'Instructor not found!', 16;
        END
        
        DELETE FROM [dbo].[instructors] WHERE [inst_ssn] = @instssn;
        
        PRINT 'Instructor deleted successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[dispalyTheFinalResultOfMyExam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dispalyTheFinalResultOfMyExam]
@ex_id int,
@std_ssn char(14)
AS
BEGIN TRY
	declare @std_deg numeric(18,2);
	declare @max_deg numeric(18,2);
	IF((SELECT COUNT(*) FROM student_exam AS SC
			WHERE SC.ex_id =@ex_id AND SC.std_ssn=@std_ssn)=0)
			BEGIN 
				PRINT 'you have not been selected to do this exam!';
			END
     ELSE IF((CONVERT(VARCHAR ,(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),112) <= CONVERT(VARCHAR ,GETDATE(),112))
		  OR (CONVERT(TIME ,GETDATE(),114) >= CONVERT(TIME ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),114)))
			BEGIN
				set @std_deg = (SELECT SUM(degree) FROM student_answers
				WHERE ex_id = @ex_id AND std_ssn =@std_ssn)
				set @max_deg =(SELECT max_deg FROM exams join courses
				on exams.crs_code = courses.crs_code
				WHERE exams.ex_id = @ex_id
				); 
				PRINT 'Your Degree Is '+ CAST(@std_deg AS NVARCHAR) + ' / ' +
				CAST(@max_deg AS NVARCHAR)
			END
END TRY 
BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[displayAllExamForCourseThatInstructorTeach]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[displayAllExamForCourseThatInstructorTeach]
@inst_ssn char(14)
as
BEGIN TRY
	SELECT exams.ex_id as [Exam Id] ,exams.ex_year as [Exam Date] FROM exams left join courses
	on exams.inst_ssn = courses.inst_ssn
	where exams.inst_ssn =@inst_ssn
END TRY

BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[displayAllQuestionsForCourseThatInstructorTeach]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[displayAllQuestionsForCourseThatInstructorTeach]
@inst_ssn char(14)
as
BEGIN TRY
	SELECT Q.q_id as [Question Id], Q.q_text  as [Question Text] ,Q.q_type as [Type] 
	FROM questions AS Q left join courses AS C
	on Q.[crs_code] = C.[crs_code] left join instructors AS I
	on C.inst_ssn=I.inst_ssn
	where I.inst_ssn =@inst_ssn
END TRY

BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[displayAllStudentThatEnrrolledInSpecCourse]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[displayAllStudentThatEnrrolledInSpecCourse]
@crs_code varchar(25)
AS 
BEGIN TRY 
		IF EXISTS (SELECT 1 FROM courses where crs_code =@crs_code)
		   BEGIN
				SELECT S.std_ssn AS [Student SSN] , S.full_name AS [Name]
				FROM students AS S left join student_courses AS SC
				ON SC.[std_ssn] = S.[std_ssn]
				WHERE SC.crs_code = @crs_code
		   END
		ELSE
		BEGIN
			SELECT 'This course does not exist' AS 'Error'; 
		END
END TRY
BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[displayExamToThisStudent]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[displayExamToThisStudent]
@std_ssn char(14),
@ex_id int
AS
BEGIN TRY
		IF ((SELECT COUNT(*) FROM student_exam AS SC
		WHERE SC.ex_id =@ex_id AND SC.std_ssn=@std_ssn)=0
		)
			BEGIN
				SELECT 'This Student does not Selected to do this Exam' AS 'Error';
			END
										--2023-08-26---
		 ELSE IF((CONVERT(VARCHAR ,(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),112) = CONVERT(VARCHAR ,GETDATE(),112))
		  AND( (CONVERT(TIME ,GETDATE(),114) >= CONVERT(TIME ,(SELECT str_time FROM getInfoAboutSpecificExam (@ex_id)),114) 
		  AND (CONVERT(TIME ,GETDATE(),114) <= CONVERT(TIME ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),114)))
		  )
		  )
			BEGIN 
				--display mcq exam questions --
				SELECT 
				EQ.ex_id as [Exam ID], Q.crs_code as [Course Code],
				Q.q_id as [Question ID] , Q.q_text as [Question text] ,
				Q.q_type as [Quetion Type] , Q.op_a as [Option A],
				Q.op_b as [Option B],Q.op_c as [Option C],Q.op_d as [Option D]
				FROM questions AS Q
				JOIN exam_questions AS EQ
				ON Q.q_id = EQ.q_id
				WHERE EQ.ex_id = @ex_id AND Q.q_type = 'mcq'
				--display t/f exam questions --
				SELECT EQ.ex_id as [Exam ID], Q.crs_code as [Course Code],
				Q.q_id as [Question ID] , Q.q_text as [Question text] ,
				Q.q_type as [Quetion Type] 
				FROM questions AS Q
				JOIN exam_questions AS EQ
				ON Q.q_id = EQ.q_id
				WHERE EQ.ex_id = @ex_id AND Q.q_type = 't/f'
				--display text exam questions --
				SELECT EQ.ex_id as [Exam ID], Q.crs_code as [Course Code],
				Q.q_id as [Question ID] , Q.q_text as [Question text] ,
				Q.q_type as [Quetion Type] 
				FROM questions AS Q
				JOIN exam_questions AS EQ
				ON Q.q_id = EQ.q_id
				WHERE EQ.ex_id = @ex_id AND Q.q_type = 'text'
			END
			ELSE 
			BEGIN
			    SELECT CONCAT('the Exam date in ',(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),
				' and it will Start in ' ,CONVERT(TIME(7) ,(SELECT str_time FROM getInfoAboutSpecificExam (@ex_id)),108),
				' and it will End in ' ,CONVERT(TIME(7) ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),108)
				) AS 'Note'
			END
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[displayResultOfAllStudentINSpecificExam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[displayResultOfAllStudentINSpecificExam]
@crs_code varchar(25),
@inst_ssn char(14),
@ex_id int
AS
BEGIN TRY
	IF NOT EXISTS(SELECT * FROM courses where crs_code = @crs_code)
			BEGIN 
					SELECT 'This course does not exist' AS 'Error'; 
			END
		ELSE IF NOT EXISTS(SELECT * FROM courses where inst_ssn = @inst_ssn)
			BEGIN 
					SELECT 'This instructor does not  teach this corse' AS 'Error'; 
			END
		ELSE
			BEGIN
				SELECT S.full_name as[Full Name] , SUM(SA.degree)as [Student degree],@crs_code as [Course Code]  
				FROM student_answers SA
				LEFT JOIN students S
				ON SA.std_ssn = S.std_ssn
				where ex_id=@ex_id
				GROUP BY S.full_name
			END
END TRY
BEGIN CATCH
			SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[generateExamByInstructor]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[generateExamByInstructor]
@type char(10), ----type Exam (mcq  ,t/f , text)
@year date, ----------------(Date of an exam)
@str_time time(7), ----------Start time--------
@end_time time(7), ----------End time--------
@total_time numeric(2,1), --------total time of Exam ---------
@inst_ssn char(14),    -----------Instructor SSN ---------
@round_num int,       ------------intake round number -----
@crs_code varchar(25),   ----------Course Code ------------
@mcq_num int, @mcq_deg numeric(5,1),          --------Number of MCQ quesstions ----
@tf_num int, @tf_deg numeric(5,1),      --------Number of t/f quesstions ----
@text_num int , @text_deg numeric(5,1)        --------Number of text quesstions ----
AS
BEGIN TRY 
		DECLARE @InsertedExamId TABLE (ID INT)

		IF NOT EXISTS(SELECT * FROM courses where crs_code = @crs_code)
			BEGIN 
					SELECT 'This course does not exist' AS 'Error'; 
			END
		ELSE IF NOT EXISTS(SELECT * FROM courses where inst_ssn = @inst_ssn)
			BEGIN 
					SELECT 'This instructor does not  teach this corse' AS 'Error'; 
			END
		ELSE IF NOT EXISTS(SELECT * FROM intakes where round_num = @round_num)
			BEGIN 
					SELECT 'This intake does not exist' AS 'Error'; 
			END
		ELSE
			BEGIN 
				IF(dbo.checkIfTotalQuestionsDegreesEqualMaxDegreeOfCourse(@mcq_num,
				@mcq_deg,@tf_num,@tf_deg,@text_num,@text_deg)=
				(SELECT TOP(1) max_deg FROM courses WHERE crs_code=@crs_Code))
					BEGIN
							----------insert info about exam
							 INSERT INTO exams(ex_type,ex_year,str_time,end_time,
							total_time,inst_ssn,round_num,crs_code)
							OUTPUT INSERTED.ex_id INTO @InsertedExamId
							VALUES(@type,@year,@str_time,@end_time,@total_time,
							@inst_ssn,@round_num,@crs_code);


							----------select mcq Question from Questions pool .....>
							------related to course and insert into this exam----
							-------------insert mcq question ---------
							INSERT INTO exam_questions(q_id,ex_id,q_degree) 
							SELECT TOP(@mcq_num) Qus.q_id ,(SELECT ID from @InsertedExamId), @mcq_deg
							FROM questions AS Qus
							WHERE qus.crs_code = @crs_code AND qus.q_type = 'mcq'
							ORDER BY NEWID();

							-------------insert T/F question ---------
							INSERT INTO exam_questions(q_id,ex_id,q_degree) 
							SELECT TOP(@tf_num) Qus.q_id ,(SELECT ID from @InsertedExamId) ,@tf_deg 
							FROM questions AS Qus
							WHERE qus.crs_code = @crs_code AND qus.q_type = 't/f'
							ORDER BY NEWID();
							-------------insert text question ---------
							INSERT INTO exam_questions(q_id,ex_id,q_degree) 
							SELECT TOP(@text_num) Qus.q_id ,(SELECT ID from @InsertedExamId),@text_deg  
							FROM questions AS Qus
							WHERE qus.crs_code = @crs_code AND qus.q_type = 'text'
							ORDER BY NEWID();
							SELECT 'You generated Exam Successfully For This Course '+@crs_code AS 'Success Message'; 
					END
					ELSE
						BEGIN 
							SELECT 'The total degree of questions not Equal max Degree for this course ' AS 'Error'; 
						END
			
			END
END TRY

BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SearchCourses]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCourses]
    @search_term NVARCHAR(100)
AS
BEGIN
    BEGIN TRY
        DECLARE @ResultsCount INT;

        SELECT
            [crs_code],
            [crs_name],
            [crs_desc],
            [min_deg],
            [max_deg],
            [inst_ssn]
        FROM
            [dbo].[courses]
        WHERE
            [crs_code] LIKE '%' + @search_term + '%' OR
            [crs_name] LIKE '%' + @search_term + '%' OR
            [crs_desc] LIKE '%' + @search_term + '%';

        SET @ResultsCount = @@ROWCOUNT;

        IF @ResultsCount = 0
        BEGIN
            PRINT 'No courses found No students found please valid id,name or email .';
        END
    END TRY
    BEGIN CATCH
       
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SearchStudents]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchStudents]
    @search_term NVARCHAR(100)
AS
BEGIN
    BEGIN TRY
        DECLARE @ResultsCount INT;

        SELECT
            [std_ssn],
            [full_name],
            [std_email]

        FROM
            [dbo].[students]
        WHERE
            [std_ssn] LIKE '%' + @search_term + '%' OR
            [full_name] LIKE '%' + @search_term + '%' OR
            [std_email] LIKE '%' + @search_term + '%';

        SET @ResultsCount = @@ROWCOUNT;

        IF @ResultsCount = 0
        BEGIN
            PRINT 'No students found please valid id,name or email .';
        END
    END TRY
    BEGIN CATCH
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectingQuestionToOneByOneExamManually]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectingQuestionToOneByOneExamManually]
@ex_id int ,
@q_id int ,
@q_degree numeric(2,1)
AS
BEGIN TRY
	IF((SELECT COUNT(*) FROM exams AS E 
	left join questions AS Q on E.[crs_code] = Q.[crs_code]
	where E.ex_id =@ex_id AND Q.q_id=@q_id) >0
	)
	BEGIN
		INSERT INTO exam_questions(q_id,ex_id,q_degree)
		VALUES(@q_id,@ex_id,@q_degree)
	END
	ELSE
	   BEGIN 
			SELECT 'This question  does not belong to this corse' AS 'Error'; 
	   END
END TRY
BEGIN CATCH
		SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[selectSpecificStudentToDoExam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectSpecificStudentToDoExam]
@ex_id int,
@std_ssn char(14),
@inst_ssn char(14)
AS
BEGIN TRY
		IF NOT EXISTS (SELECT COUNT(*) FROM exams 
		where inst_ssn =@inst_ssn AND ex_id =@ex_id)
			BEGIN 
				SELECT 'This instructor does not  teach this corse' AS 'Error'; 
			END
		ELSE IF NOT EXISTS(SELECT COUNT(*) FROM exams E
				JOIN [dbo].[student_courses] AS SC
				ON E.crs_code = SC.crs_code
				WHERE SC.[std_ssn] =@std_ssn AND E.ex_id=@ex_id
				)
			BEGIN
				SELECT 'Student and exam do not belong to the same course' AS 'Error'; 
			END
		ELSE
			BEGIN
				INSERT INTO student_exam(ex_id,std_ssn,inst_ssn)
				VALUES(@ex_id,@std_ssn,@inst_ssn)
				SELECT 'You selected student to exam Successfully' AS 'Success'; 
			END

END TRY
BEGIN CATCH
			SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Ubdate_Question]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ubdate_Question]
    (@q_id int ,
	@q_text varchar(max),
	@crs_code varchar(25),
	@q_type varchar(5),
	@correct_ans varchar(100),
	@op_a varchar(100),
	@op_b varchar(100),
	@op_c varchar(100),
	@op_d varchar(100))

AS
BEGIN try
        IF  EXISTS (SELECT 1 FROM dbo.questions WHERE q_id= @q_id )
        BEGIN
		UPDATE dbo.questions
        SET q_text=@q_text,
			crs_code=@crs_code,
			q_type=@q_type,
			correct_ans=@correct_ans,
			op_a=@op_a,
			op_b=@op_b,
			op_c=@op_c,
			op_d=@op_d
		WHERE q_id= @q_id
		END
		ELSE
        BEGIN
            PRINT 'this question is not found'
        END
end try
begin catch
    SELECT ERROR_MESSAGE() AS errorMessage;
end catch
GO
/****** Object:  StoredProcedure [dbo].[update_branch_info]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_branch_info](@branch_name  varchar(100) , @inst_ssn  char(14) ,@new_branch_name varchar(100)  ,@new_inst_ssn  char(14))
	
as
begin
	if exists (select 2 from dbo.branches where branch_name =@branch_name and inst_ssn=@inst_ssn)
	begin 
		update dbo.branches  
		set branch_name=@new_branch_name,
		inst_ssn=@new_inst_ssn
		where branch_name =@branch_name and inst_ssn=@inst_ssn
	end
	else
	begin
	print 'this branch is not found'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[update_department_info]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_department_info](@old_department_name  varchar(100) ,@new_department_name varchar(100))
as
begin
	if exists (select 1 from dbo.Departments where dep_name=@old_department_name)
	begin 
		update dbo.Departments 
		set  dep_name =@new_department_name
		where dep_name=@old_department_name	
	end
	else
	begin
	print 'this track is not found'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[update_intake_info]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_intake_info] 
					(@round_num int ,
					@str_date date,
					@end_date date ,
					@dep_name varchar(100) ,
					@track_name varchar(100) ,
					@branch_name varchar(100))
as
begin
	if exists (select 1 from dbo.intakes where round_num=@round_num )
		begin
			update dbo.intakes  
			set str_date=@str_date,
				end_date=@end_date,
				dep_name=@dep_name,
				track_name=@track_name,
				branch_name=@branch_name
			where round_num=@round_num 
		end
	else  print 'this round number is not found'
end
GO
/****** Object:  StoredProcedure [dbo].[update_student_info]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_student_info] (@std_ssn char(14) , @std_email varchar(50), @full_name varchar(50) , @std_phone char(11) , @std_address varchar(100) ,@round_num int)
	
as
begin
	if exists (select 1 from dbo.students where std_ssn =@std_ssn)
	begin 
	if exists (select 1 from dbo.intakes where round_num =@round_num)
	begin
		update dbo.students 
		set std_email=@std_email,
			full_name=@full_name,
			std_phone=@std_phone,
			std_address=@std_address,
			round_num=@round_num
		where std_ssn =@std_ssn
	end
	else 
	begin 
		print 'this round number is not found'
	end
	end
	else
	print 'this student is not found'

end
GO
/****** Object:  StoredProcedure [dbo].[update_track_info]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[update_track_info](@old_track_name as varchar(100),@new_track_name as varchar(100))
	
as
begin
	if exists (select 1 from dbo.tracks where track_name=@old_track_name)
	begin 
		update dbo.Tracks  
		set  track_name =@new_track_name
		where track_name=@old_track_name	
	end
	else
	begin
	print 'this track is not found'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[updateAnswerQuestionToSpecificExam]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateAnswerQuestionToSpecificExam]
@ex_id int ,
@q_id int,
@std_ssn CHAR(14),
@new_std_answer varchar(100)
AS
BEGIN TRY
	DECLARE @Q_degree numeric(2,1);
	IF((SELECT COUNT(*) FROM exam_questions --check if this question exits in this exam
	WHERE q_id=@q_id AND ex_id=@ex_id)=0)    
		 BEGIN 
			print 'This Question does not exit in this exam!';
		 END
	 ELSE IF((SELECT COUNT(*) FROM student_exam AS SC
			WHERE SC.ex_id =@ex_id AND SC.std_ssn=@std_ssn)=0)
			BEGIN 
				PRINT 'This Student does not Selected to do this Exam';
			END
     ELSE IF((CONVERT(VARCHAR ,(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),112) = CONVERT(VARCHAR ,GETDATE(),112))
		  AND( (CONVERT(TIME ,GETDATE(),114) >= CONVERT(TIME ,(SELECT str_time FROM getInfoAboutSpecificExam (@ex_id)),114) 
		  AND (CONVERT(TIME ,GETDATE(),114) <= CONVERT(TIME ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),114)))
		  ))
			BEGIN
				 IF(LOWER(@new_std_answer) =LOWER((SELECT Q.correct_ans FROM questions AS Q
									WHERE Q.q_id = @q_id)))
				 BEGIN
					  set @Q_degree = (SELECT EQ.q_degree FROM [dbo].[exam_questions] as EQ
									where EQ.ex_id=@ex_id and Eq.q_id=@q_id)
				END
				ELSE
					BEGIN 
						set @Q_degree =0.0;
					END

				UPDATE  student_answers SET degree=@Q_degree , std_ans =@new_std_answer 
				WHERE q_id= @q_id AND ex_id=@ex_id AND std_ssn= @std_ssn;
				PRINT 'you have Updated the answer of question.'
			END
			ELSE 
			BEGIN
			    SELECT CONCAT('the Exam date in ',(SELECT ex_year FROM getInfoAboutSpecificExam (@ex_id)),
				' and its Start Time in ' ,CONVERT(varchar(8) ,(SELECT str_time FROM getInfoAboutSpecificExam (@ex_id)),108),
				' and its End Time in ' ,CONVERT(varchar(8) ,(SELECT end_time FROM getInfoAboutSpecificExam (@ex_id)),108)
				) AS 'Note'
			END
END TRY
BEGIN CATCH
	    SELECT ERROR_MESSAGE() AS errorMessage;
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourse]
    @crs_code VARCHAR(25),
    @NewCourseName VARCHAR(50),
    @NewCourseDesc VARCHAR(MAX),
    @NewMinDeg numeric(18, 0),
    @NewMaxDeg numeric(18, 0),
    @NewInstSsn CHAR(14)
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@crs_code, '') = '')
        BEGIN
            THROW 50050, 'Please provide course code!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[courses] WHERE [crs_code] = @crs_code))
        BEGIN
            THROW 50051, 'Course not found!', 16;
        END
        
        IF (ISNULL(@NewCourseName, '') = '')
        BEGIN
            THROW 50052, 'Please provide the new course name!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[instructors] WHERE [inst_ssn] = @NewInstSsn))
        BEGIN
            THROW 50053, 'Instructor not found!', 16;
        END
        
        UPDATE [dbo].[courses]
        SET [crs_name] = @NewCourseName,
            [crs_desc] = @NewCourseDesc,
            [min_deg] = @NewMinDeg,
            [max_deg] = @NewMaxDeg,
            [inst_ssn] = @NewInstSsn
        WHERE [crs_code] = @crs_code;
        
        PRINT 'Course updated successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructor]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInstructor]
    @instssn CHAR(14),
    @NewName VARCHAR(50),
    @NewEmail VARCHAR(50),
    @NewPhone VARCHAR(11),
	@NewAddress VARCHAR(100),
    @NewHiredate DATE
AS
BEGIN
    BEGIN TRY
        IF (ISNULL(@instssn, '') = '')
        BEGIN
            THROW 50010, 'Please provide the instructor ID!', 16;
        END
        
        IF (ISNULL(@NewName, '') = '')
        BEGIN
            THROW 50011, 'Please provide the new name!', 16;
        END
        
        IF (ISNULL(@NewPhone, '') = '' OR LEN(@NewPhone) != 11)
        BEGIN
            THROW 50012, 'The new phone number must be 11 digits long!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[instructors] WHERE [inst_ssn] = @instssn))
        BEGIN
            THROW 50013, 'Instructor not found!', 16;
        END
        
        UPDATE [dbo].[instructors]
        SET [full_name] = @NewName,
            [email] = @NewEmail,
            [phone] = @NewPhone,
            [inst_address] = @NewAddress,
            [hire_date] = @NewHiredate
        WHERE [inst_ssn] = @instssn;
        
        PRINT 'Instructor updated successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateInstructorForCourse]    Script Date: 8/31/2023 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateInstructorForCourse]
    @inst_ssn CHAR(14),
    @crs_code VARCHAR(25),
    @new_inst_ssn CHAR(14)
AS
BEGIN
    BEGIN TRY
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[instructors] WHERE [inst_ssn] = @new_inst_ssn))
        BEGIN
            THROW 50071, 'New instructor not found!', 16;
        END
        
        IF (NOT EXISTS (SELECT 1 FROM [dbo].[courses] WHERE [crs_code] = @crs_code))
        BEGIN
            THROW 50072, 'Course not found!', 16;
        END
        
        UPDATE [dbo].[courses]
        SET [inst_ssn] = @new_inst_ssn
        WHERE  [crs_code] = @crs_code;
        
        PRINT 'Instructor for course updated successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Error ' + @ErrorMessage;
    END CATCH;
END;


GO
USE [master]
GO
ALTER DATABASE [examination_system] SET  READ_WRITE 
GO
