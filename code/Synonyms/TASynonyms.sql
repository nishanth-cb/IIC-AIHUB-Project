
IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_StudentDetail' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_StudentDetail]
GO
CREATE  synonym syn_StudentDetail FOR  [SarasDB_TA_Test].[dbo].StudentDetail

IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_Assessment' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_Assessment]
GO
CREATE  synonym syn_Assessment FOR  [SarasDB_TA_Test].[dbo].Assessment
 
IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_ScheduleDetails' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_ScheduleDetails]
GO
CREATE  synonym syn_ScheduleDetails FOR  [SarasDB_TA_Test].[dbo].ScheduleDetails


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_Schedule' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_Schedule]
GO
CREATE  synonym syn_Schedule FOR  [SarasDB_TA_Test].[dbo].Schedule


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_ScheduleUser' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_ScheduleUser]
GO
CREATE  synonym syn_ScheduleUser FOR  [SarasDB_TA_Test].[dbo].ScheduleUser


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_ScheduleUserDetail' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_ScheduleUserDetail]
GO
CREATE  synonym syn_ScheduleUserDetail FOR  [SarasDB_TA_Test].[dbo].ScheduleUserDetail


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_tblAssessmentPreferences' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_tblAssessmentPreferences]
GO
CREATE  synonym syn_tblAssessmentPreferences FOR  [SarasDB_TA_Test].[dbo].tblAssessmentPreferences


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_Users' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_Users]
GO
CREATE  synonym syn_Users FOR  [SarasDB_TA_Test].[dbo].[Users]


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_User' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_User]
GO
CREATE  synonym syn_User FOR  [SarasDB_TA_Test].dbo.[User]


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_ScheduleUserNavigationMapping' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_ScheduleUserNavigationMapping]
GO
CREATE  synonym syn_ScheduleUserNavigationMapping FOR  SarasDB_TA_Test.dbo.ScheduleUserNavigationMapping


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_UserQuestionMapping' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_UserQuestionMapping]
GO
CREATE  synonym syn_UserQuestionMapping FOR  SarasDB_TA_Test.dbo.UserQuestionMapping


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_ScheduleUserVideoDetails' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_ScheduleUserVideoDetails]
GO
CREATE  synonym syn_ScheduleUserVideoDetails FOR  SarasDB_TA_Test.dbo.ScheduleUserVideoDetails


IF  EXISTS (SELECT * FROM sys.synonyms WHERE name = N'syn_Organization' AND schema_id = SCHEMA_ID(N'dbo'))
DROP SYNONYM [dbo].[syn_Organization]
GO
CREATE  synonym syn_Organization FOR  [SarasDB_TA_Test].[dbo].Organization  