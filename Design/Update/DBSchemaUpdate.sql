--16-09-2022
IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tbltestdetails'))BEGIN	ALTER TABLE RPT.tbltestdetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tbltestdetails'))BEGIN	ALTER TABLE RPT.tbltestdetails	ADD IsArchived BIT  ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestdetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tbltestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')BEGINALTER TABLE RPT.tbltestdetails ADD CONSTRAINT DF_tbltestdetails_IsArchived DEFAULT(0) FOR IsArchivedEND IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tbltestAttempts'))BEGIN	ALTER TABLE RPT.tbltestAttempts	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tbltestAttempts'))BEGIN	ALTER TABLE RPT.tbltestAttempts	ADD IsArchived BIT   END--IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestAttempts_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tbltestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')--BEGIN--ALTER TABLE RPT.tbltestAttempts --ADD CONSTRAINT DF_tbltestAttempts_IsArchived DEFAULT(0) FOR IsArchived--ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tblSubmissionQueue'))BEGIN	ALTER TABLE RPT.tblSubmissionQueue	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tblSubmissionQueue'))BEGIN	ALTER TABLE RPT.tblSubmissionQueue	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblSubmissionQueue_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tblSubmissionQueue' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')BEGINALTER TABLE RPT.tblSubmissionQueue ADD CONSTRAINT DF_tblSubmissionQueue_IsArchived DEFAULT(0) FOR IsArchivedENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tblStudentScheduleDetails'))BEGIN	ALTER TABLE RPT.tblStudentScheduleDetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tblStudentScheduleDetails'))BEGIN	ALTER TABLE RPT.tblStudentScheduleDetails	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblStudentScheduleDetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')BEGINALTER TABLE RPT.tblStudentScheduleDetails ADD CONSTRAINT DF_tblStudentScheduleDetails_IsArchived DEFAULT(0) FOR IsArchivedENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.StudentScheduleDetail'))BEGIN	ALTER TABLE RPT.StudentScheduleDetail	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.StudentScheduleDetail'))BEGIN	ALTER TABLE RPT.StudentScheduleDetail	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_StudentScheduleDetail_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='StudentScheduleDetail' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')BEGINALTER TABLE RPT.StudentScheduleDetail ADD CONSTRAINT DF_StudentScheduleDetail_IsArchived DEFAULT(0) FOR IsArchivedENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tblProctorOnlineReview'))BEGIN	ALTER TABLE RPT.tblProctorOnlineReview	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tblProctorOnlineReview'))BEGIN	ALTER TABLE RPT.tblProctorOnlineReview	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblProctorOnlineReview_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tblProctorOnlineReview' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')BEGINALTER TABLE RPT.tblProctorOnlineReview ADD CONSTRAINT DF_tblProctorOnlineReview_IsArchived DEFAULT(0) FOR IsArchivedEND IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPP.SummaryAssessmentScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryAssessmentScheduleDetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPP.SummaryAssessmentScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryAssessmentScheduleDetails	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SummaryAssessmentScheduleDetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='SummaryAssessmentScheduleDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')BEGINALTER TABLE RPP.SummaryAssessmentScheduleDetails ADD CONSTRAINT DF_SummaryAssessmentScheduleDetails_IsArchived DEFAULT(0) FOR IsArchivedENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPP.SummaryScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryScheduleDetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPP.SummaryScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryScheduleDetails	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SummaryScheduleDetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='SummaryScheduleDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPP')BEGINALTER TABLE RPP.SummaryScheduleDetails ADD CONSTRAINT DF_SummaryScheduleDetails_IsArchived DEFAULT(0) FOR IsArchivedENDIF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'ArchiveDate' AND Object_ID = Object_ID(N'dbo.notifications'))BEGIN	ALTER TABLE dbo.notifications	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsArchived' AND Object_ID = Object_ID(N'dbo.notifications'))BEGIN	ALTER TABLE dbo.notifications	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_notifications_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='notifications' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')BEGINALTER TABLE dbo.notifications ADD CONSTRAINT DF_notifications_IsArchived DEFAULT(0) FOR IsArchivedEND--22-09-2022IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ISCustomerEnabled'AND Object_ID = Object_ID(N'RPT.tblCustomers'))BEGINALTER TABLE RPT.tblCustomers  ADD ISCustomerEnabled BIT DEFAULT(0)END 


IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tbltestdetails'))BEGIN	ALTER TABLE RPT.tbltestdetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tbltestdetails'))BEGIN	ALTER TABLE RPT.tbltestdetails	ADD IsArchived BIT  ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tbltestAttempts'))BEGIN	ALTER TABLE RPT.tbltestAttempts	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tbltestAttempts'))BEGIN	ALTER TABLE RPT.tbltestAttempts	ADD IsArchived BIT   ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tblSubmissionQueue'))BEGIN	ALTER TABLE RPT.tblSubmissionQueue	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tblSubmissionQueue'))BEGIN	ALTER TABLE RPT.tblSubmissionQueue	ADD IsArchived BIT   ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tblStudentScheduleDetails'))BEGIN	ALTER TABLE RPT.tblStudentScheduleDetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tblStudentScheduleDetails'))BEGIN	ALTER TABLE RPT.tblStudentScheduleDetails	ADD IsArchived BIT   ENDIF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblStudentScheduleDetails_IsArchived' AND OBJECT_NAME(Parent_Object_Id)='tblStudentScheduleDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')BEGINALTER TABLE RPT.tblStudentScheduleDetails ADD CONSTRAINT DF_tblStudentScheduleDetails_IsArchived DEFAULT(0) FOR IsArchivedENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.StudentScheduleDetail'))BEGIN	ALTER TABLE RPT.StudentScheduleDetail	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.StudentScheduleDetail'))BEGIN	ALTER TABLE RPT.StudentScheduleDetail	ADD IsArchived BIT   ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPT.tblProctorOnlineReview'))BEGIN	ALTER TABLE RPT.tblProctorOnlineReview	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPT.tblProctorOnlineReview'))BEGIN	ALTER TABLE RPT.tblProctorOnlineReview	ADD IsArchived BIT   END IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPP.SummaryAssessmentScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryAssessmentScheduleDetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPP.SummaryAssessmentScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryAssessmentScheduleDetails	ADD IsArchived BIT   ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ArchiveDate'AND Object_ID = Object_ID(N'RPP.SummaryScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryScheduleDetails	ADD ArchiveDate DATETIME ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsArchived'AND Object_ID = Object_ID(N'RPP.SummaryScheduleDetails'))BEGIN	ALTER TABLE RPP.SummaryScheduleDetails	ADD IsArchived BIT   ENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'ModifiedDate'AND Object_ID = Object_ID(N'RPT.tblTestDetails'))BEGINALTER TABLE  RPT.tblTestDetails  ADD ModifiedDate DATETIMEENDIF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsTestStopped'AND Object_ID = Object_ID(N'RPT.tblTestAttempts'))BEGINALTER TABLE RPT.tblTestAttempts  ADD IsTestStopped BITEND--13-10-2022IF NOT  EXISTS(SELECT 1 FROM sys.columnsWHERE Name = N'IsLicenceAcceptance'AND Object_ID = Object_ID(N'RPT.tblUsers'))BEGINALTER TABLE rpt.tblUsersADD IsLicenceAcceptance bit default 0;ENDIF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'Organisationid'
AND Object_ID = Object_ID(N'RPT.tblTestConfiguration'))
BEGIN
ALTER TABLE RPT.tblTestConfiguration  ADD Organisationid BIGINT
END

--21-02-2023
IF NOT  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[RPT].[SessionInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [RPT].[SessionInfo](
	[SessionInfoID] [bigint] IDENTITY(1,1) NOT NULL,
	[id] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
	[sessionId] [nvarchar](200) NULL,
	[createdAt] [nvarchar](100) NULL,
	[size] [nvarchar](100) NULL,
	[duration] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[ModifiedBy] [bigint] NULL,
	[Isdeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionInfo_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='SessionInfo' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[SessionInfo] ADD  CONSTRAINT [DF_SessionInfo_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionInfo_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='SessionInfo' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[SessionInfo] ADD  CONSTRAINT [DF_SessionInfo_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END


--04-05-2023
IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'desktopvideolength' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD desktopvideolength NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'desktopvideosize' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD	desktopvideosize NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'videolength' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD	videolength NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'videosize' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD	videosize NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'highcount' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD highcount INT 
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'mediumcount' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD	mediumcount INT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblVideoJSON' AND COLUMN_NAME = 'lowcount' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblVideoJSON
ADD	lowcount INT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblVideoJSON_highcount' AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE RPT.tblVideoJSON ADD CONSTRAINT [DF_tblVideoJSON_highcount] DEFAULT (0) FOR highcount
END  
GO

 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblVideoJSON_mediumcount' AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE RPT.tblVideoJSON ADD CONSTRAINT [DF_tblVideoJSON_mediumcount] DEFAULT (0) FOR mediumcount
END  
GO

 IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblVideoJSON_lowcount' AND OBJECT_NAME(Parent_Object_Id)='tblVideoJSON' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE RPT.tblVideoJSON ADD CONSTRAINT [DF_tblVideoJSON_lowcount] DEFAULT (0) FOR lowcount
END  
GO

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestAttempts' AND COLUMN_NAME = 'Isdeletedfroms3localstorage' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblTestAttempts  ADD Isdeletedfroms3localstorage BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestattempts' AND COLUMN_NAME = 'videosourcetype' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tbltestattempts  ADD videosourcetype integer
END


IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempts_Isdeletedfroms3localstorage' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE RPT.tblTestAttempts ADD CONSTRAINT [DF_tblTestAttempts_Isdeletedfroms3localstorage] DEFAULT (0) FOR [Isdeletedfroms3localstorage]
END  
GO

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblsubmissionqueue' AND COLUMN_NAME = 'Isvideodeleted' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblsubmissionqueue  ADD Isvideodeleted BIT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblsubmissionqueue_Isvideodeleted' AND OBJECT_NAME(Parent_Object_Id)='tblsubmissionqueue' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tblsubmissionqueue ADD CONSTRAINT DF_tblsubmissionqueue_Isvideodeleted DEFAULT (0) FOR [Isvideodeleted]
END  
GO

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblsubmissionqueue' AND COLUMN_NAME = 'HumanVoiceStatus' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblSubmissionQueue  ADD HumanVoiceStatus tinyint
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblsubmissionqueue' AND COLUMN_NAME = 'HumanVoiceStatusUpdatedDate' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblsubmissionqueue  ADD HumanVoiceStatusUpdatedDate datetime2
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblsubmissionqueue' AND COLUMN_NAME = 'HumanVoiceMessage' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE rpt.tblsubmissionqueue  ADD HumanVoiceMessage nvarchar(1000)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestImageModeConfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblTestImageModeConfiguration  ADD  OrganizationCode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestLiveModeConfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblTestLiveModeConfiguration  ADD  OrganizationCode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestSCConfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblTestSCConfiguration  ADD  OrganizationCode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tbltestconfiguration  ADD  OrganizationCode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'LMAugmentedProctoring' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tbltestconfiguration  ADD LMAugmentedProctoring BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'LMAutomatedproctoring' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tbltestconfiguration  ADD LMAutomatedproctoring BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'RMAgumatedProctoringReview' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tbltestconfiguration  ADD RMAgumatedProctoringReview BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tbltestconfiguration' AND COLUMN_NAME = 'RMAutomatedProctoringReview' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tbltestconfiguration  ADD RMAutomatedProctoringReview BIT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAugmentedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_LMAugmentedProctoring DEFAULT (0) FOR [LMAugmentedProctoring]
END  
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAutomatedproctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_LMAutomatedproctoring DEFAULT (0) FOR [LMAutomatedproctoring]
END  
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_RMAgumatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_RMAgumatedProctoringReview DEFAULT (0) FOR [RMAgumatedProctoringReview]
END  
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_RMAutomatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_RMAutomatedProctoringReview DEFAULT (0) FOR [RMAutomatedProctoringReview]
END  
GO

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblScheduleDetails' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblScheduleDetails  ADD OrganizationCode NVARCHAR(200)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblScheduleUser' AND COLUMN_NAME = 'OrganizationCode' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblScheduleUser  ADD OrganizationCode NVARCHAR(200)
END


IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'ThirdPartyAPIURL' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration   ADD ThirdPartyAPIURL NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AgumatedProctoring' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration  ADD AgumatedProctoring BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AutomatedProctoring' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration  ADD AutomatedProctoring BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AutomatedProctoringReview' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration  ADD AutomatedProctoringReview BIT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblOrganisationConfiguration' AND COLUMN_NAME = 'AgumatedProctoringReview' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration  ADD AgumatedProctoringReview BIT
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AgumatedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AgumatedProctoring DEFAULT (0) FOR [AgumatedProctoring]
END  
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AutomatedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AutomatedProctoring DEFAULT (0) FOR [AutomatedProctoring]
END  
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AutomatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AutomatedProctoringReview DEFAULT (0) FOR [AutomatedProctoringReview]
END  
GO
IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AgumatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AgumatedProctoringReview DEFAULT (0) FOR [AgumatedProctoringReview]
END  
GO

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblUsers' AND COLUMN_NAME = 'ProfilePath' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblUsers ADD  ProfilePath nvarchar(max)
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblvideoLog' AND COLUMN_NAME = 'videosourcetype' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE [RPT].[tblvideoLog]  ADD videosourcetype INT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'SessionDetails' AND COLUMN_NAME = 'PartnerIntegrationId' AND TABLE_SCHEMA='Zoom')
BEGIN
ALTER TABLE Zoom.SessionDetails  ADD PartnerIntegrationId BIGINT
END

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestAttempts' AND COLUMN_NAME = 'NativeMessage' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblTestAttempts  ADD NativeMessage NVARCHAR(500)
END
GO

IF NOT  EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'tblTestAttempts' AND COLUMN_NAME = 'NativeStatus' AND TABLE_SCHEMA='RPT')
BEGIN
ALTER TABLE RPT.tblTestAttempts  ADD NativeStatus INT
END
GO

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempts_NativeStatus' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN   
ALTER TABLE rpt.tblTestAttempts  ADD  CONSTRAINT [DF_tblTestAttempts_NativeStatus]  DEFAULT ((0)) FOR [NativeStatus]
END  
GO


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'Isuserloggedin'
AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
ALTER TABLE rpt.tblusers   ADD  Isuserloggedin  BIT constraint DF_tblusers_Isuserloggedin Default 0
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'useractivedate'
AND Object_ID = Object_ID(N'rpt.tblUsers'))
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

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'Isdeletedfroms3localstorage'
AND Object_ID = Object_ID(N'RPT.tblTestAttempts'))
BEGIN
ALTER TABLE RPT.tblTestAttempts  ADD Isdeletedfroms3localstorage BIT
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblTestAttempts_Isdeletedfroms3localstorage' AND OBJECT_NAME(Parent_Object_Id)='tblTestAttempts' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblTestAttempts ADD CONSTRAINT [DF_tblTestAttempts_Isdeletedfroms3localstorage] DEFAULT (0) FOR [Isdeletedfroms3localstorage]
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'highcount'
AND Object_ID = Object_ID(N'RPT.tblVideoJSON'))
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD highcount  INT
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'mediumcount'
AND Object_ID = Object_ID(N'RPT.tblVideoJSON'))
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD mediumcount INT
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'lowcount'
AND Object_ID = Object_ID(N'RPT.tblVideoJSON'))
BEGIN
ALTER TABLE rpt.tblVideoJSON  ADD lowcount INT
END
 
IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAugmentedProctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_LMAugmentedProctoring DEFAULT (0) FOR [LMAugmentedProctoring]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tbltestconfiguration_LMAutomatedproctoring' AND OBJECT_NAME(Parent_Object_Id)='tbltestconfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tbltestconfiguration ADD CONSTRAINT DF_tbltestconfiguration_LMAutomatedproctoring DEFAULT (0) FOR [LMAutomatedproctoring]
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

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AutomatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AutomatedProctoringReview DEFAULT (0) FOR [AutomatedProctoringReview]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblOrganisationConfiguration_AgumatedProctoringReview' AND OBJECT_NAME(Parent_Object_Id)='tblOrganisationConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration ADD CONSTRAINT DF_tblOrganisationConfiguration_AgumatedProctoringReview DEFAULT (0) FOR [AgumatedProctoringReview]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblImageModeTestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE RPT.tblImageModeTestdetails   
(  
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
	CONSTRAINT [PK_tblImageModeTestdetails] 
	PRIMARY KEY CLUSTERED  
	(  [ID] ASC       ) ON [PRIMARY]    
)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageModeTestdetails_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblImageModeTestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblImageModeTestdetails ADD CONSTRAINT [DF_tblImageModeTestdetails_Isdeleted] DEFAULT (0) FOR [Isdeleted]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageModeTestdetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblImageModeTestdetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblImageModeTestdetails ADD CONSTRAINT [DF_tblImageModeTestdetails_CreatedDate] DEFAULT (getutcdate()) FOR [CreatedDate]
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'NativeStatus'
AND Object_ID = Object_ID(N'RPT.tblTestAttempts'))
BEGIN
 ALTER TABLE rpt.tblTestAttempts  ADD NativeStatus INT
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'NativeMessage'
AND Object_ID = Object_ID(N'RPT.tblTestAttempts'))
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

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'FaceCount'
AND Object_ID = Object_ID(N'RPT.tblVideoJSON'))
BEGIN
ALTER TABLE rpt.tblVideoJSON ADD  FaceCount INT
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'ScreenVideoSize_S3'
AND Object_ID = Object_ID(N'RPT.tblVideoJSON'))
BEGIN
ALTER TABLE rpt.tblVideoJSON ADD  ScreenVideoSize_S3 NVARCHAR(MAX)
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'MainVideoSize_S3'
AND Object_ID = Object_ID(N'RPT.tblVideoJSON'))
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
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [c] DEFAULT (0) FOR [IsVideoDownloaded]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_SessionLogs_Has_pstn' AND OBJECT_NAME(Parent_Object_Id)='SessionLogs' AND SCHEMA_NAME(SCHEMA_ID) = 'Zoom')
BEGIN
ALTER TABLE Zoom.SessionLogs ADD CONSTRAINT [DF_SessionLogs_Has_pstn] DEFAULT (0) FOR [Has_pstn]
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'PartnerIntegrationId'
AND Object_ID = Object_ID(N'Zoom.SessionLogs'))
BEGIN
ALTER TABLE Zoom.SessionLogs  ADD PartnerIntegrationId BIGINT
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'Isuserloggedin'
AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
ALTER TABLE rpt.tblusers   ADD  Isuserloggedin  BIT constraint DF_tblusers_Isuserloggedin Default 0
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'IsAllowmultiUserConnection'
AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration   ADD  IsAllowmultiUserConnection  BIT constraint DF_tblOrganisationConfiguration_IsAllowmultiUserConnection Default 0
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'useractivedate'
AND Object_ID = Object_ID(N'rpt.tblUsers'))
BEGIN
ALTER TABLE rpt.tblUsers   ADD useractivedate datetime
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[Privilages]
(   
	[ID] [bigint] NOT NULL,   
	[Name] [nvarchar](500) NOT NULL,   
	[Description] [nvarchar](3000) NULL,  
	[ParentID] [bigint] NOT NULL,   
	[PrivilageType] [bigint] NOT NULL,   
	[Url] [nvarchar](max) NULL,   
	[CustomerID] [bigint] NOT NULL,   
	[PrivilageCode] [nvarchar](50) NULL,   
	[Order] [bigint] NULL,   
	[PrivilageTypeID] [int] NULL,  
	[ParentPrivilages] [nvarchar](1000) NULL,   
	[OrganizationID] [bigint] NOT NULL,   
	[CreatedDate] DateTime,   
	[ModifiedDate] DateTime,   
	[Isdeleted] BIT   
	CONSTRAINT [PK_Privilages] 
	PRIMARY KEY CLUSTERED   (   [ID] ASC  )
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_ParentID' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_ParentID]  DEFAULT ((0)) FOR [ParentID]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_PrivilageType' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_PrivilageType]  DEFAULT ((0)) FOR [PrivilageType]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_OrganizationID' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_OrganizationID]  DEFAULT ((1)) FOR [OrganizationID]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_CreatedDate]  DEFAULT GETUTCDATE() FOR [CreatedDate]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'RoleToprivilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[RoleToprivilages]
(   
	[ID] [bigint] IDENTITY(1,1) NOT NULL,   
	[RoleId] [bigint] NOT NULL,  
	[PrivilageId] [bigint] NULL,   
	[Isdeleted] [bit]    
	CONSTRAINT [PK_RoleToprivilages] PRIMARY KEY CLUSTERED   (   [ID] ASC  ) 
)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_RoleToprivilages_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='RoleToprivilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[RoleToprivilages] ADD  CONSTRAINT [DF_RoleToprivilages_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
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


IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[Summary_ApplicationUsageDetails]
(   
	[ApplicationUsageDetailId] [bigint] IDENTITY(1,1) NOT NULL,   
	[CustomerId] [BIGINT],   
	[CustomerName] [nvarchar](200) NULL,  
	[OrganizationName] [nvarchar](200) NULL,   
	[OrganizationId] [BIGINT] NULL,   
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
	PRIMARY KEY CLUSTERED   (   [ApplicationUsageDetailId] ASC  )
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Summary_ApplicationUsageDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Summary_ApplicationUsageDetails] ADD  CONSTRAINT [DF_Summary_ApplicationUsageDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Summary_ApplicationUsageDetails_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Summary_ApplicationUsageDetails] ADD  CONSTRAINT [DF_Summary_ApplicationUsageDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity_2023' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity_2023]
(   
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
)
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity_Archive]
(   
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
)
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'PartnerIntegrationId'
AND Object_ID = Object_ID(N'Zoom.SessionLogs'))
BEGIN
ALTER TABLE Zoom.SessionLogs  ADD PartnerIntegrationId BIGINT
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'Isuserloggedin'
AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
ALTER TABLE rpt.tblusers   ADD  Isuserloggedin  BIT constraint DF_tblusers_Isuserloggedin Default 0
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'IsAllowmultiUserConnection'
AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE rpt.tblOrganisationConfiguration   ADD  IsAllowmultiUserConnection  BIT constraint DF_tblOrganisationConfiguration_IsAllowmultiUserConnection Default 0
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'useractivedate'
AND Object_ID = Object_ID(N'rpt.tblUsers'))
BEGIN
ALTER TABLE rpt.tblUsers   ADD useractivedate datetime
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[Privilages]
(   
	[ID] [bigint] NOT NULL,   
	[Name] [nvarchar](500) NOT NULL,   
	[Description] [nvarchar](3000) NULL,  
	[ParentID] [bigint] NOT NULL,   
	[PrivilageType] [bigint] NOT NULL,   
	[Url] [nvarchar](max) NULL,   
	[CustomerID] [bigint] NOT NULL,   
	[PrivilageCode] [nvarchar](50) NULL,   
	[Order] [bigint] NULL,   
	[PrivilageTypeID] [int] NULL,  
	[ParentPrivilages] [nvarchar](1000) NULL,   
	[OrganizationID] [bigint] NOT NULL,   
	[CreatedDate] DateTime,   
	[ModifiedDate] DateTime,   
	[Isdeleted] BIT   
	CONSTRAINT [PK_Privilages] 
	PRIMARY KEY CLUSTERED   (   [ID] ASC  )
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_ParentID' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_ParentID]  DEFAULT ((0)) FOR [ParentID]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_PrivilageType' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_PrivilageType]  DEFAULT ((0)) FOR [PrivilageType]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_OrganizationID' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_OrganizationID]  DEFAULT ((1)) FOR [OrganizationID]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_CreatedDate]  DEFAULT GETUTCDATE() FOR [CreatedDate]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Privilages_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='Privilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Privilages] ADD  CONSTRAINT [DF_Privilages_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'RoleToprivilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[RoleToprivilages]
(   
	[ID] [bigint] IDENTITY(1,1) NOT NULL,   
	[RoleId] [bigint] NOT NULL,  
	[PrivilageId] [bigint] NULL,   
	[Isdeleted] [bit]    
	CONSTRAINT [PK_RoleToprivilages] PRIMARY KEY CLUSTERED   (   [ID] ASC  ) 
)
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_RoleToprivilages_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='RoleToprivilages' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[RoleToprivilages] ADD  CONSTRAINT [DF_RoleToprivilages_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
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


IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[Summary_ApplicationUsageDetails]
(   
	[ApplicationUsageDetailId] [bigint] IDENTITY(1,1) NOT NULL,   
	[CustomerId] [BIGINT],   
	[CustomerName] [nvarchar](200) NULL,  
	[OrganizationName] [nvarchar](200) NULL,   
	[OrganizationId] [BIGINT] NULL,   
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
	PRIMARY KEY CLUSTERED   (   [ApplicationUsageDetailId] ASC  )
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Summary_ApplicationUsageDetails_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Summary_ApplicationUsageDetails] ADD  CONSTRAINT [DF_Summary_ApplicationUsageDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_Summary_ApplicationUsageDetails_IsDeleted' AND OBJECT_NAME(Parent_Object_Id)='Summary_ApplicationUsageDetails' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[Summary_ApplicationUsageDetails] ADD  CONSTRAINT [DF_Summary_ApplicationUsageDetails_IsDeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity_2023' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity_2023]
(   
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
)
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity_Archive' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[UserActivity_Archive]
(   
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
)
END

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblAuditEvents' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblAuditEvents]
(   
	[ID] [bigint] Identity(1,1) NOT NULL,   
	[EventId] [bigint] NOT NULL,   
	[EventName] [nvarchar](3000) NOT NULL,   
	[Description] [nvarchar](3000) NULL,   
	[CreatedDate] DateTime,   
	[ModifiedDate] DateTime,   
	[Isdeleted] BIT   
	CONSTRAINT [PK_tblAuditEvents] 
	PRIMARY KEY CLUSTERED   (   [ID] ASC  )  
)
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditEvents_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblAuditEvents' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditEvents] ADD  CONSTRAINT [DF_tblAuditEvents_CreatedDate]  DEFAULT GETUTCDATE() FOR [CreatedDate]
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditEvents_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblAuditEvents' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditEvents] ADD  CONSTRAINT [DF_tblAuditEvents_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END
 

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
CREATE TABLE [RPT].[tblAuditlog]
(  
	[ID] [bigint] Identity(1,1) NOT NULL,   
	[EventId] [bigint] NOT NULL,   
	[CreatedDate] DateTime NOT NULL,   
	[CreatedBy] [bigint] NOT NULL,  
	[UserId] [bigint]  NULL,  
	[Profiler] [nvarchar](MAX) NULL,   
	[ObjectName] [nvarchar](MAX) NULL,   
	[Status] [nvarchar](MAX) NULL,   
	[Description] [nvarchar](MAX) NULL,   
	[IpAddress] [nvarchar](MAX) NULL,   
	[BrowserInfo] [nvarchar](MAX) NULL,  
	[Location] [nvarchar](MAX) NULL,  
	[Theme] [nvarchar](MAX) NULL,   
	[Timezone] [nvarchar](MAX) NULL,   
	[Region] [nvarchar](MAX) NULL ,  
	[Language] [nvarchar](MAX) NULL,   
	[FilePath] [nvarchar](MAX) NULL,   
	[IsAutolog] BIT ,   
	[ModifiedDate] DateTime,   
	[Isdeleted] BIT   
	CONSTRAINT [PK_tblAuditlog] 
	PRIMARY KEY CLUSTERED   (   [ID] ASC  )  
)
END


IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditlog_IsAutolog' AND OBJECT_NAME(Parent_Object_Id)='tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditlog] ADD  CONSTRAINT [DF_tblAuditlog_IsAutolog]  DEFAULT ((0)) FOR [IsAutolog]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditlog_Isdeleted' AND OBJECT_NAME(Parent_Object_Id)='tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditlog] ADD  CONSTRAINT [DF_tblAuditlog_Isdeleted]  DEFAULT ((0)) FOR [Isdeleted]
END

IF NOT  EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblAuditlog_CreatedDate' AND OBJECT_NAME(Parent_Object_Id)='tblAuditlog' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE [RPT].[tblAuditlog] ADD  CONSTRAINT [DF_tblAuditlog_CreatedDate]  DEFAULT GETUTCDATE() FOR [CreatedDate]
END

  

IF  NOT EXISTS(SELECT TOP 1 1 FROM SYS.TABLES WHERE NAME = 'UserActivity' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
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
 CONSTRAINT [PK_UserActivity] PRIMARY KEY CLUSTERED 
(
	[UserActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) ON [PRIMARY]
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



IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'IsUserLoggedIN'
AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
ALTER TABLE RPT.tblUsers
ADD IsUserLoggedIN BIT CONSTRAINT IX_tblusers_IsUserLoggedIN DEFAULT(0)
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'useractivedate'
AND Object_ID = Object_ID(N'rpt.tblusers'))
BEGIN
ALTER TABLE RPT.tblUsers
ADD useractivedate DATETIME CONSTRAINT IX_tblusers_useractivedate DEFAULT(GETUTCDATE())
END


IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'IsAllowmultiUserConnection'
AND Object_ID = Object_ID(N'rpt.tblOrganisationConfiguration'))
BEGIN
ALTER TABLE RPT.tblOrganisationConfiguration
ADD IsAllowmultiUserConnection BIT CONSTRAINT IX_tblOrganisationConfiguration_IsAllowmultiUserConnection DEFAULT(0)
END

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'HeadshotStatus'
AND Object_ID = Object_ID(N'rpt.tblTestAttempts'))
BEGIN
ALTER TABLE RPT.tblTestAttempts
ADD HeadshotStatus INT
END

--20-10-2023
IF EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'SessionID'
AND Object_ID = Object_ID(N'rpt.UserActivity'))
BEGIN
ALTER TABLE rpt.UserActivity
ALTER COLUMN  SessionID nvarchar(MAX)
END

--24-11-2023
IF   EXISTS(SELECT TOP 1 1 FROM SYS.DEFAULT_CONSTRAINTS WHERE [Name]='DF_tblImageTestConfiguration_ImageTimeInterval' AND OBJECT_NAME(Parent_Object_Id)='tblImageTestConfiguration' AND SCHEMA_NAME(SCHEMA_ID) = 'RPT')
BEGIN
ALTER TABLE RPT.tblImageTestConfiguration
DROP CONSTRAINT DF_tblImageTestConfiguration_ImageTimeInterval
END

IF EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'ImageTimeInterval'
AND Object_ID = Object_ID(N'rpt.tblImageTestConfiguration'))
BEGIN
ALTER TABLE RPT.tblImageTestConfiguration
ALTER COLUMN ImageTimeInterval INT
END

--18-03-2024

IF NOT  EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'roomvideostatus'
AND Object_ID = Object_ID(N'rpt.tblScheduleUserRoomVideo'))
BEGIN
ALTER TABLE [RPT].[tblScheduleUserRoomVideo] ADD roomvideostatus NUMERIC
END


IF EXISTS(SELECT 1 FROM sys.columns
WHERE Name = N'roomvideostatus'
AND Object_ID = Object_ID(N'rpt.tblScheduleUserRoomVideo'))
BEGIN
ALTER TABLE [RPT].[tblScheduleUserRoomVideo] ADD  CONSTRAINT [DF_tblAssessments_roomvideostatus]  DEFAULT ((0)) FOR [roomvideostatus]
END
