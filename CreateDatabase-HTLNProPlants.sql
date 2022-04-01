

-- 1. Connect to your SQL Server instance, master database

-- 2. Run the following code to create an empty database called TSQLV4
USE master;

-- Drop database
IF DB_ID(N'HTLN_ProPlants') IS NOT NULL DROP DATABASE HTLN_ProPlants;

-- If database could not be created due to open connections, abort
IF @@ERROR = 3702 
   RAISERROR(N'Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;



-- Create database
CREATE DATABASE HTLN_ProPlants;
GO

USE HTLN_ProPlants;
GO

CREATE SCHEMA lut AUTHORIZATION dbo;
GO

-- Create tables
CREATE TABLE dbo.ClipStatus
(
  id          INT          NOT NULL IDENTITY (1,1),
  park        NVARCHAR(4)  NOT NULL,
  locationid  NVARCHAR(20) NOT NULL,
  clipstatus  NVARCHAR(20) NOT NULL
  CONSTRAINT PK_ClipStatus PRIMARY KEY(id)
  --CONSTRAINT AK_LocationID UNIQUE(LocationID)   
);
GO

CREATE TABLE dbo.FieldData
(  
  id          INT           NOT NULL IDENTITY (1,1),
  locationid  NVARCHAR(20)    NOT NULL,
  periodid    NVARCHAR(20)    NOT NULL,
  species     NVARCHAR(50)    NOT NULL,
  coverclass  INT             NOT NULL,
  CONSTRAINT PK_FieldData PRIMARY KEY(id)
);
GO

CREATE TABLE dbo.Location_ll
(
  id              INT             NOT NULL IDENTITY (1,1),
  locationid      NVARCHAR(20)    NOT NULL,
  firstsampled    NVARCHAR(25)    NOT NULL,
  searchunittype  NVARCHAR(20)    NOT NULL,
  latitude        DECIMAL(12,6)   NOT NULL,
  longitude       DECIMAL(12,6)   NOT NULL,   
  CONSTRAINT PK_Location_LL PRIMARY KEY(id)
);
GO


CREATE TABLE lut.TaxaReference
(
  id                INT             NOT NULL IDENTITY,
  acceptedsymbol    NVARCHAR(20)    NOT NULL,
  commonname        NVARCHAR(100)   NOT NULL, 
  scientificname    NVARCHAR(256)   NOT NULL,
  family            NVARCHAR(40)    NOT NULL,
  CONSTRAINT PK_Taxareference PRIMARY KEY(id)
);
GO


CREATE TABLE lut.MyCoverClass
(
  id          INT             NOT NULL IDENTITY,
  coverclass  DECIMAL(6,2)   NOT NULL,
  lowrange    DECIMAL(6,2)   NOT NULL,
  midrange    DECIMAL(6,2)   NOT NULL,
  highrange   DECIMAL(6,2)   NOT NULL,
  CONSTRAINT PK_Coverclass PRIMARY KEY(id)
);
GO

CREATE TABLE dbo.SamplingPeriod
(
  id          INT           NOT NULL IDENTITY,
  periodid    NVARCHAR(20)  NOT NULL,
  parkcode    NVARCHAR(4)   NOT NULL,
  startdate   DATE          NOT NULL,
  enddate     DATE          NOT NULL,
  CONSTRAINT PK_SamplingPeriod PRIMARY KEY(id)
);
GO

BULK INSERT
dbo.clipstatus
FROM 'C:\users\growell\work\PowerBI\ProPlants\Access\csv\tbl_ClipStatus.csv'
WITH (FIRSTROW = 2,FIELDTERMINATOR = ',' , ROWTERMINATOR = '\n');
GO

BULK INSERT
dbo.FieldData
FROM 'C:\users\growell\work\PowerBI\ProPlants\Access\csv\tbl_FieldData.csv'
WITH (FIRSTROW = 2,FIELDTERMINATOR = ',' , ROWTERMINATOR = '\n');
GO


BULK INSERT
dbo.Location_ll
FROM 'C:\users\growell\work\PowerBI\ProPlants\Access\csv\tbl_Location_LL.csv'
WITH (FIRSTROW = 2,FIELDTERMINATOR = ',' , ROWTERMINATOR = '\n');
GO



BULK INSERT
lut.TaxaReference
FROM 'C:\users\growell\work\PowerBI\ProPlants\Access\csv\tbl_TaxaReference.csv'
WITH (FIRSTROW = 2,FIELDTERMINATOR = ',' , ROWTERMINATOR = '\n');
GO



BULK INSERT
lut.MyCoverClass
FROM 'C:\users\growell\work\PowerBI\ProPlants\Access\csv\tlu_CoverClass.csv'
WITH (FIRSTROW = 2,FIELDTERMINATOR = ',' , ROWTERMINATOR = '\n');
GO

