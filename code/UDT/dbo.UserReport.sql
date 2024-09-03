/****** Object:  UserDefinedTableType [dbo].[UserReport]    Script Date: 25-03-2021 10:48:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UserReport' AND ss.name = N'dbo')
CREATE TYPE [dbo].[UserReport] AS TABLE(
	[AssessmentName] [varchar](400) NULL,
	[TestDuration] [int] NULL,
	[UserTestStartDate] [datetime2](7) NULL,
	[UserTestEndDate] [datetime2](7) NULL,
	[ObtainedScore] [numeric](10, 6) NULL,
	[NoOfQnsInTest] [smallint] NULL,
	[Attempted] [smallint] NULL,
	[NoOfCorrect] [smallint] NULL,
	[LoginName] [varchar](400) NULL,
	[FirstName] [varchar](400) NULL,
	[LastName] [varchar](400) NULL,
	[ScheduleUserID] [int] NULL,
	[AssessmentID] [bigint] NULL,
	[AssessmentDuration] [smallint] NULL
)
GO