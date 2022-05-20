USE [master]
GO
/****** Object:  Database [gymmy]    Script Date: 5/20/2022 4:15:57 PM ******/
CREATE DATABASE [gymmy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gymmy', FILENAME = N'C:\Users\anita\gymmy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gymmy_log', FILENAME = N'C:\Users\anita\gymmy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [gymmy] SET COMPATIBILITY_LEVEL = 130
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
ALTER DATABASE [gymmy] SET QUERY_STORE = OFF
GO
USE [gymmy]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [gymmy]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 5/20/2022 4:15:57 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercise]    Script Date: 5/20/2022 4:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercise](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
	[description] [varchar](max) NULL,
	[photo] [varchar](max) NULL,
	[Type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExercisePhotos]    Script Date: 5/20/2022 4:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExercisePhotos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idExercise] [int] NOT NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marker]    Script Date: 5/20/2022 4:15:57 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routine]    Script Date: 5/20/2022 4:15:57 PM ******/
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
	[Model3D] [varchar](max) NULL,
	[Marker] [varchar](max) NULL,
	[audio] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutineCategory]    Script Date: 5/20/2022 4:15:57 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoutineCategoryLevel]    Script Date: 5/20/2022 4:15:57 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/20/2022 4:15:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](max) NULL,
	[photo] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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

INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (1, N'Curl de bicep concentrado con mancuerna en banca (silla)', N'Para realizar el ejercicio debemos comenzar sentados en un banco, con ambos pies apoyados en el piso y una mancuerna cogida en una mano de manera que la palma de la misma al sujetar el peso mire hacia arriba, es decir, en supinación. El codo del mismo brazo que sujeta la mancuerna debemos apoyarlo en la cara interna del muslo del mismo lado, mientras el brazo permanece extendido.Desde esa posición iniciamos, con el tronco levemente inclinado, el movimiento. Inspiramos y flexionamos el codo para llevar el peso desde el pie hacia la rodilla contraria. Espiramos al final del movimiento y comenzamos un descenso controlado del peso hasta extender el codo nuevamente.', N'https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/6550874/pexels-photo-6550874.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w', 4)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (2, N'Sentadilla sumo con mancuerna', N'Colócate con las piernas más separadas de anchura de caderas y puntas de los pies abiertas con la mancuerna entre tus piernas.Activa la musculatura de la espalda y abdominales y comienza a bajar lentamente haciendo la sentadilla sumo a coger la mancuerna.Cuando la cojas, sube contrayendo las piernas y glúteos mientras sueltas el aire.', N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (3, N'Dorsales remo con mancuernas.', N'Mantener la espalda y la cabeza en posición neutra durante todo el ejercicio;Estirar el dorsal "dejando caer" la escápula (protracción) rotando ligeramente a nivel del tórax por el lado opuesto al que estamos trabajando;Retraer la escápula y sacar pecho hacia afuera.', N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x612', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (4, N'Elevaciones frontales con mancuerna.', N'Para comenzar el movimiento debemos colocarnos de pie, con los pies ligeramente separados y mancuernas sujetadas con las manos en pronación o palmas hacia abajo, es decir, con el dorso de la mano mirando hacia afuera y los dedos hacia el cuerpo.Las mancuernas deben apoyarse junto a las manos sobre los muslos, ligeramente hacia los costados. Inspiramos y comenzamos a contraer los músculos para elevar un brazo hacia adelante mientras espiramos el aire.', N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (5, N'Prensa a 45 grados.', N'Para realizar el ejercicio debemos emplear una máquina que funciona como su nombre lo indica, como una prensa en la cual nosotros debemos resistir el peso seleccionado y cargado previamente. Nos colocaremos con la espalda bien apoyada en el respaldo de la máquina llamada prensa inclinada a 45 grados y los pies sobre la plataforma que debemos empujar, medianamente separados entre sí.Quitamos los soportes laterales del peso y empujamos la plataforma con las piernas para dejar casi extendidas las mismas. Desde allí, inspiramos y con las rodillas desbloqueadas flexionamos las piernas hasta que los muslos lleguen lo más cercano posible de la caja torácica sin sobrepasar el ángulo de 90 grados con las piernas. Lentamente regresamos a la posición inicial sin extender por completo las rodillas y exhalamos al final del movimiento.', N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x612', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (6, N'Press de pecho en banca con mancuernas.', N'Para iniciar la realización del ejercicio es necesario acostarse en un banco plano con los glúteos, caderas y hombros sobre el banco. Los pies deben apoyarse en suelo, separados un poco más allá del ancho de lo hombros. Con las manos debemos tomar la barra de manera que las palmas miren hacia adelante, es decir, en pronación, y separadas ligeramente más allá de la anchura de los hombros.El brazo y el antebrazo deben formar un ángulo de 90º, por lo que debemos flexionar el codo de manera que la barra tomada con las manos quede exactamente encima del pecho.Desde allí debemos inspirar y descender lentamente la barra hacia el pecho, sin despegar la espalda del banco. Una vez la barra esté sobre el pecho debemos empujar hacia arriba mientras espiramos y subimos lentamente los brazos.', N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (7, N'Zancada en pie con banca y mancuerna.', N'para la realizacion de este ejercicio es necesario contar con un banco como bien se ve la animacion y una mancuerna, se sujeta la mancuerna y se coloca la pierna opuesta al brazo que sostiene la mancuerna en puntillas y la otra pierna se flexiona de tal manera que la rodilla forme un angulo de 90 grados, se inhala y se baja levemente con la espalda recta y se vuelve a subir y se exhala como bien se ve en la animación.', N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x612', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (8, N'Curl de bíceps alternos con suspensión.', N'Para realizar este ejercicio es necesario estar parado y tener los pies levemente separados sujetar las 2 mancuernas inspirar y flexionar los codos efectuando un rotacion externa de la muñeca antes que los antebrazos alcancen la linea horizantal, al finalizar la flexion deberas  elevar los codos y alli puedes soltar el aire recien al final del movimiento.', N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (9, N'Remo con mancuerna en banco inclinado.', N'Necesita colocar un banco inclinado a 30º para hacer el ejercicio. Seleccione el peso adecuado de las mancuernas. Coja las pesas, siéntese en el banco y descanse el pecho sobre la almohadilla. Su cabeza debe estar más alta que el banco. Los pies deben estar en el suelo y los brazos deben estar rectos.Retrayendo los omóplatos, levante las mancuernas hacia los lados de su pecho mientras exhala. Mientras hace el ejercicio, mueva solo el brazo, asegúrese de no mover ninguna otra parte de su cuerpo. Vuelva a la posición inicial con un suave movimiento mientras inhala.', N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (10, N'Pájaros en banca con mancuernas.', N'Para realizar este ejercicio es necesario con tar con un banco y 2 mancuernas, se procede a sentar en el banco de frsnte de tal manera que el abdomen este de cara el banco, la cabeza tiene que sobresalir del asiento, se toman las 2 mancuernas antes de sentarse en el banco y se levantan haciendo fuerza  hacia el centro de la columna , se inhala y se exhala, este movimiento se repite varias veces.', N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png', 3)
INSERT [dbo].[Exercise] ([id], [name], [description], [photo], [Type]) VALUES (11, N' Extensiones de cuádriceps.', N'Para comenzar el ejercicio de extensión de piernas en máquina debemos sentarnos en la máquina específica para tal fin y colocar los pies debajo de las almohadillas o rodillos acolchados, de manera tal que las rodillas queden alineadas con la articulación de la máquina.12)	Colocamos las manos agarrando el asiento o los brazos del sillon para estabilizar el tronco y nos sentamos de manera tal que la espalda y las caderas queden perfectamente apoyadas sobre el respaldo de la máquina. Previamente debemos cargar la máquina con el peso elegido y una vez en esta posición, debemos inspirar y realizar una extensión de rodilla de manera de levantar el peso con las piernas hasta que éstas queden horizontales y paralelas al piso, el torso debe permanecer inmóvil y erguido.', N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612', 3)
SET IDENTITY_INSERT [dbo].[Exercise] OFF
GO
SET IDENTITY_INSERT [dbo].[ExercisePhotos] ON 

INSERT [dbo].[ExercisePhotos] ([id], [idExercise], [photo]) VALUES (1, 1, N'https://www.sportlife.es/uploads/s1/76/31/43/1/article-biceps-consigue-brazos-fuertes-funcionales-58ac78bf84823.jpeg')
INSERT [dbo].[ExercisePhotos] ([id], [idExercise], [photo]) VALUES (2, 1, N'https://sportadictos.com/wp-content/blogs.dir/29/files/2013/10/biceps-curl.jpg')
INSERT [dbo].[ExercisePhotos] ([id], [idExercise], [photo]) VALUES (3, 1, N'https://i.blogs.es/6927c6/biceps-curl-concentrado/1366_2000.jpeg')
INSERT [dbo].[ExercisePhotos] ([id], [idExercise], [photo]) VALUES (4, 2, N'https://ejerciciosfisicos.es/media/sumo-squats-with-kettlebell_4.jpg.400x330_q95_crop-%2C_filters-detail.jpg')
INSERT [dbo].[ExercisePhotos] ([id], [idExercise], [photo]) VALUES (5, 2, N'https://dam.esquirelat.com/wp-content/uploads/2020/07/Sentadilla-sumo-con-mancuerna1.jpg')
INSERT [dbo].[ExercisePhotos] ([id], [idExercise], [photo]) VALUES (6, 2, N'https://css.adelgazarencasa.co/wp-content/uploads/2020/06/dumbbell-sumo-suqat.jpg')
SET IDENTITY_INSERT [dbo].[ExercisePhotos] OFF
GO
SET IDENTITY_INSERT [dbo].[Routine] ON 

INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (34, 1, 2, 1, 1, N'Curl de bicep concentrado con mancuerna en banca (silla)', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w', N'https://cdn.glitch.com/0cbf313d-fcae-4c85-bf6c-af26b450ab6a%2Fasset.gltf?v=1627253210888', N'https://cdn.glitch.com/0cbf313d-fcae-4c85-bf6c-af26b450ab6a%2Fmarker.patt?v=1627253136545', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (35, 2, 2, 1, 1, N'Curl de bicep concentrado con mancuerna en banca (silla)', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w', N'https://cdn.glitch.com/0cbf313d-fcae-4c85-bf6c-af26b450ab6a%2Fasset.gltf?v=1627253210888', N'https://cdn.glitch.com/0cbf313d-fcae-4c85-bf6c-af26b450ab6a%2Fmarker.patt?v=1627253136545', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (36, 3, 2, 1, 1, N'Curl de bicep concentrado con mancuerna en banca (silla)', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=650&w=940%20940w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260%201260w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940%201880w,%20https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260%202520w', N'https://cdn.glitch.com/0cbf313d-fcae-4c85-bf6c-af26b450ab6a%2Fasset.gltf?v=1627253210888', N'https://cdn.glitch.com/0cbf313d-fcae-4c85-bf6c-af26b450ab6a%2Fmarker.patt?v=1627253136545', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (37, 7, 2, 2, 1, N'Sentadilla sumo con mancuerna', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fasset.gltf?v=1627257056384', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (38, 8, 2, 2, 1, N'Sentadilla sumo con mancuerna', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fasset.gltf?v=1627257056384', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (39, 9, 2, 2, 1, N'Sentadilla sumo con mancuerna', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/4720242/pexels-photo-4720242.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fasset.gltf?v=1627257056384', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (40, 13, 2, 3, 1, N'Dorsales remo con mancuernas.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x612', N'https://cdn.glitch.com/5a1c60aa-9c03-4304-b241-1069e13577d8%2Fasset.gltf?v=1627254064019', N'https://cdn.glitch.com/5a1c60aa-9c03-4304-b241-1069e13577d8%2Fmarker.patt?v=1627254017326', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (41, 14, 2, 3, 1, N'Dorsales remo con mancuernas.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x613', N'https://cdn.glitch.com/5a1c60aa-9c03-4304-b241-1069e13577d8%2Fasset.gltf?v=1627254064019', N'https://cdn.glitch.com/5a1c60aa-9c03-4304-b241-1069e13577d8%2Fmarker.patt?v=1627254017326', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (42, 15, 2, 3, 1, N'Dorsales remo con mancuernas.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/healty-man-exercising-with-arm-weights-picture-id679247126?s=612x614', N'https://cdn.glitch.com/5a1c60aa-9c03-4304-b241-1069e13577d8%2Fasset.gltf?v=1627254064019', N'https://cdn.glitch.com/5a1c60aa-9c03-4304-b241-1069e13577d8%2Fmarker.patt?v=1627254017326', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (43, 4, 2, 4, 1, N'Elevaciones frontales con mancuerna.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (44, 5, 2, 4, 1, N'Elevaciones frontales con mancuerna.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (45, 6, 2, 4, 1, N'Elevaciones frontales con mancuerna.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=650&w=940 940w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 1260w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 1880w, https://images.pexels.com/photos/3931376/pexels-photo-3931376.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260 2520w', N'', NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (46, 7, 3, 5, 1, N'Prensa a 45 grados.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x612', N'https://cdn.glitch.com/64466ef4-fb99-4cb5-bcf7-12a96bf5e9a0%2Fasset.gltf?v=1628730887576', N'https://cdn.glitch.com/64466ef4-fb99-4cb5-bcf7-12a96bf5e9a0%2Fmarker.patt?v=1628730807254', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (47, 8, 3, 5, 1, N'Prensa a 45 grados.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x613', N'https://cdn.glitch.com/64466ef4-fb99-4cb5-bcf7-12a96bf5e9a0%2Fasset.gltf?v=1628730887576', N'https://cdn.glitch.com/64466ef4-fb99-4cb5-bcf7-12a96bf5e9a0%2Fmarker.patt?v=1628730807254', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (48, 9, 3, 5, 1, N'Prensa a 45 grados.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/leg-day-for-beautiful-woman-picture-id617880750?s=612x614', N'https://cdn.glitch.com/64466ef4-fb99-4cb5-bcf7-12a96bf5e9a0%2Fasset.gltf?v=1628730887576', N'https://cdn.glitch.com/64466ef4-fb99-4cb5-bcf7-12a96bf5e9a0%2Fmarker.patt?v=1628730807254', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (49, 10, 1, 6, 1, N'Press de pecho en banca con mancuernas.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', N'https://cdn.glitch.com/95c45b57-9aef-4b3a-acb0-1f3b66b78cef%2Fasset.gltf?v=1627870976065', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (50, 11, 1, 6, 1, N'Press de pecho en banca con mancuernas.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=941', N'https://cdn.glitch.com/95c45b57-9aef-4b3a-acb0-1f3b66b78cef%2Fasset.gltf?v=1627870976065', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (51, 12, 1, 6, 1, N'Press de pecho en banca con mancuernas.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/3837743/pexels-photo-3837743.jpeg?auto=compress&cs=tinysrgb&h=650&w=942', N'https://cdn.glitch.com/95c45b57-9aef-4b3a-acb0-1f3b66b78cef%2Fasset.gltf?v=1627870976065', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (52, 7, 1, 7, 1, N'Zancada en pie con banca y mancuerna.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x612', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (53, 8, 1, 7, 1, N'Zancada en pie con banca y mancuerna.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x613', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (54, 9, 1, 7, 1, N'Zancada en pie con banca y mancuerna.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/sporty-woman-in-the-park-picture-id1219232325?s=612x614', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (55, 1, 1, 8, 1, N'Curl de bíceps alternos con suspensión.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=940', N'https://cdn.glitch.com/95ab2c6d-aed4-4fc1-877a-9f7608719b0d%2Fasset.gltf?v=1627870038229', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (56, 2, 1, 8, 1, N'Curl de bíceps alternos con suspensión.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=941', N'https://cdn.glitch.com/95ab2c6d-aed4-4fc1-877a-9f7608719b0d%2Fasset.gltf?v=1627870038229', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (57, 3, 1, 8, 1, N'Curl de bíceps alternos con suspensión.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://images.pexels.com/photos/6550854/pexels-photo-6550854.jpeg?auto=compress&cs=tinysrgb&h=650&w=942', N'https://cdn.glitch.com/95ab2c6d-aed4-4fc1-877a-9f7608719b0d%2Fasset.gltf?v=1627870038229', N'https://cdn.glitch.com/55d28b0e-9061-4d22-93a0-f54a126fba06%2Fmarker.patt?v=1627257018882', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (58, 13, 1, 9, 1, N'Remo con mancuerna en banco inclinado.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp', N'https://cdn.glitch.com/ace18b9c-4eb0-4b90-a35b-9c9dca63294d%2Fasset.gltf?v=1627871363182', NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (59, 14, 1, 9, 1, N'Remo con mancuerna en banco inclinado.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp', N'https://cdn.glitch.com/ace18b9c-4eb0-4b90-a35b-9c9dca63294d%2Fasset.gltf?v=1627871363182', NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (60, 15, 1, 9, 1, N'Remo con mancuerna en banco inclinado.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://www.cambiatufisico.com/wp-content/uploads/remo-mancuernas-banco-inclinado2.jpg.webp', N'https://cdn.glitch.com/ace18b9c-4eb0-4b90-a35b-9c9dca63294d%2Fasset.gltf?v=1627871363182', NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (61, 4, 1, 10, 1, N'Pájaros en banca con mancuernas.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (62, 5, 1, 10, 1, N'Pájaros en banca con mancuernas.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (63, 6, 1, 10, 1, N'Pájaros en banca con mancuernas.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://tumejorfisico.com/wp-content/uploads/2015/11/Elevaciones-frontales-alternas-con-mancuernas.png', NULL, NULL, N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (64, 7, 4, 11, 1, N' Extensiones de cuádriceps.', 5, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612', N'https://cdn.glitch.com/2c35aaa9-4e2b-4e72-bf97-90148db4ddf2%2Fasset.gltf?v=1628730279284', N'https://cdn.glitch.com/2c35aaa9-4e2b-4e72-bf97-90148db4ddf2%2Fmarker.patt?v=1628730193596', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (65, 8, 4, 11, 1, N' Extensiones de cuádriceps.', 10, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612', N'https://cdn.glitch.com/2c35aaa9-4e2b-4e72-bf97-90148db4ddf2%2Fasset.gltf?v=1628730279284', N'https://cdn.glitch.com/2c35aaa9-4e2b-4e72-bf97-90148db4ddf2%2Fmarker.patt?v=1628730193596', N'./assets/audio/prensa-45.ogg')
INSERT [dbo].[Routine] ([id], [idRoutineCategoryLevel], [idEquipment], [idExcercise], [idMark], [description], [repetitions], [time], [photo], [Model3D], [Marker], [audio]) VALUES (66, 9, 4, 11, 1, N' Extensiones de cuádriceps.', 20, CAST(0.00 AS Decimal(18, 2)), N'https://media.istockphoto.com/photos/woman-doing-leg-extensions-picture-id1032694158?s=612x612', N'https://cdn.glitch.com/2c35aaa9-4e2b-4e72-bf97-90148db4ddf2%2Fasset.gltf?v=1628730279284', N'https://cdn.glitch.com/2c35aaa9-4e2b-4e72-bf97-90148db4ddf2%2Fmarker.patt?v=1628730193596', N'./assets/audio/prensa-45.ogg')
SET IDENTITY_INSERT [dbo].[Routine] OFF
GO
SET IDENTITY_INSERT [dbo].[RoutineCategory] ON 

INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (1, N'brazos', N'Rutina para brazos ', N'https://images.pexels.com/photos/1978505/pexels-photo-1978505.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (2, N'hombros', N'Rutina para hombros', N'https://images.pexels.com/photos/4720259/pexels-photo-4720259.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (3, N'piernas', N'Rutina para pierna', N'https://images.pexels.com/photos/2261484/pexels-photo-2261484.jpeg?auto=compress&cs=tinysrgb&h=650&w=940')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (4, N'pecho', N'Rutina para pecho', N'https://images.pexels.com/photos/3839280/pexels-photo-3839280.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
INSERT [dbo].[RoutineCategory] ([id], [name], [description], [photo]) VALUES (5, N'espalda', N'Rutina para espalda', N'https://images.pexels.com/photos/28061/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=650&w=940')
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

INSERT [dbo].[Users] ([id], [name], [email], [password], [photo]) VALUES (5, N'Minerva', N'mine@yopmail.com', N'E13EFC991A9BF44BBB4DA87CDBB725240184585CCAF270523170E008CF2A3B85F45F86C3DA647F69780FB9E971CAF5437B3D06D418355A68C9760C70A31D05C7', N'https://lh3.googleusercontent.com/a-/AOh14GhC01Ft5hNTfp9d0-8kxK9zaNDpdlxjnMAIjJDT')
INSERT [dbo].[Users] ([id], [name], [email], [password], [photo]) VALUES (1002, N'kevin', N'knava@yopmail.com', N'E13EFC991A9BF44BBB4DA87CDBB725240184585CCAF270523170E008CF2A3B85F45F86C3DA647F69780FB9E971CAF5437B3D06D418355A68C9760C70A31D05C7', N'https://testingblobazure.blob.core.windows.net/images/202110101218333202.jpg')
INSERT [dbo].[Users] ([id], [name], [email], [password], [photo]) VALUES (1003, N'jhon does', N'jhondoe@yopmail.com', N'E13EFC991A9BF44BBB4DA87CDBB725240184585CCAF270523170E008CF2A3B85F45F86C3DA647F69780FB9E971CAF5437B3D06D418355A68C9760C70A31D05C7', N'')
INSERT [dbo].[Users] ([id], [name], [email], [password], [photo]) VALUES (1004, N'ben greenep', N'ben@yopmail.com', N'BA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB413', N'')
INSERT [dbo].[Users] ([id], [name], [email], [password], [photo]) VALUES (1005, N'claire rivers', N'claire@yopmail.com', N'BA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB413', NULL)
INSERT [dbo].[Users] ([id], [name], [email], [password], [photo]) VALUES (2002, N'kevin nava', N'kevin@yopmail.com', N'E13EFC991A9BF44BBB4DA87CDBB725240184585CCAF270523170E008CF2A3B85F45F86C3DA647F69780FB9E971CAF5437B3D06D418355A68C9760C70A31D05C7', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_users_email]    Script Date: 5/20/2022 4:15:57 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [uq_users_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExercisePhotos]  WITH CHECK ADD  CONSTRAINT [FK_ExercisePhotos_Exercise] FOREIGN KEY([idExercise])
REFERENCES [dbo].[Exercise] ([id])
GO
ALTER TABLE [dbo].[ExercisePhotos] CHECK CONSTRAINT [FK_ExercisePhotos_Exercise]
GO
USE [master]
GO
ALTER DATABASE [gymmy] SET  READ_WRITE 
GO
