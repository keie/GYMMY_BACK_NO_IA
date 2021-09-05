USE [master]
GO
/****** Object:  Database [gymmy]    Script Date: 8/8/2021 5:19:05 PM ******/
CREATE DATABASE [gymmy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gymmy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gymmy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gymmy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gymmy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gymmy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gymmy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gymmy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gymmy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gymmy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gymmy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gymmy] SET ARITHABORT OFF 
GO
ALTER DATABASE [gymmy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gymmy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gymmy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gymmy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gymmy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gymmy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gymmy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gymmy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gymmy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gymmy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [gymmy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gymmy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gymmy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gymmy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gymmy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gymmy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gymmy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gymmy] SET RECOVERY FULL 
GO
ALTER DATABASE [gymmy] SET  MULTI_USER 
GO
ALTER DATABASE [gymmy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gymmy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gymmy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gymmy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gymmy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gymmy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gymmy', N'ON'
GO
ALTER DATABASE [gymmy] SET QUERY_STORE = OFF
GO
USE [gymmy]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[description] [varchar](200) NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[description] [varchar](200) NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marker]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routine]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRoutineCategoryLevel] [int] NULL,
	[idEquipment] [int] NULL,
	[idExcercise] [int] NULL,
	[idMark] [int] NULL,
	[description] [varchar](200) NULL,
	[repetitions] [int] NULL,
	[time] [decimal](18, 2) NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutineCategory]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutineCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[description] [varchar](200) NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutineCategoryLevel]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoutineCategoryLevel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[description] [varchar](200) NULL,
	[photo] [varchar](max) NULL,
	[idRoutineCategory] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/8/2021 5:19:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([id], [name], [description], [photo]) VALUES (1, N'press de banca', N'banca con soporte superior', N'https://m.media-amazon.com/images/I/71Q6hdT4O5L._AC_SL1500_.jpg')
INSERT [dbo].[Equipment] ([id], [name], [description], [photo]) VALUES (2, N'Mancuerna', N'Aparato gimnástico formado por una barra de metal con una o más piezas pesadas en cada extremo', N'https://m.media-amazon.com/images/I/61-voCPy-zL._AC_SL1500_.jpg')
INSERT [dbo].[Equipment] ([id], [name], [description], [photo]) VALUES (3, N'Prensa de pierna', N'Maquina pesada para la extension de piern sentado', N'https://m.media-amazon.com/images/I/41C+sV2ZplL._AC_.jpg')
INSERT [dbo].[Equipment] ([id], [name], [description], [photo]) VALUES (4, N'Banco de peso ajustable', N'Banco de peso ajustable', N'https://www.amazon.com/-/es/entrenamiento-ajustable-ejercicios-inclinado-extensi%C3%B3n/dp/B08TBJMLDD/ref=sr_1_3?__mk_es_US=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=leg+extension&qid=1628427014&sr=8-3')
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Exercise] ON 

INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (1, N'Curl de bicep concentrado con mancuerna en banca (silla)', N'Curl de bicep concentrado con mancuerna en banca (silla)', N'https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (2, N'Sentadilla sumo con mancuerna', N'Sentadilla sumo con mancuerna', N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (3, N'Dorsales remo con mancuernas.', N'Dorsales remo con mancuernas.', N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x612')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (4, N'Elevaciones frontales con mancuerna.', N'Elevaciones frontales con mancuerna.', N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (5, N'Prensa a 45 grados.', N'Prensa a 45 grados.', N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x612')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (6, N'Press de pecho en banca con mancuernas.', N'Press de pecho en banca con mancuernas.', N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (7, N'Zancada en pie con banca y mancuerna.', N'Zancada en pie con banca y mancuerna.', N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x612')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (8, N'Curl de bíceps alternos con suspensión.', N'Curl de bíceps alternos con suspensión.', N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (9, N'Remo con mancuerna en banco inclinado.', N'Remo con mancuerna en banco inclinado.', N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (10, N'Pájaros en banca con mancuernas.', N'Pájaros en banca con mancuernas.', N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png')
INSERT [dbo].[Exercise] ([id], [name], [description], [photo]) VALUES (11, N' Extensiones de cuádriceps.', N' Extensiones de cuádriceps.', N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612')
SET IDENTITY_INSERT [dbo].[Exercise] OFF
GO
SET IDENTITY_INSERT [dbo].[Routine] ON 

INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (34, 1, 2, 1, 1, N'Curl de bicep concentrado con mancuerna en banca (silla)', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (35, 2, 2, 1, 1, N'Curl de bicep concentrado con mancuerna en banca (silla)', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (36, 3, 2, 1, 1, N'Curl de bicep concentrado con mancuerna en banca (silla)', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (37, 7, 2, 2, 1, N'Sentadilla sumo con mancuerna', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (38, 8, 2, 2, 1, N'Sentadilla sumo con mancuerna', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (39, 9, 2, 2, 1, N'Sentadilla sumo con mancuerna', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (40, 13, 2, 3, 1, N'Dorsales remo con mancuernas.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x612')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (41, 14, 2, 3, 1, N'Dorsales remo con mancuernas.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x613')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (42, 15, 2, 3, 1, N'Dorsales remo con mancuernas.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x614')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (43, 4, 2, 4, 1, N'Elevaciones frontales con mancuerna.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (44, 5, 2, 4, 1, N'Elevaciones frontales con mancuerna.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (45, 6, 2, 4, 1, N'Elevaciones frontales con mancuerna.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (46, 7, 3, 5, 1, N'Prensa a 45 grados.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x612')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (47, 8, 3, 5, 1, N'Prensa a 45 grados.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x613')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (48, 9, 3, 5, 1, N'Prensa a 45 grados.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x614')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (49, 10, 1, 6, 1, N'Press de pecho en banca con mancuernas.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (50, 11, 1, 6, 1, N'Press de pecho en banca con mancuernas.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=941')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (51, 12, 1, 6, 1, N'Press de pecho en banca con mancuernas.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=942')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (52, 7, 1, 7, 1, N'Zancada en pie con banca y mancuerna.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x612')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (53, 8, 1, 7, 1, N'Zancada en pie con banca y mancuerna.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x613')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (54, 9, 1, 7, 1, N'Zancada en pie con banca y mancuerna.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x614')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (55, 1, 1, 8, 1, N'Curl de bíceps alternos con suspensión.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (56, 2, 1, 8, 1, N'Curl de bíceps alternos con suspensión.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=941')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (57, 3, 1, 8, 1, N'Curl de bíceps alternos con suspensión.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=942')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (58, 13, 1, 9, 1, N'Remo con mancuerna en banco inclinado.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (59, 14, 1, 9, 1, N'Remo con mancuerna en banco inclinado.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (60, 15, 1, 9, 1, N'Remo con mancuerna en banco inclinado.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (61, 4, 1, 10, 1, N'Pájaros en banca con mancuernas.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (62, 5, 1, 10, 1, N'Pájaros en banca con mancuernas.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (63, 6, 1, 10, 1, N'Pájaros en banca con mancuernas.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (64, 7, 4, 11, 1, N' Extensiones de cuádriceps.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (65, 8, 4, 11, 1, N' Extensiones de cuádriceps.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo]) VALUES (66, 9, 4, 11, 1, N' Extensiones de cuádriceps.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612')
SET IDENTITY_INSERT [dbo].[Routine] OFF
GO
SET IDENTITY_INSERT [dbo].[RoutineCategory] ON 

INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (1, N'Rutina de brazos', N'Rutina para brazos ', N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (2, N'Rutina de hombros', N'Rutina para hombros', N'https://images.pexels.com/photos/4720259/pexels-photo-4720259.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (3, N'Rutina de pierna', N'Rutina para pierna', N'https://images.pexels.com/photos/2261484/pexels-photo-2261484.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (4, N'Rutina de pecho', N'Rutina para pecho', N'https://images.pexels.com/photos/3839280/pexels-photo-3839280.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (5, N'Rutina de espalda', N'Rutina para espalda', N'https://images.pexels.com/photos/28061/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=650&w=940')
SET IDENTITY_INSERT [dbo].[RoutineCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[RoutineCategoryLevel] ON 

INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (1, N'Nivel bajo', N'Nivel para principiantes', N'https://images.pexels.com/photos/1257770/pexels-photo-1257770.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 1)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (2, N'Nivel medio', N'Nivel para amateurs', N'https://images.pexels.com/photos/2080544/pexels-photo-2080544.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 1)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (3, N'Nivel alto', N'Nivel para avanzados', N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w', 1)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (4, N'Nivel bajo', N'Nivel para principiantes', N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w', 2)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (5, N'Nivel medio', N'Nivel para amateurs', N'https://media.istockphoto.com/photos/warming-up-for-a-workout-routine-picture-id176622672?s=612x612', 2)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (6, N'Nivel alto', N'Nivel para avanzados', N'https://media.istockphoto.com/photos/woman-lifting-weights-picture-id600678002?s=612x612', 2)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (7, N'Nivel bajo', N'Nivel para principiantes', N'https://images.pexels.com/photos/3766219/pexels-photo-3766219.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3766219/pexels-photo-3766219.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3766219/pexels-photo-3766219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3766219/pexels-photo-3766219.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', 3)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (8, N'Nivel medio', N'Nivel para amateurs', N'https://images.pexels.com/photos/2996261/pexels-photo-2996261.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/2996261/pexels-photo-2996261.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/2996261/pexels-photo-2996261.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/2996261/pexels-photo-2996261.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', 3)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (9, N'Nivel alto', N'Nivel para avanzados', N'https://images.pexels.com/photos/2261484/pexels-photo-2261484.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 3)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (10, N'Nivel bajo', N'Nivel para principiantes', N'https://media.istockphoto.com/photos/muscular-arms-crossed-picture-id917064138?s=612x612', 4)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (11, N'Nivel medio', N'Nivel para amateurs', N'https://media.istockphoto.com/photos/chest-and-neck-of-a-young-strong-man-picture-id526723119?s=612x612', 4)
INSERT [dbo].[RoutineCategoryLevel] ([id], [name], [description], [photo], [idRoutineCategory]) VALUES (12, N'Nivel alto', N'Nivel para avanzados', N'https://media.istockphoto.com/photos/strong-muscular-men-picture-id618209684?s=612x612', 4)
SET IDENTITY_INSERT [dbo].[RoutineCategoryLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [email], [password]) VALUES (4, N'jhon@doe.com', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [gymmy] SET  READ_WRITE 
GO
