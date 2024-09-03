--19-09-2022IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = '[IX_tblusers_RIO]' AND object_ID = OBJECT_ID('[RPT].[tblUsers]'))
DROP INDEX [IX_tblusers_RIO] ON [RPT].[tblUsers]
GO  CREATE NONCLUSTERED INDEX [IX_tblusers_RIO]ON [RPT].[tblUsers] ([RoleId],[IsDeleted])INCLUDE ([OrganisationId]) IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = '[IX_tblLiveTestConfiguration_PIOIIIC]' AND object_ID = OBJECT_ID('[RPT].[tblUsers]'))
DROP INDEX [IX_tblLiveTestConfiguration_PIOIIIC] ON [RPT].[tblLiveTestConfiguration]
GO  CREATE NONCLUSTERED INDEX [IX_tblLiveTestConfiguration_PIOIIIC]ON [RPT].[tblLiveTestConfiguration] ([proctoringTypeID],[Isdeleted])INCLUDE ([OrganisationID],[IsAudioFeatureRequired],[IsChatFeatureRequired],[IsFaceMismatchCountRequired],[ConfigurationSystemtype],[IsHeadShotRequired],[IsRoomVideoRequired],[RecordingType],[IsAutoProctorTagging],[IsAudioCallingRequired],[IsScreenRecordingRequired],[IsSCAnalysisRequired])  --31-08-23 IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_TblTestAttempts_Isdeleted_TestDetailsID_VideoCode' AND object_ID = OBJECT_ID('RPT.tblTestAttempts'))
	DROP INDEX IX_TblTestAttempts_Isdeleted_TestDetailsID_VideoCode ON [RPT].[tblTestAttempts]

CREATE NONCLUSTERED INDEX [IX_TblTestAttempts_Isdeleted_TestDetailsID_VideoCode]  
ON [RPT].[tblTestAttempts] ([isdeleted])  INCLUDE ([TestDetailsId],[VideoCode])


IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblTestDetails_TPIIT' AND object_ID = OBJECT_ID('RPT.tblTestDetails'))
	DROP INDEX IX_tblTestDetails_TPIIT ON [RPT].[tblTestDetails]
CREATE NONCLUSTERED INDEX IX_tblTestDetails_TPIIT ON RPT.tblTestDetails(TestDetailId,PartnerIntegrationID,IsSubmitted,IsDeleted,TestNameInformationId)  

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblTestAttempts_AIT' AND object_ID = OBJECT_ID('RPT.tblTestAttempts'))
	DROP INDEX IX_tblTestAttempts_AIT ON [RPT].[tblTestAttempts]
CREATE NONCLUSTERED INDEX IX_tblTestAttempts_AIT ON RPT.tblTestAttempts(AttemptId,ISdeleted,TestDetailsId) 

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblSubmissionQueue_AI' AND object_ID = OBJECT_ID('RPT.tblSubmissionQueue'))
	DROP INDEX IX_tblSubmissionQueue_AI ON [RPT].[tblSubmissionQueue]
CREATE NONCLUSTERED INDEX IX_tblSubmissionQueue_AI ON RPT.tblSubmissionQueue(AttemptId,ISdeleted) 
 
IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_StudentScheduleDetail_PPIT' AND object_ID = OBJECT_ID('RPT.tblStudentScheduleDetails'))
	DROP INDEX IX_StudentScheduleDetail_PPIT ON [RPT].[tblStudentScheduleDetails]

CREATE NONCLUSTERED INDEX IX_StudentScheduleDetail_PPIT ON RPT.tblStudentScheduleDetails(PartnerIntegrationId,ProctorAvailID,ISdeleted,TestNameInformationId) 


--05-12-2023

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblScheduleUser_SISS' AND object_ID = OBJECT_ID('RPT.tblScheduleUser'))
DROP INDEX IX_tblScheduleUser_SISS ON [RPT].[tblScheduleUser]
CREATE NONCLUSTERED INDEX [IX_tblScheduleUser_SISS]
ON [RPT].[tblScheduleUser] ([ScheduleUserID],[Isdeleted])
INCLUDE ([ScheduleDetailID],[ScheduleUserCode])
GO
 

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblTestDetails_TOII' AND object_ID = OBJECT_ID('RPT.tblTestDetails'))
DROP INDEX IX_tblTestDetails_TOII ON [RPT].[tblTestDetails]
CREATE NONCLUSTERED INDEX [IX_tblTestDetails_TOII]
ON [RPT].[tblTestDetails] ([TestNameInformationId],[OrganisationId],[IsSubmitted],[IsDeleted])
GO

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblScheduleDetails_SISPSE' AND object_ID = OBJECT_ID('RPT.tblScheduleDetails'))
DROP INDEX IX_tblScheduleDetails_SISPSE ON [RPT].[tblScheduleDetails]
CREATE NONCLUSTERED INDEX [IX_tblScheduleDetails_SISPSE]
ON [RPT].[tblScheduleDetails] ([ScheduleDetailID],[Isdeleted])
INCLUDE ([ScheduleID],[ProctoringType],[StartDatetime],[EndDateTime])
GO

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblSchedule_SS' AND object_ID = OBJECT_ID('RPT.tblSchedule'))
DROP INDEX IX_tblSchedule_SS ON [RPT].[tblSchedule]
CREATE NONCLUSTERED INDEX [IX_tblSchedule_SS]
ON [RPT].[tblSchedule] ([ScheduleID])
INCLUDE ([ScheduleName])
GO

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblTestLiveModeConfiguration_PIOI' AND object_ID = OBJECT_ID('RPT.tblTestLiveModeConfiguration'))
DROP INDEX IX_tblTestLiveModeConfiguration_PIOI ON [RPT].[tblTestLiveModeConfiguration] 
CREATE NONCLUSTERED INDEX [IX_tblTestLiveModeConfiguration_PIOI]
ON [RPT].[tblTestLiveModeConfiguration] ([proctoringTypeID],[Isdeleted],[OrganisationID])
INCLUDE ([IsChatFeatureRequired],[RecordingType],[IsScreenRecordingRequired],[IsSCAnalysisRequired],[ScheduleDetailID])
GO

IF EXISTS (SELECT NULL FROM sys.indexes WHERE name = 'IX_tblLiveTestConfiguration_PIO' AND object_ID = OBJECT_ID('RPT.tblLiveTestConfiguration'))
DROP INDEX IX_tblLiveTestConfiguration_PIO ON [RPT].[tblLiveTestConfiguration] 
CREATE NONCLUSTERED INDEX [IX_tblLiveTestConfiguration_PIO]
ON [RPT].[tblLiveTestConfiguration] ([OrganisationID],[proctoringTypeID],[Isdeleted])
INCLUDE ([RecordingType],[IsScreenRecordingRequired],[IsSCAnalysisRequired])
GO
 