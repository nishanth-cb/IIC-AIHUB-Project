IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTSessionInfo' AND ss.name = N'rpt')
CREATE TYPE [RPT].[UDTSessionInfo] AS TABLE(
	[id] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
	[sessionId] [nvarchar](200) NULL,
	[createdAt] [nvarchar](100) NULL,
	[size] [nvarchar](100) NULL,
	[duration] [bigint] NULL
)
GO

