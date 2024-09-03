/****** Object:  UserDefinedTableType [RPT].[UDTUserDetails]    Script Date: 25-03-2021 10:48:57 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTUserDetails' AND ss.name = N'RPT')
CREATE TYPE [RPT].[UDTUserDetails] AS TABLE(
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[LoginName] [nvarchar](120) NULL,
	[Password] [varchar](200) NULL,
	[PhoneNumber] [nvarchar](120) NULL,
	[EmailId] [nvarchar](120) NULL,
	[Status] [nvarchar](120) NULL
)
GO

IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTUserDetailsImport' AND ss.name = N'RPT')
CREATE TYPE [RPT].[UDTUserDetailsImport] AS TABLE(
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[LoginName] [nvarchar](120) NULL,
	[Password] [varchar](200) NULL,
	[PhoneNumber] [nvarchar](120) NULL,
	[EmailId] [nvarchar](120) NULL,
	[Status] [nvarchar](120) NULL,
	[OrganisationName] [nvarchar](200) NULL,
	[RoleName] [nvarchar](200) NULL
)
GO

