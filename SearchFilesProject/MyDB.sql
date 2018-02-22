USE [master]
GO
/****** Object:  Database [SearcheFiles]    Script Date: 15/02/2018 17:38:26 ******/
CREATE DATABASE [SearcheFiles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SearcheFiles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SearcheFiles.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SearcheFiles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SearcheFiles_log.ldf' , SIZE = 12352KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SearcheFiles] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SearcheFiles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SearcheFiles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SearcheFiles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SearcheFiles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SearcheFiles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SearcheFiles] SET ARITHABORT OFF 
GO
ALTER DATABASE [SearcheFiles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SearcheFiles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SearcheFiles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SearcheFiles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SearcheFiles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SearcheFiles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SearcheFiles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SearcheFiles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SearcheFiles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SearcheFiles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SearcheFiles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SearcheFiles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SearcheFiles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SearcheFiles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SearcheFiles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SearcheFiles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SearcheFiles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SearcheFiles] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SearcheFiles] SET  MULTI_USER 
GO
ALTER DATABASE [SearcheFiles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SearcheFiles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SearcheFiles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SearcheFiles] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SearcheFiles] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SearcheFiles]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 15/02/2018 17:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[SearchId] [int] NOT NULL,
	[FilePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Search]    Script Date: 15/02/2018 17:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Search](
	[SearchId] [int] IDENTITY(1,1) NOT NULL,
	[SearchString] [nvarchar](50) NOT NULL,
	[SearchFolder] [nvarchar](50) NULL,
 CONSTRAINT [PK_Search] PRIMARY KEY CLUSTERED 
(
	[SearchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ResultId], [SearchId], [FilePath]) VALUES (10813, 114, N'D:\FLOWER\FLOwer.docx')
INSERT [dbo].[Result] ([ResultId], [SearchId], [FilePath]) VALUES (10814, 114, N'D:\FLOWER\John\Bryce\my best flower ever.docx')
INSERT [dbo].[Result] ([ResultId], [SearchId], [FilePath]) VALUES (10815, 115, N'C:\FLOWER\my after flower in the.rtf')
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Search] ON 

INSERT [dbo].[Search] ([SearchId], [SearchString], [SearchFolder]) VALUES (114, N'*flower*', N'D:\FLOWER')
INSERT [dbo].[Search] ([SearchId], [SearchString], [SearchFolder]) VALUES (115, N'*flower*', N'C:\FLOWER')
SET IDENTITY_INSERT [dbo].[Search] OFF
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_ToTable] FOREIGN KEY([SearchId])
REFERENCES [dbo].[Search] ([SearchId])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_ToTable]
GO
USE [master]
GO
ALTER DATABASE [SearcheFiles] SET  READ_WRITE 
GO
