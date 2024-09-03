/****** Object:  UserDefinedTableType [RPT].[tvpTblProctorAvail]    Script Date: 25-03-2021 10:48:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'tvpTblProctorAvail' AND ss.name = N'RPT')
CREATE TYPE [RPT].[tvpTblProctorAvail] AS TABLE(
	[UserId] [bigint] NULL,
	[StartDateTime] [datetime2](3) NULL,
	[EndDateTime] [datetime2](3) NULL
)
GO