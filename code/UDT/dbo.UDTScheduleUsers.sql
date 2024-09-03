IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'UDTScheduleUsers' AND ss.name = N'dbo')
CREATE TYPE [dbo].[UDTScheduleUsers] AS TABLE(
	[ID] [bigint] NULL,
	[UserCode] [nvarchar](200) NULL,
	[ScheduleCode] [nvarchar](100) NULL,
	[ScheduleUserID] [bigint] NULL,
	[AssessmentCode] [nvarchar](100) NULL,
	[Organizationcode] [nvarchar](100) NULL,
	[LoginName] [nvarchar](200) NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[ProfilePhotoPath] [nvarchar](max) NULL
)



