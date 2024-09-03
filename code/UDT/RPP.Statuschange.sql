
/****** Object:  UserDefinedTableType [RPP].[Statuschange]    Script Date: 25-03-2021 10:48:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Statuschange' AND ss.name = N'RPP')
CREATE TYPE [RPP].[Statuschange] AS TABLE(
	[AttemptId] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Message] [varchar](450) NULL,
	[AudioStatus] [varchar](450) NULL,
	[AudioMessage] [varchar](450) NULL
)
GO