﻿  

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'RPF')
EXEC sys.sp_executesql N'CREATE SCHEMA [RPF]'


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'RPP')
EXEC sys.sp_executesql N'CREATE SCHEMA [RPP]'


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'RPP;RPT;db;RPF')
EXEC sys.sp_executesql N'CREATE SCHEMA [RPP;RPT;db;RPF]'


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'RPT')
EXEC sys.sp_executesql N'CREATE SCHEMA [RPT]'


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'RPT')
EXEC sys.sp_executesql N'CREATE SCHEMA [Hms]'

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'RPT')
EXEC sys.sp_executesql N'CREATE SCHEMA [Zoom]'


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChangeLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseName] [varchar](256) NOT NULL,
	[EventType] [varchar](50) NOT NULL,
	[ObjectName] [varchar](256) NOT NULL,
	[ObjectType] [varchar](25) NOT NULL,
	[SqlCommand] [varchar](max) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[LoginName] [varchar](256) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DatabaseLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DatabaseLog](
	[DatabaseLogID] [int] IDENTITY(1,1) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Event] [sysname] NOT NULL,
	[ObjectName] [sysname] NULL,
	[TSQL] [nvarchar](max) NOT NULL,
	[SystemOwner] [sysname] NOT NULL,
	[Server] [sysname] NOT NULL,
 CONSTRAINT [PK_DatabaseLog] PRIMARY KEY CLUSTERED 
(
	[DatabaseLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [bigint] IDENTITY(1,1) NOT NULL,
	[NotificationSubject] [nvarchar](200) NULL,
	[NotificationDescription] [nvarchar](2000) NULL,
	[ScheduleID] [bigint] NULL,
	[TestDetailId] [bigint] NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[TestNameInformationId] [bigint] NULL,
	[UserID] [bigint] NULL,
	[UserName] [nvarchar](1000) NULL,
	[CreatedBy] [bigint] NULL,
	[ScheduleStartDate] [datetime] NULL,
	[ScheduleEndDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsRead] [int] NULL,
	[IsDeleted] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[UserNotificationType] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Notifications_Archive]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Notifications_Archive](
	[ArchiveID] [bigint] IDENTITY(1,1) NOT NULL,
	[NotificationID] [bigint] NULL,
	[NotificationSubject] [nvarchar](200) NULL,
	[NotificationDescription] [nvarchar](2000) NULL,
	[ScheduleID] [bigint] NULL,
	[TestDetailId] [bigint] NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[TestNameInformationId] [bigint] NULL,
	[UserID] [bigint] NULL,
	[UserName] [nvarchar](1000) NULL,
	[CreatedBy] [bigint] NULL,
	[ScheduleStartDate] [datetime] NULL,
	[ScheduleEndDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsRead] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[UserNotificationType] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ArchiveDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Notifications_Archive] PRIMARY KEY CLUSTERED 
(
	[ArchiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SPErrorLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SPErrorLog](
	[ErrorLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorLine] [bigint] NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[SchemaName] [varchar](500) NULL,
	[ErrorProcedure] [nvarchar](500) NULL,
	[ErrorSeverity] [bigint] NULL,
	[ErrorState] [bigint] NULL,
	[SPID] [bigint] NULL,
	[ServerName] [nvarchar](500) NULL,
	[ServiceName] [nvarchar](500) NULL,
	[HostName] [nvarchar](500) NULL,
	[ProgramName] [nvarchar](1000) NULL,
	[CommandLine] [nvarchar](max) NULL,
	[LoginUser] [nvarchar](50) NULL,
	[PostTime] [datetime] NOT NULL,
 CONSTRAINT [PK_SPErrorLog_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TempSummaryTestStudentDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TempSummaryTestStudentDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
	[CreatedDate] [datetime2](7) NULL,
	[Isdeleted] [bit] NULL,
	[TestCenterCode] [nvarchar](100) NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USerMacAddressDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USerMacAddressDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Scheduleuserid] [bigint] NULL,
	[MacAddress] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserNotificationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserNotificationType](
	[UserNotificationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserNotificationType] [nvarchar](20) NULL,
	[IsDeleted] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserNotificationTypeID] PRIMARY KEY CLUSTERED 
(
	[UserNotificationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebServicelog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebServicelog](
	[WebServicelogID] [bigint] IDENTITY(1,1) NOT NULL,
	[Module] [nvarchar](500) NULL,
	[MethodType] [nvarchar](500) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RequestObject] [nvarchar](max) NULL,
	[ResponseObject] [nvarchar](max) NULL,
	[ErrorDetails] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Extension] [nvarchar](max) NULL,
	[SessionID] [nvarchar](500) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WebServicelog] PRIMARY KEY CLUSTERED 
(
	[WebServicelogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WebServicelogResponse]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WebServicelogResponse](
	[WebServicelogResponseID] [bigint] IDENTITY(1,1) NOT NULL,
	[Module] [nvarchar](500) NULL,
	[MethodType] [nvarchar](500) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RequestObject] [nvarchar](max) NULL,
	[ResponseObject] [nvarchar](max) NULL,
	[ErrorDetails] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Extension] [nvarchar](2000) NULL,
	[SessionID] [nvarchar](500) NULL,
	[WebServicelogID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_WebServicelogResponse] PRIMARY KEY CLUSTERED 
(
	[WebServicelogResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPP].[SummaryAssessmentScheduleDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPP].[SummaryAssessmentScheduleDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssessmentID] [bigint] NULL,
	[AssessmentName] [nvarchar](200) NULL,
	[TotalStudentSubmission] [int] NULL,
	[TotalSchedules] [int] NULL,
	[TotalStudent] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPP].[SummaryScheduleDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPP].[SummaryScheduleDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssessmentID] [bigint] NULL,
	[AssessmentName] [nvarchar](200) NULL,
	[ScheduleID] [bigint] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[ScheduleUserDetailID] [bigint] NULL,
	[ScheduleName] [nvarchar](200) NULL,
	[ScheduleStarttime] [datetime] NULL,
	[ScheduleEndtime] [datetime] NULL,
	[RecordType] [tinyint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[ApplicationSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[ApplicationSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IsProfile] [int] NULL,
	[IsOnlineRequired] [bit] NULL,
	[IsOfflineRequired] [bit] NULL,
	[Extention1] [nvarchar](100) NULL,
	[Extention2] [nvarchar](100) NULL,
	[Extention3] [nvarchar](100) NULL,
	[Extention4] [nvarchar](100) NULL,
	[Type] [int] NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[AWSFaceComparisonDet]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[AWSFaceComparisonDet](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer] [int] NOT NULL,
	[Region] [nvarchar](100) NOT NULL,
	[AccessKey] [nvarchar](200) NOT NULL,
	[SecretKey] [nvarchar](200) NOT NULL,
	[FunctionName] [nvarchar](100) NOT NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[PhotoVerificationSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[PhotoVerificationSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IsProfile] [bit] NULL,
	[ISHeadShot] [bit] NULL,
	[IsPhotoVerificationReqOnline] [bit] NULL,
	[IsPhotoVerificationReqOffline] [bit] NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[ProctorPauseResumeTrack]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[ProctorPauseResumeTrack](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProctorID] [bigint] NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[Extratime] [int] NULL,
	[PauseTime] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[ScheduleName]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[ScheduleName](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[ScheduleName] [nvarchar](200) NULL,
	[IsProcessed] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[Organisationid] [bigint] NULL,
	[Mode] [int] NULL,
	[ScheduleDetailID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[ScheduleUserFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[ScheduleUserFile](
	[ScheduleUserFileID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleUserID] [bigint] NOT NULL,
	[FilePath] [nvarchar](1000) NOT NULL,
	[InsertedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ScheduleUserFile] PRIMARY KEY CLUSTERED 
(
	[ScheduleUserFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[SecondaryCameraDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[SecondaryCameraDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[ScheduleUserID] [bigint] NULL,
	[OrgID] [bigint] NULL,
	[SessionID] [nvarchar](max) NULL,
	[TokenID] [nvarchar](max) NULL,
	[Videocode] [nvarchar](max) NULL,
	[VideoPath] [nvarchar](max) NULL,
	[AttemptID] [bigint] NULL,
	[ActiveBit] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[Extension1] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
	[Message] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[StudentScheduleDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[StudentScheduleDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SchdUserID] [bigint] NULL,
	[SchedulestartDate] [datetime2](7) NULL,
	[ScheduleEndDate] [datetime2](7) NULL,
	[TestName] [nvarchar](100) NULL,
	[StudentName] [nvarchar](200) NULL,
	[IsTagged] [bit] NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblApplicationSettings](
	[ApplicationSettingID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](200) NULL,
	[SettingKeyID] [smallint] NULL,
	[OrganisationId] [bigint] NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblApplicationSettings_ApplicationSettingID] PRIMARY KEY CLUSTERED 
(
	[ApplicationSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblAssessments]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblAssessments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AssessmentID] [bigint] NULL,
	[AssessmentName] [nvarchar](200) NULL,
	[AssessmentCode] [nvarchar](200) NULL,
	[AssessmentInstruction] [nvarchar](1000) NULL,
	[CourseName] [nvarchar](200) NULL,
	[Isdeleted] [bit] NULL,
	[MaxMarks] [int] NULL,
	[Threshold] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Assetid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblAssignmentHistory](
	[AssignmentHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssignmentId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[EventId] [smallint] NOT NULL,
	[Createdate] [datetime2](3) NOT NULL,
	[AuditSummaryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblAssignmentHistory_AssignmentHistoryId] PRIMARY KEY CLUSTERED 
(
	[AssignmentHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblAudioJSON]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblAudioJSON](
	[AudioJSONId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttempId] [bigint] NOT NULL,
	[AudioJSON] [nvarchar](max) NOT NULL,
	[AnalysisDuration] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblAudioJSON] PRIMARY KEY CLUSTERED 
(
	[AudioJSONId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblAudioJSONHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblAudioJSONHistory](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblAudioJSONHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[TBLAuditCandidatetagging]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[TBLAuditCandidatetagging](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProctorID] [bigint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsTagged] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblAuditDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblAuditDetails](
	[AuditDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[FromUserID] [bigint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblAuditDetails_AuditDetailsID] PRIMARY KEY CLUSTERED 
(
	[AuditDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblAuditSummary](
	[AuditSummaryID] [bigint] IDENTITY(1,1) NOT NULL,
	[RefId] [bigint] NOT NULL,
	[EventId] [smallint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblAuditSummary_AuditSummaryID] PRIMARY KEY CLUSTERED 
(
	[AuditSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[TblAuditUserImport]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[TblAuditUserImport](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleID] [bigint] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Orgcode] [nvarchar](100) NULL,
	[ErrorMessage] [nvarchar](500) NULL,
	[Loginname] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[Filename] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblBlockListedApplicationDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblBlockListedApplicationDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Schduleid] [bigint] NULL,
	[StrBlockListedApps] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblChatHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblChatHistory](
	[ChatHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[PartnerIntegrationID] [varchar](50) NULL,
	[ProctorId] [bigint] NOT NULL,
	[ChatData] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblChatHistory] PRIMARY KEY CLUSTERED 
(
	[ChatHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblCustomers]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblCustomers](
	[CustomerID] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](200) NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerCode] [nvarchar](100) NULL,
	[Modifieddate] [datetime] NULL,
	[SecretKey] [nvarchar](max) NULL,
	[SecretValue] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblEmailTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblEmailTemplate](
	[EmailTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[OrgId] [smallint] NOT NULL,
	[EventId] [smallint] NOT NULL,
	[TemplateName] [varchar](255) NOT NULL,
	[TemplateDescription] [varchar](255) NOT NULL,
	[Template] [nvarchar](max) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [EmailTemplate_PK] PRIMARY KEY CLUSTERED 
(
	[EmailTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Org_UQcodes] UNIQUE NONCLUSTERED 
(
	[OrgId] ASC,
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblEventLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblEventLog](
	[EventLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](250) NULL,
	[LogDescription] [nvarchar](500) NULL,
	[PartnerIntegrationId] [bigint] NOT NULL,
	[ProctorId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [tinyint] NULL,
 CONSTRAINT [PK_tblEventLog_EventLogId] PRIMARY KEY CLUSTERED 
(
	[EventLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblEvents](
	[EventId] [smallint] IDENTITY(0,1) NOT NULL,
	[EventName] [nvarchar](250) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblEvents_EventId] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblFaceMismatchDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblFaceMismatchDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[Attemptid] [bigint] NULL,
	[Status] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[FaceMisMatchCount] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Createdby] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblFileImport]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblFileImport](
	[FileID] [bigint] IDENTITY(1,1) NOT NULL,
	[Filename] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[IsProcessed] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblLoginHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblLoginHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[EventId] [smallint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IPAddress] [varchar](15) NULL,
	[Token] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblLoginHistoy_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblManualReviewHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblManualReviewHistory](
	[ReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblManualReviewHistory] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblManualReviewJSON](
	[ManualReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[AssignmentId] [bigint] NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblManualReviewJSON] PRIMARY KEY CLUSTERED 
(
	[ManualReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblOrganisation]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblOrganisation](
	[OrganisationId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganisationName] [varchar](100) NOT NULL,
	[OrganisationGUID] [uniqueidentifier] NULL,
	[OrganisationTheme] [varchar](8000) NOT NULL,
	[OrganisationURL] [varchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsEnabled] [bit] NULL,
	[Description] [varchar](4000) NULL,
	[Address] [nvarchar](4000) NULL,
	[FromEmailId] [nvarchar](120) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[DefaultUserId] [bigint] NULL,
	[Mode] [tinyint] NULL,
	[StorageConfiguration] [nvarchar](4000) NULL,
	[Customerid] [int] NULL,
	[OrganizationCode] [nvarchar](50) NULL,
	[ParentID] [bigint] NULL,
	[OrganisationType] [int] NULL,
	[IscustomerOrg] [bit] NULL,
 CONSTRAINT [PK_tblOrganisation_OrganisationId] PRIMARY KEY CLUSTERED 
(
	[OrganisationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblOrganisation1]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblOrganisation1](
	[OrganisationId] [smallint] IDENTITY(1,1) NOT NULL,
	[OrganisationName] [varchar](100) NOT NULL,
	[OrganisationGUID] [uniqueidentifier] NULL,
	[OrganisationTheme] [varchar](8000) NOT NULL,
	[OrganisationURL] [varchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsEnabled] [bit] NULL,
	[Description] [varchar](4000) NULL,
	[Address] [nvarchar](4000) NULL,
	[FromEmailId] [nvarchar](120) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[DefaultUserId] [bigint] NULL,
	[Mode] [tinyint] NULL,
	[StorageConfiguration] [nvarchar](4000) NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblPhotoJSONHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblPhotoJSONHistory](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblPhotoJSONHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblPredifiedTypeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblPredifiedTypeMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PredifiedType] [nvarchar](100) NULL,
	[Createdate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblPreferences]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblPreferences](
	[PreferenceId] [bigint] IDENTITY(1,1) NOT NULL,
	[PreferenceGUID] [uniqueidentifier] NOT NULL,
	[PreferenceJSON] [nvarchar](4000) NOT NULL,
	[OrganisationId] [bigint] NULL,
	[AssetId] [nvarchar](20) NOT NULL,
	[ScheduleId] [nvarchar](50) NULL,
	[Type] [nvarchar](20) NULL,
	[TemplateId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[Proctoringtype] [int] NULL,
	[Recordintype] [int] NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblPreferencesHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblPreferencesHistory](
	[HistoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[PreferenceId] [bigint] NOT NULL,
	[PreferenceJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[OrganisationId] [bigint] NULL,
	[AuditSummaryID] [bigint] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblPreferencesHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctorAvail]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctorAvail](
	[ProctorAvailId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[StartDateTime] [datetime2](3) NOT NULL,
	[EndDateTime] [datetime2](3) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblProctorAvail] PRIMARY KEY CLUSTERED 
(
	[ProctorAvailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[TblProctorAvailAuditlog]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[TblProctorAvailAuditlog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmailId] [nvarchar](120) NULL,
	[StartDateTime] [datetime2](3) NULL,
	[EndDateTime] [datetime2](3) NULL,
	[Status] [nvarchar](10) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctorAvailHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctorAvailHistory](
	[AvailHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NULL,
	[OldStartDateTime] [datetime2](3) NULL,
	[OldEndDateTime] [datetime2](3) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblProctorAvailHistory] PRIMARY KEY CLUSTERED 
(
	[AvailHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctoringType]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctoringType](
	[ProctoringTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProctoringType] [nvarchar](200) NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Mode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProctoringTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctorOnlineReview](
	[OnlineReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudScheduleID] [bigint] NULL,
	[ProctorId] [bigint] NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[Review] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[ReviewStatus] [tinyint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblProctorOnlineReview] PRIMARY KEY CLUSTERED 
(
	[OnlineReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReviewHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctorOnlineReviewHistory](
	[ReviewHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NULL,
	[ProctorID] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[Review] [nvarchar](max) NULL,
	[ReviewStatus] [tinyint] NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblProctorOnlineReviewHistory] PRIMARY KEY CLUSTERED 
(
	[ReviewHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReviewRejectHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctorOnlineReviewRejectHistory](
	[OnlineReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[StudScheduleID] [bigint] NULL,
	[ProctorId] [bigint] NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[Review] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[ReviewStatus] [tinyint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblProctorOnlineReviewRejectHistory] PRIMARY KEY CLUSTERED 
(
	[OnlineReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblProctorSignals]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblProctorSignals](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[proctorSignals] [nvarchar](500) NULL,
	[ScheduleUSerID] [bigint] NULL,
	[AttemptID] [bigint] NULL,
	[SignalType] [int] NULL,
	[PauseTime] [int] NULL,
	[Addextratime] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblRole](
	[RoleId] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblRole_RoleId] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSchedule]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSchedule](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[ScheduleCode] [nvarchar](200) NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Extension] [nvarchar](200) NULL,
	[Extension1] [nvarchar](200) NULL,
	[ScheduleName] [nvarchar](200) NULL,
	[Organizationcode] [nvarchar](100) NULL,
	[ISPhoto] [bit] NULL,
	[ISSignature] [bit] NULL,
	[ISHeadshot] [bit] NULL,
	[ISThumbempression] [bit] NULL,
	[ISRoomvideo] [bit] NULL,
	[ISSecondaryCamera] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[TblScheduleAssessmentProctorAvailAuditlog]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[TblScheduleAssessmentProctorAvailAuditlog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SchdUserID] [bigint] NULL,
	[SchedulestartDate] [datetime2](7) NULL,
	[ScheduleEndDate] [datetime2](7) NULL,
	[TestName] [nvarchar](100) NULL,
	[StudentName] [nvarchar](200) NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ProctorID] [bigint] NULL,
	[ProctorName] [nvarchar](100) NULL,
	[SectionNames] [nvarchar](1000) NULL,
	[SectionIDs] [nvarchar](1000) NULL,
	[TestCenterCode] [nvarchar](100) NULL,
	[ProctorAvailID] [bigint] NULL,
	[ScheduleName] [nvarchar](200) NULL,
	[IsSecuredTest] [bit] NULL,
	[ScheduleID] [bigint] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[RecordType] [int] NULL,
	[SectionCount] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Organizationid] [bigint] NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblScheduleDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblScheduleDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[ScheduleDetailCode] [nvarchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[ProctoringType] [int] NULL,
	[IsSecuredBrowser] [bit] NULL,
	[AssetID] [bigint] NULL,
	[StartDatetime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[PredifiedTypeID] [bigint] NULL,
	[Createby] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblScheduleStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblScheduleStatus](
	[ScheduleStatusID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleStatus] [nvarchar](200) NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblScheduleUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblScheduleUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleUserID] [bigint] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[StudentUserID] [bigint] NULL,
	[SubmittedDate] [datetime] NULL,
	[TestStartDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[ExtendedTime] [int] NULL,
	[ObtainedMarks] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[IsSecured] [bit] NULL,
	[LoginName] [nvarchar](200) NULL,
	[STATUS] [int] NULL,
	[ForcedSubmit] [bit] NULL,
	[Comments] [nvarchar](max) NULL,
	[Tag_Untag] [bit] NULL,
	[ScheduleUserCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblScheduleUserPhoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblScheduleUserPhoto](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleUserID] [bigint] NULL,
	[HeadShot] [nvarchar](max) NULL,
	[PhotoID] [int] NULL,
	[ProfilePhoto] [nvarchar](max) NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Organizationid] [bigint] NULL,
	[Attemptid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblScheduleUserRoomVideo]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblScheduleUserRoomVideo](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleUserID] [bigint] NULL,
	[RoomVideoID] [nvarchar](max) NULL,
	[TokenID] [nvarchar](max) NULL,
	[SessionID] [nvarchar](max) NULL,
	[TokenID1] [nvarchar](max) NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Attemptid] [bigint] NULL,
	[VideoPath] [nvarchar](max) NULL,
	[Organizationid] [bigint] NULL,
	[UserID] [bigint] NULL,
	[IsRoomVideo] [bit] NULL,
	[Endtime] [datetime] NULL,
	[status] [int] NULL,
	[Message] [nvarchar](200) NULL,
	[Extension1] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSecondarySubmissionQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSecondarySubmissionQueue](
	[QueueId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Message] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[AudioStatus] [tinyint] NOT NULL,
	[AudioStatusUpdatedDate] [datetime] NULL,
	[AudioMessage] [nvarchar](100) NULL,
	[LicenseMode] [tinyint] NOT NULL,
	[Extension1] [nvarchar](500) NULL,
	[Extension2] [nvarchar](500) NULL,
	[Extension3] [nvarchar](500) NULL,
	[OutcomeProcessingCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSecondarySubmissionQueue_QueueId] PRIMARY KEY CLUSTERED 
(
	[QueueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSON]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSecondaryVideoJSON](
	[VideoJSONId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[VideoJSON] [nvarchar](max) NOT NULL,
	[TotalFrames] [int] NOT NULL,
	[DetectedFrames] [int] NOT NULL,
	[AnalysisDuration] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSecondaryVideoJSON] PRIMARY KEY CLUSTERED 
(
	[VideoJSONId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSONHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSecondaryVideoJSONHistory](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSecondaryVideoJSONHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSecureBrower]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSecureBrower](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicationTracker] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[LaunchDate] [nvarchar](500) NULL,
	[ScheduleUserid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSettingKeys]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSettingKeys](
	[SettingKeyID] [smallint] IDENTITY(1,1) NOT NULL,
	[SettingKey] [varchar](200) NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblSettingKeys_SettingKeyID] PRIMARY KEY CLUSTERED 
(
	[SettingKeyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSingnalType]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSingnalType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SignalType] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[SignalID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblStudentCountConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblStudentCountConfig](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentCountSet] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblStudentHeadshotDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblStudentHeadshotDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[Attemptid] [bigint] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Createdby] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblStudentScheduleDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblStudentScheduleDetails](
	[StudScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProctorAvailID] [bigint] NOT NULL,
	[PartnerIntegrationId] [varchar](50) NOT NULL,
	[TestNameInformationId] [bigint] NULL,
	[ScheduleStartDateTime] [datetime2](3) NOT NULL,
	[ScheduleEndDateTime] [datetime2](3) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrgId] [smallint] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[StudentName] [nvarchar](200) NULL,
	[StudentID] [bigint] NULL,
	[StudentTimezoneId] [nvarchar](max) NULL,
	[IsSecuredTest] [bit] NULL,
 CONSTRAINT [PK_tblStudentScheduleDetails] PRIMARY KEY CLUSTERED 
(
	[StudScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblStudentScheduleHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblStudentScheduleHistory](
	[ScheduleHistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NULL,
	[ProctorAvailID] [bigint] NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblStudentScheduleHistory] PRIMARY KEY CLUSTERED 
(
	[ScheduleHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSubmissionQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSubmissionQueue](
	[QueueId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Message] [nvarchar](100) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[AudioStatus] [tinyint] NOT NULL,
	[AudioStatusUpdatedDate] [datetime2](3) NULL,
	[AudioMessage] [nvarchar](100) NULL,
	[LicenseMode] [tinyint] NOT NULL,
	[Extension1] [nvarchar](500) NULL,
	[Extension2] [nvarchar](500) NULL,
	[Extension3] [nvarchar](500) NULL,
	[OutcomeProcessingCompleted] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblSubmissionQueue_QueueId] PRIMARY KEY CLUSTERED 
(
	[QueueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSystemRequirement]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSystemRequirement](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleUserID] [bigint] NULL,
	[JsonObject] [nvarchar](max) NULL,
	[IPAddress] [nvarchar](100) NULL,
	[MACAddress] [nvarchar](100) NULL,
	[UserAgreement] [bit] NULL,
	[Isdeleted] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblTemplates](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](200) NOT NULL,
	[IsDefault] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblTemplates_TemplateId] PRIMARY KEY CLUSTERED 
(
	[TemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblTestAssignment](
	[AssignmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestDetailId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[IsAssigned] [bit] NOT NULL,
	[IsForwarded] [bit] NOT NULL,
	[ReviewStatus] [tinyint] NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[ForwardCount] [tinyint] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblTestAssignment_AssignmentId] PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblTestAttempts]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblTestAttempts](
	[AttemptId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestDetailsId] [bigint] NOT NULL,
	[StartDateTime] [datetime2](3) NOT NULL,
	[EndDateTime] [datetime2](3) NOT NULL,
	[LicenseMode] [tinyint] NOT NULL,
	[FileCount] [int] NOT NULL,
	[PhotoCapturedInterval] [int] NOT NULL,
	[AttemptSeverity] [tinyint] NULL,
	[StreamStartTime] [datetime2](3) NULL,
	[VideoCode] [nvarchar](100) NULL,
	[VideoPath] [nvarchar](500) NULL,
	[TokenID] [nvarchar](500) NULL,
	[SessionID] [nvarchar](500) NULL,
	[Extension1] [nvarchar](500) NULL,
	[Extension2] [nvarchar](500) NULL,
	[Extension3] [nvarchar](500) NULL,
	[VideoSequence] [int] NULL,
	[ParentVideoID] [nvarchar](200) NULL,
	[ArchiveVideoID] [nvarchar](200) NULL,
	[Isprocssed] [int] NULL,
	[DesktopVideoCode] [nvarchar](100) NULL,
	[DesktopVideoPath] [nvarchar](500) NULL,
	[DesktopTokenID] [nvarchar](500) NULL,
	[DesktopSessionID] [nvarchar](500) NULL,
	[DesktopVideoSequence] [int] NULL,
	[DesktopParentVideoID] [nvarchar](200) NULL,
	[DesktopArchiveVideoID] [nvarchar](200) NULL,
	[DesktopIsprocessed] [int] NULL,
	[Extension4] [nvarchar](500) NULL,
	[Extension5] [nvarchar](500) NULL,
	[Extension6] [nvarchar](500) NULL,
	[DesktopStatus] [tinyint] NULL,
	[DesktopMessage] [nvarchar](100) NULL,
	[DesktopUpdatedDate] [datetime2](3) NULL,
	[isdeleted] [bit] NULL,
	[IsArchived] [bit] NULL,
 CONSTRAINT [PK_tblTestAttempts_AttemptId] PRIMARY KEY CLUSTERED 
(
	[AttemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblTestAttempts_Archive]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblTestAttempts_Archive](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganisationId] [bigint] NULL,
	[TestDetailId] [bigint] NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[Createddate] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblTestDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblTestDetails](
	[TestDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationID] [varchar](50) NOT NULL,
	[TestGUID] [uniqueidentifier] NOT NULL,
	[TestNameInformationId] [bigint] NULL,
	[OrganisationId] [bigint] NULL,
	[CreatedDate] [datetime2](3) NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[StudentName] [nvarchar](200) NULL,
	[IsSubmitted] [bit] NOT NULL,
	[Severity] [tinyint] NULL,
	[StudentID] [bigint] NULL,
	[IsSecuredTest] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [bigint] NULL,
 CONSTRAINT [PK_tblTestDetails_TestDetailId] PRIMARY KEY CLUSTERED 
(
	[TestDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblTestNameInformation]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblTestNameInformation](
	[TestNameInformationId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](250) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[ScheduledStartDate] [datetime2](3) NULL,
	[ScheduledEndDate] [datetime2](3) NULL,
	[AssessmentId] [nvarchar](20) NULL,
	[TestDuration] [int] NULL,
	[OrganisationID] [bigint] NULL,
 CONSTRAINT [PK_tblTestNameInformation_TestDetailId] PRIMARY KEY CLUSTERED 
(
	[TestNameInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblUrlConfigurationSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblUrlConfigurationSettings](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[EventId] [smallint] NOT NULL,
	[EventName] [nvarchar](100) NULL,
	[Url] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[OrgId] [smallint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsDeleted] [tinyint] NOT NULL,
	[IsEnabled] [tinyint] NOT NULL,
 CONSTRAINT [PK_RPT.tblUrlConfigurationSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[TblUserAuditLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[TblUserAuditLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[LoginName] [nvarchar](120) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[EmailId] [nvarchar](120) NULL,
	[Password] [nvarchar](120) NULL,
	[Status] [nvarchar](120) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
	[Organisationid] [bigint] NULL,
	[OrganisationName] [nvarchar](200) NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblUserImages]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblUserImages](
	[UserImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[UserImage] [varbinary](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblUserImages_UserImageId] PRIMARY KEY CLUSTERED 
(
	[UserImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[TblUserImportFile]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[TblUserImportFile](
	[UserImportFileID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[RoleID] [bigint] NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[OrgCode] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[IsProcessed] [bit] NULL,
	[ImportType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserImportFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblUserPersonalizedSettings](
	[UserPersonalizedSettingId] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](200) NOT NULL,
	[SettingKeyID] [smallint] NULL,
	[UserId] [bigint] NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
 CONSTRAINT [PK_tblUserPersonalizedSettings_UserPersonalizedSettingId] PRIMARY KEY CLUSTERED 
(
	[UserPersonalizedSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblUsers](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[LoginName] [nvarchar](120) NOT NULL,
	[Password] [varchar](120) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[EmailId] [nvarchar](120) NULL,
	[RoleId] [tinyint] NOT NULL,
	[OrganisationId] [bigint] NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[UserTimeZoneId] [nvarchar](max) NULL,
	[loginclickcount] [int] NOT NULL,
	[loginclicktime] [datetime] NOT NULL,
	[forgotpasswordclicktime] [datetime] NOT NULL,
	[forgotpasswordclickcount] [int] NOT NULL,
	[USerGUID] [nvarchar](500) NULL,
	[CreatedAdminorg] [bigint] NULL,
 CONSTRAINT [PK_tblUsers_UserId] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblusers1]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblusers1](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[LoginName] [nvarchar](120) NOT NULL,
	[Password] [varchar](120) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[EmailId] [nvarchar](120) NULL,
	[RoleId] [tinyint] NOT NULL,
	[OrganisationId] [smallint] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[UserTimeZoneId] [nvarchar](max) NULL,
	[loginclickcount] [int] NOT NULL,
	[loginclicktime] [datetime] NOT NULL,
	[forgotpasswordclicktime] [datetime] NOT NULL,
	[forgotpasswordclickcount] [int] NOT NULL,
	[USerGUID] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblVerificationTypeMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblVerificationTypeMaster](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserVerificationType] [nvarchar](100) NULL,
	[Createdate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblVideoJSON]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblVideoJSON](
	[VideoJSONId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[VideoJSON] [nvarchar](max) NOT NULL,
	[TotalFrames] [int] NOT NULL,
	[DetectedFrames] [int] NOT NULL,
	[AnalysisDuration] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblVideoJSON] PRIMARY KEY CLUSTERED 
(
	[VideoJSONId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblVideoJSONHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblVideoJSONHistory](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblVideoJSONHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblvideoLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblvideoLog](
	[videoLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptID] [bigint] NOT NULL,
	[VideoCode] [nvarchar](100) NULL,
	[VideoPath] [nvarchar](500) NULL,
	[TokenID] [nvarchar](500) NULL,
	[SessionID] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblVideoRecordingDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblVideoRecordingDetails](
	[RecordingId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationId] [bigint] NOT NULL,
	[VideoCode] [nvarchar](100) NULL,
	[VideoPath] [nvarchar](500) NULL,
	[TokenID] [nvarchar](500) NULL,
	[SessionID] [nvarchar](500) NULL,
	[Extension1] [nvarchar](500) NULL,
	[Extension2] [nvarchar](500) NULL,
	[Extension3] [nvarchar](500) NULL,
	[VideoSequence] [int] NULL,
	[ParentVideoID] [nvarchar](200) NULL,
	[ArchiveVideoID] [nvarchar](200) NULL,
	[Isprocssed] [int] NULL,
	[IsVideoUploaded] [tinyint] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblVideoRecordingDetails_RecordingId] PRIMARY KEY CLUSTERED 
(
	[RecordingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[UserSession]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[UserSession](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[SessionID] [nvarchar](500) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK_UserSession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[UserSystemConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[UserSystemConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[UserName] [nvarchar](200) NULL,
	[JSon] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[SessionID] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_DatabaseLog_PostTime' AND OBJECT_NAME(Parent_Object_Id)='DatabaseLog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[DatabaseLog] ADD  CONSTRAINT [DF_DatabaseLog_PostTime]  DEFAULT (getutcdate()) FOR [PostTime]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_Notifications_IsRead' AND OBJECT_NAME(Parent_Object_Id)='Notifications' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Notifications_IsRead]  DEFAULT ((0)) FOR [IsRead]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_Summary_ScheduleDetails_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='Notifications' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Summary_ScheduleDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__Notifications_createddate' AND OBJECT_NAME(Parent_Object_Id)='Notifications' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF__Notifications_createddate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__Notifications_Archive_createddate' AND OBJECT_NAME(Parent_Object_Id)='Notifications_Archive' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[Notifications_Archive] ADD  CONSTRAINT [DF__Notifications_Archive_createddate]  DEFAULT (getutcdate()) FOR [ArchiveDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_Notifications_archive_IsDelete' AND OBJECT_NAME(Parent_Object_Id)='Notifications_Archive' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[Notifications_Archive] ADD  CONSTRAINT [DF_Notifications_archive_IsDelete]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SPErrorLog_PostTime' AND OBJECT_NAME(Parent_Object_Id)='SPErrorLog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[SPErrorLog] ADD  CONSTRAINT [DF_SPErrorLog_PostTime]  DEFAULT (getutcdate()) FOR [PostTime]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TempSummaryTestStudentDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='TempSummaryTestStudentDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[TempSummaryTestStudentDetails] ADD  CONSTRAINT [DF_TempSummaryTestStudentDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TempSummaryTestStudentDetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='TempSummaryTestStudentDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[TempSummaryTestStudentDetails] ADD  CONSTRAINT [DF_TempSummaryTestStudentDetails_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_USerMacAddressDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='USerMacAddressDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[USerMacAddressDetails] ADD  CONSTRAINT [DF_USerMacAddressDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_USerMacAddressDetails_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='USerMacAddressDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[USerMacAddressDetails] ADD  CONSTRAINT [DF_USerMacAddressDetails_isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserNotificationType_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='UserNotificationType' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[UserNotificationType] ADD  CONSTRAINT [DF_UserNotificationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__UserNotificationTypecreateddate' 
AND OBJECT_NAME(Parent_Object_Id)='UserNotificationType' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[UserNotificationType] ADD  CONSTRAINT [DF__UserNotificationTypecreateddate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__WebServicelog_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='WebServicelog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[WebServicelog] ADD CONSTRAINT [DF__WebServicelog_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__WebServicelogResponse_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='WebServicelogResponse' 
AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[WebServicelogResponse] ADD CONSTRAINT  DF__WebServicelogResponse_Isdeleted DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SummaryAssessmentScheduleDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='SummaryAssessmentScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')
BEGIN
ALTER TABLE [RPP].[SummaryAssessmentScheduleDetails] ADD  CONSTRAINT 
[DF_SummaryAssessmentScheduleDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SummaryAssessmentScheduleDetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='SummaryAssessmentScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')
BEGIN
ALTER TABLE [RPP].[SummaryAssessmentScheduleDetails] ADD  CONSTRAINT 
[DF_SummaryAssessmentScheduleDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SummaryScheduleDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='SummaryScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')
BEGIN
ALTER TABLE [RPP].[SummaryScheduleDetails] ADD  CONSTRAINT [DF_SummaryScheduleDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SummaryScheduleDetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='SummaryScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')
BEGIN
ALTER TABLE [RPP].[SummaryScheduleDetails] ADD  CONSTRAINT [DF_SummaryScheduleDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ApplicationSettings_IsProfile' 
AND OBJECT_NAME(Parent_Object_Id)='ApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ApplicationSettings] ADD  CONSTRAINT [DF_ApplicationSettings_IsProfile]  DEFAULT ((1)) FOR [IsProfile]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ApplicationSettings_IsOnlineRequired' 
AND OBJECT_NAME(Parent_Object_Id)='ApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ApplicationSettings] ADD  CONSTRAINT [DF_ApplicationSettings_IsOnlineRequired]  DEFAULT ((0)) FOR [IsOnlineRequired]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ApplicationSettings_IsOfflineRequired' 
AND OBJECT_NAME(Parent_Object_Id)='ApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ApplicationSettings] ADD  CONSTRAINT [DF_ApplicationSettings_IsOfflineRequired]  DEFAULT ((0)) FOR [IsOfflineRequired]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ApplicationSettings_Type' 
AND OBJECT_NAME(Parent_Object_Id)='ApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ApplicationSettings] ADD  CONSTRAINT [DF_ApplicationSettings_Type]  DEFAULT ((1)) FOR [Type]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ApplicationSettings_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='ApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ApplicationSettings] ADD  CONSTRAINT [DF_ApplicationSettings_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ApplicationSettings_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='ApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ApplicationSettings] ADD  CONSTRAINT [DF_ApplicationSettings_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_PhotoVerificationSettings_IsProfile' 
AND OBJECT_NAME(Parent_Object_Id)='PhotoVerificationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[PhotoVerificationSettings] ADD  CONSTRAINT [DF_PhotoVerificationSettings_IsProfile]  DEFAULT ((0)) FOR [IsProfile]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_PhotoVerificationSettings_ISHeadShot' 
AND OBJECT_NAME(Parent_Object_Id)='PhotoVerificationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[PhotoVerificationSettings] ADD  CONSTRAINT [DF_PhotoVerificationSettings_ISHeadShot]  DEFAULT ((0)) FOR [ISHeadShot]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_PhotoVerificationSettings_IsPhotoVerificationReqOnline' 
AND OBJECT_NAME(Parent_Object_Id)='PhotoVerificationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[PhotoVerificationSettings] ADD  
CONSTRAINT [DF_PhotoVerificationSettings_IsPhotoVerificationReqOnline]  DEFAULT ((0)) FOR [IsPhotoVerificationReqOnline]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_PhotoVerificationSettings_IsPhotoVerificationReqOffline' 
AND OBJECT_NAME(Parent_Object_Id)='PhotoVerificationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[PhotoVerificationSettings] ADD  CONSTRAINT 
[DF_PhotoVerificationSettings_IsPhotoVerificationReqOffline]  DEFAULT ((0)) FOR [IsPhotoVerificationReqOffline]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_PhotoVerificationSettings_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='PhotoVerificationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[PhotoVerificationSettings] ADD  CONSTRAINT [DF_PhotoVerificationSettings_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_PhotoVerificationSettings_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='PhotoVerificationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[PhotoVerificationSettings] ADD  CONSTRAINT [DF_PhotoVerificationSettings_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ProctorPauseResumeTrack_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='ProctorPauseResumeTrack' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ProctorPauseResumeTrack] ADD  CONSTRAINT [DF_ProctorPauseResumeTrack_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ProctorPauseResumeTrack_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='ProctorPauseResumeTrack' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ProctorPauseResumeTrack] ADD  CONSTRAINT [DF_ProctorPauseResumeTrack_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ScheduleName_IsProcessed' 
AND OBJECT_NAME(Parent_Object_Id)='ScheduleName' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ScheduleName] ADD  CONSTRAINT [DF_ScheduleName_IsProcessed] DEFAULT ((0)) FOR [IsProcessed]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ScheduleName_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='ScheduleName' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ScheduleName] ADD CONSTRAINT [DF_ScheduleName_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ScheduleName_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='ScheduleName' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ScheduleName] ADD  CONSTRAINT [DF_ScheduleName_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ScheduleUserFile_InsertedDate' 
AND OBJECT_NAME(Parent_Object_Id)='ScheduleUserFile' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ScheduleUserFile] ADD CONSTRAINT [DF_ScheduleUserFile_InsertedDate]  DEFAULT (getutcdate()) FOR [InsertedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_ScheduleUserFile_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='ScheduleUserFile' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[ScheduleUserFile] ADD CONSTRAINT [DF_ScheduleUserFile_IsDeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SecondaryCameraDetails_ActiveBit' 
AND OBJECT_NAME(Parent_Object_Id)='SecondaryCameraDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[SecondaryCameraDetails] ADD  CONSTRAINT [DF_SecondaryCameraDetails_ActiveBit]   DEFAULT ((0)) FOR [ActiveBit]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SecondaryCameraDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='SecondaryCameraDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[SecondaryCameraDetails] ADD  CONSTRAINT [DF_SecondaryCameraDetails_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_SecondaryCameraDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='SecondaryCameraDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[SecondaryCameraDetails] ADD CONSTRAINT [DF_SecondaryCameraDetails_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_StudentScheduleDetail_IsTagged' 
AND OBJECT_NAME(Parent_Object_Id)='StudentScheduleDetail' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[StudentScheduleDetail] ADD  CONSTRAINT [DF_StudentScheduleDetail_IsTagged]  DEFAULT ((0)) FOR [IsTagged]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_StudentScheduleDetail_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='StudentScheduleDetail' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[StudentScheduleDetail] ADD  CONSTRAINT [DF_StudentScheduleDetail_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_StudentScheduleDetail_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='StudentScheduleDetail' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[StudentScheduleDetail] ADD  CONSTRAINT [DF_StudentScheduleDetail_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblApplicationSettings_IsDelete' 
AND OBJECT_NAME(Parent_Object_Id)='tblApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblApplicationSettings] ADD  CONSTRAINT [DF_tblApplicationSettings_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblApplicationSettings_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblApplicationSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblApplicationSettings] ADD  CONSTRAINT [DF_tblApplicationSettings_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAssessments_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblAssessments' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAssessments] ADD  CONSTRAINT [DF_tblAssessments_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAssessments_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblAssessments' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAssessments] ADD  CONSTRAINT [DF_tblAssessments_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAssignmentHistory_Createdate' 
AND OBJECT_NAME(Parent_Object_Id)='tblAssignmentHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAssignmentHistory] ADD  CONSTRAINT [DF_tblAssignmentHistory_Createdate]  DEFAULT (getutcdate()) FOR [Createdate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAssignmentHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblAssignmentHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAssignmentHistory] ADD  CONSTRAINT [DF_tblAssignmentHistory_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAudioJSON_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblAudioJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAudioJSON] ADD  CONSTRAINT [DF_tblAudioJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAudioJSON_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblAudioJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAudioJSON] ADD  CONSTRAINT [DF_tblAudioJSON_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAudioJSONHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblAudioJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAudioJSONHistory] ADD  CONSTRAINT [DF_tblAudioJSONHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAudioJSONHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblAudioJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAudioJSONHistory] ADD  CONSTRAINT [DF_tblAudioJSONHistory_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TBLAuditCandidatetagging_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='TBLAuditCandidatetagging' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TBLAuditCandidatetagging] ADD  CONSTRAINT [DF_TBLAuditCandidatetagging_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TBLAuditCandidatetagging_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='TBLAuditCandidatetagging' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TBLAuditCandidatetagging] ADD  CONSTRAINT [DF_TBLAuditCandidatetagging_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TBLAuditCandidatetagging_IsTagged' 
AND OBJECT_NAME(Parent_Object_Id)='TBLAuditCandidatetagging' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TBLAuditCandidatetagging] ADD  CONSTRAINT [DF_TBLAuditCandidatetagging_IsTagged]  DEFAULT ((0)) FOR [IsTagged]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAuditDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblAuditDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditDetails] ADD  CONSTRAINT [DF_tblAuditDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__tblAuditD__IsDel__75AD65ED' 
AND OBJECT_NAME(Parent_Object_Id)='tblAuditDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditDetails] ADD   CONSTRAINT [DF__tblAuditD__IsDel__75AD65ED]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblAuditSummary_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblAuditSummary' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditSummary] ADD  CONSTRAINT [DF_tblAuditSummary_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__tblAuditS__IsDel__011F1899' 
AND OBJECT_NAME(Parent_Object_Id)='tblAuditSummary' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditSummary] ADD   CONSTRAINT [DF__tblAuditS__IsDel__011F1899]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__TblAuditU__Creat__2FA4FD58' 
AND OBJECT_NAME(Parent_Object_Id)='TblAuditUserImport' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblAuditUserImport] ADD  CONSTRAINT [DF__TblAuditU__Creat__2FA4FD58]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__TblAuditU__Isdel__30992191' 
AND OBJECT_NAME(Parent_Object_Id)='TblAuditUserImport' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblAuditUserImport] ADD   CONSTRAINT [DF__TblAuditU__Isdel__30992191]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF__tblBlockL__Creat__233F2673' 
AND OBJECT_NAME(Parent_Object_Id)='tblBlockListedApplicationDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblBlockListedApplicationDetails] ADD  CONSTRAINT [DF__tblBlockL__Creat__233F2673]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblChatHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblChatHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblChatHistory] ADD  CONSTRAINT [DF_tblChatHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblChatHistory_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblChatHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblChatHistory] ADD   CONSTRAINT [DF_tblChatHistory_isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblCustomers_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblCustomers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblCustomers] ADD  CONSTRAINT [DF_tblCustomers_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblCustomers_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblCustomers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblCustomers] ADD  CONSTRAINT [DF_tblCustomers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblEmailTemplate_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblEmailTemplate' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblEmailTemplate] ADD  CONSTRAINT [DF_tblEmailTemplate_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblEmailTemplate_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblEmailTemplate' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblEmailTemplate] ADD   CONSTRAINT [DF_tblEmailTemplate_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblEvents_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblEvents' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblEvents] ADD  CONSTRAINT [DF_tblEvents_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblEvents_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblEvents' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblEvents] ADD  CONSTRAINT [DF_tblEvents_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblFaceMismatchDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblFaceMismatchDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblFaceMismatchDetails] ADD   CONSTRAINT [DF_tblFaceMismatchDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblFaceMismatchDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblFaceMismatchDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblFaceMismatchDetails] ADD  CONSTRAINT [DF_tblFaceMismatchDetails_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblFileImport_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblFileImport' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblFileImport] ADD   CONSTRAINT [DF_tblFileImport_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblFileImport_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblFileImport' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblFileImport] ADD  CONSTRAINT [DF_tblFileImport_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblFileImport_IsProcessed' 
AND OBJECT_NAME(Parent_Object_Id)='tblFileImport' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblFileImport] ADD  CONSTRAINT [DF_tblFileImport_IsProcessed] DEFAULT ((0)) FOR [IsProcessed]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblLoginHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblLoginHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblLoginHistory] ADD  CONSTRAINT [DF_tblLoginHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblLoginHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblLoginHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblLoginHistory] ADD  CONSTRAINT [DF_tblLoginHistory_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblManualReviewHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblManualReviewHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblManualReviewHistory] ADD  CONSTRAINT [DF_tblManualReviewHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblManualReviewHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblManualReviewHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblManualReviewHistory] ADD   CONSTRAINT [DF_tblManualReviewHistory_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblManualReviewJSON_Status' 
AND OBJECT_NAME(Parent_Object_Id)='tblManualReviewJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblManualReviewJSON] ADD  CONSTRAINT [DF_tblManualReviewJSON_Status]  DEFAULT ((0)) FOR [Status]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblManualReviewJSON_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblManualReviewJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblManualReviewJSON] ADD  CONSTRAINT [DF_tblManualReviewJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblManualReviewJSON_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblManualReviewJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblManualReviewJSON] ADD  CONSTRAINT [DF_tblManualReviewJSON_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblOrganisation_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblOrganisation' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblOrganisation] ADD  CONSTRAINT [DF_tblOrganisation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblOrganisation_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblOrganisation' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblOrganisation] ADD  CONSTRAINT [DF_tblOrganisation_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblOrganisation_IscustomerOrg' 
AND OBJECT_NAME(Parent_Object_Id)='tblOrganisation' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblOrganisation] ADD CONSTRAINT [DF_tblOrganisation_IscustomerOrg]   DEFAULT ((0)) FOR [IscustomerOrg]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPhotoJSONHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblPhotoJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPhotoJSONHistory] ADD  CONSTRAINT [DF_tblPhotoJSONHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPhotoJSONHistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblPhotoJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPhotoJSONHistory] ADD CONSTRAINT [DF_tblPhotoJSONHistory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]

END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPredifiedTypeMaster_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblPredifiedTypeMaster' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPredifiedTypeMaster] ADD  CONSTRAINT [DF_tblPredifiedTypeMaster_CreatedDate]  DEFAULT (getutcdate()) FOR [Createdate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPredifiedTypeMaster_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblPredifiedTypeMaster' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPredifiedTypeMaster] ADD  CONSTRAINT [DF_tblPredifiedTypeMaster_IsDeleted]  DEFAULT ((0)) FOR [isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPreferences_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblPreferences' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPreferences] ADD  CONSTRAINT [DF_tblPreferences_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPreferences_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblPreferences' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPreferences] ADD  CONSTRAINT [DF_tblPreferences_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPreferences_Proctoringtype' 
AND OBJECT_NAME(Parent_Object_Id)='tblPreferences' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPreferences] ADD  CONSTRAINT [DF_tblPreferences_Proctoringtype]  DEFAULT ((2)) FOR [Proctoringtype]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPreferences_Recordintype' 
AND OBJECT_NAME(Parent_Object_Id)='tblPreferences' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPreferences] ADD  CONSTRAINT [DF_tblPreferences_Recordintype]  DEFAULT ((0)) FOR [Recordintype]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPreferencesHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblPreferencesHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPreferencesHistory] ADD  CONSTRAINT [DF_tblPreferencesHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblPreferencesHistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblPreferencesHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblPreferencesHistory] ADD CONSTRAINT [DF_tblPreferencesHistory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorAvail_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorAvail' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorAvail] ADD  CONSTRAINT [DF_tblProctorAvail_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorAvail_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorAvail' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorAvail] ADD  CONSTRAINT [DF_tblProctorAvail_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblProctorAvailAuditlog_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='TblProctorAvailAuditlog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblProctorAvailAuditlog] ADD  CONSTRAINT [DF_TblProctorAvailAuditlog_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblProctorAvailAuditlog_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='TblProctorAvailAuditlog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblProctorAvailAuditlog] ADD  CONSTRAINT [DF_TblProctorAvailAuditlog_IsDeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorAvailHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorAvailHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorAvailHistory] ADD  CONSTRAINT [DF_tblProctorAvailHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorAvailHistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorAvailHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorAvailHistory] ADD  CONSTRAINT [DF_tblProctorAvailHistory_IsDeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctoringType_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctoringType' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctoringType] ADD  CONSTRAINT [DF_tblProctoringType_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctoringType_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctoringType' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctoringType] ADD  CONSTRAINT [DF_tblProctoringType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorOnlineReview_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReview' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorOnlineReview] ADD  CONSTRAINT [DF_tblProctorOnlineReview_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorOnlineReview_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReview' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorOnlineReview] ADD   CONSTRAINT [DF_tblProctorOnlineReview_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorOnlineReviewHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReviewHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorOnlineReviewHistory] ADD  CONSTRAINT [DF_tblProctorOnlineReviewHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorOnlineReviewHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReviewHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorOnlineReviewHistory] ADD  CONSTRAINT [DF_tblProctorOnlineReviewHistory_Isdeleted] DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorOnlineReviewRejectHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReviewRejectHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorOnlineReviewRejectHistory] ADD  CONSTRAINT [DF_tblProctorOnlineReviewRejectHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorOnlineReviewRejectHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReviewRejectHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorOnlineReviewRejectHistory] ADD  CONSTRAINT [DF_tblProctorOnlineReviewRejectHistory_Isdeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorSignals_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorSignals' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorSignals] ADD CONSTRAINT [DF_tblProctorSignals_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblProctorSignals_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorSignals' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorSignals] ADD  CONSTRAINT [DF_tblProctorSignals_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblRole_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblRole' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblRole] ADD  CONSTRAINT [DF_tblRole_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblRole_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblRole' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblRole] ADD  CONSTRAINT [DF_tblRole_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSchedule_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD  CONSTRAINT [DF_tblSchedule_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD  CONSTRAINT [DF_tblschedule_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_ISPhoto' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD  CONSTRAINT [DF_tblschedule_ISPhoto]  DEFAULT ((0)) FOR [ISPhoto]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_ISSignature' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD CONSTRAINT [DF_tblschedule_ISSignature]   DEFAULT ((0)) FOR [ISSignature]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_ISHeadshot' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD  CONSTRAINT [DF_tblschedule_ISHeadshot]  DEFAULT ((0)) FOR [ISHeadshot]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_ISThumbempression' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD  CONSTRAINT [DF_tblschedule_ISThumbempression] DEFAULT ((0)) FOR [ISThumbempression]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_ISRoomvideo' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD  CONSTRAINT [DF_tblschedule_ISRoomvideo] DEFAULT ((0)) FOR [ISRoomvideo]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblschedule_ISSecondaryCamera' 
AND OBJECT_NAME(Parent_Object_Id)='tblSchedule' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSchedule] ADD CONSTRAINT [DF_tblschedule_ISSecondaryCamera]  DEFAULT ((0)) FOR [ISSecondaryCamera]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblScheduleAssessmentProctorAvailAuditlog_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='TblScheduleAssessmentProctorAvailAuditlog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblScheduleAssessmentProctorAvailAuditlog] ADD  CONSTRAINT [DF_TblScheduleAssessmentProctorAvailAuditlog_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblScheduleAssessmentProctorAvailAuditlog_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='TblScheduleAssessmentProctorAvailAuditlog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblScheduleAssessmentProctorAvailAuditlog] ADD CONSTRAINT [DF_TblScheduleAssessmentProctorAvailAuditlog_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleDetails] ADD  CONSTRAINT [DF_tblScheduleDetails_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblscheduleDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleDetails] ADD  CONSTRAINT [DF_tblscheduleDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleStatus_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleStatus' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleStatus] ADD  CONSTRAINT [DF_tblScheduleStatus_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleStatus_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleStatus' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleStatus] ADD  CONSTRAINT [DF_tblScheduleStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUser_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUser' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUser] ADD  CONSTRAINT [DF_tblScheduleUser_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblscheduleUSer_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUser' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUser] ADD  CONSTRAINT [DF_tblscheduleUSer_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUser_IsSecured' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUser' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUser] ADD CONSTRAINT [DF_tblScheduleUser_IsSecured]   DEFAULT ((0)) FOR [IsSecured]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUser_ForcedSubmit' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUser' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUser] ADD CONSTRAINT [DF_tblScheduleUser_ForcedSubmit]  DEFAULT ((0)) FOR [ForcedSubmit]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUser_Tag_Untag' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUser' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUser] ADD CONSTRAINT [DF_tblScheduleUser_Tag_Untag]  DEFAULT ((0)) FOR [Tag_Untag]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUserPhoto_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUserPhoto' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUserPhoto] ADD  CONSTRAINT [DF_tblScheduleUserPhoto_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleuserphoto_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUserPhoto' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUserPhoto] ADD  CONSTRAINT [DF_tblScheduleuserphoto_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUserRoomVideo_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUserRoomVideo' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUserRoomVideo] ADD  CONSTRAINT [DF_tblScheduleUserRoomVideo_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblScheduleUserRoomVideo_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUserRoomVideo' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUserRoomVideo] ADD  CONSTRAINT [DF_tblScheduleUserRoomVideo_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondarySubmissionQueue_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondarySubmissionQueue' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondarySubmissionQueue] ADD  CONSTRAINT [DF_tblSecondarySubmissionQueue_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondarySubmissionQueue_OutcomeProcessingCompleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondarySubmissionQueue' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondarySubmissionQueue] ADD  CONSTRAINT [DF_tblSecondarySubmissionQueue_OutcomeProcessingCompleted]  DEFAULT ((0)) FOR [OutcomeProcessingCompleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondarySubmissionQueue_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondarySubmissionQueue' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondarySubmissionQueue] ADD  CONSTRAINT [DF_tblSecondarySubmissionQueue_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondaryVideoJSON_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryVideoJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondaryVideoJSON] ADD  CONSTRAINT [DF_tblSecondaryVideoJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondaryVideoJSON_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryVideoJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondaryVideoJSON] ADD  CONSTRAINT [DF_tblSecondaryVideoJSON_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondaryVideoJSONHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryVideoJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondaryVideoJSONHistory] ADD  CONSTRAINT [DF_tblSecondaryVideoJSONHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecondaryVideoJSONHistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryVideoJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecondaryVideoJSONHistory] ADD  CONSTRAINT [DF_tblSecondaryVideoJSONHistory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecureBrower_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecureBrower' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecureBrower] ADD   CONSTRAINT [DF_tblSecureBrower_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSecureBrower_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSecureBrower' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSecureBrower] ADD CONSTRAINT [DF_tblSecureBrower_IsDeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSettingKeys_IsDelete' 
AND OBJECT_NAME(Parent_Object_Id)='tblSettingKeys' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSettingKeys] ADD  CONSTRAINT [DF_tblSettingKeys_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSettingKeys_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSettingKeys' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSettingKeys] ADD  CONSTRAINT [DF_tblSettingKeys_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSingnalType_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSingnalType' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSingnalType] ADD  CONSTRAINT [DF_tblSingnalType_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSingnalType_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSingnalType' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSingnalType] ADD   CONSTRAINT [DF_tblSingnalType_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentCountConfig_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentCountConfig' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentCountConfig] ADD  CONSTRAINT [DF_tblStudentCountConfig_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentCountConfig_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentCountConfig' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentCountConfig] ADD   CONSTRAINT [DF_tblStudentCountConfig_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentHeadshotDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentHeadshotDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentHeadshotDetails] ADD  CONSTRAINT [DF_tblStudentHeadshotDetails_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentHeadshotDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentHeadshotDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentHeadshotDetails] ADD CONSTRAINT [DF_tblStudentHeadshotDetails_Isdeleted]   DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentScheduleDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentScheduleDetails] ADD  CONSTRAINT [DF_tblStudentScheduleDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentScheduleDetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentScheduleDetails] ADD  CONSTRAINT [DF_tblStudentScheduleDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='D_studscheduledetails_IsSecuredTest' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentScheduleDetails] ADD  CONSTRAINT [D_studscheduledetails_IsSecuredTest]  DEFAULT ((0)) FOR [IsSecuredTest]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblStudentScheduleHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentScheduleHistory] ADD  CONSTRAINT [DF_tblStudentScheduleHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_studscheduledetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblStudentScheduleHistory] ADD CONSTRAINT [DF_studscheduledetails_IsDeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSubmissionQueue_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSubmissionQueue' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSubmissionQueue] ADD  CONSTRAINT [DF_tblSubmissionQueue_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSubmissionQueue_OutcomeProcessingCompleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSubmissionQueue' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSubmissionQueue] ADD  CONSTRAINT [DF_tblSubmissionQueue_OutcomeProcessingCompleted]  DEFAULT ((0)) FOR [OutcomeProcessingCompleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSubmissionQueue_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSubmissionQueue' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSubmissionQueue] ADD CONSTRAINT [DF_tblSubmissionQueue_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSystemRequirement_UserAgreement' 
AND OBJECT_NAME(Parent_Object_Id)='tblSystemRequirement' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSystemRequirement] ADD  CONSTRAINT [DF_tblSystemRequirement_UserAgreement]  DEFAULT ((0)) FOR [UserAgreement]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSystemRequirement_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblSystemRequirement' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSystemRequirement] ADD  CONSTRAINT [DF_tblSystemRequirement_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSystemRequirement_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSystemRequirement' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblSystemRequirement] ADD  CONSTRAINT [DF_tblSystemRequirement_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblSystemRequirement_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblSystemRequirement' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTemplates] ADD  CONSTRAINT [DF_tblTemplates_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTemplates_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTemplates' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTemplates] ADD  CONSTRAINT [DF_tblTemplates_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTemplates_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblTemplates' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTemplates] ADD  CONSTRAINT [DF_tblTemplates_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAssignment_IsAssigned' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAssignment' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAssignment] ADD  CONSTRAINT [DF_tblTestAssignment_IsAssigned]  DEFAULT ((1)) FOR [IsAssigned]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestDetails_IsForwarded' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAssignment' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAssignment] ADD  CONSTRAINT [DF_tblTestDetails_IsForwarded]  DEFAULT ((0)) FOR [IsForwarded]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAssignment_ReviewStatus' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAssignment' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAssignment] ADD  CONSTRAINT [DF_tblTestAssignment_ReviewStatus]  DEFAULT ((0)) FOR [ReviewStatus]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAssignment_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAssignment' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAssignment] ADD  CONSTRAINT [DF_tblTestAssignment_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='NN_tblTestAssignment_ForwardCount' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAssignment' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAssignment] ADD  CONSTRAINT [NN_tblTestAssignment_ForwardCount]  DEFAULT ((1)) FOR [ForwardCount]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAssignment_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAssignment' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAssignment] ADD CONSTRAINT [DF_tblTestAssignment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='VideoSequence' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAttempts] ADD  CONSTRAINT [VideoSequence]  DEFAULT ((0)) FOR [VideoSequence]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='Isprocssed' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAttempts] ADD  CONSTRAINT [Isprocssed]  DEFAULT ((0)) FOR [Isprocssed]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAttempts_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAttempts] ADD CONSTRAINT [DF_tblTestAttempts_isdeleted] DEFAULT ((0)) FOR [isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAttempts_IsArchived' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAttempts] ADD  CONSTRAINT [DF_tblTestAttempts_IsArchived]  DEFAULT ((0)) FOR [IsArchived]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAttempts_Archive_IsArchived_Createddate' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts_Archive' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAttempts_Archive] ADD CONSTRAINT [DF_tblTestAttempts_Archive_IsArchived_Createddate] DEFAULT (getutcdate()) FOR [Createddate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestAttempts_Archive_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts_Archive' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestAttempts_Archive] ADD CONSTRAINT [DF_tblTestAttempts_Archive_isdeleted] DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestDetails] ADD  CONSTRAINT [DF_tblTestDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestDetails_IsSubmitted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestDetails] ADD  CONSTRAINT [DF_tblTestDetails_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestDetails_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestDetails] ADD  CONSTRAINT [DF_tblTestDetails_isdeleted] DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestNameInformation_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestNameInformation' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestNameInformation] ADD  CONSTRAINT [DF_tblTestNameInformation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblTestNameInformation_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestNameInformation' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestNameInformation] ADD  CONSTRAINT [DF_tblTestNameInformation_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblUserAuditLog_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='TblUserAuditLog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblUserAuditLog] ADD  CONSTRAINT [DF_TblUserAuditLog_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblUserAuditLog_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='TblUserAuditLog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblUserAuditLog] ADD  CONSTRAINT [DF_TblUserAuditLog_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUserImages_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblUserImages' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUserImages] ADD  CONSTRAINT [DF_tblUserImages_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUserImages_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblUserImages' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUserImages] ADD  CONSTRAINT [DF_tblUserImages_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblUserImportFile_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='TblUserImportFile' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblUserImportFile] ADD   CONSTRAINT [DF_TblUserImportFile_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_TblUserImportFile_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='TblUserImportFile' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblUserImportFile] ADD  CONSTRAINT [DF_TblUserImportFile_Isdeleted]   DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUserPersonalizedSettings_IsDelete' 
AND OBJECT_NAME(Parent_Object_Id)='tblUserPersonalizedSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUserPersonalizedSettings] ADD  CONSTRAINT [DF_tblUserPersonalizedSettings_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUserPersonalizedSettings_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblUserPersonalizedSettings' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUserPersonalizedSettings] ADD  CONSTRAINT [DF_tblUserPersonalizedSettings_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_IsEnabled' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_IsEnabled]  DEFAULT ((1)) FOR [IsEnabled]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_loginclickcount' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD CONSTRAINT [DF_tblUsers_loginclickcount]  DEFAULT ((0)) FOR [loginclickcount]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_loginclicktime' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD CONSTRAINT [DF_tblUsers_loginclicktime] DEFAULT (getdate()) FOR [loginclicktime]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_fortpasswordclicktime' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_fortpasswordclicktime] DEFAULT (getdate()) FOR [forgotpasswordclicktime]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblUsers_fortpasswordclickcount' 
AND OBJECT_NAME(Parent_Object_Id)='tblUsers' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD CONSTRAINT [DF_tblUsers_fortpasswordclickcount] DEFAULT ((0)) FOR [forgotpasswordclickcount]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVerificationTypeMaster_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblVerificationTypeMaster' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVerificationTypeMaster] ADD CONSTRAINT [DF_tblVerificationTypeMaster_CreatedDate]  DEFAULT (getutcdate()) FOR [Createdate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVerificationTypeMaster_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblVerificationTypeMaster' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVerificationTypeMaster] ADD CONSTRAINT [DF_tblVerificationTypeMaster_isdeleted]  DEFAULT ((0)) FOR [isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVideoJSON_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideoJSON] ADD  CONSTRAINT [DF_tblVideoJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVideoJSON_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideoJSON] ADD CONSTRAINT [DF_tblVideoJSON_IsDeleted]   DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVideoJSONHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideoJSONHistory] ADD  CONSTRAINT [DF_tblVideoJSONHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVideoJSONHistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSONHistory' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideoJSONHistory] ADD  CONSTRAINT [DF_tblVideoJSONHistory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblvideoLog_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblvideoLog' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvideoLog] ADD   CONSTRAINT [DF_tblvideoLog_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_tblVideoRecordingDetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoRecordingDetails' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideoRecordingDetails] ADD  CONSTRAINT [DF_tblVideoRecordingDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserSession_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='UserSession' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserSession] ADD  CONSTRAINT [DF_UserSession_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserSession_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='UserSession' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserSession] ADD  CONSTRAINT [DF_UserSession_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserSystemConfiguration_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='UserSystemConfiguration' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserSystemConfiguration] ADD CONSTRAINT [DF_UserSystemConfiguration_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserSystemConfiguration_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='UserSystemConfiguration' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserSystemConfiguration] ADD CONSTRAINT [DF_UserSystemConfiguration_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblApplicationSettings_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]'))
ALTER TABLE [RPT].[tblApplicationSettings]  WITH CHECK ADD  CONSTRAINT [FK_tblApplicationSettings_tblOrganisation_OrganisationId] FOREIGN KEY([OrganisationId])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblApplicationSettings_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]'))
ALTER TABLE [RPT].[tblApplicationSettings] CHECK CONSTRAINT [FK_tblApplicationSettings_tblOrganisation_OrganisationId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblApplicationSettings_tblSettingKeys_SettingKeyID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]'))
ALTER TABLE [RPT].[tblApplicationSettings]  WITH CHECK ADD  CONSTRAINT [FK_tblApplicationSettings_tblSettingKeys_SettingKeyID] FOREIGN KEY([SettingKeyID])
REFERENCES [RPT].[tblSettingKeys] ([SettingKeyID])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblApplicationSettings_tblSettingKeys_SettingKeyID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]'))
ALTER TABLE [RPT].[tblApplicationSettings] CHECK CONSTRAINT [FK_tblApplicationSettings_tblSettingKeys_SettingKeyID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblEvents_EventId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblAssignmentHistory_tblEvents_EventId] FOREIGN KEY([EventId])
REFERENCES [RPT].[tblEvents] ([EventId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblEvents_EventId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory] CHECK CONSTRAINT [FK_tblAssignmentHistory_tblEvents_EventId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblTestAssignment_AssignmentId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblAssignmentHistory_tblTestAssignment_AssignmentId] FOREIGN KEY([AssignmentId])
REFERENCES [RPT].[tblTestAssignment] ([AssignmentId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblTestAssignment_AssignmentId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory] CHECK CONSTRAINT [FK_tblAssignmentHistory_tblTestAssignment_AssignmentId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblAssignmentHistory_tblUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory] CHECK CONSTRAINT [FK_tblAssignmentHistory_tblUsers_UserId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAudioJSON_tblTestAttempts_TestAttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAudioJSON]'))
ALTER TABLE [RPT].[tblAudioJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblAudioJSON_tblTestAttempts_TestAttemptId] FOREIGN KEY([AttempId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAudioJSON_tblTestAttempts_TestAttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAudioJSON]'))
ALTER TABLE [RPT].[tblAudioJSON] CHECK CONSTRAINT [FK_tblAudioJSON_tblTestAttempts_TestAttemptId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblAudioJ__Audit__5B438874]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAudioJSONHistory]'))
ALTER TABLE [RPT].[tblAudioJSONHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditDetails_tblAuditSummary_AuditSummaryID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditDetails]'))
ALTER TABLE [RPT].[tblAuditDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblAuditDetails_tblAuditSummary_AuditSummaryID] FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditDetails_tblAuditSummary_AuditSummaryID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditDetails]'))
ALTER TABLE [RPT].[tblAuditDetails] CHECK CONSTRAINT [FK_tblAuditDetails_tblAuditSummary_AuditSummaryID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditSummary_tblEvents_EventId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]'))
ALTER TABLE [RPT].[tblAuditSummary]  WITH CHECK ADD  CONSTRAINT [FK_tblAuditSummary_tblEvents_EventId] FOREIGN KEY([EventId])
REFERENCES [RPT].[tblEvents] ([EventId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditSummary_tblEvents_EventId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]'))
ALTER TABLE [RPT].[tblAuditSummary] CHECK CONSTRAINT [FK_tblAuditSummary_tblEvents_EventId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditSummary_tblUsers_UserID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]'))
ALTER TABLE [RPT].[tblAuditSummary]  WITH CHECK ADD  CONSTRAINT [FK_tblAuditSummary_tblUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditSummary_tblUsers_UserID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]'))
ALTER TABLE [RPT].[tblAuditSummary] CHECK CONSTRAINT [FK_tblAuditSummary_tblUsers_UserID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblEmailT__Event__4A8310C6]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblEmailTemplate]'))
ALTER TABLE [RPT].[tblEmailTemplate]  WITH CHECK ADD FOREIGN KEY([EventId])
REFERENCES [RPT].[tblEvents] ([EventId])

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblManual__Audit__5772F790]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewHistory]'))
ALTER TABLE [RPT].[tblManualReviewHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblTestAssignment_AssignmentId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblManualReviewJSON_tblTestAssignment_AssignmentId] FOREIGN KEY([AssignmentId])
REFERENCES [RPT].[tblTestAssignment] ([AssignmentId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblTestAssignment_AssignmentId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON] CHECK CONSTRAINT [FK_tblManualReviewJSON_tblTestAssignment_AssignmentId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblManualReviewJSON_tblTestAttempts_AttemptId] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON] CHECK CONSTRAINT [FK_tblManualReviewJSON_tblTestAttempts_AttemptId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblManualReviewJSON_tblUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON] CHECK CONSTRAINT [FK_tblManualReviewJSON_tblUsers_UserId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblOrgani__Defau__367C1819]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblOrganisation]'))
ALTER TABLE [RPT].[tblOrganisation]  WITH CHECK ADD FOREIGN KEY([DefaultUserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblOrganisation_ParentID_Organisation_Organisationid]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblOrganisation]'))
ALTER TABLE [RPT].[tblOrganisation]  WITH CHECK ADD  CONSTRAINT [FK_tblOrganisation_ParentID_Organisation_Organisationid] FOREIGN KEY([ParentID])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblOrganisation_ParentID_Organisation_Organisationid]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblOrganisation]'))
ALTER TABLE [RPT].[tblOrganisation] CHECK CONSTRAINT [FK_tblOrganisation_ParentID_Organisation_Organisationid]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblPhotoJ__Audit__62E4AA3C]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPhotoJSONHistory]'))
ALTER TABLE [RPT].[tblPhotoJSONHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblPreferences_tblTemplates_TemplateId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferences]'))
ALTER TABLE [RPT].[tblPreferences]  WITH CHECK ADD  CONSTRAINT [FK_tblPreferences_tblTemplates_TemplateId] FOREIGN KEY([TemplateId])
REFERENCES [RPT].[tblTemplates] ([TemplateId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblPreferences_tblTemplates_TemplateId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferences]'))
ALTER TABLE [RPT].[tblPreferences] CHECK CONSTRAINT [FK_tblPreferences_tblTemplates_TemplateId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[PK_tblPreferences_PreferenceId_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferences]'))
ALTER TABLE [RPT].[tblPreferences]  WITH CHECK ADD  CONSTRAINT [PK_tblPreferences_PreferenceId_OrganisationId] FOREIGN KEY([OrganisationId])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[PK_tblPreferences_PreferenceId_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferences]'))
ALTER TABLE [RPT].[tblPreferences] CHECK CONSTRAINT [PK_tblPreferences_PreferenceId_OrganisationId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblPreferencesHistory_tblPreferences_PreferenceId_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferencesHistory]'))
ALTER TABLE [RPT].[tblPreferencesHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblPreferencesHistory_tblPreferences_PreferenceId_OrganisationId] FOREIGN KEY([OrganisationId])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblPreferencesHistory_tblPreferences_PreferenceId_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferencesHistory]'))
ALTER TABLE [RPT].[tblPreferencesHistory] CHECK CONSTRAINT [FK_tblPreferencesHistory_tblPreferences_PreferenceId_OrganisationId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorAvail_tblUsers]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorAvail]'))
ALTER TABLE [RPT].[tblProctorAvail]  WITH CHECK ADD  CONSTRAINT [FK_tblProctorAvail_tblUsers] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorAvail_tblUsers]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorAvail]'))
ALTER TABLE [RPT].[tblProctorAvail] CHECK CONSTRAINT [FK_tblProctorAvail_tblUsers]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblStudentScheduleDetails]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview]  WITH CHECK ADD  CONSTRAINT [FK_tblProctorOnlineReview_tblStudentScheduleDetails] FOREIGN KEY([StudScheduleID])
REFERENCES [RPT].[tblStudentScheduleDetails] ([StudScheduleId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblStudentScheduleDetails]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview] CHECK CONSTRAINT [FK_tblProctorOnlineReview_tblStudentScheduleDetails]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblTestAttempts]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview]  WITH CHECK ADD  CONSTRAINT [FK_tblProctorOnlineReview_tblTestAttempts] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblTestAttempts]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview] CHECK CONSTRAINT [FK_tblProctorOnlineReview_tblTestAttempts]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblUsers]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview]  WITH CHECK ADD  CONSTRAINT [FK_tblProctorOnlineReview_tblUsers] FOREIGN KEY([ProctorId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblUsers]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview] CHECK CONSTRAINT [FK_tblProctorOnlineReview_tblUsers]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondarySubmissionQueue_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondarySubmissionQueue]'))
ALTER TABLE [RPT].[tblSecondarySubmissionQueue]  WITH CHECK ADD  CONSTRAINT [FK_tblSecondarySubmissionQueue_tblTestAttempts_AttemptId] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondarySubmissionQueue_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondarySubmissionQueue]'))
ALTER TABLE [RPT].[tblSecondarySubmissionQueue] CHECK CONSTRAINT [FK_tblSecondarySubmissionQueue_tblTestAttempts_AttemptId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondaryVideoJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSON]'))
ALTER TABLE [RPT].[tblSecondaryVideoJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblSecondaryVideoJSON_tblTestAttempts_AttemptId] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondaryVideoJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSON]'))
ALTER TABLE [RPT].[tblSecondaryVideoJSON] CHECK CONSTRAINT [FK_tblSecondaryVideoJSON_tblTestAttempts_AttemptId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondaryVideoJSONHistory_tblAuditSummary_AuditSummaryID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSONHistory]'))
ALTER TABLE [RPT].[tblSecondaryVideoJSONHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblSecondaryVideoJSONHistory_tblAuditSummary_AuditSummaryID] FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondaryVideoJSONHistory_tblAuditSummary_AuditSummaryID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSONHistory]'))
ALTER TABLE [RPT].[tblSecondaryVideoJSONHistory] CHECK CONSTRAINT [FK_tblSecondaryVideoJSONHistory_tblAuditSummary_AuditSummaryID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblStudentScheduleDetails_tblProctorAvail]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblStudentScheduleDetails]'))
ALTER TABLE [RPT].[tblStudentScheduleDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentScheduleDetails_tblProctorAvail] FOREIGN KEY([ProctorAvailID])
REFERENCES [RPT].[tblProctorAvail] ([ProctorAvailId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblStudentScheduleDetails_tblProctorAvail]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblStudentScheduleDetails]'))
ALTER TABLE [RPT].[tblStudentScheduleDetails] CHECK CONSTRAINT [FK_tblStudentScheduleDetails_tblProctorAvail]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSubmissionQueue_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSubmissionQueue]'))
ALTER TABLE [RPT].[tblSubmissionQueue]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmissionQueue_tblTestAttempts_AttemptId] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSubmissionQueue_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSubmissionQueue]'))
ALTER TABLE [RPT].[tblSubmissionQueue] CHECK CONSTRAINT [FK_tblSubmissionQueue_tblTestAttempts_AttemptId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblTestDetails_TestDetailsId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]'))
ALTER TABLE [RPT].[tblTestAssignment]  WITH CHECK ADD  CONSTRAINT [FK_tblTestAssignment_tblTestDetails_TestDetailsId] FOREIGN KEY([TestDetailId])
REFERENCES [RPT].[tblTestDetails] ([TestDetailId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblTestDetails_TestDetailsId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]'))
ALTER TABLE [RPT].[tblTestAssignment] CHECK CONSTRAINT [FK_tblTestAssignment_tblTestDetails_TestDetailsId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblUsers_TestGUID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]'))
ALTER TABLE [RPT].[tblTestAssignment]  WITH CHECK ADD  CONSTRAINT [FK_tblTestAssignment_tblUsers_TestGUID] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblUsers_TestGUID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]'))
ALTER TABLE [RPT].[tblTestAssignment] CHECK CONSTRAINT [FK_tblTestAssignment_tblUsers_TestGUID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAttempts_tblTestDetails_TestDetailsId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAttempts]'))
ALTER TABLE [RPT].[tblTestAttempts]  WITH CHECK ADD  CONSTRAINT [FK_tblTestAttempts_tblTestDetails_TestDetailsId] FOREIGN KEY([TestDetailsId])
REFERENCES [RPT].[tblTestDetails] ([TestDetailId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAttempts_tblTestDetails_TestDetailsId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAttempts]'))
ALTER TABLE [RPT].[tblTestAttempts] CHECK CONSTRAINT [FK_tblTestAttempts_tblTestDetails_TestDetailsId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestDetails_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestDetails]'))
ALTER TABLE [RPT].[tblTestDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblTestDetails_tblOrganisation_OrganisationId] FOREIGN KEY([OrganisationId])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestDetails_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestDetails]'))
ALTER TABLE [RPT].[tblTestDetails] CHECK CONSTRAINT [FK_tblTestDetails_tblOrganisation_OrganisationId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestDetails_tblTestNameInformation_TestNameInformationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestDetails]'))
ALTER TABLE [RPT].[tblTestDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblTestDetails_tblTestNameInformation_TestNameInformationId] FOREIGN KEY([TestNameInformationId])
REFERENCES [RPT].[tblTestNameInformation] ([TestNameInformationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestDetails_tblTestNameInformation_TestNameInformationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestDetails]'))
ALTER TABLE [RPT].[tblTestDetails] CHECK CONSTRAINT [FK_tblTestDetails_tblTestNameInformation_TestNameInformationId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestNameInformation_tblOrganisation]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestNameInformation]'))
ALTER TABLE [RPT].[tblTestNameInformation]  WITH CHECK ADD  CONSTRAINT [FK_tblTestNameInformation_tblOrganisation] FOREIGN KEY([OrganisationID])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestNameInformation_tblOrganisation]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestNameInformation]'))
ALTER TABLE [RPT].[tblTestNameInformation] CHECK CONSTRAINT [FK_tblTestNameInformation_tblOrganisation]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserImages_TblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserImages]'))
ALTER TABLE [RPT].[tblUserImages]  WITH CHECK ADD  CONSTRAINT [FK_tblUserImages_TblUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserImages_TblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserImages]'))
ALTER TABLE [RPT].[tblUserImages] CHECK CONSTRAINT [FK_tblUserImages_TblUsers_UserId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserPersonalizedSettings_tblSettingKeys_SettingKeyID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]'))
ALTER TABLE [RPT].[tblUserPersonalizedSettings]  WITH CHECK ADD  CONSTRAINT [FK_tblUserPersonalizedSettings_tblSettingKeys_SettingKeyID] FOREIGN KEY([SettingKeyID])
REFERENCES [RPT].[tblSettingKeys] ([SettingKeyID])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserPersonalizedSettings_tblSettingKeys_SettingKeyID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]'))
ALTER TABLE [RPT].[tblUserPersonalizedSettings] CHECK CONSTRAINT [FK_tblUserPersonalizedSettings_tblSettingKeys_SettingKeyID]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserPersonalizedSettings_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]'))
ALTER TABLE [RPT].[tblUserPersonalizedSettings]  WITH CHECK ADD  CONSTRAINT [FK_tblUserPersonalizedSettings_tblUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserPersonalizedSettings_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]'))
ALTER TABLE [RPT].[tblUserPersonalizedSettings] CHECK CONSTRAINT [FK_tblUserPersonalizedSettings_tblUsers_UserId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUsers_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUsers]'))
ALTER TABLE [RPT].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblOrganisation_OrganisationId] FOREIGN KEY([OrganisationId])
REFERENCES [RPT].[tblOrganisation] ([OrganisationId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUsers_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUsers]'))
ALTER TABLE [RPT].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblOrganisation_OrganisationId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUsers_tblRole_RoleId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUsers]'))
ALTER TABLE [RPT].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [RPT].[tblRole] ([RoleId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUsers_tblRole_RoleId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUsers]'))
ALTER TABLE [RPT].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRole_RoleId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblVideoJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblVideoJSON]'))
ALTER TABLE [RPT].[tblVideoJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblVideoJSON_tblTestAttempts_AttemptId] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblVideoJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblVideoJSON]'))
ALTER TABLE [RPT].[tblVideoJSON] CHECK CONSTRAINT [FK_tblVideoJSON_tblTestAttempts_AttemptId]

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblVideoJ__Audit__5F141958]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblVideoJSONHistory]'))
ALTER TABLE [RPT].[tblVideoJSONHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'DatabaseLogID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identity column' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'DatabaseLogID'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'PostTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time when Alter/ Drop/ Create happened' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'PostTime'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'Event'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Alter/ Drop/ Create' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'Event'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'ObjectName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Object Name Which t Affected By Alter/ Drop/ Create' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'ObjectName'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'TSQL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The actual code which was there before Alter/ Drop/ Create' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'TSQL'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'SystemOwner'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'System details from where Alter/ Drop/ Create' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'SystemOwner'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'DatabaseLog', N'COLUMN',N'Server'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Server of database Alter/ Drop/ Create' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DatabaseLog', @level2type=N'COLUMN',@level2name=N'Server'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SPErrorLog', N'COLUMN',N'ErrorLine'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line in which error occured' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SPErrorLog', @level2type=N'COLUMN',@level2name=N'ErrorLine'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SPErrorLog', N'COLUMN',N'ErrorMessage'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Error Message' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SPErrorLog', @level2type=N'COLUMN',@level2name=N'ErrorMessage'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'SPErrorLog', N'COLUMN',N'PostTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time when Alter/ Drop/ Create happened' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SPErrorLog', @level2type=N'COLUMN',@level2name=N'PostTime'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblApplicationSettings', N'COLUMN',N'IsDelete'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsDeleted 0 = Not Deleted, 1 = Deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblApplicationSettings', @level2type=N'COLUMN',@level2name=N'IsDelete'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblApplicationSettings', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblApplicationSettings', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblApplicationSettings', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblApplicationSettings', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblEvents', N'COLUMN',N'EventName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual name of the event' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblEvents', @level2type=N'COLUMN',@level2name=N'EventName'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblEvents', N'COLUMN',N'IsDeleted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsDeleted = 1 then deleted, IsDeleted = 0 then not deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblEvents', @level2type=N'COLUMN',@level2name=N'IsDeleted'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblEvents', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblEvents', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblEvents', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblEvents', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblManualReviewJSON', N'COLUMN',N'Status'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-pending,1-In Progress, 2-approved, 3-rejected' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblManualReviewJSON', @level2type=N'COLUMN',@level2name=N'Status'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblOrganisation', N'COLUMN',N'OrganisationURL'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default URL of organisation' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblOrganisation', @level2type=N'COLUMN',@level2name=N'OrganisationURL'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblOrganisation', N'COLUMN',N'IsDeleted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsDeleted = 1 then deleted, IsDeleted = 0 then not deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblOrganisation', @level2type=N'COLUMN',@level2name=N'IsDeleted'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblOrganisation', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblOrganisation', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblOrganisation', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblOrganisation', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblOrganisation', N'COLUMN',N'Mode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'License mode 0 – Full, 1- Lite' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblOrganisation', @level2type=N'COLUMN',@level2name=N'Mode'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblOrganisation', N'COLUMN',N'StorageConfiguration'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To store the file storage configuration JSON like IsS3, bucket name etc..' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblOrganisation', @level2type=N'COLUMN',@level2name=N'StorageConfiguration'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblPreferences', N'COLUMN',N'AssetId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An ID value to identify the preference for test name' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblPreferences', @level2type=N'COLUMN',@level2name=N'AssetId'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblPreferences', N'COLUMN',N'ScheduleId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1= Soft deleted, 0= Not soft deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblPreferences', @level2type=N'COLUMN',@level2name=N'ScheduleId'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblPreferences', N'COLUMN',N'Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblPreferences', @level2type=N'COLUMN',@level2name=N'Type'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblProctorOnlineReview', N'COLUMN',N'ReviewStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-In-progress, 2-Hold, 3-Waiting,4-Rejected,5-Approved' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblProctorOnlineReview', @level2type=N'COLUMN',@level2name=N'ReviewStatus'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblRole', N'COLUMN',N'RoleName'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual name of the role' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblRole', @level2type=N'COLUMN',@level2name=N'RoleName'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblRole', N'COLUMN',N'IsDeleted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsDeleted = 1 then deleted, IsDeleted = 0 then not deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblRole', @level2type=N'COLUMN',@level2name=N'IsDeleted'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblRole', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblRole', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblRole', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblRole', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAssignment', N'COLUMN',N'IsAssigned'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsAssigned 1 = Assignaed 0 = Not Assignaed' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAssignment', @level2type=N'COLUMN',@level2name=N'IsAssigned'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAssignment', N'COLUMN',N'IsForwarded'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsForwarded 0 = Not Forwarded 1 = Forwarded' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAssignment', @level2type=N'COLUMN',@level2name=N'IsForwarded'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAssignment', N'COLUMN',N'ReviewStatus'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ReviewStatus NULL = Not Reviewed, 1 = Approve or Completed, 0 = Rejected' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAssignment', @level2type=N'COLUMN',@level2name=N'ReviewStatus'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAssignment', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAssignment', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAssignment', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAssignment', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAssignment', N'COLUMN',N'ForwardCount'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How many times the video has Forwarded' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAssignment', @level2type=N'COLUMN',@level2name=N'ForwardCount'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'TestDetailsId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Refers Test details table' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'TestDetailsId'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'StartDateTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To store test start date and time' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'StartDateTime'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'EndDateTime'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To store test end date and time' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'EndDateTime'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'LicenseMode'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = full and 1= lite' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'LicenseMode'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'FileCount'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To store the file count:
1 = Full license
Total number photos = Lite license' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'FileCount'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'PhotoCapturedInterval'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Full and Interval value = lite' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'PhotoCapturedInterval'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestAttempts', N'COLUMN',N'AttemptSeverity'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To store severity level. 0 = Low, 1=Medium and 2= High' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestAttempts', @level2type=N'COLUMN',@level2name=N'AttemptSeverity'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'PartnerIntegrationID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PartnerIntegrationID is Student Test InstanceId LMS Id from Saras T And A Application' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'PartnerIntegrationID'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'TestGUID'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Translation of Student Test Instance Id as a GUID' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'TestGUID'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'TestNameInformationId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referes TestNameInformation.
This field value is filled when “Synctest” service executed and Test name  inserted in the TestNameInformation table.
' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'TestNameInformationId'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'IsSubmitted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=pending,1=submitted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'IsSubmitted'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblTestDetails', N'COLUMN',N'Severity'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Low,2=medium,3=high' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblTestDetails', @level2type=N'COLUMN',@level2name=N'Severity'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUserPersonalizedSettings', N'COLUMN',N'IsDelete'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsDeleted 0 = Not Deleted, 1 = Deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUserPersonalizedSettings', @level2type=N'COLUMN',@level2name=N'IsDelete'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUserPersonalizedSettings', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUserPersonalizedSettings', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUserPersonalizedSettings', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUserPersonalizedSettings', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUsers', N'COLUMN',N'RoleId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RoleId from tblRole' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUsers', @level2type=N'COLUMN',@level2name=N'RoleId'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUsers', N'COLUMN',N'IsEnabled'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsEnabled 0 = Not Enabled, 1 = Enabled' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUsers', @level2type=N'COLUMN',@level2name=N'IsEnabled'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUsers', N'COLUMN',N'IsDeleted'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IsDeleted 0 = Not Deleted, 1 = Deleted' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUsers', @level2type=N'COLUMN',@level2name=N'IsDeleted'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUsers', N'COLUMN',N'CreatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreatedDate Row inserted date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUsers', @level2type=N'COLUMN',@level2name=N'CreatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUsers', N'COLUMN',N'UpdatedDate'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UpdatedDate Row Updated date' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUsers', @level2type=N'COLUMN',@level2name=N'UpdatedDate'

IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'RPT', N'TABLE',N'tblUsers', N'COLUMN',N'UserTimeZoneId'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'To store timezone information of the user' , @level0type=N'SCHEMA',@level0name=N'RPT', @level1type=N'TABLE',@level1name=N'tblUsers', @level2type=N'COLUMN',@level2name=N'UserTimeZoneId'



--26-07-2022

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSystemConfigurationMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSystemConfigurationMaster](
	[ConfigurationID] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfigurationName] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
 
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSystemConfigurationMaster_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblSystemConfigurationMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSystemConfigurationMaster] ADD  CONSTRAINT [DF_tblSystemConfigurationMaster_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSystemConfigurationMaster_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblSystemConfigurationMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSystemConfigurationMaster] ADD  CONSTRAINT [DF_tblSystemConfigurationMaster_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSystemConfigurationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblSystemConfigurationType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfigurationID] [bigint] NULL,
	[ConfigurationTypeName] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSystemConfigurationType_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblSystemConfigurationType' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSystemConfigurationType] ADD  CONSTRAINT [DF_tblSystemConfigurationType_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSystemConfigurationType_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblSystemConfigurationType' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSystemConfigurationType] ADD  CONSTRAINT [DF_tblSystemConfigurationType_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblOrganisationConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblOrganisationConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [bigint] NULL,
	[SecureBrowserTypeID] [int] NULL,
	[RoomVideoTypeID] [int] NULL,
	[PhotoComparisonTypeID] [int] NULL,
	[UserAgreement] [nvarchar](max) NULL,
	[TestPlayerUrl] [nvarchar](max) NULL,
	[ComparionForStudent] [bit] NULL,
	[StorageType] [int] NULL,
	[Analysis] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsSecuredBrowser] [bit] NULL,
	[IsRoomVideoRequired] [bit] NULL,
	[ComparisonForProctor] [bit] NULL,
	[FMMCountRequired] [bit] NULL,
	[HMMCountRequired] [bit] NULL,
	[SingleSignOnURL] [nvarchar](max) NULL,
	[BucketName] [nvarchar](200) NULL,
	[IsSecondaryCameraRequired] [bit] NULL,
	[IsLiveModeRequired] [bit] NULL,
	[IsImageModeRequired] [bit] NULL,
	[IsReviewerModeRequired] [bit] NULL,
	[IsAudioAnalysisRequired] [bit] NULL,
	[IsFMMCountRequired] [bit] NULL,
	[IsCorrectFlag] [bit] NULL,
	[IsVideoAnalysisfrequency] [int] NULL,
	[IsFMMfrequency] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_ComparionForStudent' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_ComparionForStudent]  DEFAULT ((0)) FOR [ComparionForStudent]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsSecuredBrowser' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD CONSTRAINT DF_tblOrganisationConfiguration_IsSecuredBrowser  DEFAULT ((0)) FOR [IsSecuredBrowser]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsRoomVideoRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD CONSTRAINT DF_tblOrganisationConfiguration_IsRoomVideoRequired DEFAULT ((0)) FOR [IsRoomVideoRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_ComparisonForProctor' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD CONSTRAINT DF_tblOrganisationConfiguration_ComparisonForProctor  DEFAULT ((0)) FOR [ComparisonForProctor]
END
 
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_FMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD CONSTRAINT DF_tblOrganisationConfiguration_FMMCountRequired DEFAULT ((0)) FOR [FMMCountRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_HMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD CONSTRAINT DF_tblOrganisationConfiguration_HMMCountRequired DEFAULT ((0)) FOR [HMMCountRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsSecondaryCameraRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD CONSTRAINT DF_tblOrganisationConfiguration_IsSecondaryCameraRequired DEFAULT ((0)) FOR [IsSecondaryCameraRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsLiveModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_IsLiveModeRequired]  DEFAULT ((0)) FOR [IsLiveModeRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsImageModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_IsImageModeRequired]  DEFAULT ((0)) FOR [IsImageModeRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsReviewerModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_IsReviewerModeRequired]  DEFAULT ((0)) FOR [IsReviewerModeRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsAudioAnalysisRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_IsAudioAnalysisRequired]  DEFAULT ((0)) FOR [IsAudioAnalysisRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsFMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_IsFMMCountRequired]  DEFAULT ((0)) FOR [IsFMMCountRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_IsCorrectFlag' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblOrganisationConfiguration] ADD  CONSTRAINT [DF_tblOrganisationConfiguration_IsCorrectFlag]  DEFAULT ((0)) FOR [IsCorrectFlag]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblImageTestConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblImageTestConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [bigint] NULL,
	[IsSecureBrowser] [bit] NULL,
	[ThresholdFrequency] [int] NULL,
	[ImageModeAnalysis] [int] NULL,
	[ConfigurationSystemtype] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsCorrectFlag] [bit] NULL,
	[IsRoomVideoRequired] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_IsSecureBrowser' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT [DF_tblImageTestConfiguration_IsSecureBrowser]  DEFAULT ((0)) FOR [IsSecureBrowser]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT [DF_tblImageTestConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT [DF_tblImageTestConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_IsCorrectFlag' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT DF_tblImageTestConfiguration_IsCorrectFlag DEFAULT ((0)) FOR [IsCorrectFlag]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_IsRoomVideoRequired' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT DF_tblImageTestConfiguration_IsRoomVideoRequired  DEFAULT ((0)) FOR [IsRoomVideoRequired]
END




IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblLiveTestConfiguration]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblLiveTestConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [bigint] NULL,
	[proctoringTypeID] [bigint] NULL,
	[StreamingType] [int] NULL,
	[IsAudioFeatureRequired] [bit] NULL,
	[IsChatFeatureRequired] [bit] NULL,
	[IsFaceMismatchCountRequired] [bit] NULL,
	[ConfigurationSystemtype] [int] NULL,
	[IsHeadShotRequired] [bit] NULL,
	[HeadShotComparisonTime] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsRoomVideoRequired] [bit] NULL,
	[RecordingType] [int] NULL,
	[IsAutoProctorTagging] [bit] NULL,
	[IsAudioCallingRequired] [bit] NULL,
	[IsScreenRecordingRequired] [bit] NULL,
	[IsSCAnalysisRequired] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsAudioFeatureRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsAudioFeatureRequired]  DEFAULT ((0)) FOR [IsAudioFeatureRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsChatFeatureRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsChatFeatureRequired]  DEFAULT ((0)) FOR [IsChatFeatureRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsFaceMismatchCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsFaceMismatchCountRequired]  DEFAULT ((0)) FOR [IsFaceMismatchCountRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsHeadShotRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsHeadShotRequired]  DEFAULT ((0)) FOR [IsHeadShotRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsRoomVideoRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD CONSTRAINT DF_tblLiveTestConfiguration_IsRoomVideoRequired  DEFAULT ((0)) FOR [IsRoomVideoRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsRoomVideoRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD CONSTRAINT DF_tblLiveTestConfiguration_IsAutoProctorTagging  DEFAULT ((0)) FOR [IsAutoProctorTagging]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsAudioCallingRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsAudioCallingRequired]  DEFAULT ((0)) FOR [IsAudioCallingRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsScreenRecordingRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsScreenRecordingRequired]  DEFAULT ((0)) FOR [IsScreenRecordingRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblLiveTestConfiguration_IsSCAnalysisRequired' AND OBJECT_NAME(Parent_Object_Id)='tblLiveTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblLiveTestConfiguration] ADD  CONSTRAINT [DF_tblLiveTestConfiguration_IsSCAnalysisRequired]  DEFAULT ((0)) FOR [IsSCAnalysisRequired]
END



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSecondaryCameraConfiguration]') AND type in (N'U'))
BEGIN 
CREATE TABLE [RPT].[tblSecondaryCameraConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[StreamingType] [int] NULL,
	[FMSDuration] [int] NULL,
	[IsAudioAnalysis] [bit] NULL,
	[RecordingType] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsCorrectFlag] [bit] NULL,
	[IsRoomVideoRequired] [bit] NULL,
	[ConfigurationSystemtype] [int] NULL,
	[Organizationid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryCameraConfiguration_IsAudioAnalysis' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryCameraConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryCameraConfiguration] ADD  CONSTRAINT [DF_tblSecondaryCameraConfiguration_IsAudioAnalysis]  DEFAULT ((0)) FOR [IsAudioAnalysis]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryCameraConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryCameraConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryCameraConfiguration] ADD  CONSTRAINT [DF_tblSecondaryCameraConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryCameraConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryCameraConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryCameraConfiguration] ADD  CONSTRAINT [DF_tblSecondaryCameraConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryCameraConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryCameraConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryCameraConfiguration] ADD  CONSTRAINT F_tblSecondaryCameraConfiguration_IsCorrectFlag  DEFAULT ((0)) FOR [IsCorrectFlag]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryCameraConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryCameraConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryCameraConfiguration] ADD CONSTRAINT DF_tblSecondaryCameraConfiguration_IsRoomVideoRequired DEFAULT ((0)) FOR [IsRoomVideoRequired]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryMaster]') AND type in (N'U'))
BEGIN 
CREATE TABLE [dbo].[CountryMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IPFrom] [nvarchar](30) NULL,
	[IPTo] [nvarchar](30) NULL,
	[CountryISOCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_CountryMaster1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_CountryMaster1_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='CountryMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[CountryMaster] ADD  CONSTRAINT [DF_CountryMaster1_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[tblSecondaryManualReviewJSON]') AND type in (N'U'))
BEGIN 
CREATE TABLE [RPT].[tblSecondaryManualReviewJSON](
	[ManualReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[AssignmentId] [bigint] NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblSecondaryManualReviewJSON] PRIMARY KEY CLUSTERED 
(
	[ManualReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryManualReviewJSON_Status' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryManualReviewJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryManualReviewJSON] ADD  CONSTRAINT [DF_tblSecondaryManualReviewJSON_Status]  DEFAULT ((0)) FOR [Status]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryManualReviewJSON_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryManualReviewJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryManualReviewJSON] ADD  CONSTRAINT [DF_tblSecondaryManualReviewJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSecondaryManualReviewJSON_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryManualReviewJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryManualReviewJSON] ADD CONSTRAINT DF_tblSecondaryManualReviewJSON_IsDeleted DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_tblSecondaryManualReviewJSON_tblTestAssignment_AssignmentId'AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryManualReviewJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryManualReviewJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblSecondaryManualReviewJSON_tblTestAssignment_AssignmentId] FOREIGN KEY([AssignmentId])
REFERENCES [RPT].[tblTestAssignment] ([AssignmentId])
END

ALTER TABLE [RPT].[tblSecondaryManualReviewJSON] CHECK CONSTRAINT [FK_tblSecondaryManualReviewJSON_tblTestAssignment_AssignmentId]
 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_tblSecondaryManualReviewJSON_tblTestAttempts_AttemptId'AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryManualReviewJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryManualReviewJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblSecondaryManualReviewJSON_tblTestAttempts_AttemptId] FOREIGN KEY([AttemptId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])
END

ALTER TABLE [RPT].[tblSecondaryManualReviewJSON] CHECK CONSTRAINT [FK_tblSecondaryManualReviewJSON_tblTestAttempts_AttemptId]


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_tblSecondaryManualReviewJSON_tblUsers_UserId'AND OBJECT_NAME(Parent_Object_Id)='tblSecondaryManualReviewJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblSecondaryManualReviewJSON]  WITH CHECK ADD  CONSTRAINT [FK_tblSecondaryManualReviewJSON_tblUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])
END

ALTER TABLE [RPT].[tblSecondaryManualReviewJSON] CHECK CONSTRAINT [FK_tblSecondaryManualReviewJSON_tblUsers_UserId]


 





--08-08-2022


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'CountryId')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD CountryId BIGINT
END



IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'CreatedBy')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD CreatedBy BIGINT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'ContactNo')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD ContactNo NVARCHAR(50)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'EmailId')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD EmailId NVARCHAR(200)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'LastName')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD LastName NVARCHAR(200)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'FirstName')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD FirstName NVARCHAR(200)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblusers' AND [COLUMN_NAME] = 'CountryID')
BEGIN
ALTER  TABLE RPT.tblusers  ADD CountryID BIGINT
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblorganisation' AND [COLUMN_NAME] = 'EndDate')
BEGIN
ALTER  TABLE RPT.tblorganisation  ADD EndDate DATETIME
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblorganisation' AND [COLUMN_NAME] = 'StartDate')
BEGIN
ALTER  TABLE RPT.tblorganisation  ADD StartDate DATETIME
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblorganisation' AND [COLUMN_NAME] = 'LicenseType')
BEGIN
ALTER  TABLE RPT.tblorganisation  ADD LicenseType BIGINT
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblorganisation' AND [COLUMN_NAME] = 'CountryID')
BEGIN
ALTER  TABLE RPT.tblorganisation  ADD CountryID BIGINT
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'ImagePath')
BEGIN
ALTER  TABLE RPT.tblCustomers  ADD ImagePath NVARCHAR(MAX)
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblorganisation' AND [COLUMN_NAME] = 'ImagePath')
BEGIN
ALTER  TABLE RPT.tblorganisation  ADD ImagePath NVARCHAR(MAX)
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblOrganisation' AND [COLUMN_NAME] = 'FileName')
BEGIN
ALTER TABLE RPT.tblOrganisation  ADD FileName NVARCHAR(200)
END

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestConfiguration' AND TABLE_SCHEMA='RPT')
BEGIN 
CREATE TABLE [RPT].[tblTestConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[SecureBrowserTypeID] [int] NULL,
	[PhotoComparisonTypeID] [int] NULL,
	[ComparionForStudent] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsSecuredBrowser] [bit] NULL,
	[ComparisonForProctor] [bit] NULL,
	[FMMCountRequired] [bit] NULL,
	[HMMCountRequired] [bit] NULL,
	[IsLiveModeRequired] [bit] NULL,
	[IsImageModeRequired] [bit] NULL,
	[IsReviewerModeRequired] [bit] NULL,
	[IsAudioAnalysisRequired] [bit] NULL,
	[IsCorrectFlag] [bit] NULL,
	[IsSecondaryCameraRequired] [bit] NULL,
	[TimeInterval] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_ComparionForStudent' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_ComparionForStudent]  DEFAULT ((0)) FOR [ComparionForStudent]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsSecuredBrowser' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsSecuredBrowser] DEFAULT ((0)) FOR [IsSecuredBrowser]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_ComparisonForProctor' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT [DF_tblTestConfiguration_ComparisonForProctor]  DEFAULT ((0)) FOR [ComparisonForProctor]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_FMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_FMMCountRequired] DEFAULT ((0)) FOR [FMMCountRequired]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_HMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_HMMCountRequired] DEFAULT ((0)) FOR [HMMCountRequired]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsLiveModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsLiveModeRequired]  DEFAULT ((0)) FOR [IsLiveModeRequired]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsImageModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsImageModeRequired]  DEFAULT ((0)) FOR [IsImageModeRequired]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsReviewerModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsReviewerModeRequired]  DEFAULT ((0)) FOR [IsReviewerModeRequired]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsAudioAnalysisRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsAudioAnalysisRequired]  DEFAULT ((0)) FOR [IsAudioAnalysisRequired]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsCorrectFlag' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsCorrectFlag]  DEFAULT ((0)) FOR [IsCorrectFlag]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsSecondaryCameraRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT [DF_tblTestConfiguration_IsSecondaryCameraRequired]  DEFAULT ((0)) FOR [IsSecondaryCameraRequired]
END



--09-09-2022
IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblImageTestConfiguration' AND [COLUMN_NAME] = 'ImageTimeInterval')
BEGIN
	ALTER TABLE RPT.tblImageTestConfiguration  ADD ImageTimeInterval BIT

 END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_ImageTimeInterval' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].tblImageTestConfiguration ADD  CONSTRAINT [DF_tblImageTestConfiguration_ImageTimeInterval]  DEFAULT ((0)) FOR [ImageTimeInterval]


END



--22-09-2022



 
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'tblTestImageModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) =  N'RPT')
BEGIN
CREATE TABLE [RPT].[tblTestImageModeConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[ImageModeAnalysis] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[OrganisationID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestImageModeConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblTestImageModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestImageModeConfiguration] ADD  CONSTRAINT [DF_tblTestImageModeConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestImageModeConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblTestImageModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestImageModeConfiguration] ADD  CONSTRAINT [DF_tblTestImageModeConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

 
 
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'tblTestSCConfiguration' AND SCHEMA_NAME(SCHEMA_ID) =  N'RPT')
BEGIN
CREATE TABLE [RPT].[tblTestSCConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[StreamingType] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[OrganisationID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestSCConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblTestSCConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestSCConfiguration] ADD  CONSTRAINT [DF_tblTestSCConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestSCConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblTestSCConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestSCConfiguration] ADD  CONSTRAINT [DF_tblTestSCConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

 
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'tblTestLiveModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) =  N'RPT')
BEGIN
 CREATE TABLE [RPT].[tblTestLiveModeConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[proctoringTypeID] [bigint] NULL,
	[IsChatFeatureRequired] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[RecordingType] [int] NULL,
	[IsScreenRecordingRequired] [bit] NULL,
	[IsSCAnalysisRequired] [bit] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[OrganisationID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestLiveModeConfiguration_IsChatFeatureRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestLiveModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestLiveModeConfiguration] ADD  CONSTRAINT [DF_tblTestLiveModeConfiguration_IsChatFeatureRequired]  DEFAULT ((0)) FOR [IsChatFeatureRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestLiveModeConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblTestLiveModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestLiveModeConfiguration] ADD  CONSTRAINT [DF_tblTestLiveModeConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestLiveModeConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblTestLiveModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestLiveModeConfiguration] ADD  CONSTRAINT [DF_tblTestLiveModeConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END 


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestLiveModeConfiguration_IsScreenRecordingRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestLiveModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestLiveModeConfiguration] ADD  CONSTRAINT [DF_tblTestLiveModeConfiguration_IsScreenRecordingRequired]  DEFAULT ((0)) FOR [IsScreenRecordingRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestLiveModeConfiguration_IsSCAnalysisRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestLiveModeConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestLiveModeConfiguration] ADD  CONSTRAINT [DF_tblTestLiveModeConfiguration_IsSCAnalysisRequired]  DEFAULT ((0)) FOR [IsSCAnalysisRequired]
END

 
 
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) =  N'RPT')
BEGIN
CREATE TABLE [RPT].[tblTestConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [bigint] NULL,
	[SecureBrowserTypeID] [int] NULL,
	[PhotoComparisonTypeID] [int] NULL,
	[ComparionForStudent] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsSecuredBrowser] [bit] NULL,
	[ComparisonForProctor] [bit] NULL,
	[FMMCountRequired] [bit] NULL,
	[HMMCountRequired] [bit] NULL,
	[IsLiveModeRequired] [bit] NULL,
	[IsImageModeRequired] [bit] NULL,
	[IsReviewerModeRequired] [bit] NULL,
	[IsAudioAnalysisRequired] [bit] NULL,
	[IsCorrectFlag] [bit] NULL,
	[IsSecondaryCameraRequired] [bit] NULL,
	[TimeInterval] [int] NULL,
	[ScheduleDetailID] [bigint] NULL,
	[OrganisationID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_ComparionForStudent' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_ComparionForStudent]  DEFAULT ((0)) FOR [ComparionForStudent]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsSecuredBrowser' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT DF_tblTestConfiguration_IsSecuredBrowser DEFAULT ((0)) FOR [IsSecuredBrowser]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_ComparisonForProctor' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT DF_tblTestConfiguration_ComparisonForProctor DEFAULT ((0)) FOR [ComparisonForProctor]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_FMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT DF_tblTestConfiguration_FMMCountRequired DEFAULT ((0)) FOR [FMMCountRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_HMMCountRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT DF_tblTestConfiguration_HMMCountRequired DEFAULT ((0)) FOR [HMMCountRequired]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsLiveModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsLiveModeRequired]  DEFAULT ((0)) FOR [IsLiveModeRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsImageModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsImageModeRequired]  DEFAULT ((0)) FOR [IsImageModeRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsReviewerModeRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsReviewerModeRequired]  DEFAULT ((0)) FOR [IsReviewerModeRequired]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsAudioAnalysisRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsAudioAnalysisRequired]  DEFAULT ((0)) FOR [IsAudioAnalysisRequired]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsCorrectFlag' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD  CONSTRAINT [DF_tblTestConfiguration_IsCorrectFlag]  DEFAULT ((0)) FOR [IsCorrectFlag]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestConfiguration_IsSecondaryCameraRequired' AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblTestConfiguration] ADD CONSTRAINT [DF_tblTestConfiguration_IsSecondaryCameraRequired]  DEFAULT ((0)) FOR [IsSecondaryCameraRequired]
END


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) =  N'RPT')
BEGIN 
CREATE TABLE [RPT].[tblImageTestConfiguration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrganisationID] [bigint] NULL,
	[IsSecureBrowser] [bit] NULL,
	[ThresholdFrequency] [int] NULL,
	[ImageModeAnalysis] [int] NULL,
	[ConfigurationSystemtype] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[IsCorrectFlag] [bit] NULL,
	[IsRoomVideoRequired] [bit] NULL,
	[ImageTimeInterval] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_IsSecureBrowser' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT [DF_tblImageTestConfiguration_IsSecureBrowser]  DEFAULT ((0)) FOR [IsSecureBrowser]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT [DF_tblImageTestConfiguration_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD  CONSTRAINT [DF_tblImageTestConfiguration_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_IsCorrectFlag' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD CONSTRAINT DF_tblImageTestConfiguration_IsCorrectFlag DEFAULT ((0)) FOR [IsCorrectFlag]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_IsRoomVideoRequired' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblImageTestConfiguration] ADD CONSTRAINT DF_tblImageTestConfiguration_IsRoomVideoRequired DEFAULT ((0)) FOR [IsRoomVideoRequired]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblSubmissionQueue' AND [COLUMN_NAME] = 'IsArchived')
BEGIN
ALTER TABLE RPT.tblSubmissionQueue  ADD IsArchived BIT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'StudentScheduleDetail' AND [COLUMN_NAME] = 'IsArchived')
BEGIN
ALTER TABLE RPT.StudentScheduleDetail  ADD IsArchived BIT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblProctorOnlineReview' AND [COLUMN_NAME] = 'IsArchived')
BEGIN
ALTER TABLE RPT.tblProctorOnlineReview  ADD IsArchived BIT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPP' AND
    [TABLE_NAME] = 'SummaryAssessmentScheduleDetails' AND [COLUMN_NAME] = 'IsArchived')
BEGIN
ALTER TABLE RPP.SummaryAssessmentScheduleDetails  ADD IsArchived BIT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPP' AND
    [TABLE_NAME] = 'SummaryScheduleDetails' AND [COLUMN_NAME] = 'IsArchived')
BEGIN
ALTER TABLE RPP.SummaryScheduleDetails  ADD IsArchived BIT
END





IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSubmissionQueue_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tblSubmissionQueue' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblSubmissionQueue ADD CONSTRAINT DF_tblSubmissionQueue_IsArchived DEFAULT(0) FOR IsArchived
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StudentScheduleDetail_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='StudentScheduleDetail' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.StudentScheduleDetail ADD CONSTRAINT DF_StudentScheduleDetail_IsArchived DEFAULT(0) FOR IsArchived
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblProctorOnlineReview_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReview' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblProctorOnlineReview ADD CONSTRAINT DF_tblProctorOnlineReview_IsArchived DEFAULT(0) FOR IsArchived
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SummaryAssessmentScheduleDetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='SummaryAssessmentScheduleDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')
BEGIN
ALTER TABLE RPP.SummaryAssessmentScheduleDetails ADD CONSTRAINT DF_SummaryAssessmentScheduleDetails_IsArchived DEFAULT(0) FOR IsArchived
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SummaryScheduleDetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='SummaryScheduleDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')
BEGIN
ALTER TABLE RPP.SummaryScheduleDetails ADD CONSTRAINT DF_SummaryScheduleDetails_IsArchived DEFAULT(0) FOR IsArchived
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblTestAttempts' AND [COLUMN_NAME] = 'IsTestStopped')
BEGIN
ALTER TABLE RPT.tblTestAttempts  ADD IsTestStopped BIT
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempt_IsTestStopped' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblTestAttempts ADD  CONSTRAINT [DF_tblTestAttempt_IsTestStopped]  DEFAULT ((0)) FOR IsTestStopped
END
 
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'DbBuildVersions' AND SCHEMA_NAME(SCHEMA_ID) =  N'dbo')
BEGIN
CREATE TABLE [dbo].[DbBuildVersions](
	[VersionID] [bigint] IDENTITY(1,1) NOT NULL,
	[VersionNumber] [nvarchar](50) NOT NULL,
	[IsApplied] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateTimeStamp] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_DbBuildVersions] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


--07-10-2022
IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblOrganisation' AND [COLUMN_NAME] = 'CustomerName')
BEGIN
ALTER TABLE RPT.tblOrganisation  ADD CustomerName NVARCHAR(200)
END



IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblCustomers' AND [COLUMN_NAME] = 'ISCustomerEnabled')
BEGIN
ALTER TABLE RPT.tblCustomers  ADD ISCustomerEnabled BIT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblCustomers_ISCustomerEnabled' AND OBJECT_NAME(Parent_Object_Id)='tblCustomers' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblCustomers ADD  CONSTRAINT [DF_tblCustomers_ISCustomerEnabled]  DEFAULT ((0)) FOR ISCustomerEnabled
END
 

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblTestConfiguration' AND [COLUMN_NAME] = 'ScheduleDetailid')
BEGIN
ALTER TABLE RPT.tblTestConfiguration  ADD ScheduleDetailid BIGINT
END





--24-10-2022

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'videolength')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD videolength NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'videosize')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD videosize NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblUsers' AND [COLUMN_NAME] = 'IsLicenceAcceptance')
BEGIN
ALTER TABLE rpt.tblUsers  ADD IsLicenceAcceptance BIT 
END

--10-11-2022
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblUsers_IsLicenceAcceptance' AND OBJECT_NAME(Parent_Object_Id)='tblUsers' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_IsLicenceAcceptance]  DEFAULT ((0)) FOR [IsLicenceAcceptance]
END


IF NOT EXISTS ( SELECT  1 FROM    sys.schemas WHERE   name = N'Zoom' )
EXEC('CREATE SCHEMA Zoom')



IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'UserDetails' AND SCHEMA_NAME(SCHEMA_ID) =  N'Zoom')
BEGIN
	CREATE TABLE [Zoom].[UserDetails]
	(
		UserDetailsId BIGINT PRIMARY KEY IDENTITY(1,1) ,
		IntergrationUserId BIGINT,
		PartnerIntegrationId BIGINT,
		MacId NVARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		IPAddress NVARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CookieIDValue NVARCHAR(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		LastLoginDateTime DATETIME,
		Extension1 BIGINT NULL,
		Extension2 NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		Extension3 NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		RoleId  INT,
		CreatedDate DATETIME NOT NULL,
		CreatedBy BIGINT NULL,
		ModifiedDate DATETIME NULL,
		ModifiedBy BIGINT NULL,
		IsDeleted BIT NOT NULL
	)
END		

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='UserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.UserDetails ADD CONSTRAINT [DF_UserDetails_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserDetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='UserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.UserDetails ADD CONSTRAINT [DF_UserDetails_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END


--IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_UserDetails_RoleID'AND OBJECT_NAME(Parent_Object_Id)='UserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
--BEGIN
--ALTER TABLE Zoom.UserDetails WITH CHECK ADD CONSTRAINT [FK_UserDetails_RoleID] FOREIGN KEY([RoleID])          REFERENCES [RPT].[Tblrole] ([RoleID])
--END
--


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) =  N'Zoom')
BEGIN
	CREATE TABLE [Zoom].[SessionDetails]
	(
		SessionDetailsId BIGINT PRIMARY KEY IDENTITY(1,1),
		UserDetailsId BIGINT NOT NULL,
		SessionName NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS ,
		UserId  BIGINT,
		SessionId NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS ,
		SessionStartTime DATETIME,
		SessionEndTime DATETIME,
		Duration NVARCHAR(100)  COLLATE SQL_Latin1_General_CP1_CI_AS,
		UserCount INT,
		Has_voip BIT NOT NULL,
		Has_video BIT NOT NULL,
		Has_Screen_share BIT NOT NULL,
		Has_recording BIT NOT NULL,
		Has_pstn BIT NOT NULL,
		Session_key NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS,
		IsVideoDownloaded BIT NOT NULL,
		IsVideoDeletedInZoom BIT NOT NULL,
		Extension1 BIGINT NULL,
		Extension2 NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		Extension3 NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CreatedDate DATETIME NOT NULL,
		CreatedBy BIGINT NULL ,
		ModifiedDate DATETIME NULL,
		ModifiedBy BIGINT NULL,
		IsDeleted BIT NOT NULL
	)
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_SessionDetails_UserDetailsId'AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails WITH CHECK ADD CONSTRAINT [FK_SessionDetails_UserDetailsId] FOREIGN KEY([UserDetailsId])          REFERENCES [Zoom].[UserDetails] ([UserDetailsId])
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_Has_voip' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_Has_voip] DEFAULT (0) FOR [Has_voip]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_Has_video' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_Has_video] DEFAULT (0) FOR [Has_video]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_Has_Screen_share' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_Has_Screen_share] DEFAULT (0) FOR [Has_Screen_share]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_Has_recording' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_Has_recording] DEFAULT (0) FOR [Has_recording]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_Has_pstn' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_Has_pstn] DEFAULT (0) FOR [Has_pstn]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_IsVideoDownloaded' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_IsVideoDownloaded] DEFAULT (0) FOR [IsVideoDownloaded]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionDetails_IsVideoDeletedInZoom' AND OBJECT_NAME(Parent_Object_Id)='SessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails ADD CONSTRAINT [DF_SessionDetails_IsVideoDeletedInZoom] DEFAULT (0) FOR [IsVideoDeletedInZoom]
END



IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'ErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) =  N'Zoom')
BEGIN
	CREATE TABLE [Zoom].[ErrorLogs]
	(
		ErrorLogsId BIGINT PRIMARY KEY IDENTITY(1,1),
		PartnerIntegrationId BIGINT,
		ZoomUserId BIGINT,
		ZoomSessionId NVARCHAR(MAX),
		ErrorDetails NVARCHAR(500),
		Description NVARCHAR(500),
		Extension1 BIGINT NULL,
		Extension2 NVARCHAR(MAX),
		Extension3 NVARCHAR(MAX),
		CreatedDate DATETIME NOT NULL,
		CreatedBy BIGINT NULL,
		ModifiedDate DATETIME NULL,
		ModifiedBy BIGINT NULL,
		IsDeleted BIT NOT NULL
	)
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_ErrorLogs_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='ErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.ErrorLogs ADD CONSTRAINT [DF_ErrorLogs_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_ErrorLogs_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='ErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.ErrorLogs ADD CONSTRAINT [DF_ErrorLogs_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END




IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='Zoom' AND
    [TABLE_NAME] = 'SessionDetails' AND [COLUMN_NAME] = 'PartnerIntegrationId')
BEGIN
ALTER TABLE Zoom.SessionDetails
ADD PartnerIntegrationId BIGINT 
END


--08-12-2022
IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'CookieDetails' AND SCHEMA_NAME(SCHEMA_ID) =  N'Zoom')
BEGIN
CREATE TABLE [Zoom].[CookieDetails]
(
	 CookieDetailsId BIGINT IDENTITY(1,1) PRIMARY KEY,
	 PartnerIntegrationId BIGINT,
	 IPAddress NVARCHAR(500),
	 MACAddress NVARCHAR(500),
	 [Asp.Net_SessionId] NVARCHAR(500),
	 [Asp.Net_CookieId] NVARCHAR(500),
	 UserSessionId NVARCHAR(500),
	 UserCookieId NVARCHAR(500),
	 UserTimeZoneInfo  NVARCHAR(500),
	 UsageTime DATETIME,
	 CreatedDate DATETIME,
	 CreatedBy BIGINT,
	 ModifiedDate DATETIME,
	 ModifiedBy BIGINT,
	 IsDeleted BIT,
	 Extension1 BIGINT,
	 Extension2 NVARCHAR(MAX),
	 Extension3 NVARCHAR(MAX)
)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_CookieDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='CookieDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.CookieDetails ADD CONSTRAINT [DF_CookieDetails_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_CookieDetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='CookieDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.CookieDetails ADD CONSTRAINT [DF_CookieDetails_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =N'AuditLogs' AND SCHEMA_NAME(SCHEMA_ID) =  N'Zoom')
BEGIN
CREATE TABLE [Zoom].[AuditLogs]
(
	AuditLogsId BIGINT IDENTITY(1,1) PRIMARY KEY,
	CookieDetailsId BIGINT,
	PartnerIntegrationId BIGINT,
	IPAddress NVARCHAR(500),
	MACAddress NVARCHAR(500),
	[Asp.Net_SessionId] NVARCHAR(500),
	[Asp.Net_CookieId] NVARCHAR(500),
	UserSessionId NVARCHAR(500),
	UserCookieId NVARCHAR(500),
	UserTimeZoneInfo NVARCHAR(500),
	UsageTime DATETIME,
	CreatedDate DATETIME,
	CreatedBy BIGINT,
	ModifiedDate DATETIME,
	ModifiedBy BIGINT,
	IsDeleted BIT,
	Extension1 BIGINT,
	Extension2 NVARCHAR(MAX),
	Extension3 NVARCHAR(MAX)
)
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_AuditLogs_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='AuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.AuditLogs ADD CONSTRAINT [DF_AuditLogs_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_AuditLogs_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='AuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.AuditLogs ADD CONSTRAINT [DF_AuditLogs_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tbltestattempts' AND [COLUMN_NAME] = 'videosourcetype')
BEGIN
ALTER TABLE rpt.tbltestattempts
ADD videosourcetype INT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblsubmissionqueue' AND [COLUMN_NAME] = 'IsProcessed')
BEGIN
ALTER TABLE rpt.tblsubmissionqueue
ADD IsProcessed BIT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblsubmissionqueue_IsProcessed' AND OBJECT_NAME(Parent_Object_Id)='tblsubmissionqueue' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE rpt.tblsubmissionqueue ADD CONSTRAINT DF_tblsubmissionqueue_IsProcessed DEFAULT (0) FOR [IsProcessed]
END


IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideostatusDetails' AND TABLE_SCHEMA='RPT')
BEGIN
	
	CREATE TABLE RPT.tblVideostatusDetails
	(
		ID BIGINT PRIMARY KEY IDENTITY(1,1),
		PartnerIntegrationID BIGINT,
		Attemptid BIGINT,
		VideoCode NVARCHAR(MAX),
		DesktopVideoCode NVARCHAR(MAX),
		VideoCodeStatus INT,
		DesktopVideoCodeStatus INT,
		CreatedBy BIGINT,
		CreatedDate DATETIME,
		ModifiedBy BIGINT,
		ModifiedDate DATETIME,
		Isdeleted BIT
	)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblVideostatusDetails_CreatedDate'AND OBJECT_NAME(Parent_Object_Id)='tblVideostatusDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideostatusDetails] ADD  CONSTRAINT [DF_tblVideostatusDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblVideostatusDetails_Isdeleted'AND OBJECT_NAME(Parent_Object_Id)='tblVideostatusDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblVideostatusDetails] ADD  CONSTRAINT [DF_tblVideostatusDetails_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END




---28--03-23


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'RMAutomatedProctoringReview' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tbltestconfiguration 
ADD RMAutomatedProctoringReview BIT
END



 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_RMAutomatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
			 BEGIN   
			 ALTER TABLE RPT.tbltestconfiguration ADD CONSTRAINT [DF_tbltestconfiguration_RMAutomatedProctoringReview] DEFAULT (0) FOR [RMAutomatedProctoringReview]
 END  

-------------------

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'RMAgumatedProctoringReview' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tbltestconfiguration 
ADD RMAgumatedProctoringReview BIT
END



 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_RMAgumatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
			 BEGIN   
			 ALTER TABLE RPT.tbltestconfiguration ADD CONSTRAINT [DF_tbltestconfiguration_RMAgumatedProctoringReview] DEFAULT (0) FOR [RMAgumatedProctoringReview]
 END  


-------


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'LMAutomatedproctoring' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tbltestconfiguration 
ADD LMAutomatedproctoring BIT
END



 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAutomatedproctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
			 BEGIN   
			 ALTER TABLE RPT.tbltestconfiguration ADD CONSTRAINT [DF_tbltestconfiguration_LMAutomatedproctoring] DEFAULT (0) FOR [LMAutomatedproctoring]
 END  


--------------------


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'LMAugmentedProctoring' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tbltestconfiguration 
ADD LMAugmentedProctoring BIT
END



 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAugmentedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
			 BEGIN   
			 ALTER TABLE RPT.tbltestconfiguration ADD CONSTRAINT [DF_tbltestconfiguration_LMAugmentedProctoring] DEFAULT (0) FOR [LMAugmentedProctoring]
 END  



-------------



IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tbltestconfiguration 
ADD OrganizationCode  NVARCHAR(200)
END



----------------


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestAttempts' AND COLUMN_NAME = 'HeadshotStatus' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tblTestAttempts
ADD HeadshotStatus BIT
END



 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempts_HeadshotStatus' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
			 BEGIN   
			 ALTER TABLE RPT.tblTestAttempts ADD CONSTRAINT [DF_tblTestAttempts_HeadshotStatus] DEFAULT (0) FOR [HeadshotStatus]
 END  



----------------------------

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblPreferencesHistory' AND COLUMN_NAME = 'AuditSummaryID' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tblPreferencesHistory 
ADD AuditSummaryID BIGINT  
END




IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestLiveModeConfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tblTestLiveModeConfiguration  ADD  OrganizationCode NVARCHAR(200)  
END






IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestSCConfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tblTestSCConfiguration  ADD  OrganizationCode NVARCHAR(200)
END





IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AgumatedProctoring' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.tblOrganisationConfiguration  ADD AgumatedProctoring BIT

END




IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AutomatedProctoring' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration  ADD AutomatedProctoring BIT
END




IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblScheduleDetails' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblScheduleDetails  ADD  OrganizationCode NVARCHAR(200)
END





IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblScheduleUser' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblScheduleUser  ADD  OrganizationCode NVARCHAR(200)

END




IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblHumanVoiceAuditSummary' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN

CREATE TABLE [RPT].[tblHumanVoiceAuditSummary](
	[AuditSummaryID] [bigint] IDENTITY(1,1) NOT NULL,
	[RefId] [bigint] NOT NULL,
	[EventId] [smallint] NULL,
	[UserID] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblHumanVoiceAuditSummary_AuditSummaryID] PRIMARY KEY CLUSTERED 
(
	[AuditSummaryID] ASC
) ON [PRIMARY]
)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblHumanVoiceJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN

CREATE TABLE [RPT].[tblHumanVoiceJSON](
	[HumanVoiceJSONId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttempId] [bigint] NOT NULL,
	[HumanVoiceJSON] [nvarchar](max) NOT NULL,
	[AnalysisDuration] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblHumanVoiceJSON] PRIMARY KEY CLUSTERED 
(
	[HumanVoiceJSONId] ASC
)ON [PRIMARY] 
) 

END
 


 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblHumanVoiceJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN

CREATE TABLE [RPT].[tblHumanVoiceJSONHistory](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
	EventID smallint,
 CONSTRAINT [PK_tblHumanVoiceJSONHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
) ON [PRIMARY]
)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblHumanVoiceAuditSummary_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceAuditSummary' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE [RPT].[tblHumanVoiceAuditSummary] ADD  CONSTRAINT [DF_tblHumanVoiceAuditSummary_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END 


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblHumanVoiceAuditSummary_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceAuditSummary' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE [RPT].[tblHumanVoiceAuditSummary] ADD CONSTRAINT [DF_tblHumanVoiceAuditSummary_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblHumanVoiceJSON_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE [RPT].[tblHumanVoiceJSON] ADD  CONSTRAINT [DF_tblHumanVoiceJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblHumanVoiceJSON_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE [RPT].[tblHumanVoiceJSON] ADD CONSTRAINT [DF_tblHumanVoiceJSON_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblHumanVoiceJSONHistory_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE [RPT].[tblHumanVoiceJSONHistory] ADD  CONSTRAINT [DF_tblHumanVoiceJSONHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblHumanVoiceJSONHistory_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE [RPT].[tblHumanVoiceJSONHistory] ADD CONSTRAINT [DF_tblHumanVoiceJSONHistory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_tblHumanVoiceAuditSummary_tblEvents_EventId'AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceAuditSummary' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceAuditSummary]  WITH CHECK ADD  CONSTRAINT [FK_tblHumanVoiceAuditSummary_tblEvents_EventId] FOREIGN KEY([EventId])
REFERENCES [RPT].[tblEvents] ([EventId])


 


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS 
WHERE [Name]='FK_tblHumanVoiceAuditSummary_tblUsers_UserID'
AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceAuditSummary' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceAuditSummary]  WITH CHECK ADD  CONSTRAINT [FK_tblHumanVoiceAuditSummary_tblUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [RPT].[tblUsers] ([UserId])


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS 
WHERE [Name]='FK_tblHumanVoiceAuditSummary_tblUsers_UserID'
AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceAuditSummary' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceAuditSummary] CHECK CONSTRAINT [FK_tblHumanVoiceAuditSummary_tblUsers_UserID]


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS 
WHERE [Name]='FK_tblHumanVoiceJSON_tblTestAttempts_TestAttemptId'
AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceJSON]  WITH CHECK ADD CONSTRAINT [FK_tblHumanVoiceJSON_tblTestAttempts_TestAttemptId] FOREIGN KEY([AttempId])
REFERENCES [RPT].[tblTestAttempts] ([AttemptId])


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS 
WHERE [Name]='FK_tblHumanVoiceJSON_tblTestAttempts_TestAttemptId'
AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceJSON] CHECK CONSTRAINT [FK_tblHumanVoiceJSON_tblTestAttempts_TestAttemptId]


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS 
WHERE [Name]='FK_tblHumanVoiceJSONHistory_tblAuditSummary_AuditSummaryID'
AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceJSONHistory]  WITH CHECK ADD  CONSTRAINT FK_tblHumanVoiceJSONHistory_tblAuditSummary_AuditSummaryID FOREIGN KEY([AuditSummaryID])
REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])


--09-05-2023
 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblImageModeTestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE RPT.tblImageModeTestdetails   ( 
ID BIGINT IDENTITY(1,1) NOT NULL,  
Orgcode  NVARCHAR(200),  
ScheduleUserId  NVARCHAR(200),  
attemptid BIGINT,  
StorageType INT,  
ImageCatpureInterval INT,  
CurrentDateTime DATETIME, 
[Isdeleted] BIT NOT NULL , 
[Createdby] BIGINT   NULL,  
[Modifiedby] BIGINT NULL,  
[CreatedDate]  DATETIME NOT NULL,  
[ModifiedDate] DATETIME  NULL,  
CONSTRAINT [PK_tblImageModeTestdetails] PRIMARY KEY CLUSTERED  (  [ID] ASC       ) ON [PRIMARY]   
)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageModeTestdetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblImageModeTestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE RPT.tblImageModeTestdetails ADD CONSTRAINT [DF_tblImageModeTestdetails_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageModeTestdetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblImageModeTestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
ALTER TABLE RPT.tblImageModeTestdetails ADD CONSTRAINT [DF_tblImageModeTestdetails_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END

---06-06-23


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VideoSummaryTestDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VideoSummaryTestDetails]
(
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SchchduleUserID]  BIGINT,
	[AttemptID] BIGINT,
	[S3] NVARCHAR(MAX),
	[FMMCount] INT,
	[HMMCount] INT,
	[DesktopVideoSize] NVARCHAR(MAX),
	[DesktopVideoLength]  NVARCHAR(MAX),
	[VideoSize] NVARCHAR(MAX),
	[VideoLength]  NVARCHAR(MAX),
	[S3VideoSize] NVARCHAR(MAX),
	[S3VideoLength]  NVARCHAR(MAX),
	[VideoCode] NVARCHAR(MAX),
	[NativeStatus] INT,
	[ProctorType] INT,
	[LowCount] INT,
	[MediumCount] INT,
	[HighCount] INT,
	[ArchiveID] BIGINT,
	[TestCreatedDate] DATETIME,
	[TASubmittedDate] DATETIME,
	[CreatedDate] [datetime2](7) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Isdeleted] [bit] NULL,
	
) ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_VideoSummaryTestDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='VideoSummaryTestDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN   
ALTER TABLE [dbo].[VideoSummaryTestDetails] ADD  CONSTRAINT [DF_VideoSummaryTestDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END  
 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_VideoSummaryTestDetails_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='VideoSummaryTestDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN   
ALTER TABLE [dbo].[VideoSummaryTestDetails] ADD  CONSTRAINT [DF_VideoSummaryTestDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END  


--29-06-2023

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'FaceCount' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD  FaceCount INT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'ScreenVideoSize_S3' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD  ScreenVideoSize_S3 NVARCHAR(MAX);
END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'MainVideoSize_S3' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD  MainVideoSize_S3 NVARCHAR(MAX);
END


--31-08-2023

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblAPIRequestAndResponseLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE RPT.tblAPIRequestAndResponseLogs
(                      
	[ID] BIGINT IDENTITY(1,1) NOT NULL,                      
	[Method]  NVARCHAR(300),       
	[RequestUrl]  NVARCHAR(MAX),      
	RequestContent NVARCHAR(MAX),       
	StatusCode VARCHAR(20),       
	ResponseContent NVARCHAR(MAX),       
	StartDateAndTime DATETIME,       
	EndDateAndTime DATETIME,                     
	[Isdeleted] BIT NOT NULL ,                      
	[Createdby] BIGINT   NULL,                      
	[Modifiedby] BIGINT NULL,                      
	[CreatedDate]  DATETIME NOT NULL,                      
	[ModifiedDate] DATETIME  NULL,                     
	CONSTRAINT [PK_tblAPIRequestAndResponseLogs] 
	PRIMARY KEY CLUSTERED                      
	(                     
		[ID] ASC                           
	) ON [PRIMARY]                        
)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAPIRequestAndResponseLogs_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblAPIRequestAndResponseLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblAPIRequestAndResponseLogs ADD CONSTRAINT [DF_tblAPIRequestAndResponseLogs_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAPIRequestAndResponseLogs_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblAPIRequestAndResponseLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblAPIRequestAndResponseLogs ADD CONSTRAINT [DF_tblAPIRequestAndResponseLogs_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblTestAttempts' AND [COLUMN_NAME] = 'Isdeletedfroms3localstorage')
BEGIN
ALTER TABLE RPT.tblTestAttempts  ADD Isdeletedfroms3localstorage BIT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempts_Isdeletedfroms3localstorage' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblTestAttempts ADD CONSTRAINT [DF_tblTestAttempts_Isdeletedfroms3localstorage] DEFAULT (0) FOR [Isdeletedfroms3localstorage]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'highcount')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD highcount  INT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'mediumcount')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD mediumcount INT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'lowcount')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD lowcount INT
END
 
IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAugmentedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_LMAugmentedProctoring DEFAULT (0) FOR [LMAugmentedProctoring]
END
 

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_RMAgumatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_RMAgumatedProctoringReview DEFAULT (0) FOR [RMAgumatedProctoringReview]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_RMAutomatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_RMAutomatedProctoringReview DEFAULT (0) FOR [RMAutomatedProctoringReview]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AgumatedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AgumatedProctoring DEFAULT (0) FOR [AgumatedProctoring]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AutomatedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AutomatedProctoring DEFAULT (0) FOR [AutomatedProctoring]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblOrganisationConfiguration' AND [COLUMN_NAME] = 'AutomatedProctoringReview')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration  ADD AutomatedProctoringReview bit
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AutomatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AutomatedProctoringReview DEFAULT (0) FOR [AutomatedProctoringReview]
END
 
IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'AgumatedProctoringReview'
AND Object_ID = Object_ID(N'RPT.tblOrganisationConfiguration'))
BEGIN
 ALTER TABLE rpt.tblOrganisationConfiguration  ADD AgumatedProctoringReview bit
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AgumatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AgumatedProctoringReview DEFAULT (0) FOR [AgumatedProctoringReview]
END
 
IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'NativeStatus'
AND Object_ID = Object_ID(N'RPT.tblTestAttempts'))
BEGIN
 ALTER TABLE rpt.tblTestAttempts  ADD NativeStatus INT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblTestAttempts' AND [COLUMN_NAME] = 'NativeMessage')
BEGIN
 ALTER TABLE rpt.tblTestAttempts  ADD NativeMessage NVARCHAR(500)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'VideoSummaryTestDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
CREATE TABLE [dbo].[VideoSummaryTestDetails]  
(   
	[ID] [bigint] IDENTITY(1,1) NOT NULL,   
	[SchchduleUserID]  BIGINT,   
	[AttemptID] BIGINT,   
	[S3] NVARCHAR(MAX),   
	[FMMCount] INT,   
	[HMMCount] INT,   
	[DesktopVideoSize] NVARCHAR(MAX),   
	[DesktopVideoLength]  NVARCHAR(MAX),   
	[VideoSize] NVARCHAR(MAX),   
	[VideoLength]  NVARCHAR(MAX),   
	[S3VideoSize] NVARCHAR(MAX),   
	[S3VideoLength]  NVARCHAR(MAX),   
	[VideoCode] NVARCHAR(MAX),   
	[NativeStatus] INT,   
	[ProctorType] INT,   
	[LowCount] INT,   
	[MediumCount] INT,   
	[HighCount] INT,   
	[ArchiveID] BIGINT,   
	[TestCreatedDate] DATETIME,   
	[TASubmittedDate] DATETIME,   
	[CreatedDate] [datetime2](7) NULL,   
	[ModifiedDate] [datetime2](7) NULL,   
	[Isdeleted] [bit] NULL,     
) 
	ON [PRIMARY]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_VideoSummaryTestDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='VideoSummaryTestDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[VideoSummaryTestDetails] ADD  CONSTRAINT [DF_VideoSummaryTestDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_VideoSummaryTestDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='VideoSummaryTestDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
ALTER TABLE [dbo].[VideoSummaryTestDetails] ADD  CONSTRAINT [DF_VideoSummaryTestDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'FaceCount')
BEGIN
ALTER TABLE rpt.tblVideoJSON ADD  FaceCount INT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'ScreenVideoSize_S3')
BEGIN
ALTER TABLE rpt.tblVideoJSON ADD  ScreenVideoSize_S3 NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'MainVideoSize_S3')
BEGIN
ALTER TABLE rpt.tblVideoJSON ADD  MainVideoSize_S3 NVARCHAR(MAX)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
CREATE TABLE [Zoom].[SessionLogs]   
(    
	SessionLogsID BIGINT PRIMARY KEY IDENTITY(1,1),    
	UserDetailsId BIGINT NOT NULL,    
	SessionName NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS ,    
	UserId  BIGINT,    
	SessionId NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS ,    
	SessionStartTime DATETIME,    
	SessionEndTime DATETIME,    
	Duration NVARCHAR(100)  COLLATE SQL_Latin1_General_CP1_CI_AS,    
	UserCount INT,    
	Has_voip BIT NOT NULL,    
	Has_video BIT NOT NULL,    
	Has_Screen_share BIT NOT NULL,    
	Has_recording BIT NOT NULL,    
	Has_pstn BIT NOT NULL,    
	Session_key NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS,    
	IsVideoDownloaded BIT NOT NULL,    
	IsVideoDeletedInZoom BIT NOT NULL,    
	Extension1 BIGINT NULL,    
	Extension2 NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS NULL,    
	Extension3 NVARCHAR(MAX)  COLLATE SQL_Latin1_General_CP1_CI_AS NULL,    
	CreatedDate DATETIME NOT NULL,    
	CreatedBy BIGINT NULL ,    
	ModifiedDate DATETIME NULL,    
	ModifiedBy BIGINT NULL,    
	IsDeleted BIT NOT NULL   
)
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_SessionLogs_UserDetailsId'AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs WITH CHECK ADD CONSTRAINT [FK_SessionLogs_UserDetailsId] FOREIGN KEY([UserDetailsId])          REFERENCES [Zoom].[UserDetails] ([UserDetailsId])
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_CreatedDate] DEFAULT (getdate()) FOR [CreatedDate]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_Has_voip' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_Has_voip] DEFAULT (0) FOR [Has_voip]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_Has_video' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_Has_video] DEFAULT (0) FOR [Has_video]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_Has_recording' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_Has_recording] DEFAULT (0) FOR [Has_recording]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_IsVideoDeletedInZoom' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_IsVideoDeletedInZoom] DEFAULT (0) FOR [IsVideoDeletedInZoom]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_IsVideoDownloaded' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_IsVideoDownloaded] DEFAULT (0) FOR [IsVideoDownloaded]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_Has_pstn' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_Has_pstn] DEFAULT (0) FOR [Has_pstn]
END
--11-09-2023

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN

CREATE TABLE [RPT].[tblvoidcases](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[voidCase] [nvarchar](200) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK_tblvoidcases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblvoidcases_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvoidcases] ADD  CONSTRAINT [DF_tblvoidcases_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblvoidcases_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvoidcases] ADD  CONSTRAINT [DF_tblvoidcases_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblProctorRemoteReviewRejectHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblProctorRemoteReviewRejectHistory](
	[ReviewId] [bigint] IDENTITY(1,1) NOT NULL,
	[TestDetailId] [bigint] NULL,
	[ProctorId] [bigint] NOT NULL,
	[PartnerintegrationId] [bigint] NOT NULL,
	[ReasonsForRejection] [nvarchar](max) NULL,
	[ReviewComments] [nvarchar](max) NULL,
	[ReviewStatus] [tinyint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblProctorRemoteReviewRejectHistory] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblProctorRemoteReviewRejectHistory_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblProctorRemoteReviewRejectHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorRemoteReviewRejectHistory] ADD  CONSTRAINT [DF_tblProctorRemoteReviewRejectHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblProctorRemoteReviewRejectHistory_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='tblProctorRemoteReviewRejectHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorRemoteReviewRejectHistory] ADD   CONSTRAINT [DF_tblProctorRemoteReviewRejectHistory_IsDeleted] DEFAULT ((0)) FOR [IsDeleted]
END





IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblAuditlog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventId] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UserId] [bigint] NULL,
	[Profiler] [nvarchar](max) NULL,
	[ObjectName] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[BrowserInfo] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Theme] [nvarchar](max) NULL,
	[Timezone] [nvarchar](max) NULL,
	[Region] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[FilePath] [nvarchar](max) NULL,
	[IsAutolog] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK_tblAuditlog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditlog_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditlog] ADD  CONSTRAINT [DF_tblAuditlog_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditlog_IsAutolog'AND OBJECT_NAME(Parent_Object_Id)='tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditlog] ADD  CONSTRAINT [DF_tblAuditlog_IsAutolog]  DEFAULT ((0)) FOR [IsAutolog]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditlog_Isdeleted'AND OBJECT_NAME(Parent_Object_Id)='tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditlog] ADD  CONSTRAINT [DF_tblAuditlog_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END




IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity_Archive](
	[UserActivityID] [bigint] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
	[WorkSpaceID] [bigint] NULL,
	[UserID] [bigint] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[AssetID] [bigint] NULL,
	[SessionID] [nvarchar](50) NOT NULL,
	[ClientIP] [nvarchar](50) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[UserAgent] [nvarchar](50) NULL,
	[URLReferrer] [nvarchar](512) NULL,
	[UserLanguage] [nvarchar](50) NULL,
	[ExtraInformation] [nvarchar](1024) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[SyncID] [bigint] NULL
) ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity_2023' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity_2023](
	[UserActivityID] [bigint] NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
	[WorkSpaceID] [bigint] NULL,
	[UserID] [bigint] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[PageID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[AssetID] [bigint] NULL,
	[SessionID] [nvarchar](50) NOT NULL,
	[ClientIP] [nvarchar](50) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[UserAgent] [nvarchar](50) NULL,
	[URLReferrer] [nvarchar](512) NULL,
	[UserLanguage] [nvarchar](50) NULL,
	[ExtraInformation] [nvarchar](1024) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[SyncID] [bigint] NULL
) ON [PRIMARY]
END



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[Summary_ApplicationUsageDetails](
	[ApplicationUsageDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[CustomerName] [nvarchar](200) NULL,
	[OrganizationName] [nvarchar](200) NULL,
	[OrganizationId] [bigint] NULL,
	[TotalUsage] [bigint] NULL,
	[CustomerAdminUsage] [bigint] NULL,
	[AdminUsage] [bigint] NULL,
	[ProctorUsage] [bigint] NULL,
	[StudentUsage] [bigint] NULL,
	[CustomerAdminNoOfVisits] [bigint] NULL,
	[AdminNoOfVisits] [bigint] NULL,
	[ProctorNoOfVisits] [bigint] NULL,
	[StudentNoOfVisits] [bigint] NULL,
	[UsageDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[ModiFiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ParentUsage] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationUsageDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Summary_ApplicationUsageDetails_CreatedDate'AND OBJECT_NAME(Parent_Object_Id)='Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Summary_ApplicationUsageDetails] ADD  CONSTRAINT [DF_Summary_ApplicationUsageDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Summary_ApplicationUsageDetails_IsDeleted'AND OBJECT_NAME(Parent_Object_Id)='Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Summary_ApplicationUsageDetails] ADD  CONSTRAINT [DF_Summary_ApplicationUsageDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END
 

---22-09-2023


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ScheduleName' AND COLUMN_NAME = 'Orgcode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.ScheduleName  ADD Orgcode NVARCHAR(100)
END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ScheduleName' AND COLUMN_NAME = 'Type' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.ScheduleName  ADD Type INT
END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ScheduleName' AND COLUMN_NAME = 'IsSecuredBrowser' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.ScheduleName  ADD IsSecuredBrowser BIT 
END


 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='IX_ScheduleName_IsSecuredBrowser' AND OBJECT_NAME(Parent_Object_Id)='ScheduleName' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
			 ALTER TABLE RPT.ScheduleName ADD CONSTRAINT [IX_ScheduleName_IsSecuredBrowser] DEFAULT (0) FOR [IsSecuredBrowser]
		
END  


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblStudentScheduleDetails' AND COLUMN_NAME = 'SCheduleusercode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblStudentScheduleDetails  ADD SCheduleusercode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TblScheduleAssessmentProctorAvailAuditlog' AND COLUMN_NAME = 'SCheduleusercode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.TblScheduleAssessmentProctorAvailAuditlog  ADD SCheduleusercode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'StudentScheduleDetail' AND COLUMN_NAME = 'SCheduleusercode' AND TABLE_SCHEMA='RPT')
BEGIN

ALTER TABLE RPT.[StudentScheduleDetail]  ADD SCheduleusercode NVARCHAR(200)

END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblusers' AND COLUMN_NAME = 'Isuserloggedin' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblusers   ADD  Isuserloggedin  BIT 
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblusers_Isuserloggedin' AND OBJECT_NAME(Parent_Object_Id)='tblusers' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
			 ALTER TABLE rpt.tblusers ADD CONSTRAINT [DF_tblusers_Isuserloggedin] DEFAULT (0) FOR [Isuserloggedin]
		
END 


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblusers' AND COLUMN_NAME = 'useractivedate' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblUsers   ADD useractivedate datetime
END



IF   EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
DROP TABLE RPT.UserActivity
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity]
(   
	[UserActivityID] [bigint] IDENTITY(1,1) NOT NULL,   
	[ApplicationID] [int] NOT NULL,   
	[OrganizationID] [int] NULL,   
	[WorkSpaceID] [bigint] NULL,   
	[UserID] [bigint] NOT NULL,   
	[ModuleID] [int] NOT NULL,   
	[PageID] [int] NOT NULL,   
	[EventID] [int] NOT NULL,   
	[AssetID] [bigint] NULL,   
	[SessionID] [nvarchar](50) NOT NULL,   
	[ClientIP] [nvarchar](50) NULL,   
	[StartTime] [datetime] NOT NULL,  
	[EndTime] [datetime] NOT NULL,  
	[UserAgent] [nvarchar](50) NULL,   
	[URLReferrer] [nvarchar](512) NULL,   
	[UserLanguage] [nvarchar](50) NULL,   
	[ExtraInformation] [nvarchar](1024) NULL,   
	[IsDeleted] [bit] NOT NULL,   
	[CreatedBy] [bigint] NULL,   
	[CreatedDate] [datetime] NULL,   
	[ModifiedBy] [bigint] NULL,   
	[ModifiedDate] [datetime] NULL,   
	[SyncID] [bigint] NULL,   
	[IsAllowmultiUserConnection] [BIT],
	[PartnerIntegrationID] [BIGINT],
	CONSTRAINT [PK_UserActivity] 
	PRIMARY KEY CLUSTERED   (   [UserActivityID] ASC  )
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) ON [PRIMARY]  
) ON [PRIMARY]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserActivity_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserActivity] ADD  CONSTRAINT [DF_UserActivity_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserActivity_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserActivity] ADD  CONSTRAINT [DF_UserActivity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
 
 


 IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserActivity_IsAllowmultiUserConnection' AND OBJECT_NAME(Parent_Object_Id)='UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserActivity] ADD  CONSTRAINT [DF_UserActivity_IsAllowmultiUserConnection]  DEFAULT ((0)) FOR [IsAllowmultiUserConnection]
END


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserActivity_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='UserActivity' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserActivity] ADD  CONSTRAINT [DF_UserActivity_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS 
WHERE [Name]='DF_UserActivity_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='UserActivity' 
AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[UserActivity] ADD CONSTRAINT [DF_UserActivity_Isdeleted] DEFAULT ((0)) FOR [Isdeleted]
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblAuditlog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventId] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_tblAuditlog_CreatedDate]  DEFAULT (getutcdate()),
	[CreatedBy] [bigint] NOT NULL,
	[UserId] [bigint] NULL,
	[Profiler] [nvarchar](max) NULL,
	[ObjectName] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
	[BrowserInfo] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Theme] [nvarchar](max) NULL,
	[Timezone] [nvarchar](max) NULL,
	[Region] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[FilePath] [nvarchar](max) NULL,
	[IsAutolog] [bit] NULL    CONSTRAINT [DF_tblAuditlog_IsAutolog]  DEFAULT ((0)),
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL  CONSTRAINT [DF_tblAuditlog_Isdeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_tblAuditlog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblAuditEvents' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblAuditEvents](
	[ID] [bigint] Identity(1,1) NOT NULL,
	[EventId] [bigint] NOT NULL,
	[EventName] [nvarchar](3000) NOT NULL,
	[Description] [nvarchar](3000) NULL,
	[CreatedDate] DateTime,
	[ModifiedDate] DateTime,
	[Isdeleted] BIT
 CONSTRAINT [PK_tblAuditEvents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO
IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditEvents_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblAuditEvents' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditEvents] ADD  CONSTRAINT [DF_tblAuditEvents_CreatedDate]  DEFAULT GETUTCDATE() FOR [CreatedDate]
END
GO
IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditEvents_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblAuditEvents' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditEvents] ADD  CONSTRAINT [DF_tblAuditEvents_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END
GO

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblvoidcases](
	[ID] bigint Identity(1,1) NOT NULL,
	[voidCase] Nvarchar(200) NOT NULL,
	[CreatedDate] DateTime,
	[ModifiedDate] DateTime,
	[Isdeleted] BIT
 CONSTRAINT [PK_tblvoidcases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO
IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblvoidcases_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvoidcases] ADD  CONSTRAINT [DF_tblvoidcases_CreatedDate]  DEFAULT GETUTCDATE() FOR [CreatedDate]
END
GO
IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblvoidcases_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvoidcases] ADD  CONSTRAINT [DF_tblvoidcases_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END
GO


--17-10-2023

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblProctorVideoJson' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblProctorVideoJson](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[VideoJson] [nvarchar](max) NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[AttemptID] [bigint] NULL,
	[ProctorID] [bigint] NULL,
	[TestDetailID] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NULL,
	[TestScreenImageJson] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblProctorVideoJson_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblProctorVideoJson' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorVideoJson] ADD  CONSTRAINT [DF_tblProctorVideoJson_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblProctorVideoJson_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblProctorVideoJson' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblProctorVideoJson] ADD  CONSTRAINT [DF_tblProctorVideoJson_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

 
 

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'TestScreenImageJson')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD TestScreenImageJson nvarchar(MAX)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE  [TABLE_SCHEMA]='RPT' AND
    [TABLE_NAME] = 'tblVideoJSON' AND [COLUMN_NAME] = 'UserScreenImageJson')
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD UserScreenImageJson nvarchar(MAX)
END

 
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'TblAssignmentRejectHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[TblAssignmentRejectHistory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[RejectedBy] [bigint] NULL,
	[RejectedReason] [nvarchar](max) NULL,
	[TestDetailID] [bigint] NULL,
	[RejectedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_TblAssignmentRejectHistory_RejectedDate' AND OBJECT_NAME(Parent_Object_Id)='TblAssignmentRejectHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblAssignmentRejectHistory] ADD  CONSTRAINT [DF_TblAssignmentRejectHistory_RejectedDate]  DEFAULT (getutcdate()) FOR [RejectedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_TblAssignmentRejectHistory_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='TblAssignmentRejectHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[TblAssignmentRejectHistory] ADD  CONSTRAINT [DF_TblAssignmentRejectHistory_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END


 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblUnallocatedUserLog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblUnallocatedUserLog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[TestDetailID] [bigint] NULL,
	[Createddate] [datetime] NULL
) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblUnallocatedUserLog_Createddate' AND OBJECT_NAME(Parent_Object_Id)='tblUnallocatedUserLog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblUnallocatedUserLog] ADD  CONSTRAINT [DF_tblUnallocatedUserLog_Createddate]  DEFAULT (getutcdate()) FOR [Createddate]
END




IF   EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_tblTestAssignment_tblUsers_TestGUID'AND OBJECT_NAME(Parent_Object_Id)='tbltestassignment' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE RPT.tbltestassignment   DROP Constraint FK_tblTestAssignment_tblUsers_TestGUID
END

 --19-10-2023
 

--02-11-2023
IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblUnallocatedUserLog' AND COLUMN_NAME = 'UnAllocatedBy' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblUnallocatedUserLog 
ADD UnAllocatedBy BIGINT
END

--14-02-2023

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'JwtTokens' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[JwtTokens](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExpiredToken] [nvarchar](max) NULL,
	[ExpiredTime] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK_JwtTokens] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_JwtTokens_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='JwtTokens' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
   ALTER TABLE [RPT].[JwtTokens] ADD  CONSTRAINT [DF_JwtTokens_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_JwtTokens_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='JwtTokens' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN 
	ALTER TABLE [RPT].[JwtTokens] ADD  CONSTRAINT [DF_JwtTokens_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END


--18-01-2024
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Stream')
EXEC sys.sp_executesql N'CREATE SCHEMA [Stream]'



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamUserDetails](
	StreamUserDetailsId	BIGINT IDENTITY(1,1) NOT NULL,
	IntergrationUserId	BIGINT NULL,
	PartnerIntegrationId	BIGINT NULL,
	AttemptId	BIGINT NULL,
	RoleId	   SMALLINT NULL,
	CreatedDate	DATETIME NULL,
	CreatedBy	BIGINT NULL,
	ModifiedDate	DATETIME NULL,
	ModifiedBy	BIGINT NULL,
	IsDeleted	BIT NULL,
	Extension1	BIGINT NULL,
	Extension2	NVARCHAR(MAX) NULL,
	Extension3	NVARCHAR(MAX) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamUserDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamUserDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='StreamUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamUserDetails] ADD  CONSTRAINT [DF_StreamUserDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamUserDetail_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='StreamUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamUserDetails] ADD  CONSTRAINT [DF_StreamUserDetail_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END





IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN

CREATE TABLE [Stream].[StreamAuditLogs](
	[StreamAuditLogsId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[EventType] [nvarchar](max) NULL,
	[EventDescription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [nvarchar](max) NULL,
	[Extension3] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamAuditLogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamAuditLogs_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='StreamAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamAuditLogs] ADD  CONSTRAINT [DF_StreamAuditLogs_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamAuditLogs_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='StreamAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamAuditLogs]  ADD  CONSTRAINT [DF_StreamAuditLogs_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamErrorLogs](
	[ErrorLogsId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[ErrorCode] [nvarchar](max) NULL,
	[ErrorDetails] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [bigint] NULL,
	[Extension2] [nvarchar](max) NULL,
	[Extension3] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorLogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamErrorLogs_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamErrorLogs] ADD  CONSTRAINT [DF_StreamErrorLogs_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamErrorLogs_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamErrorLogs]  ADD  CONSTRAINT [DF_StreamErrorLogs_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamRoleTypeMaster](
	[StreamRoleTypeMasterId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NULL,
	[RoleName] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [bigint] NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamRoleTypeMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamRoleTypeMaster_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamRoleTypeMaster] ADD  CONSTRAINT [DF_StreamRoleTypeMaster_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]

END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamRoleTypeMaster_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamRoleTypeMaster] ADD  CONSTRAINT [DF_StreamRoleTypeMaster_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]

END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamSessionDetails](
	[StreamSessionDetailsId] [bigint] IDENTITY(1,1) NOT NULL,
	[StreamUserDetailsId] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[UserVideoCode] [nvarchar](max) NULL,
	[ScreenVideoCode] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamSessionDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamSessionDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='StreamSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamSessionDetails] ADD  CONSTRAINT [DF_StreamSessionDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamSessionDetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='StreamSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamSessionDetails] ADD  CONSTRAINT [DF_StreamSessionDetails_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblvoidcases' AND COLUMN_NAME = 'VCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblvoidcases
ADD VCode NVARCHAR(100)
END


--28-02-2024


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Stream].[RoomVideoDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [Stream].[RoomVideoDetails](
	[RoomVideoDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[videocode] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomVideoDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_RoomVideoDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='RoomVideoDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[RoomVideoDetails] ADD  CONSTRAINT [DF_RoomVideoCodes_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_RoomVideoDetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='RoomVideoDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[RoomVideoDetails] ADD  CONSTRAINT [DF_RoomVideoDetails_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ErrorLogs' AND COLUMN_NAME = 'ErrorDetails' AND TABLE_SCHEMA='Zoom')
BEGIN
ALTER TABLE zoom.ErrorLogs 
ALTER COLUMN ErrorDetails NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ErrorLogs' AND COLUMN_NAME = 'Description' AND TABLE_SCHEMA='Zoom')
BEGIN
ALTER TABLE zoom.ErrorLogs 
ALTER COLUMN Description NVARCHAR(MAX)
END

--28-03-2024

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[tbltestpausedetails]') AND type in (N'U'))
BEGIN
CREATE TABLE  rpt.tbltestpausedetails
(
    ID bigint IDENTITY(1,1) NOT NULL,
    PId bigint,
    TestDetailId bigint,
    AttemptId bigint,
    ProctorId bigint,
    PausedTime DATETIME,
    EndTime DATETIME,
    IsPaused numeric(1,0),
    CreatedDate DATETIME,
    IsDeleted numeric(1,0) ,
    PausedDuration integer
)
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestpausedetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [rpt].[tbltestpausedetails] ADD  CONSTRAINT [DF_tbltestpausedetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestpausedetails_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [rpt].[tbltestpausedetails] ADD  CONSTRAINT [DF_tbltestpausedetails_IsDeleted]  DEFAULT 0 FOR [IsDeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestpausedetails_IsPaused' AND OBJECT_NAME(Parent_Object_Id)='tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [rpt].[tbltestpausedetails] ADD  CONSTRAINT [DF_tbltestpausedetails_IsPaused]  DEFAULT 0 FOR [IsPaused]
END

--02-04-2024

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'rpt.tbltestpausedetailshistory') AND type in (N'U'))
BEGIN

CREATE TABLE rpt.tbltestpausedetailshistory
(
    historyid INT IDENTITY(1,1) PRIMARY KEY,
    testpausedetailid BIGINT,
    pid BIGINT,
    attemptid BIGINT,
    proctorid BIGINT,
    pausedtime DATETIME,
    endtime DATETIME,
    ispaused NUMERIC,
    pausedduration INT,
    organizationid BIGINT
   
);
END

--24-04-2024 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'rpt.tblScreenJSON') AND type in (N'U'))
BEGIN

CREATE TABLE [RPT].[tblScreenJSON](
	[ScreenJSONId] [bigint] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NOT NULL,
	[ScreenJSON] [nvarchar](max) NOT NULL,
	[TotalFrames] [int] NOT NULL,
	[DetectedFrames] [int] NOT NULL,
	[AnalysisDuration] [bigint] NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[UpdatedDate] [datetime2](3) NULL,
	[IsDeleted] [bit] NULL,
	[Screensize] [nvarchar](max) NULL,
	[Screenlength] [nvarchar](max) NULL,
	[desktopScreenlength] [nvarchar](max) NULL,
	[desktopScreensize] [nvarchar](max) NULL,
	[highcount] [int] NULL,
	[mediumcount] [int] NULL,
	[lowcount] [int] NULL,
	[FaceCount] [int] NULL,
	[ScreenVideoSize_S3] [nvarchar](max) NULL,
	[MainVideoSize_S3] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblScreenJSON] PRIMARY KEY CLUSTERED 
(
	[ScreenJSONId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblScreenJSON_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblScreenJSON] ADD  CONSTRAINT [DF_tblScreenJSON_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblScreenJSON_highcount' AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblScreenJSON] ADD  CONSTRAINT [DF_tblScreenJSON_highcount]  DEFAULT ((0)) FOR [highcount]
END 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblScreenJSON_mediumcount' AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblScreenJSON] ADD  CONSTRAINT [DF_tblScreenJSON_mediumcount]  DEFAULT ((0)) FOR [mediumcount]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblScreenJSON_lowcount' AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblScreenJSON] ADD  CONSTRAINT [DF_tblScreenJSON_lowcount]  DEFAULT ((0)) FOR [lowcount]
END 

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'rpt.tblScreenJSONHistory') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblScreenJSONHistory](
	[HistoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditSummaryID] [bigint] NOT NULL,
	[ReviewJSON] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](3) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tblScreenJSONHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblScreenJSONHistory_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblScreenJSONHistory] ADD  CONSTRAINT [DF_tblScreenJSONHistory_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END 

---

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblsubmissionqueue' AND COLUMN_NAME = 'ScreenStatus' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblsubmissionqueue	ADD   ScreenStatus Smallint
END 

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblsubmissionqueue' AND COLUMN_NAME = 'ScreenMessage' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblsubmissionqueue	ADD ScreenMessage  varchar(100)
END 

---
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'rpt.tblautopaused') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblautopaused](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[pid] [bigint] NULL,
	[attemptid] [bigint] NULL,
	[status] [int] NULL,
	[createddate] [datetime] NULL,
	[modifiedby] [nvarchar](500) NULL,
	[modifieddate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblautopaused] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
END 

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblautopaused' AND COLUMN_NAME = 'createddate' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE [RPT].[tblautopaused] ADD  DEFAULT (getutcdate()) FOR [createddate]
END 

--
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'rpt.tblautopausedhistory') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[tblautopausedhistory](
	[historyid] [bigint] IDENTITY(1,1) NOT NULL,
	[autopausedid] [bigint] NULL,
	[proctorid] [bigint] NULL,
	[pid] [bigint] NULL,
	[attemptid] [bigint] NULL,
	[status] [int] NULL,
	[createddate] [datetime2](7) NULL,
	[modifiedby] [nvarchar](500) NULL,
	[modifieddate] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblautopausedhistory] PRIMARY KEY CLUSTERED 
(
	[historyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END 

--
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblautopausedhistory_createddate' AND OBJECT_NAME(Parent_Object_Id)='tblautopausedhistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE [RPT].[tblautopausedhistory] ADD  CONSTRAINT [DF_tblautopausedhistory_createddate]  DEFAULT (getutcdate()) FOR [createddate]
END 

--24-04-2024

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AllowedWarning' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblOrganisationConfiguration ADd  AllowedWarning INT
END 

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AllowedHighflag' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblOrganisationConfiguration ADd  AllowedHighflag INT
END 

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AllowedMediumflag' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblOrganisationConfiguration ADd  AllowedMediumflag INT
END 

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AllowedLowflag' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblOrganisationConfiguration ADd  AllowedLowflag INT
END 

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AllowedTotalflag' AND TABLE_SCHEMA='RPT')
BEGIN
Alter table rpt.tblOrganisationConfiguration ADd  AllowedTotalflag INT
END

--30-04-2024

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbltestautopausedetails]') AND type in (N'U'))
BEGIN
    CREATE TABLE [rpt].[tbltestautopausedetails]
    (
        [id] [bigint] IDENTITY(1,1) NOT NULL,
        [scheduleusercode] [varchar](500) ,
        [partnerintegrationid] [bigint] ,
        [orgid] [bigint],
        [attemptid] [bigint] ,
        [proctorid] [bigint] ,
        [actiontype] [int] ,
        [actiontime] [DATETIME] ,
        [createddate] [DATETIME] ,
        [modifieddate] [DATETIME] ,
        [modifiedby] [bigint] ,
        [isdeleted] [int] NOT NULL,
        CONSTRAINT [PK_tbltestautopausedetails] PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails] ADD  CONSTRAINT [DF_tbltestautopausedetails_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails] ADD  CONSTRAINT [DF_tbltestautopausedetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_modifieddate' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails] ADD  CONSTRAINT [DF_tbltestautopausedetails_modifieddate]  DEFAULT (getdate()) FOR [modifieddate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_actiontime' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails] ADD  CONSTRAINT [DF_tbltestautopausedetails_actiontime]  DEFAULT (getdate()) FOR [actiontime]
END


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rpt].[tbltestautopausedetails_history]') AND type in (N'U'))
BEGIN
    CREATE TABLE [rpt].[tbltestautopausedetails_history]
    (
        [id] [bigint] IDENTITY(1,1) NOT NULL,
        [testpausedetailid] [bigint] ,
        [scheduleusercode] [varchar](500) ,
        [partnerintegrationid] [bigint] ,
        [orgid] [bigint] ,
        [attemptid] [bigint] ,
        [proctorid] [bigint] ,
        [actiontype] [int] ,
        [actiontime] [DATETIME] ,
        [createddate] [DATETIME] ,
        [modifieddate] [DATETIME] ,
        [modifiedby] [bigint] ,
        [isdeleted] [int] NOT NULL,
        CONSTRAINT [PK_tbltestautopausedetails_history] PRIMARY KEY CLUSTERED ([id] ASC),
        CONSTRAINT [FK_tbltestautopausedetails_history_tbltestautopausedetails] FOREIGN KEY ([testpausedetailid])
            REFERENCES [rpt].[tbltestautopausedetails] ([id])
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    ) ON [PRIMARY]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_history_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails_history] ADD  CONSTRAINT [DF_tbltestautopausedetails_history_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_history_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails_history] ADD  CONSTRAINT [DF_tbltestautopausedetails_history_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_history_modifieddate' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails_history] ADD  CONSTRAINT [DF_tbltestautopausedetails_history_modifieddate]  DEFAULT (getdate()) FOR [modifieddate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestautopausedetails_history_actiontime' AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN 
ALTER TABLE [rpt].[tbltestautopausedetails_history] ADD  CONSTRAINT [DF_tbltestautopausedetails_history_actiontime]  DEFAULT (getdate()) FOR [actiontime]
END

--11-07-2024
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Hms')
BEGIN
    EXEC('CREATE SCHEMA [Hms]')
END
Go




IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Accesskey' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration  ADD Accesskey NVARCHAR(MAX)
end
go

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Secretkey' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration  ADD Secretkey NVARCHAR(MAX)
end
go

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Region' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration  ADD Region NVARCHAR(MAX)
END 
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblorganisationconfiguration_AutomatedProctoringImage' 
AND OBJECT_NAME(Parent_Object_Id)='tblorganisationconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblorganisationconfiguration  ADD  CONSTRAINT DF_tblorganisationconfiguration_AutomatedProctoringImage   DEFAULT ((0)) FOR AutomatedProctoringImage 
END 
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblorganisationconfiguration_AgumatedProctoringImage' 
AND OBJECT_NAME(Parent_Object_Id)='tblorganisationconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
begin
ALTER TABLE RPT.tblorganisationconfiguration  ADD  CONSTRAINT DF_tblorganisationconfiguration_AgumatedProctoringImage   DEFAULT ((0)) FOR AgumatedProctoringImage 
END 
GO 


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AutomatedProctoringImage' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblorganisationconfiguration   ADD AutomatedProctoringImage BIT
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AgumatedProctoringImage' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblorganisationconfiguration   ADD AgumatedProctoringImage BIT
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowedWarning' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration   ADD       AllowedWarning  INT NULL         
END 
GO


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowedHighflag' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration   ADD AllowedHighflag  INT NULL
END 
GO


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowedMediumflag' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration   ADD  AllowedMediumflag  INT NULL
END 
GO


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowedLowflag' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration   ADD AllowedLowflag  INT NULL
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowedTotalflag' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration   ADD AllowedTotalflag  INT NULL
END 
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblproctorNotes' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE RPT.tblproctorNotes (
	Id  bigint  IDENTITY(1,1) NOT NULL,
	partnerintegrationid  bigint  NULL,
	proctorNotes  nvarchar (max) NULL,
	attemptId  bigint  NULL,
	proctorid  bigint  NULL,
	OrganizationId  bigint  NULL,
	createdby  bigint  NULL,
	createddate  datetime  NULL,
	modifiedby  bigint  NULL,
	modifieddate  datetime  NULL,
	isdeleted  numeric (1, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	Id  ASC
)
) 
END 
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblproctorNotes_createddate' 
AND OBJECT_NAME(Parent_Object_Id)='tblproctorNotes' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblproctorNotes  ADD CONSTRAINT DF_tblproctorNotes_createddate    DEFAULT (getutcdate()) FOR createddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblproctorNotes_isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblproctorNotes' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblproctorNotes  ADD  CONSTRAINT DF_tblproctorNotes_isdeleted  DEFAULT ((0)) FOR isdeleted 
END 
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblProctorSwitchLog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	CREATE TABLE RPT.tblProctorSwitchLog (
		ID  bigint  IDENTITY(1,1) NOT NULL,
		ProctorID  bigint  NULL,
		ProctorName  nvarchar (200) NULL,
		AvailID  bigint  NULL,
		CreatedDate  datetime  NULL,
		ModifiedDate  datetime  NULL,
		IsDeleted  bit  NULL,
		TaggedProctor  nvarchar (200) NULL,
		TaggedProctorAvail  bigint  NULL,
	PRIMARY KEY CLUSTERED 
	(
		ID  ASC
	)
	) 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblProctorSwitchLog_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorSwitchLog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblProctorSwitchLog  ADD  CONSTRAINT DF_tblProctorSwitchLog_CreatedDate   DEFAULT (getutcdate()) FOR CreatedDate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblProctorSwitchLog_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblProctorSwitchLog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblProctorSwitchLog  ADD  CONSTRAINT DF_tblProctorSwitchLog_IsDeleted   DEFAULT ((0)) FOR IsDeleted 
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'OrgCode' AND Object_ID = Object_ID(N'stream.StreamUserDetails'))
BEGIN
	ALTER TABLE stream.StreamUserDetails   ADD OrgCode VARCHAR(300)
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'UserCode' AND Object_ID = Object_ID(N'stream.StreamUserDetails'))
BEGIN
	ALTER TABLE stream.StreamUserDetails   ADD UserCode VARCHAR(300)
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'HmsUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	CREATE TABLE Hms.HmsUserDetails (
		HmsUserDetailsId  bigint  IDENTITY(1,1) NOT NULL,
		IntegrationUserId  bigint  NULL,
		PartnerIntegrationId  varchar (500) NULL,
		AttemptId  bigint  NULL,
		RoleId  smallint  NULL,
		Extension1  varchar (max) NULL,
		Extension2  varchar (max) NULL,
		Extension3  varchar (max) NULL,
		CreatedDate  datetime  NULL,
		ModifiedDate  datetime  NULL,
		ModifiedBy  bigint  NULL,
		Isdeleted  int  NOT NULL,
		UserCode  varchar (300) NULL,
		OrgCode  varchar (300) NULL,
	 CONSTRAINT PK_HmsUserDetails  PRIMARY KEY CLUSTERED 
	(
		HmsUserDetailsId  ASC
	)
	) 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'RoomVideoDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
CREATE TABLE [Zoom].[RoomVideoDetails](
	[RoomVideoDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[SessionName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomVideoDetailsId] ASC
)
) 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'RoomVideoDetailsHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
CREATE TABLE [Zoom].[RoomVideoDetailsHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttemptId] [bigint] NULL,
	[PartnerIntegrationID] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[SessionName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsUserDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='HmsUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsUserDetails  ADD  CONSTRAINT DF_HmsUserDetails_CreatedDate   DEFAULT (getdate()) FOR CreatedDate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsUserDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='HmsUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsUserDetails  ADD  CONSTRAINT DF_HmsUserDetails_Isdeleted   DEFAULT ((0)) FOR Isdeleted 
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Usercode' AND Object_ID = Object_ID(N'rpt.tblScheduleUser'))
BEGIN
	ALTER TABLE rpt.tblScheduleUser   ADD Usercode NVARCHAR(100)
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'OrgCode' AND Object_ID = Object_ID(N'stream.StreamUserDetails '))
BEGIN
	ALTER TABLE stream.StreamUserDetails   ADD OrgCode VARCHAR(300)
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'UserCode' AND Object_ID = Object_ID(N'stream.StreamUserDetails '))
BEGIN
	ALTER TABLE stream.StreamUserDetails   ADD UserCode VARCHAR(300)
END 
GO 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_zoomVideoCodesHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='RoomVideoDetailsHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'zoom')
BEGIN
	ALTER TABLE zoom.RoomVideoDetailsHistory  ADD  CONSTRAINT DF_zoomVideoCodesHistory_CreatedDate   DEFAULT (getutcdate()) FOR CreatedDate 
END 
GO 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_zoomVideoDetailsHistory_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='RoomVideoDetailsHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'zoom')
BEGIN
	ALTER TABLE zoom.RoomVideoDetailsHistory  ADD  CONSTRAINT DF_zoomVideoDetailsHistory_Isdeleted   DEFAULT ((0)) FOR IsDeleted 
END 
GO 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_ZoomVideoCodes_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='RoomVideoDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'zoom')
BEGIN
	ALTER TABLE Zoom.RoomVideoDetails  ADD  CONSTRAINT DF_ZoomVideoCodes_CreatedDate   DEFAULT (getutcdate()) FOR CreatedDate 
END 
GO 

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_ZoomVideoDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='RoomVideoDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'zoom')
BEGIN
ALTER TABLE Zoom.RoomVideoDetails  ADD  CONSTRAINT DF_ZoomVideoDetails_Isdeleted   DEFAULT ((0)) FOR IsDeleted 
END 
GO 


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'HmsSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	CREATE TABLE Hms.HmsSessionDetails (
		HmsSessionDetailsId  bigint  IDENTITY(1,1) NOT NULL,
		HmsUserDetailsId  bigint  NULL,
		RoomId  varchar (max) NULL,
		SessionId  varchar (max) NULL,
		PeerId  varchar (max) NULL,
		Extension1  bigint  NULL,
		Extension2  varchar (max) NULL,
		Extension3  varchar (max) NULL,
		CreatedDate  datetime  NULL,
		ModifiedDate  datetime  NULL,
		ModifiedBy  bigint  NULL,
		Isdeleted  int  NOT NULL,
		UserVideoCode  varchar (max) NULL,
		ScreenVideoCode  varchar (max) NULL,
	 CONSTRAINT PK_HmsSessionDetails  PRIMARY KEY CLUSTERED 
	(
		HmsSessionDetailsId  ASC
	) 
	)   
	END 
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsSessionDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='HmsSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsSessionDetails  ADD  CONSTRAINT DF_HmsSessionDetails_CreatedDate   DEFAULT (getdate()) FOR CreatedDate 
END 
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsSessionDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='HmsSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsSessionDetails  ADD  CONSTRAINT DF_HmsSessionDetails_Isdeleted   DEFAULT ((0)) FOR Isdeleted 
END 
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'HmsRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	CREATE TABLE Hms.HmsRoleTypeMaster (
		HmsRoleTypeMasterId  bigint  IDENTITY(1,1) NOT NULL,
		RoleId  bigint  NULL,
		RoleName  varchar (500) NULL,
		Extension1  bigint  NULL,
		Extension2  varchar (max) NULL,
		Extension3  varchar (max) NULL,
		CreatedDate  datetime  NULL,
		ModifiedDate  datetime  NULL,
		ModifiedBy  bigint  NULL,
		Isdeleted  int  NOT NULL,
	 CONSTRAINT PK_HmsRoleTypeMaster  PRIMARY KEY CLUSTERED 
	(
		HmsRoleTypeMasterId  ASC
	) 
	)   
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsRoleTypeMaster_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='HmsRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsRoleTypeMaster  ADD  CONSTRAINT DF_HmsRoleTypeMaster_CreatedDate   DEFAULT (getdate()) FOR CreatedDate 
END 
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsRoleTypeMaster_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='HmsRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsRoleTypeMaster  ADD  CONSTRAINT DF_HmsRoleTypeMaster_Isdeleted   DEFAULT ((0)) FOR Isdeleted 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'HmsChatDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	CREATE TABLE Hms.HmsChatDetails (
		HmsChatDetailsId  bigint  IDENTITY(1,1) NOT NULL,
		SenderPeerID  varchar (max) NULL,
		SenderName  varchar (max) NULL,
		SenderUserID  bigint  NULL,
		Roles  varchar (max) NULL,
		MessageSentAt  datetime  NULL,
		Type  varchar (max) NULL,
		ChatMessage  nvarchar (max) NULL,
		MessageID  varchar (max) NULL,
		CreatedDate  datetime  NULL,
		CreatedBy  bigint  NULL,
		ModifiedDate  datetime  NULL,
		ModifiedBy  bigint  NULL,
		IsDeleted  bit  NULL,
		Extension1  varchar (max) NULL,
		Extension2  varchar (max) NULL,
		Extension3  varchar (max) NULL,
	 CONSTRAINT PK_HmsChatDetails  PRIMARY KEY CLUSTERED 
	(
		HmsChatDetailsId  ASC
	) 
	)   
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsChatDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='HmsChatDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsChatDetails  ADD  CONSTRAINT DF_HmsChatDetails_CreatedDate   DEFAULT (getdate()) FOR CreatedDate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsChatDetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='HmsChatDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	ALTER TABLE Hms.HmsChatDetails  ADD  CONSTRAINT DF_HmsChatDetails_IsDeleted   DEFAULT ((0)) FOR IsDeleted 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'HmsAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms')
BEGIN
	CREATE TABLE Hms.HmsAuditLogs (
		HmsAuditLogsId  bigint  IDENTITY(1,1) NOT NULL,
		PartnerIntegrationId  bigint  NULL,
		AttemptId  bigint  NULL,
		RoomId  varchar (max) NULL,
		SessionId  varchar (max) NULL,
		EventType  varchar (max) NULL,
		EventDescription  varchar (max) NULL,
		CreatedDate  datetime  NULL,
		CreatedBy  bigint  NULL,
		ModifiedDate  datetime  NULL,
		ModifiedBy  bigint  NULL,
		IsDeleted  bit  NULL,
		Extension1  varchar (max) NULL,
		Extension2  varchar (max) NULL,
		Extension3  varchar (max) NULL,
	 CONSTRAINT PK_HmsAuditLogs  PRIMARY KEY CLUSTERED 
	(
		HmsAuditLogsId  ASC
	) 
	)   
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsAuditLogs_CreatedDate ' 
AND OBJECT_NAME(Parent_Object_Id)='HmsAuditLogs ' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms ')
BEGIN
	ALTER TABLE Hms.HmsAuditLogs  ADD  CONSTRAINT DF_HmsAuditLogs_CreatedDate   DEFAULT (getdate()) FOR CreatedDate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsAuditLogs_Isdeleted ' 
AND OBJECT_NAME(Parent_Object_Id)='HmsAuditLogs ' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms ')
BEGIN
	ALTER TABLE Hms.HmsAuditLogs  ADD  CONSTRAINT DF_HmsAuditLogs_Isdeleted   DEFAULT ((0)) FOR IsDeleted 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'HmsErrorLogs ' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms ')
BEGIN
	CREATE TABLE Hms.HmsErrorLogs (
		HmsErrorLogsId  bigint  IDENTITY(1,1) NOT NULL,
		PartnerIntegrationId  bigint  NULL,
		AttemptId  bigint  NULL,
		RoomId  varchar (max) NULL,
		SessionId  varchar (max) NULL,
		ErrorCode  varchar (max) NULL,
		ErrorDetails  varchar (max) NULL,
		Description  varchar (max) NULL,
		CreatedDate  datetime  NULL,
		CreatedBy  bigint  NULL,
		ModifiedDate  datetime  NULL,
		ModifiedBy  bigint  NULL,
		IsDeleted  bit  NULL,
		Extension1  varchar (max) NULL,
		Extension2  varchar (max) NULL,
		Extension3  varchar (max) NULL,
	 CONSTRAINT PK_HmsErrorLogs  PRIMARY KEY CLUSTERED 
	(
		HmsErrorLogsId  ASC
	) 
	)   
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_HmsErrorLogs_Isdeleted ' 
AND OBJECT_NAME(Parent_Object_Id)='HmsErrorLogs ' AND SCHEMA_NAME(SCHEMA_ID) = 'Hms ')
BEGIN
	ALTER TABLE Hms.HmsErrorLogs  ADD  CONSTRAINT DF_HmsErrorLogs_Isdeleted   DEFAULT ((0)) FOR IsDeleted 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	CREATE TABLE RPT.tbltestautopausedetails_history (
		id  bigint  IDENTITY(1,1) NOT NULL,
		testpausedetailid  bigint  NULL,
		scheduleusercode  varchar (500) NULL,
		partnerintegrationid  bigint  NULL,
		orgid  bigint  NULL,
		attemptid  bigint  NULL,
		proctorid  bigint  NULL,
		actiontype  int  NULL,
		actiontime  datetime  NULL,
		createddate  datetime  NULL,
		modifieddate  datetime  NULL,
		modifiedby  bigint  NULL,
		isdeleted  int  NOT NULL,
	 CONSTRAINT PK_tbltestautopausedetails_history  PRIMARY KEY CLUSTERED 
	(
		id  ASC
	) 
	)  
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_history_actiontime ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails_history  ADD  CONSTRAINT DF_tbltestautopausedetails_history_actiontime   DEFAULT (getdate()) FOR actiontime 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_history_CreatedDate ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails_history  ADD  CONSTRAINT DF_tbltestautopausedetails_history_CreatedDate   DEFAULT (getdate()) FOR createddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_history_modifieddate ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails_history  ADD  CONSTRAINT DF_tbltestautopausedetails_history_modifieddate   DEFAULT (getdate()) FOR modifieddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_history_Isdeleted ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails_history  ADD  CONSTRAINT DF_tbltestautopausedetails_history_Isdeleted   DEFAULT ((0)) FOR isdeleted 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE Name ='FK_tbltestautopausedetails_history_tbltestautopausedetails '
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails_history   WITH CHECK ADD  CONSTRAINT FK_tbltestautopausedetails_history_tbltestautopausedetails  FOREIGN KEY(testpausedetailid )
	REFERENCES RPT.tbltestautopausedetails  (id )
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE Name ='FK_tbltestautopausedetails_history_tbltestautopausedetails '
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails_history ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails_history  CHECK CONSTRAINT FK_tbltestautopausedetails_history_tbltestautopausedetails 
END 
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tbltestautopausedetails ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	CREATE TABLE RPT.tbltestautopausedetails (
		id  bigint  IDENTITY(1,1) NOT NULL,
		scheduleusercode  varchar (500) NULL,
		partnerintegrationid  bigint  NULL,
		orgid  bigint  NULL,
		attemptid  bigint  NULL,
		proctorid  bigint  NULL,
		actiontype  int  NULL,
		actiontime  datetime  NULL,
		createddate  datetime  NULL,
		modifieddate  datetime  NULL,
		modifiedby  bigint  NULL,
		isdeleted  int  NOT NULL,
	 CONSTRAINT PK_tbltestautopausedetails  PRIMARY KEY CLUSTERED 
	(
		id  ASC
	) 
	)  
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_actiontime ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails  ADD  CONSTRAINT DF_tbltestautopausedetails_actiontime   DEFAULT (getdate()) FOR actiontime 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_CreatedDate ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails  ADD  CONSTRAINT DF_tbltestautopausedetails_CreatedDate   DEFAULT (getdate()) FOR createddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_modifieddate ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails  ADD  CONSTRAINT DF_tbltestautopausedetails_modifieddate   DEFAULT (getdate()) FOR modifieddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestautopausedetails_Isdeleted ' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestautopausedetails ' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT ')
BEGIN
	ALTER TABLE RPT.tbltestautopausedetails  ADD  CONSTRAINT DF_tbltestautopausedetails_Isdeleted   DEFAULT ((0)) FOR isdeleted 
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TAN_firstname' AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
	ALTER TABLE rpt.tblusers  ADD TAN_firstname NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TAN_lastname' AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
	ALTER TABLE rpt.tblusers  ADD TAN_lastname NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TAN_loginname' AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
	ALTER TABLE rpt.tblusers  ADD TAN_loginname NVARCHAR(200)
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblautopausedhistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	CREATE TABLE RPT.tblautopausedhistory (
		historyid  bigint  IDENTITY(1,1) NOT NULL,
		autopausedid  bigint  NULL,
		proctorid  bigint  NULL,
		pid  bigint  NULL,
		scheduleusercode  varchar (200) NULL,
		attemptid  bigint  NULL,
		status  int  NULL,
		createddate  datetime2 (7) NULL,
		modifiedby  bigint  NULL,
		modifieddate  datetime2 (7) NULL,
		IsDeleted  bit  NOT NULL,
	 CONSTRAINT PK_tblautopausedhistory  PRIMARY KEY CLUSTERED 
	(
		historyid  ASC
	) 
	)  
END
	GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblautopausedhistory_createddate' 
AND OBJECT_NAME(Parent_Object_Id)='tblautopausedhistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE RPT.tblautopausedhistory  ADD  CONSTRAINT DF_tblautopausedhistory_createddate   DEFAULT (getutcdate()) FOR createddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblautopausedhistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblautopausedhistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE RPT.tblautopausedhistory  ADD CONSTRAINT DF_tblautopausedhistory_IsDeleted  DEFAULT ((0)) FOR IsDeleted 
END
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblautopaused' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	CREATE TABLE RPT.tblautopaused (
		id  bigint  IDENTITY(1,1) NOT NULL,
		pid  bigint  NULL,
		scheduleusercode  varchar (200) NULL,
		attemptid  bigint  NULL,
		status  int  NULL,
		createddate  datetime  NULL,
		modifiedby  bigint  NULL,
		modifieddate  datetime  NULL,
		IsDeleted  bit  NOT NULL,
	 CONSTRAINT PK_tblautopaused  PRIMARY KEY CLUSTERED 
	(
		id  ASC
	) 
	)  
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblautopaused_createddate' 
AND OBJECT_NAME(Parent_Object_Id)='tblautopaused' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE RPT.tblautopaused  ADD CONSTRAINT DF_tblautopaused_createddate  DEFAULT (getutcdate()) FOR createddate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblautopaused_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblautopaused' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE RPT.tblautopaused  ADD CONSTRAINT DF_tblautopaused_IsDeleted  DEFAULT ((0)) FOR IsDeleted 
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblSubmissionQueue_ScreeStatus' 
AND OBJECT_NAME(Parent_Object_Id)='tblSubmissionQueue' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE RPT.tblSubmissionQueue ADD  CONSTRAINT DF_tblSubmissionQueue_ScreeStatus   DEFAULT ((0)) FOR ScreenStatus 
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ScreenStatus' AND Object_ID = Object_ID(N'rpt.tblsubmissionqueue'))
BEGIN
	Alter table rpt.tblsubmissionqueue  ADD  ScreenStatus Smallint
END
GO


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ScreenMessage' AND Object_ID = Object_ID(N'rpt.tblsubmissionqueue'))
BEGIN
	Alter table rpt.tblsubmissionqueue  ADD  ScreenMessage Varchar(100)
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblScreenJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	CREATE TABLE RPT.tblScreenJSONHistory (
		HistoryId  bigint  IDENTITY(1,1) NOT NULL,
		AuditSummaryID  bigint  NOT NULL,
		ReviewJSON  nvarchar (max) NOT NULL,
		CreatedDate  datetime2 (3) NOT NULL,
		IsDeleted  bit  NULL,
	 CONSTRAINT PK_tblScreenJSONHistory  PRIMARY KEY CLUSTERED 
	(
		HistoryId  ASC
	) 
	)   
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSONHistory_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSONHistory  ADD  CONSTRAINT DF_tblScreenJSONHistory_CreatedDate   DEFAULT (getutcdate()) FOR CreatedDate 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSONHistory_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSONHistory  ADD CONSTRAINT DF_tblScreenJSONHistory_IsDeleted   DEFAULT ((0)) FOR IsDeleted 
END
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	CREATE TABLE RPT.tblScreenJSON (
		ScreenJSONId  bigint  IDENTITY(1,1) NOT NULL,
		AttemptId  bigint  NOT NULL,
		ScreenJSON  nvarchar (max) NOT NULL,
		TotalFrames  int  NOT NULL,
		DetectedFrames  int  NOT NULL,
		AnalysisDuration  bigint  NOT NULL,
		CreatedDate  datetime2 (3) NOT NULL,
		UpdatedDate  datetime2 (3) NULL,
		IsDeleted  bit  NULL,
		Screensize  nvarchar (max) NULL,
		Screenlength  nvarchar (max) NULL,
		desktopScreenlength  nvarchar (max) NULL,
		desktopScreensize  nvarchar (max) NULL,
		highcount  int  NULL,
		mediumcount  int  NULL,
		lowcount  int  NULL,
		FaceCount  int  NULL,
		ScreenVideoSize_S3  nvarchar (max) NULL,
		MainVideoSize_S3  nvarchar (max) NULL,
	 CONSTRAINT PK_tblScreenJSON  PRIMARY KEY CLUSTERED 
	(
		ScreenJSONId  ASC
	) 
	)   
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSON_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSON  ADD  CONSTRAINT DF_tblScreenJSON_CreatedDate   DEFAULT (getutcdate()) FOR CreatedDate 
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSON_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSON  ADD  CONSTRAINT DF_tblScreenJSON_IsDeleted  DEFAULT ((0)) FOR IsDeleted 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSON_highcount' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSON  ADD  CONSTRAINT DF_tblScreenJSON_highcount   DEFAULT ((0)) FOR highcount 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSON_mediumcount' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSON  ADD  CONSTRAINT DF_tblScreenJSON_mediumcount   DEFAULT ((0)) FOR mediumcount 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tblScreenJSON_lowcount' 
AND OBJECT_NAME(Parent_Object_Id)='tblScreenJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblScreenJSON  ADD  CONSTRAINT DF_tblScreenJSON_lowcount   DEFAULT ((0)) FOR lowcount 
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestconfiguration_AutomatedProctoringImage' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblTestConfiguration  ADD  CONSTRAINT DF_tbltestconfiguration_AutomatedProctoringImage   DEFAULT ((0)) FOR AutomatedProctoringImage 
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE Name ='DF_tbltestconfiguration_AgumatedProctoringImage' 
AND OBJECT_NAME(Parent_Object_Id)='tblTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblTestConfiguration  ADD  CONSTRAINT DF_tbltestconfiguration_AgumatedProctoringImage   DEFAULT ((0)) FOR AgumatedProctoringImage 
END
GO


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AutomatedProctoringImage' AND Object_ID = Object_ID(N'rpt.tbltestconfiguration'))
BEGIN
	ALTER TABLE rpt.tbltestconfiguration   ADD AutomatedProctoringImage BIT
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AgumatedProctoringImage' AND Object_ID = Object_ID(N'rpt.tbltestconfiguration'))
BEGIN
	ALTER TABLE rpt.tbltestconfiguration   ADD AgumatedProctoringImage BIT
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'organizationid' AND Object_ID = Object_ID(N'rpt.tbltestpausedetails'))
BEGIN
	ALTER TABLE rpt.tbltestpausedetails   ADD organizationid BIGINT
END
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tbltestpausedetailshistory' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	CREATE TABLE RPT.tbltestpausedetailshistory (
		historyid  int  IDENTITY(1,1) NOT NULL,
		testpausedetailid  bigint  NULL,
		pid  bigint  NULL,
		attemptid  bigint  NULL,
		proctorid  bigint  NULL,
		pausedtime  datetime  NULL,
		endtime  datetime  NULL,
		ispaused  numeric (18, 0) NULL,
		pausedduration  int  NULL,
		organizationid  bigint  NULL,
	PRIMARY KEY CLUSTERED 
	(
		historyid  ASC
	) 
	)  
END
GO


/****** Object:  UserDefinedTableType RPP.UserEncryptedDetailsType     Script Date: 11-07-2024 11:56:00 ******/
IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'UserEncryptedDetailsType' AND schema_id = SCHEMA_ID('RPP'))
BEGIN
CREATE TYPE RPP.UserEncryptedDetailsType  AS TABLE(
	UserID  bigint  NULL,
	UserName  nvarchar (500) NULL,
	FirstName  nvarchar (500) NULL,
	LastName  nvarchar (500) NULL,
	EmailID  nvarchar (1000) NULL,
	PhoneNumber  nvarchar (500) NULL
)
END
GO

/****** Object:  UserDefinedTableType dbo.UDTScheduleUsersForTP     Script Date: 11-07-2024 11:57:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'UDTScheduleUsersForTP' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
CREATE TYPE dbo.UDTScheduleUsersForTP  AS TABLE(
	ID  bigint  NULL,
	UserCode  nvarchar (200) NULL,
	ScheduleCode  nvarchar (100) NULL,
	ScheduleUserCode  nvarchar (100) NULL,
	AssessmentCode  nvarchar (100) NULL,
	Organizationcode  nvarchar (100) NULL,
	LoginName  nvarchar (200) NULL,
	FirstName  nvarchar (200) NULL,
	LastName  nvarchar (200) NULL,
	ProfilePhotoPath  nvarchar (max) NULL
)
END
GO
/****** Object:  UserDefinedTableType RPT.ScheduleDetailsForTP     Script Date: 11-07-2024 11:58:30 ******/
IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'ScheduleDetailsForTP' AND schema_id = SCHEMA_ID('RPT'))
BEGIN
CREATE TYPE RPT.ScheduleDetailsForTP  AS TABLE(
	ID  bigint  NOT NULL,
	ScheduleCode  nvarchar (100) NULL,
	ScheduleName  nvarchar (100) NULL,
	ScheduleUserCode  nvarchar (100) NULL,
	StartDateTime  datetime  NULL,
	EndDateTime  datetime  NULL,
	AsessmentCode  nvarchar (100) NULL,
	AssesmentName  nvarchar (200) NULL,
	AssessmentInstruction  nvarchar (1000) NULL,
	ExamMaximumMarks  int  NULL,
	OrgazationCode  nvarchar (100) NULL,
	UserCode  nvarchar (200) NULL,
	LoginName  nvarchar (200) NULL,
	FirstName  nvarchar (200) NULL,
	LastName  nvarchar (200) NULL,
	ProfilePhotoPath  nvarchar (max) NULL,
	ProctoringType  int  NULL,
	IsLiveModeRequired  bit  NULL,
	IsImageModeRequired  bit  NULL,
	IsReviewerModeRequired  bit  NULL,
	IsPhotoComparionRequired_Student  bit  NULL,
	IsPhotoComparionRequired_Proctor  bit  NULL,
	PhotoComparisonType  int  NULL,
	IsCandidateRoomVideoRequired  bit  NULL,
	IsSecureBrowserExam  bit  NULL,
	SecureBrowserExamType  int  NULL,
	IsSecondaryCameraRequired  bit  NULL,
	IsAudioAnalysisRequired  bit  NULL,
	IsChatFeatureRequired_Live  bit  NULL,
	IsSecondaryCameraAnalysisRequired_Live  bit  NULL,
	IsScreenRecordingRequired_Live  bit  NULL,
	RecordingType_Live  int  NULL,
	IsSecondaryCameraAnalysisRequired_RecordReview  bit  NULL,
	IsScreenRecordingRequired_RecordReview  bit  NULL,
	RecordingType_RecordReview  int  NULL,
	PhotoCaptureInterval_ImageMode  int  NULL,
	IsImageModeAnalysisRequired  int  NULL,
	IsFMMCountRequired  bit  NULL,
	IsHMMCountRequired  bit  NULL,
	IscorrectFlag  bit  NULL,
	Createdby  bigint  NULL
)
END
GO


/****** Object:  UserDefinedTableType [RPP].[UserEncryptedDetailsType]    Script Date: 11-07-2024 11:56:00 ******/
IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'UserEncryptedDetailsType' AND schema_id = SCHEMA_ID('RPP'))
BEGIN
CREATE TYPE [RPP].[UserEncryptedDetailsType] AS TABLE(
	[UserID] [bigint] NULL,
	[UserName] [nvarchar](500) NULL,
	[FirstName] [nvarchar](500) NULL,
	[LastName] [nvarchar](500) NULL,
	[EmailID] [nvarchar](1000) NULL,
	[PhoneNumber] [nvarchar](500) NULL
)
END
GO

/****** Object:  UserDefinedTableType [dbo].[UDTScheduleUsersForTP]    Script Date: 11-07-2024 11:57:56 ******/
IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'UDTScheduleUsersForTP' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
CREATE TYPE [dbo].[UDTScheduleUsersForTP] AS TABLE(
	[ID] [bigint] NULL,
	[UserCode] [nvarchar](200) NULL,
	[ScheduleCode] [nvarchar](100) NULL,
	[ScheduleUserCode] [nvarchar](100) NULL,
	[AssessmentCode] [nvarchar](100) NULL,
	[Organizationcode] [nvarchar](100) NULL,
	[LoginName] [nvarchar](200) NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[ProfilePhotoPath] [nvarchar](max) NULL
)
END
GO
/****** Object:  UserDefinedTableType [RPT].[ScheduleDetailsForTP]    Script Date: 11-07-2024 11:58:30 ******/
IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'ScheduleDetailsForTP' AND schema_id = SCHEMA_ID('RPT'))
BEGIN
CREATE TYPE [RPT].[ScheduleDetailsForTP] AS TABLE(
	[ID] [bigint] NOT NULL,
	[ScheduleCode] [nvarchar](100) NULL,
	[ScheduleName] [nvarchar](100) NULL,
	[ScheduleUserCode] [nvarchar](100) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[AsessmentCode] [nvarchar](100) NULL,
	[AssesmentName] [nvarchar](200) NULL,
	[AssessmentInstruction] [nvarchar](1000) NULL,
	[ExamMaximumMarks] [int] NULL,
	[OrgazationCode] [nvarchar](100) NULL,
	[UserCode] [nvarchar](200) NULL,
	[LoginName] [nvarchar](200) NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[ProfilePhotoPath] [nvarchar](max) NULL,
	[ProctoringType] [int] NULL,
	[IsLiveModeRequired] [bit] NULL,
	[IsImageModeRequired] [bit] NULL,
	[IsReviewerModeRequired] [bit] NULL,
	[IsPhotoComparionRequired_Student] [bit] NULL,
	[IsPhotoComparionRequired_Proctor] [bit] NULL,
	[PhotoComparisonType] [int] NULL,
	[IsCandidateRoomVideoRequired] [bit] NULL,
	[IsSecureBrowserExam] [bit] NULL,
	[SecureBrowserExamType] [int] NULL,
	[IsSecondaryCameraRequired] [bit] NULL,
	[IsAudioAnalysisRequired] [bit] NULL,
	[IsChatFeatureRequired_Live] [bit] NULL,
	[IsSecondaryCameraAnalysisRequired_Live] [bit] NULL,
	[IsScreenRecordingRequired_Live] [bit] NULL,
	[RecordingType_Live] [int] NULL,
	[IsSecondaryCameraAnalysisRequired_RecordReview] [bit] NULL,
	[IsScreenRecordingRequired_RecordReview] [bit] NULL,
	[RecordingType_RecordReview] [int] NULL,
	[PhotoCaptureInterval_ImageMode] [int] NULL,
	[IsImageModeAnalysisRequired] [int] NULL,
	[IsFMMCountRequired] [bit] NULL,
	[IsHMMCountRequired] [bit] NULL,
	[IscorrectFlag] [bit] NULL,
	[Createdby] [bigint] NULL
)
END
GO

--16-07-2024
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblvoidcases](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[voidCase] [nvarchar](200) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Isdeleted] [bit] NULL,
	[VCode] [nvarchar](100) NULL,
	[voidcaseType] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblvoidcases] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblvoidcases_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvoidcases] ADD  CONSTRAINT [DF_tblvoidcases_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblvoidcases_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblvoidcases' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblvoidcases] ADD  CONSTRAINT [DF_tblvoidcases_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END
GO

18-07-2024
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'Notifications_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
CREATE TABLE [dbo].[Notifications_Archive](
	[ArchiveID] [bigint] IDENTITY(1,1) NOT NULL,
	[NotificationID] [bigint] NULL,
	[NotificationSubject] [nvarchar](200) NULL,
	[NotificationDescription] [nvarchar](2000) NULL,
	[ScheduleID] [bigint] NULL,
	[TestDetailId] [bigint] NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[TestNameInformationId] [bigint] NULL,
	[UserID] [bigint] NULL,
	[UserName] [nvarchar](1000) NULL,
	[CreatedBy] [bigint] NULL,
	[ScheduleStartDate] [datetime] NULL,
	[ScheduleEndDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsRead] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[UserNotificationType] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ArchiveDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Notifications_Archive] PRIMARY KEY CLUSTERED 
(
	[ArchiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF__Notifications_Archive_createddate' 
AND OBJECT_NAME(Parent_Object_Id)='Notifications_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
	ALTER TABLE [dbo].[Notifications_Archive] ADD  CONSTRAINT [DF__Notifications_Archive_createddate]  DEFAULT (getutcdate()) FOR [ArchiveDate]
END
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Notifications_archive_IsDelete' 
AND OBJECT_NAME(Parent_Object_Id)='Notifications_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN
	ALTER TABLE [dbo].[Notifications_Archive] ADD  CONSTRAINT [DF_Notifications_archive_IsDelete]  DEFAULT ((0)) FOR [IsDeleted]
END
GO




IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	CREATE TABLE [RPT].[UserActivity](
		[UserActivityID] [bigint] IDENTITY(1,1) NOT NULL,
		[ApplicationID] [int] NOT NULL,
		[OrganizationID] [int] NULL,
		[WorkSpaceID] [bigint] NULL,
		[UserID] [bigint] NOT NULL,
		[ModuleID] [int] NOT NULL,
		[PageID] [int] NOT NULL,
		[EventID] [int] NOT NULL,
		[AssetID] [bigint] NULL,
		[SessionID] [nvarchar](max) NULL,
		[ClientIP] [nvarchar](50) NULL,
		[StartTime] [datetime] NOT NULL,
		[EndTime] [datetime] NOT NULL,
		[UserAgent] [nvarchar](50) NULL,
		[URLReferrer] [nvarchar](512) NULL,
		[UserLanguage] [nvarchar](50) NULL,
		[ExtraInformation] [nvarchar](1024) NULL,
		[IsDeleted] [bit] NOT NULL,
		[CreatedBy] [bigint] NULL,
		[CreatedDate] [datetime] NULL,
		[ModifiedBy] [bigint] NULL,
		[ModifiedDate] [datetime] NULL,
		[SyncID] [bigint] NULL,
		[Partnerintegrationid] [bigint] NULL,
	 CONSTRAINT [PK_UserActivity] PRIMARY KEY CLUSTERED 
	(
		[UserActivityID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserActivity_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE [RPT].[UserActivity] ADD  CONSTRAINT [DF_UserActivity_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_UserActivity_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
	ALTER TABLE [RPT].[UserActivity] ADD  CONSTRAINT [DF_UserActivity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'UnAllocatedBy' AND Object_ID = Object_ID(N'RPT.tblUnallocatedUserLog'))
BEGIN
	ALTER TABLE RPT.tblUnallocatedUserLog   ADD UnAllocatedBy BIGINT
END




IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamUserDetails](
	[StreamUserDetailsId] [bigint] IDENTITY(1,1) NOT NULL,
	[IntergrationUserId] [bigint] NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[RoleId] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [bigint] NULL,
	[Extension2] [nvarchar](max) NULL,
	[Extension3] [nvarchar](max) NULL,
	[UserCode] [varchar](300) NULL,
	[OrgCode] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamUserDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamUserDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='StreamUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	ALTER TABLE [Stream].[StreamUserDetails] ADD  CONSTRAINT [DF_StreamUserDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamUserDetail_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='StreamUserDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	ALTER TABLE [Stream].[StreamUserDetails] ADD  CONSTRAINT [DF_StreamUserDetail_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	CREATE TABLE [Stream].[StreamAuditLogs](
		[StreamAuditLogsId] [bigint] IDENTITY(1,1) NOT NULL,
		[PartnerIntegrationId] [bigint] NULL,
		[AttemptId] [bigint] NULL,
		[SessionId] [nvarchar](max) NULL,
		[EventType] [nvarchar](max) NULL,
		[EventDescription] [nvarchar](max) NULL,
		[CreatedDate] [datetime] NULL,
		[CreatedBy] [bigint] NULL,
		[ModifiedDate] [datetime] NULL,
		[ModifiedBy] [bigint] NULL,
		[IsDeleted] [bit] NULL,
		[Extension1] [nvarchar](max) NULL,
		[Extension2] [nvarchar](max) NULL,
		[Extension3] [nvarchar](max) NULL,
	PRIMARY KEY CLUSTERED 
	(
		[StreamAuditLogsId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamAuditLogs_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='StreamAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	ALTER TABLE [Stream].[StreamAuditLogs] ADD  CONSTRAINT [DF_StreamAuditLogs_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamAuditLogs_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='StreamAuditLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	ALTER TABLE [Stream].[StreamAuditLogs] ADD  CONSTRAINT [DF_StreamAuditLogs_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamErrorLogs](
	[ErrorLogsId] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerIntegrationId] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[ErrorCode] [nvarchar](max) NULL,
	[ErrorDetails] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [bigint] NULL,
	[Extension2] [nvarchar](max) NULL,
	[Extension3] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorLogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamErrorLogs_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	ALTER TABLE [Stream].[StreamErrorLogs] ADD  CONSTRAINT [DF_StreamErrorLogs_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamErrorLogs_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='StreamErrorLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
	ALTER TABLE [Stream].[StreamErrorLogs] ADD  CONSTRAINT [DF_StreamErrorLogs_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO




IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamRoleTypeMaster](
	[StreamRoleTypeMasterId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NULL,
	[RoleName] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [bigint] NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamRoleTypeMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamRoleTypeMaster_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='StreamRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamRoleTypeMaster] ADD  CONSTRAINT [DF_StreamRoleTypeMaster_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamRoleTypeMaster_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='StreamRoleTypeMaster' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamRoleTypeMaster] ADD  CONSTRAINT [DF_StreamRoleTypeMaster_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO



IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'StreamSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[StreamSessionDetails](
	[StreamSessionDetailsId] [bigint] IDENTITY(1,1) NOT NULL,
	[StreamUserDetailsId] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[UserVideoCode] [nvarchar](max) NULL,
	[ScreenVideoCode] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [varchar](max) NULL,
	[Extension3] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamSessionDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamSessionDetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='StreamSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamSessionDetails] ADD  CONSTRAINT [DF_StreamSessionDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StreamSessionDetails_Isdeleted' 
AND OBJECT_NAME(Parent_Object_Id)='StreamSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[StreamSessionDetails] ADD  CONSTRAINT [DF_StreamSessionDetails_Isdeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblApplicationSettings_tblSettingKeys_SettingKeyID]') 
AND parent_object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]'))
ALTER TABLE [RPT].[tblApplicationSettings] CHECK CONSTRAINT [FK_tblApplicationSettings_tblSettingKeys_SettingKeyID]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblApplicationSettings_tblOrganisation_OrganisationId]') 
AND parent_object_id = OBJECT_ID(N'[RPT].[tblApplicationSettings]'))
ALTER TABLE [RPT].[tblApplicationSettings] CHECK CONSTRAINT [FK_tblApplicationSettings_tblOrganisation_OrganisationId]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblUsers_UserId]') 
AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory] CHECK CONSTRAINT [FK_tblAssignmentHistory_tblUsers_UserId]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblTestAssignment_AssignmentId]') 
AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory] CHECK CONSTRAINT [FK_tblAssignmentHistory_tblTestAssignment_AssignmentId]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAssignmentHistory_tblEvents_EventId]') 
AND parent_object_id = OBJECT_ID(N'[RPT].[tblAssignmentHistory]'))
ALTER TABLE [RPT].[tblAssignmentHistory] CHECK CONSTRAINT [FK_tblAssignmentHistory_tblEvents_EventId]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAudioJSON_tblTestAttempts_TestAttemptId]') 
AND parent_object_id = OBJECT_ID(N'[RPT].[tblAudioJSON]'))
ALTER TABLE [RPT].[tblAudioJSON] CHECK CONSTRAINT [FK_tblAudioJSON_tblTestAttempts_TestAttemptId]


--

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblAudioJ__Audit__5B438874]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAudioJSONHistory]'))
ALTER TABLE [RPT].[tblAudioJSONHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID]) REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditDetails_tblAuditSummary_AuditSummaryID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditDetails]'))
ALTER TABLE [RPT].[tblAuditDetails] CHECK CONSTRAINT [FK_tblAuditDetails_tblAuditSummary_AuditSummaryID]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditSummary_tblUsers_UserID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]'))
ALTER TABLE [RPT].[tblAuditSummary] CHECK CONSTRAINT [FK_tblAuditSummary_tblUsers_UserID]




IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblAuditSummary_tblEvents_EventId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblAuditSummary]'))
ALTER TABLE [RPT].[tblAuditSummary] CHECK CONSTRAINT [FK_tblAuditSummary_tblEvents_EventId]


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblManual__Audit__5772F790]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewHistory]'))
ALTER TABLE [RPT].[tblManualReviewHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])  REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON] CHECK CONSTRAINT [FK_tblManualReviewJSON_tblUsers_UserId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON] CHECK CONSTRAINT [FK_tblManualReviewJSON_tblTestAttempts_AttemptId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblManualReviewJSON_tblTestAssignment_AssignmentId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblManualReviewJSON]'))
ALTER TABLE [RPT].[tblManualReviewJSON] CHECK CONSTRAINT [FK_tblManualReviewJSON_tblTestAssignment_AssignmentId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblOrganisation_ParentID_Organisation_Organisationid]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblOrganisation]'))
ALTER TABLE [RPT].[tblOrganisation] CHECK CONSTRAINT [FK_tblOrganisation_ParentID_Organisation_Organisationid]


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblOrgani__Defau__367C1819]') AND parent_object_id = OBJECT_ID(N'RPT.tblOrganisation'))
ALTER TABLE [RPT].[tblOrganisation]  WITH CHECK ADD FOREIGN KEY([DefaultUserId])  REFERENCES [RPT].[tblUsers] ([UserId])

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CustomerName' AND Object_ID = Object_ID(N'RPT.tblOrganisation'))
BEGIN
	ALTER TABLE RPT.tblOrganisation  ADD CustomerName NVARCHAR(200)
END


IF   EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Customerid' AND Object_ID = Object_ID(N'RPT.tblOrganisation'))
BEGIN
	ALTER TABLE [RPT].[tblOrganisation]  ALTER COLUMN Customerid BIGINT
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_CountryId'AND OBJECT_NAME(Parent_Object_Id)='tblOrganisation' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE [RPT].[tblOrganisation]  WITH CHECK ADD CONSTRAINT [FK_CountryId]  FOREIGN KEY([CountryId])REFERENCES  [dbo].[countrymaster]  ([Id])
END

IF   EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'CountryId' AND Object_ID = Object_ID(N'RPT.tblOrganisation'))
BEGIN
	ALTER TABLE [RPT].[tblOrganisation]  ALTER COLUMN CountryId INT
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='[FK_customerid]'AND OBJECT_NAME(Parent_Object_Id)='tblOrganisation' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE [RPT].[tblOrganisation]  WITH CHECK ADD CONSTRAINT [FK_customerid]  FOREIGN KEY([Customerid])REFERENCES  [RPT].[tblCustomers]  ([CustomerId])
END


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblPhotoJ__Audit__62E4AA3C]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPhotoJSONHistory]'))
BEGIN
	ALTER TABLE [RPT].[tblPhotoJSONHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])  REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])
END


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[PK_tblPreferences_PreferenceId_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferences]'))
ALTER TABLE [RPT].[tblPreferences] CHECK CONSTRAINT [PK_tblPreferences_PreferenceId_OrganisationId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblPreferences_tblTemplates_TemplateId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferences]'))
ALTER TABLE [RPT].[tblPreferences] CHECK CONSTRAINT [FK_tblPreferences_tblTemplates_TemplateId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblPreferencesHistory_tblPreferences_PreferenceId_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblPreferencesHistory]'))
ALTER TABLE [RPT].[tblPreferencesHistory] CHECK CONSTRAINT [FK_tblPreferencesHistory_tblPreferences_PreferenceId_OrganisationId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorAvail_tblUsers]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorAvail]'))
ALTER TABLE [RPT].[tblProctorAvail] CHECK CONSTRAINT [FK_tblProctorAvail_tblUsers]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblUsers]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview] CHECK CONSTRAINT [FK_tblProctorOnlineReview_tblUsers]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblTestAttempts]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview] CHECK CONSTRAINT [FK_tblProctorOnlineReview_tblTestAttempts]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblProctorOnlineReview_tblStudentScheduleDetails]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblProctorOnlineReview]'))
ALTER TABLE [RPT].[tblProctorOnlineReview] CHECK CONSTRAINT [FK_tblProctorOnlineReview_tblStudentScheduleDetails]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondarySubmissionQueue_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondarySubmissionQueue]'))
ALTER TABLE [RPT].[tblSecondarySubmissionQueue] CHECK CONSTRAINT [FK_tblSecondarySubmissionQueue_tblTestAttempts_AttemptId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondaryVideoJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSON]'))
ALTER TABLE [RPT].[tblSecondaryVideoJSON] CHECK CONSTRAINT [FK_tblSecondaryVideoJSON_tblTestAttempts_AttemptId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSecondaryVideoJSONHistory_tblAuditSummary_AuditSummaryID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSecondaryVideoJSONHistory]'))
ALTER TABLE [RPT].[tblSecondaryVideoJSONHistory] CHECK CONSTRAINT [FK_tblSecondaryVideoJSONHistory_tblAuditSummary_AuditSummaryID]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblStudentScheduleDetails_tblProctorAvail]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblStudentScheduleDetails]'))
ALTER TABLE [RPT].[tblStudentScheduleDetails] CHECK CONSTRAINT [FK_tblStudentScheduleDetails_tblProctorAvail]


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblStudentScheduleDetails' AND COLUMN_NAME = 'SCheduleusercode' AND TABLE_SCHEMA='RPT')
BEGIN
	ALTER TABLE RPT.tblStudentScheduleDetails  ADD SCheduleusercode NVARCHAR(200)
END


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblSubmissionQueue_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblSubmissionQueue]'))
ALTER TABLE [RPT].[tblSubmissionQueue] CHECK CONSTRAINT [FK_tblSubmissionQueue_tblTestAttempts_AttemptId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblTestDetails_TestDetailsId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]'))
ALTER TABLE [RPT].[tblTestAssignment] CHECK CONSTRAINT [FK_tblTestAssignment_tblTestDetails_TestDetailsId]


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblUsers_TestGUID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAssignment]'))
ALTER TABLE [RPT].[tblTestAssignment]  WITH CHECK ADD  CONSTRAINT [FK_tblTestAssignment_tblUsers_TestGUID] FOREIGN KEY([UserId])  REFERENCES [RPT].[tblUsers] ([UserId])

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblUsers_TestGUID]') AND parent_object_id = OBJECT_ID(N'RPT.tblTestAssignment'))
ALTER TABLE [RPT].[tblTestAssignment] CHECK CONSTRAINT [FK_tblTestAssignment_tblUsers_TestGUID]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAssignment_tblUsers_TestGUID]') AND parent_object_id = OBJECT_ID(N'RPT.tblTestAssignment'))
ALTER TABLE [RPT].[tbltestassignment] DROP Constraint FK_tblTestAssignment_tblUsers_TestGUID





IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempts_HeadshotStatus' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
	ALTER TABLE RPT.tblTestAttempts ADD CONSTRAINT [DF_tblTestAttempts_HeadshotStatus] DEFAULT (0) FOR [HeadshotStatus]
END  


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestAttempts_tblTestDetails_TestDetailsId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestAttempts]'))
ALTER TABLE [RPT].[tblTestAttempts] CHECK CONSTRAINT [FK_tblTestAttempts_tblTestDetails_TestDetailsId]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestDetails_tblTestNameInformation_TestNameInformationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestDetails]'))
ALTER TABLE [RPT].[tblTestDetails] CHECK CONSTRAINT [FK_tblTestDetails_tblTestNameInformation_TestNameInformationId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestDetails_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestDetails]'))
ALTER TABLE [RPT].[tblTestDetails] CHECK CONSTRAINT [FK_tblTestDetails_tblOrganisation_OrganisationId]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblTestNameInformation_tblOrganisation]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblTestNameInformation]'))
ALTER TABLE [RPT].[tblTestNameInformation] CHECK CONSTRAINT [FK_tblTestNameInformation_tblOrganisation]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserImages_TblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserImages]'))
ALTER TABLE [RPT].[tblUserImages] CHECK CONSTRAINT [FK_tblUserImages_TblUsers_UserId]


IF    EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'UserImage' AND Object_ID = Object_ID(N'RPT.tblUserImages'))
BEGIN
	ALTER TABLE RPT.tblUserImages  ALTER COLUMN UserImage VARBINARY(MAX)
END


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserPersonalizedSettings_tblSettingKeys_SettingKeyID]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]'))
ALTER TABLE [RPT].[tblUserPersonalizedSettings] CHECK CONSTRAINT [FK_tblUserPersonalizedSettings_tblSettingKeys_SettingKeyID]


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUserPersonalizedSettings_tblUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUserPersonalizedSettings]'))
ALTER TABLE [RPT].[tblUserPersonalizedSettings] CHECK CONSTRAINT [FK_tblUserPersonalizedSettings_tblUsers_UserId]



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUsers_tblOrganisation_OrganisationId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUsers]'))
ALTER TABLE [RPT].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblOrganisation_OrganisationId]

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblUsers_tblRole_RoleId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblUsers]'))
ALTER TABLE [RPT].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRole_RoleId]



IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_tblVideoJSON_tblTestAttempts_AttemptId]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblVideoJSON]'))
ALTER TABLE [RPT].[tblVideoJSON] CHECK CONSTRAINT [FK_tblVideoJSON_tblTestAttempts_AttemptId]


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='[DF_tblVideoJSON_highcount]' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblVideoJSON ADD CONSTRAINT [DF_tblVideoJSON_highcount] DEFAULT (0) FOR highcount
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='[DF_tblVideoJSON_mediumcount]' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblVideoJSON ADD CONSTRAINT [DF_tblVideoJSON_mediumcount] DEFAULT (0) FOR mediumcount
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='[DF_tblVideoJSON_lowcount]' 
AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE RPT.tblVideoJSON ADD CONSTRAINT [DF_tblVideoJSON_lowcount] DEFAULT (0) FOR lowcount
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK__tblVideoJ__Audit__5F141958]') AND parent_object_id = OBJECT_ID(N'[RPT].[tblVideoJSONHistory]'))
ALTER TABLE [RPT].[tblVideoJSONHistory]  WITH CHECK ADD FOREIGN KEY([AuditSummaryID])  REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])




IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME  =  N'DbBuildVersions' AND SCHEMA_NAME(SCHEMA_ID) =  N'dbo')
BEGIN
CREATE TABLE [dbo].[DbBuildVersions](
	[VersionID] [bigint] IDENTITY(1,1) NOT NULL,
	[VersionNumber] [nvarchar](50) NOT NULL,
	[IsApplied] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateTimeStamp] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_DbBuildVersions] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO



IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_tblHumanVoiceJSONHistory_tblAuditSummary_AuditSummaryID'
AND OBJECT_NAME(Parent_Object_Id)='tblHumanVoiceJSONHistory' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
ALTER TABLE [RPT].[tblHumanVoiceJSONHistory]  WITH CHECK ADD  CONSTRAINT FK_tblHumanVoiceJSONHistory_tblAuditSummary_AuditSummaryID FOREIGN KEY([AuditSummaryID])  REFERENCES [RPT].[tblAuditSummary] ([AuditSummaryID])


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_VideoSummaryTestDetails_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='VideoSummaryTestDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN   
	ALTER TABLE [dbo].[VideoSummaryTestDetails] ADD  CONSTRAINT [DF_VideoSummaryTestDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END  

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ScheduleName' AND COLUMN_NAME = 'Orgcode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.ScheduleName  ADD Orgcode NVARCHAR(100)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ScheduleName' AND COLUMN_NAME = 'Type' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.ScheduleName  ADD Type INT
END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ScheduleName' AND COLUMN_NAME = 'IsSecuredBrowser' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.ScheduleName  ADD IsSecuredBrowser BIT 
END


 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='IX_ScheduleName_IsSecuredBrowser' AND OBJECT_NAME(Parent_Object_Id)='ScheduleName' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
	ALTER TABLE RPT.ScheduleName ADD CONSTRAINT [IX_ScheduleName_IsSecuredBrowser] DEFAULT (0) FOR [IsSecuredBrowser]		
END  

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TblScheduleAssessmentProctorAvailAuditlog' AND COLUMN_NAME = 'SCheduleusercode' AND TABLE_SCHEMA='RPT')
BEGIN
	ALTER TABLE RPT.TblScheduleAssessmentProctorAvailAuditlog  ADD SCheduleusercode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'StudentScheduleDetail' AND COLUMN_NAME = 'SCheduleusercode' AND TABLE_SCHEMA='RPT')
BEGIN
	ALTER TABLE RPT.[StudentScheduleDetail]  ADD SCheduleusercode NVARCHAR(200)
END

IF    EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ImageTimeInterval' AND Object_ID = Object_ID(N'RPT.tblImageTestConfiguration'))
BEGIN
	ALTER TABLE RPT.tblImageTestConfiguration  ALTER COLUMN ImageTimeInterval INT
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[OneTimePassword](
	[OneTimePasswordID] [bigint] IDENTITY(1,1) NOT NULL,
	[OneTimePassword] [nvarchar](20) NULL,
	[MobileNumber] [nvarchar](30) NOT NULL,
	[CountryDialingCodeID] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[CommunicationTypeID] [tinyint] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[UserId] [bigint] NULL,
	[UserEmail] [nvarchar](500) NULL,
	[OTPExpiryDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[IsOTPValidated] [bit] NULL,
	[ModifiedBy] [bigint] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_OneTimePassword] PRIMARY KEY CLUSTERED 
(
	[OneTimePasswordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_OneTimePassword_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[OneTimePassword] ADD  CONSTRAINT [DF_OneTimePassword_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_OneTimePassword_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[OneTimePassword] ADD  CONSTRAINT [DF_OneTimePassword_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_OneTimePassword_IsOTPValidated' 
AND OBJECT_NAME(Parent_Object_Id)='OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[OneTimePassword] ADD  CONSTRAINT [DF_OneTimePassword_IsOTPValidated]  DEFAULT ((0)) FOR [IsOTPValidated]
END
GO


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_OneTimePassword_CreatedBy_User_UserID'
AND OBJECT_NAME(Parent_Object_Id)='OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
	ALTER TABLE [RPT].[OneTimePassword]  WITH CHECK ADD  CONSTRAINT [FK_OneTimePassword_CreatedBy_User_UserID] FOREIGN KEY([CreatedBy])
	REFERENCES [RPT].[tblUsers] ([UserId])
END
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_OneTimePassword_CreatedBy_User_UserID]]') AND parent_object_id = OBJECT_ID(N'[RPT].[OneTimePassword]'))
BEGIN
ALTER TABLE [RPT].[OneTimePassword] CHECK CONSTRAINT [FK_OneTimePassword_CreatedBy_User_UserID]
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_OneTimePassword_ModifiedBy'
AND OBJECT_NAME(Parent_Object_Id)='OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[OneTimePassword]  WITH CHECK ADD  CONSTRAINT [FK_OneTimePassword_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [RPT].[tblUsers] ([UserId])
END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_OneTimePassword_ModifiedBy]]') AND parent_object_id = OBJECT_ID(N'[RPT].[OneTimePassword]'))
BEGIN
ALTER TABLE [RPT].[OneTimePassword] CHECK CONSTRAINT [FK_OneTimePassword_ModifiedBy]
END
GO


IF NOT EXISTS (SELECT TOP 1 1 FROM SYS.FOREIGN_KEYS WHERE [Name]='FK_OneTimePassword_UserId'
AND OBJECT_NAME(Parent_Object_Id)='OneTimePassword' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[OneTimePassword]  WITH CHECK ADD  CONSTRAINT [FK_OneTimePassword_UserId] FOREIGN KEY([UserId])
REFERENCES [RPT].[tblUsers] ([UserId])
END
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[RPT].[FK_OneTimePassword_UserId]]') AND parent_object_id = OBJECT_ID(N'[RPT].[OneTimePassword]'))
BEGIN
ALTER TABLE [RPT].[OneTimePassword] CHECK CONSTRAINT [FK_OneTimePassword_UserId]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'OneTimePassword_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[OneTimePassword_Archive](
	[OneTimePassword_ArchiveID] [bigint] IDENTITY(1,1) NOT NULL,
	[OneTimePasswordID] [bigint] NOT NULL,
	[OneTimePassword] [nvarchar](20) NULL,
	[MobileNumber] [nvarchar](30) NOT NULL,
	[CountryDialingCodeID] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[CommunicationTypeID] [tinyint] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NULL,
	[UserId] [bigint] NULL,
	[UserEmail] [nvarchar](500) NULL,
	[OTPExpiryDate] [datetime] NULL,
	[Modifieddate] [datetime] NULL,
	[IsOTPValidated] [bit] NULL,
	[ModifiedBy] [bigint] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_OneTimePassword_Archive] PRIMARY KEY CLUSTERED 
(
	[OneTimePassword_ArchiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO




IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'ProctorSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
CREATE TABLE [Stream].[ProctorSessionDetails](
	[ProctorSessionDetailsId] [bigint] IDENTITY(1,1) NOT NULL,
	[StreamUserDetailsId] [bigint] NULL,
	[ProctorId] [bigint] NULL,
	[SessionId] [nvarchar](max) NULL,
	[AudioCode] [nvarchar](max) NULL,
	[Extension1] [nvarchar](max) NULL,
	[Extension2] [nvarchar](max) NULL,
	[Extension3] [nvarchar](max) NULL,
	[Createdby] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Modifiedby] [bigint] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProctorSessionDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF__ProctorSessionDetails_createddate' 
AND OBJECT_NAME(Parent_Object_Id)='ProctorSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[ProctorSessionDetails] ADD  CONSTRAINT [DF__ProctorSessionDetails_createddate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_ProctorSessionDetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='ProctorSessionDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'Stream')
BEGIN
ALTER TABLE [Stream].[ProctorSessionDetails] ADD  CONSTRAINT [DF_ProctorSessionDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END
GO


IF    EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ErrorDetails' AND Object_ID = Object_ID(N'zoom.ErrorLogs'))
BEGIN
ALTER TABLE zoom.ErrorLogs   ALTER COLUMN ErrorDetails NVARCHAR(MAX)
END

IF    EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Description' AND Object_ID = Object_ID(N'zoom.ErrorLogs'))
BEGIN
ALTER TABLE zoom.ErrorLogs   ALTER COLUMN Description NVARCHAR(MAX)
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'roomvideostatus' AND Object_ID = Object_ID(N'RPT.tblScheduleUserRoomVideo'))
BEGIN
ALTER TABLE [RPT].[tblScheduleUserRoomVideo] ADD roomvideostatus SMALLINT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAssessments_roomvideostatus' 
AND OBJECT_NAME(Parent_Object_Id)='tblScheduleUserRoomVideo' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblScheduleUserRoomVideo] ADD  CONSTRAINT [DF_tblAssessments_roomvideostatus]  DEFAULT ((0)) FOR [roomvideostatus]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tbltestpausedetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PId] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[ProctorId] [bigint] NULL,
	[PausedTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[IsPaused] [numeric](1, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [numeric](1, 0) NULL,
	[PausedDuration] [int] NULL,
	[organizationid] [bigint] NULL
) ON [PRIMARY]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestpausedetails_IsPaused' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tbltestpausedetails] ADD  CONSTRAINT [DF_tbltestpausedetails_IsPaused]  DEFAULT ((0)) FOR [IsPaused]
END
GO


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestpausedetails_CreatedDate' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tbltestpausedetails] ADD  CONSTRAINT [DF_tbltestpausedetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestpausedetails_IsDeleted' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestpausedetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tbltestpausedetails] ADD  CONSTRAINT [DF_tbltestpausedetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO

--23-07-2024 


IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'flagdescription' AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD flagdescription nvarchar(max)
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'flagdescription' AND Object_ID = Object_ID(N'rpt.tblTestConfiguration'))
BEGIN
ALTER TABLE rpt.tblTestConfiguration ADD flagdescription nvarchar(max)
END
GO

--23-07-2024
IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowGuardian' AND Object_ID = Object_ID(N'RPT.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration
ADD AllowGuardian BIT DEFAULT 0
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AllowGuardian' AND Object_ID = Object_ID(N'RPT.tblTestConfiguration'))
BEGIN
ALTER TABLE rpt.tblTestConfiguration
ADD AllowGuardian BIT DEFAULT 0
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Guardianheadshot' AND Object_ID = Object_ID(N'RPT.tblstudentheadshotdetails'))
BEGIN
ALTER TABLE rpt.tblstudentheadshotdetails
ADD Guardianheadshot BIT DEFAULT 0
END
GO

--30-07-2024

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblflags' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN

CREATE TABLE [RPT].[tblflags](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Flags] [nvarchar](2000) NULL,
	[ParentId] [int] NOT NULL,
	[ColorCode] [nvarchar](1000) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[flagid] [int] NULL
) 

END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsDeleted' AND Object_ID = Object_ID(N'RPT.tblflags'))
BEGIN
ALTER TABLE [RPT].[tblflags] ADD  DEFAULT ((0)) FOR [IsDeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblflagcountdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblflagcountdetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PartnerintegrationId] [bigint] NULL,
	[AttemptId] [bigint] NULL,
	[SeverityType] [int] NULL,
	[FlagId] [int] NULL,
	[Count] [int] NULL,
	[IsDeleted] [numeric](1, 0) NOT NULL,
	[Created_At] [datetime2](3) NOT NULL,
	[Updated_At] [datetime2](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END 
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsDeleted' AND Object_ID = Object_ID(N'RPT.tblflagcountdetails'))
BEGIN
ALTER TABLE RPT.tblflagcountdetails ADD  DEFAULT ((0)) FOR IsDeleted
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'Created_At' AND Object_ID = Object_ID(N'RPT.tblflagcountdetails'))
BEGIN
ALTER TABLE [RPT].[tblflagcountdetails] ADD  DEFAULT (sysutcdatetime()) FOR [Created_At]
END
GO

--30-07-2024

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'GuardianHeadshot' AND Object_ID = Object_ID(N'RPT.tblscheduleuserphoto'))
BEGIN
ALTER TABLE rpt.tblscheduleuserphoto  ADD GuardianHeadshot NVARCHAR(MAX)
END
GO
IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'isbookmarked' AND Object_ID = Object_ID(N'rpt.tblscheduleuser'))
BEGIN
Alter Table rpt.tblscheduleuser
add isbookmarked bit 
END
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblscheduleuser_isbookmarked' 
AND OBJECT_NAME(Parent_Object_Id)='tblscheduleuser' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblscheduleuser] ADD  DEFAULT ((0)) FOR [isbookmarked]
END
GO
IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'iss3deleted' AND Object_ID = Object_ID(N'rpt.tbltestdetails'))
BEGIN
ALTER TABLE rpt.tbltestdetails
add iss3deleted int  
END
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestdetails_iss3deleted' 
AND OBJECT_NAME(Parent_Object_Id)='tbltestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt')
BEGIN
ALTER TABLE rpt.tbltestdetails
ADD CONSTRAINT DF_tbltestdetails_iss3deleted DEFAULT 0 FOR iss3deleted;
END
GO

IF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N's3delelteddate' AND Object_ID = Object_ID(N'rpt.tbltestdetails'))
BEGIN
ALTER TABLE rpt.tbltestdetails
add s3delelteddate datetime  
END
GO
--22-08-2024

IF NOT EXISTS (  SELECT 1 FROM sys.columns   WHERE Name = N'Blurvideo'   AND Object_ID = Object_ID(N'rpt.tblorganisationconfiguration')
)
BEGIN
    ALTER TABLE rpt.tblorganisationconfiguration
    ADD Blurvideo BIT;
END

IF NOT EXISTS ( SELECT 1   FROM SYS.DEFAULT_CONSTRAINTS  WHERE [Name] = 'DF_tblorganisationconfiguration_Blurvideo' AND OBJECT_NAME(Parent_Object_Id) = 'tblorganisationconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt'
)
BEGIN
    ALTER TABLE rpt.tblorganisationconfiguration
    ADD CONSTRAINT DF_tblorganisationconfiguration_Blurvideo 
    DEFAULT 0 FOR Blurvideo;
END

IF NOT EXISTS ( SELECT 1 FROM sys.columns   WHERE Name = N'Blurtext' AND Object_ID = Object_ID(N'rpt.tblorganisationconfiguration')
)
BEGIN
    ALTER TABLE rpt.tblorganisationconfiguration
    ADD Blurtext BIT;
END

IF NOT EXISTS ( SELECT 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name] = 'DF_tblorganisationconfiguration_Blurtext' AND OBJECT_NAME(Parent_Object_Id) = 'tblorganisationconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'rpt'
)
BEGIN
    ALTER TABLE rpt.tblorganisationconfiguration
    ADD CONSTRAINT DF_tblorganisationconfiguration_Blurtext 
    DEFAULT 0 FOR Blurtext;
END

IF NOT EXISTS ( SELECT 1  FROM sys.columns  WHERE Name = N'Blurvideo'  AND Object_ID = Object_ID(N'rpt.tbltestconfiguration')
)
BEGIN
    ALTER TABLE rpt.tbltestconfiguration
    ADD Blurvideo BIT;
END

IF NOT EXISTS ( SELECT 1  FROM SYS.DEFAULT_CONSTRAINTS  WHERE [Name] = 'DF_tbltestconfiguration_Blurvideo'  AND OBJECT_NAME(Parent_Object_Id) = 'tbltestconfiguration'  AND SCHEMA_NAME(SCHEMA_ID) = 'rpt'
)
BEGIN
    ALTER TABLE rpt.tbltestconfiguration
    ADD CONSTRAINT DF_tbltestconfiguration_Blurvideo 
    DEFAULT 0 FOR Blurvideo;
END

IF NOT EXISTS ( SELECT 1  FROM sys.columns  WHERE Name = N'Blurtext'  AND Object_ID = Object_ID(N'rpt.tbltestconfiguration')
)
BEGIN
    ALTER TABLE rpt.tbltestconfiguration
    ADD Blurtext BIT;
END

IF NOT EXISTS ( SELECT 1  FROM SYS.DEFAULT_CONSTRAINTS  WHERE [Name] = 'DF_tbltestconfiguration_Blurtext'  AND OBJECT_NAME(Parent_Object_Id) = 'tbltestconfiguration'  AND SCHEMA_NAME(SCHEMA_ID) = 'rpt'
)
BEGIN
    ALTER TABLE rpt.tbltestconfiguration
    ADD CONSTRAINT DF_tbltestconfiguration_Blurtext 
    DEFAULT 0 FOR Blurtext;
END
