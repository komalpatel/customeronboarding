USE [master]
GO
/****** Object:  Database [customer]    Script Date: 10/24/2018 7:47:14 PM ******/
CREATE DATABASE [customer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'customer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\customer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'customer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\customer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [customer] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [customer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [customer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [customer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [customer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [customer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [customer] SET ARITHABORT OFF 
GO
ALTER DATABASE [customer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [customer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [customer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [customer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [customer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [customer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [customer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [customer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [customer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [customer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [customer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [customer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [customer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [customer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [customer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [customer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [customer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [customer] SET RECOVERY FULL 
GO
ALTER DATABASE [customer] SET  MULTI_USER 
GO
ALTER DATABASE [customer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [customer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [customer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [customer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [customer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'customer', N'ON'
GO
ALTER DATABASE [customer] SET QUERY_STORE = OFF
GO
USE [customer]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [customer]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 10/24/2018 7:47:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[TelephoneNumber] [nvarchar](12) NULL,
	[Address] [nvarchar](200) NULL,
	[isActive] [nvarchar](50) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddCustomer]    Script Date: 10/24/2018 7:47:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spAddCustomer]     
(    
    @Name VARCHAR(20),     
    @Surname VARCHAR(20),    
    @TelephoneNumber VARCHAR(20),    
    @Address VARCHAR(600)    
)    
as     
Begin     
    Insert into customer (Name,Surname,TelephoneNumber, Address,isActive)     
    Values (@Name,@Surname,@TelephoneNumber, @Address,'1')     
End


GO
/****** Object:  StoredProcedure [dbo].[spDeletecustomer]    Script Date: 10/24/2018 7:47:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spDeletecustomer]    
(      
   @Id int      
)      
as       
begin
update  customer set isactive='0' where Id=@Id      
   --Delete from customer where Id=@Id      
   
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllcustomer]    Script Date: 10/24/2018 7:47:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAllcustomer]   
as    
Begin    
    select *    
    from customer where isActive='1'
End
GO
/****** Object:  StoredProcedure [dbo].[spUpdatecustomer]    Script Date: 10/24/2018 7:47:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spUpdatecustomer]     
(      
	@Id INTEGER ,    
    @Name VARCHAR(20),     
    @Surname VARCHAR(20),    
    @TelephoneNumber VARCHAR(20),    
    @Address VARCHAR(600)  
)      
as      
begin      
   Update customer       
   set Name=@Name,      
   Surname=@Surname,      
   TelephoneNumber=@TelephoneNumber,    
   Address=@Address      
   where Id=@Id     
End


GO
USE [master]
GO
ALTER DATABASE [customer] SET  READ_WRITE 
GO
