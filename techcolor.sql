USE [master]
GO
/****** Object:  Database [techcolordb]    Script Date: 6/12/2021 11:31:29 a. m. ******/
CREATE DATABASE [techcolordb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'techcolordb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\techcolordb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'techcolordb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\techcolordb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [techcolordb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [techcolordb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [techcolordb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [techcolordb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [techcolordb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [techcolordb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [techcolordb] SET ARITHABORT OFF 
GO
ALTER DATABASE [techcolordb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [techcolordb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [techcolordb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [techcolordb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [techcolordb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [techcolordb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [techcolordb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [techcolordb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [techcolordb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [techcolordb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [techcolordb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [techcolordb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [techcolordb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [techcolordb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [techcolordb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [techcolordb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [techcolordb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [techcolordb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [techcolordb] SET  MULTI_USER 
GO
ALTER DATABASE [techcolordb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [techcolordb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [techcolordb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [techcolordb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [techcolordb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [techcolordb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [techcolordb] SET QUERY_STORE = OFF
GO
USE [techcolordb]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 6/12/2021 11:31:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Sexo] [char](1) NULL,
	[Direccion] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 6/12/2021 11:31:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](50) NULL,
	[Cargo] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 6/12/2021 11:31:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[Total] [int] NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 6/12/2021 11:31:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[TipoPedido] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Cantidad] [int] NULL,
	[idCliente] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/12/2021 11:31:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [int] NULL,
	[Cantidad] [int] NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (1, N'Juan', N'Mendoza', 34, N'm', N'calle #15 bella vista', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (2, N'Samuel', N'hernandez', 22, N'm', N'calle liberacion', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (3, N'Maria', N'Tejeda', 60, N'f', N'los frailes', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (4, N'Pepe', N'Ramirez', 20, N'm', N'calle #3 piantini', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (5, N'Miguel', N'Martinez', 45, N'm', N'gregorio luperon #25', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (6, N'Rafael', N'Peña', 22, N'm', N'Cibao central', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (7, N'Elizabeth', N'Gonzalez', 18, N'f', N'nuevo proyecto la vega', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (8, N'Carmen', N'NUñez', 56, N'f', N'Calle modesto Diaz #2', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (9, N'Altagracia', N'Santana', 35, N'f', N'Ensanche piantini', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [Apellido], [Edad], [Sexo], [Direccion], [Fecha]) VALUES (10, N'Juana', N'Henriquez', 80, N'f', N'calle hermanas mirabal #68', CAST(N'2021-12-06T11:09:54.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (1, N'Ramon', N'jimenez', N'nuevo proyecto la vega', N'809-645-5468', N'ramon@gmail.com', N'cajero', CAST(N'2021-12-06T11:11:36.463' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (2, N'Maria', N'Santana', N'calle hermanas mirabal #68', N'829-126-6284', N'maria@gmail.com', N'diseñadora', CAST(N'2021-12-06T11:11:36.463' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (3, N'Miguel', N'Gonzalez', N'Calle modesto Diaz #2', N'849-825-3964', N'miguel@gmail.com', N'diseñador', CAST(N'2021-12-06T11:11:36.463' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (4, N'Carmen', N'Peña', N'gregorio luperon #25', N'809-962-3587', N'carmen@gmail.com', N'diseñadora', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (5, N'Altagracia', N'Ramirez', N'Ensanche piantini', N'829-642-9634', N'altagracia@gmail.com', N'diseñadora', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (6, N'Juana', N'Tejeda', N'los frailes', N'829-983-9372', N'juana@gmail.com', N'cajera', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (7, N'Rafael', N'hernandez', N'salcedo', N'809-769-3159', N'rafael@gmail.com', N'diseñador', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (8, N'Jonas', N'Mendoza', N'calle liberacion', N'829-258-8234', N'jonas@gmail.com', N'diseñador', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (9, N'Euripide', N'Pinzon', N'Calle modesto Diaz #2', N'809-675-2867', N'euripide@gmail.com', N'encargado de impresion', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombre], [Apellido], [Direccion], [Telefono], [Correo], [Cargo], [Fecha]) VALUES (10, N'Marta', N'Martinez', N'Santo Domingo Norte Villa Mella', N'829-256-7846', N'marta@gmail.com', N'secretaria', CAST(N'2021-12-06T11:11:36.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (1, 1, 6, 800, CAST(N'2021-12-06T11:28:46.833' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (2, 3, 1, 1200, CAST(N'2021-12-06T11:28:46.837' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (3, 6, 1, 2500, CAST(N'2021-12-06T11:28:46.837' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (4, 7, 1, 2000, CAST(N'2021-12-06T11:28:46.837' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (5, 4, 6, 1500, CAST(N'2021-12-06T11:28:46.837' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (6, 9, 1, 2000, CAST(N'2021-12-06T11:28:46.840' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (7, 2, 6, 1300, CAST(N'2021-12-06T11:28:46.840' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (8, 8, 6, 2000, CAST(N'2021-12-06T11:28:46.840' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (9, 3, 6, 1200, CAST(N'2021-12-06T11:28:46.840' AS DateTime))
INSERT [dbo].[Factura] ([idFactura], [idPedido], [idEmpleado], [Total], [Fecha]) VALUES (10, 5, 1, 1300, CAST(N'2021-12-06T11:28:46.840' AS DateTime))
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (1, N'Detalle', N'Despachado', 800, 2, 5, CAST(N'2021-12-06T11:28:14.647' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (2, N'Por Mayor', N'Pendiente', 1200, 5, 3, CAST(N'2021-12-06T11:28:14.650' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (3, N'Detalle', N'Pendiente', 2500, 1, 7, CAST(N'2021-12-06T11:28:14.650' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (4, N'Por Mayor', N'Despachado', 2000, 8, 1, CAST(N'2021-12-06T11:28:14.650' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (5, N'Detalle', N'Pendiente', 1500, 10, 3, CAST(N'2021-12-06T11:28:14.653' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (6, N'Detalle', N'Pendiente', 2000, 9, 4, CAST(N'2021-12-06T11:28:14.653' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (7, N'Detalle', N'Despachado', 1300, 6, 2, CAST(N'2021-12-06T11:28:14.653' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (8, N'Por Mayor', N'Despachado', 2000, 8, 2, CAST(N'2021-12-06T11:28:14.653' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (9, N'Detalle', N'Despachado', 1200, 1, 2, CAST(N'2021-12-06T11:28:14.653' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (10, N'Por Mayor', N'Pendiente', 1200, 9, 2, CAST(N'2021-12-06T11:28:14.653' AS DateTime))
INSERT [dbo].[Pedido] ([idPedido], [TipoPedido], [Estado], [Cantidad], [idCliente], [idProducto], [Fecha]) VALUES (11, N'Por Mayor', N'Despachado', 1300, 3, 10, CAST(N'2021-12-06T11:28:14.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (1, N'Valla promocional 300x250 pulgadas', N'publicitarios', 1500, 2000, CAST(N'2021-12-06T11:12:41.050' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (2, N'Valla promocional 500x400 pulgadas', N'Para Capaña', 2000, 5000, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (3, N'Valla promocional 250x200 pulgadas', N'publicitarios', 1300, 7000, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (4, N'Valla promocional 720x600 pulgadas', N'Para Capaña', 2500, 10000, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (5, N'Valla promocional 100x80 pulgadas', N'publicitarios', 800, 3000, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (6, N'Valla promocional 400x300 pulgadas', N'Para Capaña', 1700, 8000, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (7, N'Valla promocional 300x200 pulgadas', N'publicitarios', 1200, 750, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (8, N'Valla promocional 350x250 pulgadas', N'publicitarios', 1350, 500, CAST(N'2021-12-06T11:12:41.053' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (9, N'Valla promocional 500x300 pulgadas', N'Para Capaña', 1900, 400, CAST(N'2021-12-06T11:12:41.057' AS DateTime))
INSERT [dbo].[Producto] ([idProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [Fecha]) VALUES (10, N'Valla promocional 250x250 pulgadas', N'publicitarios', 1350, 6500, CAST(N'2021-12-06T11:12:41.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT (CONVERT([datetime],getdate(),(103))) FOR [Fecha]
GO
ALTER TABLE [dbo].[Empleado] ADD  DEFAULT (CONVERT([datetime],getdate(),(103))) FOR [Fecha]
GO
ALTER TABLE [dbo].[Factura] ADD  DEFAULT (CONVERT([datetime],getdate(),(103))) FOR [Fecha]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT (CONVERT([datetime],getdate(),(103))) FOR [Fecha]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (CONVERT([datetime],getdate(),(103))) FOR [Fecha]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [fk_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [fk_Empleado]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [fk_Pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [fk_Pedido]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_Cliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_Producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_Producto]
GO
USE [master]
GO
ALTER DATABASE [techcolordb] SET  READ_WRITE 
GO
