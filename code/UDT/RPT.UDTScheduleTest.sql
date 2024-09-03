/****** Object:  UserDefinedTableType [RPT].[UDTScheduleTest]    Script Date: 25-03-2021 10:48:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTScheduleTest' AND ss.name = N'RPT')
CREATE TYPE [RPT].[UDTScheduleTest] AS TABLE(
	[SchdUserID] [bigint] NULL,
	[SchedulestartDate] [datetime2](7) NULL,
	[ScheduleEndDate] [datetime2](7) NULL,
	[TestName] [nvarchar](100) NULL,
	[StudentName] [nvarchar](200) NULL,
	[IsSecuredTest] [bit] NULL,
	[AssessmentID] [bigint] NULL,
	[ScheduleID] [bigint] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[ScheduleName] [nvarchar](200) NULL,
	[RecordType] [int] NULL,
	[TestCenterCode] [nvarchar](200) NULL,
	[SectionIDS] [nvarchar](500) NULL,
	[SectionNames] [nvarchar](200) NULL
)
GO