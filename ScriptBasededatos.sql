USE [master]
GO
/****** Object:  Database [BooksdbAPI]    Script Date: 23/05/2022 20:08:59 ******/
CREATE DATABASE [BooksdbAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksdbAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BooksdbAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BooksdbAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BooksdbAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BooksdbAPI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksdbAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksdbAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksdbAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksdbAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksdbAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksdbAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksdbAPI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BooksdbAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksdbAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksdbAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksdbAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksdbAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksdbAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksdbAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksdbAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksdbAPI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BooksdbAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksdbAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksdbAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksdbAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksdbAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksdbAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BooksdbAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksdbAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BooksdbAPI] SET  MULTI_USER 
GO
ALTER DATABASE [BooksdbAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksdbAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksdbAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksdbAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BooksdbAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BooksdbAPI] SET QUERY_STORE = OFF
GO
USE [BooksdbAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 23/05/2022 20:09:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteItems]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteItems](
	[ClientelId] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [int] NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Apellido] [nvarchar](max) NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_ClienteItems] PRIMARY KEY CLUSTERED 
(
	[ClientelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFacturaItems]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFacturaItems](
	[DetalleFacturaId] [int] IDENTITY(1,1) NOT NULL,
	[Plato] [nvarchar](max) NOT NULL,
	[Valor] [int] NOT NULL,
	[SupervisorId] [int] NOT NULL,
 CONSTRAINT [PK_DetalleFacturaItems] PRIMARY KEY CLUSTERED 
(
	[DetalleFacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturaItems]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaItems](
	[FacturaId] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[DetalleFacturaId] [int] NOT NULL,
	[MesaId] [int] NOT NULL,
	[MeseroId] [int] NOT NULL,
 CONSTRAINT [PK_FacturaItems] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesaItems]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesaItems](
	[MesaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Reservada] [bit] NOT NULL,
	[Puestos] [int] NOT NULL,
 CONSTRAINT [PK_MesaItems] PRIMARY KEY CLUSTERED 
(
	[MesaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeseroItems]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeseroItems](
	[MeseroId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NULL,
	[Edad] [int] NOT NULL,
	[Antiguedad] [int] NOT NULL,
 CONSTRAINT [PK_MeseroItems] PRIMARY KEY CLUSTERED 
(
	[MeseroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupervisorItems]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupervisorItems](
	[SupervisorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Apellido] [nvarchar](max) NULL,
	[Edad] [int] NOT NULL,
	[Antiguedad] [int] NOT NULL,
 CONSTRAINT [PK_SupervisorItems] PRIMARY KEY CLUSTERED 
(
	[SupervisorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_DetalleFacturaItems_SupervisorId]    Script Date: 23/05/2022 20:09:00 ******/
CREATE NONCLUSTERED INDEX [IX_DetalleFacturaItems_SupervisorId] ON [dbo].[DetalleFacturaItems]
(
	[SupervisorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacturaItems_ClienteId]    Script Date: 23/05/2022 20:09:00 ******/
CREATE NONCLUSTERED INDEX [IX_FacturaItems_ClienteId] ON [dbo].[FacturaItems]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacturaItems_DetalleFacturaId]    Script Date: 23/05/2022 20:09:00 ******/
CREATE NONCLUSTERED INDEX [IX_FacturaItems_DetalleFacturaId] ON [dbo].[FacturaItems]
(
	[DetalleFacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacturaItems_MesaId]    Script Date: 23/05/2022 20:09:00 ******/
CREATE NONCLUSTERED INDEX [IX_FacturaItems_MesaId] ON [dbo].[FacturaItems]
(
	[MesaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FacturaItems_MeseroId]    Script Date: 23/05/2022 20:09:00 ******/
CREATE NONCLUSTERED INDEX [IX_FacturaItems_MeseroId] ON [dbo].[FacturaItems]
(
	[MeseroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleFacturaItems]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFacturaItems_SupervisorItems_SupervisorId] FOREIGN KEY([SupervisorId])
REFERENCES [dbo].[SupervisorItems] ([SupervisorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleFacturaItems] CHECK CONSTRAINT [FK_DetalleFacturaItems_SupervisorItems_SupervisorId]
GO
ALTER TABLE [dbo].[FacturaItems]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItems_ClienteItems_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[ClienteItems] ([ClientelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturaItems] CHECK CONSTRAINT [FK_FacturaItems_ClienteItems_ClienteId]
GO
ALTER TABLE [dbo].[FacturaItems]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItems_DetalleFacturaItems_DetalleFacturaId] FOREIGN KEY([DetalleFacturaId])
REFERENCES [dbo].[DetalleFacturaItems] ([DetalleFacturaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturaItems] CHECK CONSTRAINT [FK_FacturaItems_DetalleFacturaItems_DetalleFacturaId]
GO
ALTER TABLE [dbo].[FacturaItems]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItems_MesaItems_MesaId] FOREIGN KEY([MesaId])
REFERENCES [dbo].[MesaItems] ([MesaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturaItems] CHECK CONSTRAINT [FK_FacturaItems_MesaItems_MesaId]
GO
ALTER TABLE [dbo].[FacturaItems]  WITH CHECK ADD  CONSTRAINT [FK_FacturaItems_MeseroItems_MeseroId] FOREIGN KEY([MeseroId])
REFERENCES [dbo].[MeseroItems] ([MeseroId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacturaItems] CHECK CONSTRAINT [FK_FacturaItems_MeseroItems_MeseroId]
GO
/****** Object:  StoredProcedure [dbo].[Consulta_ConsumoClientes]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Restaurante del SUR,,Leonardo Burbano>
-- Create date: <22/05/2022 Date>
-- Description:	Prueba tecnica
-- =============================================
CREATE PROCEDURE [dbo].[Consulta_ConsumoClientes] 
	-- Add the parameters for the stored procedure here
@fechaInico varchar(20)
,@fechaFin varchar(20)
,@monto int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Consulta datos de la factura 
	 
	
SELECT c.Cliente, c.Nombre, c.Apellido, c.Suma	from (select C.ClientelId as Cliente, 
			C.Nombre as Nombre, 
			C.Apellido as Apellido
			,CASE when SUM(D.Valor) = Null then '0' else SUM(D.Valor) end as Suma
		from ClienteItems C 
			LEFT Join FacturaItems F
		on C.ClientelId = F.ClienteId
		LEFT join DetalleFacturaItems D
		on F.DetalleFacturaId = D.DetalleFacturaId

		WHERE F.Fecha between @fechaInico and @fechaFin 
	--  	WHERE F.Fecha between '20201201'and'20231231' 
		group by C.ClientelId, C.Apellido, C.Nombre) c 
	--	where c.Suma >= 60001
	WHERE c.Suma >= @monto
END
GO
/****** Object:  StoredProcedure [dbo].[Consulta_Facturas]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Restaurante del SUR,,Leonardo Burbano>
-- Create date: <22/05/2022 Date>
-- Description:	Prueba tecnica
-- =============================================
CREATE PROCEDURE [dbo].[Consulta_Facturas] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Consulta datos de la factura 

		select F.FacturaId as CodigoFactura
		,F.Fecha as FechaFactura
		,D.Plato as Plato
		,D.Valor as Valor
		,CONCAT(S.Nombre,' ' ,S.Apellido) as Supervisor
		,MS.MesaId as NumeroMesa
		,MS.Nombre as Mesa
		,MS.Puestos as Puestos
		,C.Identificacion as IdentificacionCliente
		,CONCAT(C.Nombre,' ',C.Apellido ) as NombreCliente
		,C.Telefono as TelefonoCliente
		,C.Direccion as DireccionCliente
		,M.MeseroId as CodigoMesero
		,CONCAT(M.Nombre, ' ',M.Apellido) as NombreMesero
		
	from FacturaItems F
	join MesaItems MS
	on F.MesaId = MS.MesaId
	join DetalleFacturaItems D
	on F.DetalleFacturaId = D.DetalleFacturaId
	JOIN ClienteItems C
	on C.ClientelId = F.ClienteId
	Join MeseroItems M
	on M.MeseroId = F.MeseroId
	join SupervisorItems S
	on S.SupervisorId = D.SupervisorId

    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[Consulta_MasVendido]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Restaurante del SUR,,Leonardo Burbano>
-- Create date: <22/05/2022 Date>
-- Description:	Prueba tecnica
-- =============================================
CREATE PROCEDURE [dbo].[Consulta_MasVendido] 
	-- Add the parameters for the stored procedure here
	 @fechaInico varchar(20),
	 @fechaFin varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		select D.Plato as Plato, COUNT(D.PLATO) AS Cantidad, SUM(D.Valor) AS Suma
		from DetalleFacturaItems D
		join FacturaItems F
		on D.DetalleFacturaId = F.DetalleFacturaId
			WHERE F.Fecha between @fechaInico and @fechaFin 
		--	WHERE F.Fecha between '20201201'and'20231231' 
		group by D.Plato

END
GO
/****** Object:  StoredProcedure [dbo].[Consulta_VentaMesero]    Script Date: 23/05/2022 20:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Restaurante del SUR,,Leonardo Burbano>
-- Create date: <22/05/2022 Date>
-- Description:	Prueba tecnica
-- =============================================
CREATE PROCEDURE [dbo].[Consulta_VentaMesero] 
@fechaInico varchar(20)
,@fechaFin varchar(20)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Consulta datos de la factura 
	 
	
	select M.MeseroId as Mesero, 
			M.Nombre as Nombre, 
			M.Apellido as Apellido
			,CASE when SUM(D.Valor) = Null then '0' else SUM(D.Valor) end as Suma
		from MeseroItems M 
			LEFT Join FacturaItems F
		on M.MeseroId = F.MeseroId
		LEFT join DetalleFacturaItems D
		on F.DetalleFacturaId = D.DetalleFacturaId

		WHERE F.Fecha between @fechaInico and @fechaFin
	--	WHERE F.Fecha between '20201201'and'20231231'
		group by M.MeseroId, M.Apellido, M.Nombre


    -- Insert statements for procedure here
	
END
GO
USE [master]
GO
ALTER DATABASE [BooksdbAPI] SET  READ_WRITE 
GO
