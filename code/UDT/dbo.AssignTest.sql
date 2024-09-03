/****** Object:  UserDefinedTableType [dbo].[AssignTest]    Script Date: 25-03-2021 10:48:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'AssignTest' AND ss.name = N'dbo')
CREATE TYPE [dbo].[AssignTest] AS TABLE(
	[PartnerIntegrationID] [varchar](50) NULL,
	[UserId] [bigint] NULL,
	[TestName] [varchar](450) NULL
)
GO