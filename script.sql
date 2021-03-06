USE [master]
GO
/****** Object:  Database [ERP]    Script Date: 7/1/2016 3:27:08 AM ******/
CREATE DATABASE [ERP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ERP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ERP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ERP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ERP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ERP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ERP] SET  MULTI_USER 
GO
ALTER DATABASE [ERP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ERP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ERP]
GO
/****** Object:  Table [dbo].[Componente]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Componente](
	[idComponente] [int] IDENTITY(1,1) NOT NULL,
	[idPai] [int] NOT NULL,
	[nome] [varchar](100) NULL,
 CONSTRAINT [PK_Componente] PRIMARY KEY CLUSTERED 
(
	[idComponente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deposito]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deposito](
	[idDeposito] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
 CONSTRAINT [PK_Deposito] PRIMARY KEY CLUSTERED 
(
	[idDeposito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documento](
	[idDocumento] [int] IDENTITY(1,1) NOT NULL,
	[arquivo] [varchar](100) NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[idDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Movimentacao]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movimentacao](
	[idMovimentacao] [int] IDENTITY(1,1) NOT NULL,
	[idDeposito] [int] NULL,
	[idProduto] [int] NULL,
	[idDocumento] [int] NULL,
	[data] [date] NULL,
	[tipo] [varchar](100) NOT NULL,
	[quantidade] [int] NULL,
	[descricao] [varchar](100) NULL,
 CONSTRAINT [PK_Movimentacao] PRIMARY KEY CLUSTERED 
(
	[idMovimentacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[idProduto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[preco] [float] NOT NULL,
	[peso] [float] NOT NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario_Componente]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Componente](
	[idUsuario] [int] NOT NULL,
	[idComponente] [int] NULL,
 CONSTRAINT [PK_Usuario_Componente] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[visualizarDepositos]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[visualizarDepositos]
AS  
SELECT idDeposito,nome FROM dbo.Deposito


GO
/****** Object:  View [dbo].[visualizarInventario]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[visualizarInventario]
AS  

SELECT [idProduto],
      [nome],
	  preco,
	  peso,
	  quantidade = (
	  (SELECT sum(quantidade) from Movimentacao me where me.idProduto = Produto.idProduto and me.tipo = 'E') -
	  (SELECT sum(quantidade) from Movimentacao me where me.idProduto = Produto.idProduto and me.tipo = 'S'))
  FROM [dbo].[Produto]




GO
/****** Object:  View [dbo].[visualizarMovimentacoes]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[visualizarMovimentacoes]
AS  
SELECT idMovimentacao,data,tipo,descricao,quantidade,d.nome as 'deposito',p.nome as 'produto',p.idProduto
FROM dbo.Movimentacao m inner join dbo.Deposito d 
on d.idDeposito = m.idDeposito
inner join dbo.Produto p
on p.idProduto = m.idProduto 




GO
/****** Object:  View [dbo].[visualizarProdutos]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[visualizarProdutos]
AS  
SELECT idProduto,nome,preco,peso FROM dbo.Produto


GO
ALTER TABLE [dbo].[Componente]  WITH CHECK ADD  CONSTRAINT [FK_Componente_Componente] FOREIGN KEY([idPai])
REFERENCES [dbo].[Componente] ([idComponente])
GO
ALTER TABLE [dbo].[Componente] CHECK CONSTRAINT [FK_Componente_Componente]
GO
ALTER TABLE [dbo].[Movimentacao]  WITH CHECK ADD  CONSTRAINT [FK_Movimentacao_Deposito] FOREIGN KEY([idDeposito])
REFERENCES [dbo].[Deposito] ([idDeposito])
GO
ALTER TABLE [dbo].[Movimentacao] CHECK CONSTRAINT [FK_Movimentacao_Deposito]
GO
ALTER TABLE [dbo].[Movimentacao]  WITH CHECK ADD  CONSTRAINT [FK_Movimentacao_Documento] FOREIGN KEY([idDocumento])
REFERENCES [dbo].[Documento] ([idDocumento])
GO
ALTER TABLE [dbo].[Movimentacao] CHECK CONSTRAINT [FK_Movimentacao_Documento]
GO
ALTER TABLE [dbo].[Movimentacao]  WITH CHECK ADD  CONSTRAINT [FK_Movimentacao_Produto] FOREIGN KEY([idProduto])
REFERENCES [dbo].[Produto] ([idProduto])
GO
ALTER TABLE [dbo].[Movimentacao] CHECK CONSTRAINT [FK_Movimentacao_Produto]
GO
ALTER TABLE [dbo].[Usuario_Componente]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Componente_Componente] FOREIGN KEY([idComponente])
REFERENCES [dbo].[Componente] ([idComponente])
GO
ALTER TABLE [dbo].[Usuario_Componente] CHECK CONSTRAINT [FK_Usuario_Componente_Componente]
GO
ALTER TABLE [dbo].[Usuario_Componente]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Componente_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario_Componente] CHECK CONSTRAINT [FK_Usuario_Componente_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[adicionarDeposito]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[adicionarDeposito]   
    @Nome varchar(100)   
AS   

   
INSERT INTO [dbo].[Deposito]
           ([nome])
     VALUES
           (@Nome)

GO
/****** Object:  StoredProcedure [dbo].[adicionarMovimentacaoEntrada]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[adicionarMovimentacaoEntrada]   
    @idDeposito int,
    @idDocumento int,
    @idProduto int,
	@quantidade int
AS   

   
INSERT INTO [dbo].[Movimentacao]
           (idDeposito,idProduto,idDocumento,quantidade,data,tipo)
     VALUES
           (@idDeposito,@idProduto,@idDocumento,@quantidade, GETDATE ( ),'E')

GO
/****** Object:  StoredProcedure [dbo].[adicionarMovimentacaoSaida]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[adicionarMovimentacaoSaida]   
    @idDeposito int,
    @idDocumento int,
    @idProduto int,
	@quantidade int
AS   

   
INSERT INTO [dbo].[Movimentacao]
           (idDeposito,idProduto,idDocumento,quantidade,data,tipo)
     VALUES
           (@idDeposito,@idProduto,@idDocumento,@quantidade,GETDATE ( ),'S')

GO
/****** Object:  StoredProcedure [dbo].[adicionarProduto]    Script Date: 7/1/2016 3:27:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[adicionarProduto]   
    @Nome varchar(100),   
    @Preco float,
	@Peso float   
AS   

   
INSERT INTO [dbo].[Produto]
           ([nome]
           ,[preco]
           ,[peso])
     VALUES(@Nome, @Preco,@Peso);



GO
USE [master]
GO
ALTER DATABASE [ERP] SET  READ_WRITE 
GO
