----ApplicationSettings

SET IDENTITY_INSERT RPT.ApplicationSettings ON 

IF NOT EXISTS(SELECT 1 FROM RPT.ApplicationSettings WHERE [ID]=1)
BEGIN
	INSERT RPT.ApplicationSettings (ID,IsProfile,IsOnlineRequired,IsOfflineRequired,Extention1,Extention2,Extention3,Extention4,Type,CreatedDate) 
	VALUES (1,0,0,1,'','','','',1,'2021-04-07 13:13:14.973')
END

IF NOT EXISTS(SELECT 1 FROM RPT.ApplicationSettings WHERE [ID]=2)
BEGIN
	INSERT RPT.ApplicationSettings (ID,IsProfile,IsOnlineRequired,IsOfflineRequired,Extention1,Extention2,Extention3,Extention4,Type,CreatedDate) 
	VALUES (2,	0,	0,	0	,'skype,teams,snapchat'	,'www.skype.com	','','',3,'2021-04-08 12:30:03.283')

END

IF NOT EXISTS(SELECT 1 FROM RPT.ApplicationSettings WHERE [ID]=3)
BEGIN
	INSERT RPT.ApplicationSettings (ID,IsProfile,IsOnlineRequired,IsOfflineRequired,Extention1,Extention2,Extention3,Extention4,Type,CreatedDate) 
	VALUES (3,0,0,0,'excelwww','www.google.com','','',2,'2021-04-08 12:32:01.720'	)

END

IF NOT EXISTS(SELECT 1 FROM RPT.ApplicationSettings WHERE [ID]=4)
BEGIN
	INSERT RPT.ApplicationSettings (ID,IsProfile,IsOnlineRequired,IsOfflineRequired,Extention1,Extention2,Extention3,Extention4,Type,CreatedDate) 
	VALUES (4,	3,	NULL,NULL,	'audio required','','','',	4,'2021-04-12 09:36:10.070')

END


SET IDENTITY_INSERT RPT.ApplicationSettings OFF


---Customers

SET IDENTITY_INSERT RPT.tblCustomers ON 

IF NOT EXISTS(SELECT 1 FROM RPT.tblCustomers WHERE CustomerID=1)
BEGIN
	INSERT RPT.tblCustomers (CustomerID,CustomerName,CreatedDate,CustomerCode,SecretKey,SecretValue) 
	VALUES (1,'NYCS','2021-09-29 18:30:00.860','NYCS01',NULL,NULL)
END

IF NOT EXISTS(SELECT 1 FROM RPT.tblCustomers WHERE CustomerID=2)
BEGIN
	INSERT RPT.tblCustomers (CustomerID,CustomerName,CreatedDate,CustomerCode,SecretKey,SecretValue) 
	VALUES (2,'SIMS','2021-09-29 18:30:00.860','SIMS01',NULL,NULL)

END

IF NOT EXISTS(SELECT 1 FROM RPT.tblCustomers WHERE CustomerID=3)
BEGIN
	INSERT RPT.tblCustomers (CustomerID,CustomerName,CreatedDate,CustomerCode,SecretKey,SecretValue) 
	VALUES (3,'T&A'	,'2021-09-29 18:30:00.860','TNA01','qLy84xsWN_o4-XwHBDFubQ..','pQUICZoyuUS5XEpYdW1pVw..')

END

IF NOT EXISTS(SELECT 1 FROM RPT.tblCustomers  WHERE CustomerID=4)
BEGIN
	INSERT RPT.tblCustomers (CustomerID,CustomerName,CreatedDate,CustomerCode,SecretKey,SecretValue) 
	VALUES (4,'Excelsoft','2021-10-11 19:56:31.663','ES01',	NULL,NULL)

END


IF NOT EXISTS(SELECT 1 FROM RPT.tblCustomers  WHERE CustomerID=5)
BEGIN
	INSERT RPT.tblCustomers (CustomerID,CustomerName,CreatedDate,CustomerCode,SecretKey,SecretValue) 
	VALUES (5,'Excel QA','2021-11-09 12:26:41.547','ESQA',	NULL,	NULL)

END


SET IDENTITY_INSERT RPT.tblCustomers OFF

SET IDENTITY_INSERT [RPT].[tblRole] ON 
GO
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblRole]  WHERE Roleid=1)
INSERT [RPT].[tblRole] ([RoleId], [RoleName], [IsDeleted], [CreatedDate], [UpdatedDate]) VALUES (1, N'Administrator', 0, CAST(N'2016-06-28T04:13:20.1500000' AS DateTime2), NULL)

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblRole]  WHERE Roleid=2)
INSERT [RPT].[tblRole] ([RoleId], [RoleName], [IsDeleted], [CreatedDate], [UpdatedDate]) VALUES (2, N'Proctor', 0, CAST(N'2016-06-28T04:13:20.1500000' AS DateTime2), NULL)

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblRole]  WHERE Roleid=3)
INSERT [RPT].[tblRole] ([RoleId], [RoleName], [IsDeleted], [CreatedDate], [UpdatedDate]) VALUES (3, N'Super Administrator', 0, CAST(N'2016-06-28T04:13:20.1500000' AS DateTime2), NULL)

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblRole]  WHERE Roleid=5)
INSERT [RPT].[tblRole] ([RoleId], [RoleName], [IsDeleted], [CreatedDate], [UpdatedDate]) VALUES (5, N'Student', 0, CAST(N'2021-09-13T13:00:48.8430000' AS DateTime2), NULL)
 
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblRole]  WHERE Roleid=7)
INSERT [RPT].[tblRole] ([RoleId], [RoleName], [IsDeleted], [CreatedDate], [UpdatedDate]) VALUES (7, N'CustomerAdmin', 0, CAST(N'2021-10-12T12:07:03.7730000' AS DateTime2), NULL)
 
SET IDENTITY_INSERT [RPT].[tblRole] OFF
GO


----Organisation


SET IDENTITY_INSERT RPT.tblOrganisation ON 

IF NOT EXISTS(SELECT 1 FROM RPT.tblOrganisation WHERE [OrganisationId]=0)
BEGIN
	INSERT RPT.tblOrganisation (OrganisationId,OrganisationName,OrganisationGUID,OrganisationTheme,OrganisationURL,IsDeleted,CreatedDate,UpdatedDate,IsEnabled,Description,Address,
                                FromEmailId,PhoneNumber,DefaultUserId,Mode,StorageConfiguration,Customerid,OrganizationCode,ParentID,OrganisationType,IscustomerOrg) 
	VALUES (0,'Default Organization','7C13775E-9227-4A63-8D42-4821707F99D8','OrganisationTheme','http://localhost/EP.Web/app/index.html#/'	,0,	'2016-09-17 10:37:34.673',NULL,	1,	'Default organization for Superadmin',	NULL,'ep.admin@excelindia.com',	NULL,NULL,NULL,'{"rtmp":"rtmp://ep-stream.excelindia.com/","s3":1,"ProctorVidS3":"sarasbuildserver.video","ProctorScrS3":"sarasbuildserver.scrvideo","ProctorVid":"proctorvid","ProctorScr":"proctorscr","BucketName":"easyproctordev1","AccessKey":"AKIA4RKCS2ERO37K6VGT","SecretKey":"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","PhotoStorage":"PhotoCapture"}',	NULL,	NULL,	NULL,	NULL,	NULL)
END


IF NOT EXISTS(SELECT 1 FROM RPT.tblOrganisation WHERE [OrganisationId]=1)
BEGIN
	INSERT RPT.tblOrganisation (OrganisationId,OrganisationName,OrganisationGUID,OrganisationTheme,OrganisationURL,IsDeleted,CreatedDate,UpdatedDate,IsEnabled,Description,Address,
                                FromEmailId,PhoneNumber,DefaultUserId,Mode,StorageConfiguration,Customerid,OrganizationCode,ParentID,OrganisationType,IscustomerOrg) 
	VALUES (1,'Excelsoft','89AF55EF-E396-4D84-8F5E-457E4D8EB6CA','Sample','http://easyproctor.mysaras.com/ep.web.dev/index.html#/',	0,	'2016-09-19 09:21:54.330',	'2022-04-11 13:46:35.960',	1	,'Excelsoft mysore','Mysore','epadmin@excelindia.com',	NULL,NULL,NULL,	'{"rtmp":"rtmp://ep-stream.excelindia.com/","s3":1,"ProctorVidS3":"sarasbuildserver.video","ProctorScrS3":"sarasbuildserver.scrvideo","ProctorVid":"proctorvid","ProctorScr":"proctorscr","BucketName":"easyproctordev1","AccessKey":"AKIA4RKCS2ERO37K6VGT","SecretKey":"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","PhotoStorage":"PhotoCapture"}',	4	,000,	NULL,	NULL,	NULL)

END


SET IDENTITY_INSERT RPT.tblOrganisation OFF


---Users


SET IDENTITY_INSERT RPT.tblUsers ON 

IF NOT EXISTS(SELECT 1 FROM RPT.tblUsers WHERE [UserId]=1)
BEGIN
	INSERT RPT.tblUsers (UserId,FirstName,LastName,LoginName,Password,PhoneNumber,EmailId,RoleId,OrganisationId,IsEnabled,IsDeleted,CreatedDate,
                         UpdatedDate,UserTimeZoneId,loginclickcount,loginclicktime,forgotpasswordclicktime,forgotpasswordclickcount,USerGUID,CreatedAdminorg) 
	VALUES (1,'Super','Admin','superadmin','K56LhpR57UyHKBDKScgv/Q==','','',3,	1,	1	,0	,'2016-09-17 10:37:34.673',	NULL,'',0,'2022-05-06 06:29:18.017','2021-11-19 10:58:27.193',2,'',NULL)
END

IF NOT EXISTS(SELECT * FROM RPT.tblUsers WHERE [UserId]=2)
BEGIN
	INSERT RPT.tblUsers (UserId,FirstName,LastName,LoginName,Password,PhoneNumber,EmailId,RoleId,OrganisationId,IsEnabled,IsDeleted,CreatedDate,
                         UpdatedDate,UserTimeZoneId,loginclickcount,loginclicktime,forgotpasswordclicktime,forgotpasswordclickcount,USerGUID,CreatedAdminorg) 
	VALUES (2,'Admin','EP','admin01','K56LhpR57UyHKBDKScgv/Q==',156,'manu.niranjan@excelindia.com',1,1,1,0,'2016-09-19 14:57:42.837',NULL,'India Standard Time',0,'2016-09-17 10:37:34.673','2016-09-17 10:37:34.673',0,'',NULL)

END

SET IDENTITY_INSERT RPT.tblUsers OFF


--24-08-2022
SET IDENTITY_INSERT [dbo].[CountryMaster] ON 
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (1, N'Afghanistan', N'Afghanistan', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (2, N'Albania', N'Albania', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (3, N'Algeria', N'Algeria', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (4, N'Andorra', N'Andorra', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (5, N'Angola', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (6, N'Antigua and Barbuda', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (7, N'Argentina', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (8, N'Armenia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (9, N'Australia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (10, N'Austria', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (11, N'Azerbaijan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (12, N'Bahamas', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (13, N'Bahrain', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (14, N'Bangladesh', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (15, N'Barbados', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (16, N'Belarus', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (17, N'Belgium', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (18, N'Belize', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (19, N'Benin', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (20, N'Bhutan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (21, N'Bolivia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (22, N'Bosnia and Herzegovina', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (23, N'Botswana', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (24, N'Brazil', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (25, N'Brunei', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (26, N'Bulgaria', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (27, N'Burkina Faso', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (28, N'Burundi', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (29, N'Cambodia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (30, N'Cameroon', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (31, N'Canada', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (32, N'Cape Verde', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (33, N'Central African Republic', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (34, N'Chad', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (35, N'Chile', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (36, N'China', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (37, N'Colombia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (38, N'Comoros', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (39, N'Congo (Brazzaville)', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (40, N'Congo, Democratic Republic of the', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (41, N'Costa Rica', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (42, N'Croatia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (43, N'Cuba', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (44, N'Cyprus', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (45, N'Czech Republic', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (46, N'Cote dIvoire', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (47, N'Denmark', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (48, N'Djibouti', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (49, N'Dominica', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (50, N'Dominican Republic', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (51, N'East Timor', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (52, N'Ecuador', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (53, N'Egypt', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (54, N'El Salvador', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (55, N'Equatorial Guinea', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (56, N'Eritrea', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (57, N'Estonia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (58, N'Ethiopia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (59, N'Fiji', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (60, N'Finland', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (61, N'France', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (62, N'Gabon', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (63, N'Gambia, The', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (64, N'Georgia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (65, N'Germany', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (66, N'Ghana', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (67, N'Greece', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (68, N'Grenada', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (69, N'Guatemala', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (70, N'Guinea-Bissau', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (71, N'Guyana', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (72, N'Haiti', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (73, N'Honduras', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (74, N'Hungary', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (75, N'Iceland', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (76, N'India', NULL, 0, NULL, NULL, N'IND')
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (77, N'Indonesia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (78, N'Iran', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (79, N'Iraq', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (80, N'Ireland', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (81, N'Israel', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (82, N'Italy', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (83, N'Jamaica', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (84, N'Japan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (85, N'Jordan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (86, N'Kazakhstan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (87, N'Kenya', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (88, N'Kiribati', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (89, N'Korea, North', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (90, N'Korea, South', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (91, N'Kuwait', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (92, N'Kyrgyzstan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (93, N'Laos', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (94, N'Latvia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (95, N'Lebanon', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (96, N'Lesotho', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (97, N'Liberia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (98, N'Libya', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (99, N'Liechtenstein', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (100, N'Lithuania', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (101, N'Luxembourg', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (102, N'Macedonia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (103, N'Madagascar', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (104, N'Malawi', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (105, N'Malaysia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (106, N'Maldives', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (107, N'Mali', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (108, N'Malta', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (109, N'Marshall Islands', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (110, N'Mauritania', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (111, N'Mauritius', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (112, N'Mexico', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (113, N'Micronesia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (114, N'Moldova', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (115, N'Monaco', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (116, N'Mongolia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (117, N'Morocco', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (118, N'Mozambique', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (119, N'Myanmar', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (120, N'Namibia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (121, N'Nauru', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (122, N'Nepal', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (123, N'Netherlands', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (124, N'New Zealand', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (125, N'Nicaragua', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (126, N'Niger', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (127, N'Nigeria', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (128, N'Norway', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (129, N'Oman', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (130, N'Pakistan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (131, N'Palau', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (132, N'Panama', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (133, N'Papua New Guinea', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (134, N'Paraguay', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (135, N'Peru', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (136, N'Philippines', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (137, N'Poland', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (138, N'Portugal', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (139, N'Qatar', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (140, N'Romania', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (141, N'Russia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (142, N'Rwanda', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (143, N'Saint Kitts and Nevis', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (144, N'Saint Lucia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (145, N'Saint Vincent and The Grenadines', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (146, N'Samoa', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (147, N'San Marino', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (148, N'Sao Tome and Principe', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (149, N'Saudi Arabia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (150, N'Senegal', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (151, N'Serbia and Montenegro', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (152, N'Seychelles', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (153, N'Sierra Leone', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (154, N'Singapore', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (155, N'Slovakia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (156, N'Slovenia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (157, N'Solomon Islands', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (158, N'Somalia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (159, N'South Africa', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (160, N'Spain', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (161, N'Sri Lanka', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (162, N'Sudan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (163, N'Suriname', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (164, N'Swaziland', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (165, N'Sweden', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (166, N'Switzerland', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (167, N'Syria', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (168, N'Taiwan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (169, N'Tajikistan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (170, N'Tanzania', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (171, N'Thailand', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (172, N'Togo', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (173, N'Tonga', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (174, N'Trinidad and Tobago', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (175, N'Tunisia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (176, N'Turkey', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (177, N'Turkmenistan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (178, N'Tuvalu', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (179, N'Uganda', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (180, N'Ukraine', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (181, N'United Arab Emirates', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (182, N'United Kingdom', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (183, N'United States', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (184, N'Uruguay', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (185, N'Uzbekistan', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (186, N'Vanuatu', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (187, N'Vatican City', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (188, N'Venezuela', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (189, N'Vietnam', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (190, N'Western Sahara', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (191, N'Yemen', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (192, N'Zambia', NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CountryMaster] ([ID], [CountryName], [Description], [IsDeleted], [IPFrom], [IPTo], [CountryISOCode]) VALUES (193, N'Zimbabwe', NULL, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CountryMaster] OFF
GO


SET IDENTITY_INSERT [RPT].[tblEvents] ON
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=0)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(0,N'Submission Assigned',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=1)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(1,N'Submission Approved',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=2)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(2,N'Submission Rejected',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=3)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(3,N'Submission Fowarded',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=4)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(4,N'Submission Unassigned',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=5)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(5,N'Submission Changed',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=6)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(6,N'Organization Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=7)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(7,N'Organization Default Admin Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=8)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(8,N'Organization Enabled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=9)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(9,N'Organization Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=10)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(10,N'Organization Default Admin updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=11)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(11,N'Organization Disabled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=12)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(12,N'Admin Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=13)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(13,N'Admin Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=14)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(14,N'Admin Enabled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=15)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(15,N'Admin Disabled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=16)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(16,N'Admin Password changed',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=17)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(17,N'Threshold Settings Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=18)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(18,N'Threshold Settings Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=19)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(19,N'Preference Settings Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=20)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(20,N'Preference Settings Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=21)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(21,N'Audio Analysis Queue',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=22)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(22,N'Video Analysis Queue',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=23)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(23,N'Audio Analysis Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=24)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(24,N'Audio Analysis Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=25)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(25,N'Video Analysis Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=26)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(26,N'Video Analysis Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=27)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(27,N'Login Details',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=28)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(28,N'Logout Details',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=29)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(29,N'Proctor Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=30)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(30,N'Proctor Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=31)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(31,N'Proctor Enabled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=32)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(32,N'Proctor Disabled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=33)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(33,N'Proctor Password Changed',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=34)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(34,N'Video Attempt Approved',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=35)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(35,N'Video Attempt Rejected',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=36)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(36,N'Submission attempt Video review JSON',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=37)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(37,N'Submission attempt Photo review JSON',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=38)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(38,N'Photo Analysis Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=39)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(39,N'Photo Analysis Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=40)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(40,N'Photo Review Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=41)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(41,N'Photo Review Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=42)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(42,N'Video Review Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=43)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(43,N'Video Review Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=44)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(44,N'Photo Attempt Approved',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=45)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(45,N'Photo Attempt Rejected',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=46)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(46,N'Photo Analysis Queue',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=47)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(47,N'Forgot Password',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=48)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(48,N'Proctor Availability Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=49)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(49,N'Proctor Availability Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=50)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(50,N'Proctor Availability Deletion',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=51)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(51,N'Student Schedule Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=52)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(52,N'Student Rescheduled',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=53)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(53,N'Proctor Online Review Addition',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=54)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(54,N'Proctor Online Review Updation',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=55)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(55,N'Online Proctor Changed',0)           END          
IF NOT EXISTS (SELECT 1 FROM [RPT].[tblEvents] WHERE [EventId]=56)  BEGIN  INSERT [RPT].[tblEvents] ([EventId], [EventName], [IsDeleted])  VALUES(56,N'Customer Admin Creation',0)           END 

SET IDENTITY_INSERT [RPT].[tblEvents] OFF
GO

SET IDENTITY_INSERT RPT.tblrole ON 
IF NOT EXISTS(SELECT 1 FROM RPT.tblrole WHERE roleid=7)
INSERT INTO RPT.tblrole(RoleId,RoleName,IsDeleted)
SELECT 7,'CustomerAdmin',0
SET IDENTITY_INSERT RPT.tblrole OFF



---31-08-2023

--------------------Student------------------------------
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=1)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (1, N'Candidate Dashboard', N'Candidate Dashboard', 0, 1, N'/EPLiveProctoring/#/studentschedule', 1, N'STD001', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,1
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=2)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (2, N'Candidate Exam List', N'Candidate Exam List', 0, 1, N'/EPLiveProctoring/#/candidatedashboardStudent', 1, N'STD002', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,2
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=3)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (3, N'Candidate Report', N'Candidate Report', 0, 1, N'/EPLiveProctoring/#/studentreport', 1, N'STD003', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,3
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=4)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (4, N'Candidate Precheck', N'Candidate Precheck', 0, 1, N'/EPLiveProctoring/#/candidateprecheck', 1, N'STD004', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,4
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=5)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (5, N'Secure Browser Help', N'Secure Browser Help', 0, 1, N'/EPLiveProctoring/#/securebrowser', 1, N'STD005', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,5
END

--------------Proctor---------------------
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=6)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (6, N'Live Proctor Dashboard', N'Live Proctor Dashboard', 0, 1, N'/EPLiveProctoring/#/dashboard', 1, N'PRT001', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,6
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=7)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (7, N'Live Proctor Calendar', N'Live Proctor Calendar', 0, 1, N'/EPLiveProctoring/#/Calendar', 1, N'PRT002', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,7
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=8)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (8, N'Live Proctor Report', N'Live Proctor Report', 0, 1, N'/EPLiveProctoring/#/Reports', 1, N'PRT003', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,8
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=9)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (9, N'Live Proctor System Check', N'Live Proctor System Check', 0, 1, N'/EPLiveProctoring/#/Systemcheck', 1, N'PRT004', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,9
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=10)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (10, N'Live Proctor Edit Profile', N'Live Proctor Edit Profile', 0, 1, N'/EPLiveProctoring/#/editprofile', 1, N'PRT005', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,10
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=11)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (11, N'Live Proctor Student Verification', N'Live Proctor Student Verification', 0, 1, N'/EPLiveProctoring/#/Studentverification', 1, N'PRT006', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,11
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=12)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (12, N'Live Proctor Live View', N'Live Proctor Live View', 0, 1, N'/EPLiveProctoring/#/Liveviews', 1, N'PRT007', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,12
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=13)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (13, N'Reviewer Proctor Dashboard', N'Reviewer Proctor Dashboard', 0, 1, N'/ep.web/app/index.html#/Dashboard', 1, N'PRT008', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,13
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=14)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (14, N'Reviewer Submission Listing - Schedule Name', N'Reviewer Submission Listing - Schedule Name', 0, 1, N'/ep.web/app/index.html#/Scheduling', 1, N'PRT009', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,14
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=15)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (15, N'Reviewer Submission Listing - Candidate Name', N'Reviewer Submission Listing - Candidate Name', 0, 1, N'/ep.web/app/index.html#/Dashboard/submissionlisting/Test', 1, N'PRT010', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,15
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=16)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (16, N'Reviewer Submission Listing - Attempt', N'Reviewer Submission Listing - Attempt', 0, 1, N'/ep.web/app/index.html#/Dashboard/submissionlisting/Attempts', 1, N'PRT011', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,16
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=17)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (17, N'Reviewer Review', N'Reviewer Review', 0, 1, N'/ep.web/app/index.html#/Dashboard/submissionlisting/Review', 1, N'PRT012', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,17
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=18)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (18, N'Reviewer Video Review', N'Reviewer Video Review', 0, 1, N'/ep.web/app/index.html#/Dashboard/submissionlisting/VideoReview_Opt', 1, N'PRT013', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,18
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=19)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (19, N'Reviewer Photo Review', N'Reviewer Photo Review', 0, 1, N'/ep.web/app/index.html#/Dashboard/submissionlisting/PhotoReview', 1, N'PRT014', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,19
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=20)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (20, N'Reviewer Dashboard Table View', N'Reviewer Dashboard Table View', 0, 1, N'/ep.web/app/index.html#/DashboardTableView', 1, N'PRT015', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,20
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=21)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (21, N'Reviewer Notification', N'Reviewer Notification', 0, 1, N'/ep.web/app/index.html#/Notifications', 1, N'PRT016', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,21
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=22)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (22, N'Reviewer Test Summary Report Dashboard', N'Reviewer Test Summary Report Dashboard', 0, 1, N'/ep.web/app/index.html#/TestStatusReport', 1, N'PRT017', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,22

	INSERT INTO rpt.RoleToprivilages (RoleId,PrivilageId)
    SELECT 1,22


END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=23)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (23, N'Reviewer Test Summary Report Dashboard - Schedule Name', N'Reviewer Test Summary Report Dashboard - Schedule Name', 0, 1, N'/ep.web/app/index.html#/Scheduling', 1, N'PRT018', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,23
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,23
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=24)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (24, N'Reviewer Test Summary Report Dashboard - Candidate Name', N'Reviewer Test Summary Report Dashboard - Candidate Name', 0, 1, N'/ep.web/app/index.html#/ScheduleListing/Test', 1, N'PRT019', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,24

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
    SELECT 1,24
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=25)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (25, N'Reviewer Test Summary Report Dashboard - Attempt', N'Reviewer Test Summary Report Dashboard - Attempt', 0, 1, N'ep.web/app/index.html#/TestStatusReport/submissionlisting/Attempts', 1, N'PRT020', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,25

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,25
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=26)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (26, N'Reviewer Edit Profile', N'Reviewer Edit Profile', 0, 1, N'/ep.web/app/index.html#/UserProfile', 1, N'PRT021', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,26

	INSERT INTO rpt.RoleToprivilages (RoleId,PrivilageId)
    SELECT 1,26
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=27)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (27, N'Reviewer Change Password', N'Reviewer Change Password', 0, 1, N'/ep.web/app/index.html#/ChangePassword', 1, N'PRT022', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,27
 
    INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,27
END

------------------Admin---
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=28)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (28, N'Admin Dashboard', N'Admin Dashboard', 0, 1, N'/ep.web/app/index.html#/Admin_Dashboard', 1, N'ADM001', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,28
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=29)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (29, N'Admin Dashboard - Schedule Name', N'Admin Dashboard - Schedule Name', 0, 1, N'ep.web/app/index.html#/Scheduling', 1, N'ADM002', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,29
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=30)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (30, N'Admin Dashboard - Candidate Name', N'Admin Dashboard - Candidate Name', 0, 1, N'/ep.web/app/index.html#/Admin_Dashboard/AdminSubmissionListing/Test', 1, N'ADM003', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,30
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=31)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (31, N'Admin Dashboard - Attempt', N'Admin Dashboard - Attempt', 0, 1, N'/ep.web/app/index.html#/Admin_Dashboard/AdminSubmissionListing/Attempts', 1, N'ADM004', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,31
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=32)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (32, N'Admin Dashboard - Review', N'Admin Dashboard - Review', 0, 1, N'/ep.web/app/index.html#/Admin_Dashboard/AdminSubmissionListing/Review', 1, N'ADM005', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,32
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=33)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (33, N'Admin Dashboard - Photo Review', N'Admin Dashboard - Photo Review', 0, 1, N'/ep.web/app/index.html#/Admin_Dashboard/AdminSubmissionListing/PhotoReview', 1, N'ADM006', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,33
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=34)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (34, N'Admin Dashboard - Video Review', N'Admin Dashboard - Video Review', 0, 1, N'/ep.web/app/index.html#/Admin_Dashboard/AdminSubmissionListing/VideoReview_Opt', 1, N'ADM007', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,34
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=35)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (35, N'Manage Proctors', N'Manage Proctors', 0, 1, N'/ep.web/app/index.html#/ManageProctors', 1, N'ADM008', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,35
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=36)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (36, N'Candidate Tagging', N'Candidate Tagging', 0, 1, N'/ep.web/app/index.html#/CandidateTagging', 1, N'ADM009', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,36
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=37)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (37, N'Admin Tagging', N'Admin Tagging', 0, 1, N'/ep.web/app/index.html#/AdminTagging', 1, N'ADM010', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,37
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=38)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (38, N'Scheduled ', N'Scheduled ', 0, 1, N'/ep.web/app/index.html#/TodaysExam', 1, N'ADM011', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,38
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=39)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (39, N'Analysis Report', N'Analysis Report', 0, 1, N'/ep.web/app/index.html#/AnalysisReport', 1, N'ADM012', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,39
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=40)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (40, N'Report Summary', N'Report Summary', 0, 1, N'ep.web/app/index.html#/TypeOfReports', 1, N'ADM013', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,40
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=41)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (41, N'Report Summary - Submission Reports', N'Report Summary - Submission Reports', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/TestListForSubmissionReport/submissions', 1, N'ADM014', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,41
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=42)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (42, N'Report Summary - Submission Reports - Schedule Name', N'Report Summary - Submission Reports - Schedule Name', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/TestListForSubmissionReport/submissions/Scheduling', 1, N'ADM015', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,42
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=43)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (43, N'Report Summary - Submission Reports - ID', N'Report Summary - Submission Reports - ID', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/TestListForSubmissionReport/submissions/TestsForSubmissionsReport', 1, N'ADM016', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,43
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=44)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (44, N'Report Summary - User Report', N'Report Summary - User Report', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/UserDeatailsReport/Users', 1, N'ADM017', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,44
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=45)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (45, N'Report Summary - User Report -Test Name', N'Report Summary - User Report -Test Name', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport', 1, N'ADM018', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,45
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=46)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (46, N'Report Summary - User Report -Schedule Name', N'Report Summary - User Report -Schedule Name', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport/Scheduling', 1, N'ADM019', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,46
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=47)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (47, N'Report Summary - User Report -ID', N'Report Summary - User Report -ID', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport/Scheduling/ID', 1, N'ADM020', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,47
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=48)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (48, N'Report Summary - User Report -Attempt', N'Report Summary - User Report -Attempt', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport/Scheduling/Attempt', 1, N'ADM021', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,48
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=49)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (49, N'Login Report', N'Login Report', 0, 1, N'/ep.web/app/index.html#/LoginLogoutReports', 1, N'ADM022', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,49
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=50)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (50, N'Mapping Report', N'Mapping Report', 0, 1, N'/ep.web/app/index.html#/StudentProctorMapReport', 1, N'ADM023', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,50
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=51)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (51, N'Test Report', N'Test Report', 0, 1, N'/ep.web/app/index.html#/TestReport', 1, N'ADM024', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,51
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=52)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (52, N'Proctor Report', N'Proctor Report', 0, 1, N'/ep.web/app/index.html#/ProctorReport', 1, N'ADM025', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,52
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=53)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (53, N'Test Based Proctor Report', N'Test Based Proctor Report', 0, 1, N'/ep.web/app/index.html#/TestbasedProctorReport', 1, N'ADM026', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,53
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=54)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (54, N'Proctor Based Test Report', N'Proctor Based Test Report', 0, 1, N'/ep.web/app/index.html#/ProctorbasedTestReport', 1, N'ADM027', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,54
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=55)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (55, N'Test Result Report', N'Test Result Report', 0, 1, N'/epbuild.excelindia.com//ep.web/app/index.html#/TestResultReport', 1, N'ADM028', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,55
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=56)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (56, N'Test Result Report - Schedule', N'Test Result Report - Schedule', 0, 1, N'/ep.web/app/index.html#/TestResultReport/Scheduling', 1, N'ADM029', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,56
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=57)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (57, N'Test Result Report - Candidate Name', N'Test Result Report - Candidate Name', 0, 1, N'/ep.web/app/index.html#/TestResultReport/AdminSubmissionListing/Test', 1, N'ADM030', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,57
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=58)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (58, N'Test Result Report - Attempt', N'Test Result Report - Attempt', 0, 1, N'/ep.web/app/index.html#/TestResultReport/AdminSubmissionListing/Attempts', 1, N'ADM031', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,58
END
----------------Superadmin---------------------
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=59)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (59, N'Manage Customer', N'Manage Customer', 0, 1, N'/ep.web/app/index.html#/ManageCustomer', 1, N'SPR001', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,59
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=60)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (60, N'Configuration', N'Configuration', 0, 1, N'/ep.web/app/index.html#/Configuration', 1, N'SPR002', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,60
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=61)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (61, N'Manage Admin', N'Manage Admin', 0, 1, N'/ep.web/app/index.html#/ManageAdmin', 1, N'SPR003', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,61
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=62)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (62, N'Super Admin Manage Proctors', N'Super Admin Manage Proctors', 0, 1, N'/ep.web/app/index.html#/ManageProctors', 1, N'SPR004', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,62
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=63)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (63, N'Manage Organization', N'Manage Organization', 0, 1, N'/ep.web/app/index.html#/ManageOrganization', 1, N'SPR005', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,63
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=64)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (64, N'Super Admin Candidate Tagging', N'Super Admin Candidate Tagging', 0, 1, N'/ep.web/app/index.html#/CandidateTagging', 1, N'SPR006', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,64
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=65)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (65, N'Super Admin  Admin Tagging', N'Super Admin  Admin Tagging', 0, 1, N'/ep.web/app/index.html#/AdminTagging', 1, N'SPR007', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,65
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=66)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (66, N'Report Dashboard', N'Report Dashboard', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports', 1, N'SPR008', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,66

	INSERT INTO rpt.RoleToprivilages (RoleId,PrivilageId)
    SELECT 7,66
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=67)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (67, N'Report Summary', N'Report Summary', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports', 1, N'SPR009', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,67

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,67
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=68)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (68, N'Report Summary - Submission Report', N'Report Summary - Submission Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/TestListForSubmissionReport/submissions', 1, N'SPR010', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,68

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,68
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=69)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (69, N'Report Summary - Schedule Name', N'Report Summary - Schedule Name', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/TestListForSubmissionReport/submissions/Scheduling', 1, N'SPR011', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,69

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,69
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=70)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (70, N'Report Summary - ID', N'Report Summary - ID', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/TestListForSubmissionReport/submissions/TestsForSubmissionsReport', 1, N'SPR012', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,70

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,70
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=71)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (71, N'Report Summary - Attempt', N'Report Summary - Attempt', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/TestListForSubmissionReport/submissions/Attempts', 1, N'SPR013', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,71


	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,71

END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=72)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (72, N'Report Summary - Users Report', N'Report Summary - Users Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports', 1, N'SPR014', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,72
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=73)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (73, N'Superadmin - Audit User Report - Dashboard', N'Superadmin - Audit User Report - Dashboard', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports', 1, N'SPR015', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,73
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=74)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (74, N'Superadmin - Audit User Report', N'Superadmin - Audit User Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/AuditUserReport', 1, N'SPR016', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,74
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=75)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (75, N'Superadmin - Audit Submission Report - Dashboard', N'Superadmin - Audit Submission Report - Dashboard', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports', 1, N'SPR017', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,75
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=76)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (76, N'Superadmin -  Audit Submission Report', N'Superadmin -  Audit Submission Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/AuditSubmissionReport', 1, N'SPR018', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,76
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=77)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (77, N'Reporting Tool', N'Reporting Tool', 0, 1, N'/EP.ReportingTool/Reports.aspx', 1, N'SPR019', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,77
END
---------------Customer Admin---------------------------------
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=78)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (78, N'Customer Admin Dashboard', N'Customer Admin Dashboard', 0, 1, N'/ep.web/app/index.html#/SuperAdminDashboard', 1, N'CUS001', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,78
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=79)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (79, N'File Import', N'File Import', 0, 1, N'/ep.web/app/index.html#/FileImport', 1, N'CUS002', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,79
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=80)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (80, N'Customer Admin - Manage Admin', N'Customer Admin - Manage Admin', 0, 1, N'/ep.web/app/index.html#/ManageAdmin', 1, N'CUS003', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,80
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=81)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (81, N'Customer Admin - Manage Proctors', N'Customer Admin - Manage Proctors', 0, 1, N'/ep.web/app/index.html#/ManageProctors', 1, N'CUS004', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,81
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=82)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (82, N'Customer Admin - Candidate Tagging', N'Customer Admin - Candidate Tagging', 0, 1, N'/ep.web/app/index.html#/CandidateTagging', 1, N'CUS005', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,82
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=83)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (83, N'Customer Admin - Admin Tagging', N'Customer Admin - Admin Tagging', 0, 1, N'/ep.web/app/index.html#/AdminTagging', 1, N'CUS006', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,83
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=84)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (84, N'Customer Admin - Mapping Report', N'Customer Admin - Mapping Report', 0, 1, N'/ep.web/app/index.html#/StudentProctorMapReport', 1, N'CUS007', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,84
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=85)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (85, N'Customer Admin - Audit User Report - Dashboard', N'Customer Admin - Audit User Report - Dashboard', 0, 1, N'/ep.web/app/index.html#/StudentProctorMapReport', 1, N'CUS008', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,85
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=86)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (86, N'Customer Admin - Audit User Report', N'Customer Admin - Audit User Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/AuditUserReport', 1, N'CUS009', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,86
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=87)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (87, N'Customer Admin - Audit Submission Report -  Dashboard', N'Customer Admin - Audit Submission Report -  Dashboard', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/AuditUserReport', 1, N'CUS010', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,87
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=88)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (88, N'Customer Admin - Audit Submission Report', N'Customer Admin - Audit Submission Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/AuditSubmissionReport', 1, N'CUS011', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,88
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=89)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (89, N'Live Proctor Notification', N'Live Proctor Notification', 0, 1, N'/EPLiveProctoring/#/notifications', 1, N'PRT023', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,89
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=90)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (90, N'Report Summary - Submission Reports - Attempt', N'Report Summary - Submission Reports - Attempt', 0, 1, N'/ep.web/app/index.html#/TypeOfReports/TestListForSubmissionReport/submissions/TestsForSubmissionsReport/Attempt', 1, N'ADM032', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,90
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=91)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (91, N'Login_Logout', N'Login_Logout', 0, 1, N'Login_Logout', 1, N'SPR020', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,91
	
	INSERT INTO RPT.ROLETOPRIVILAGES (ROLEID,PRIVILAGEID)
	SELECT 1,91

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,91

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
    SELECT 7,91

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,91


END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=92)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (92, N'Report Summary - User Report', N'Report Summary - User Report', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/UserDeatailsReport/Users', 1, N'SPR021', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,92
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,92
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=93)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (93, N'Report Summary - User Report - Test Name', N'Report Summary - User Report - Test Name', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport', 1, N'SPR022', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,93
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,93
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=94)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (94, N'Report Summary - User Report - Schedule Name', N'Report Summary - User Report - Schedule Name', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport/Scheduling', 1, N'SPR023', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,94
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,94
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=95)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (95, N'Report Summary - User Report - ID', N'Report Summary - User Report - ID', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport/Scheduling/Attempt', 1, N'SPR024', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,95
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,95
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=96)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (96, N'Report Summary - User Report - Attempt', N'Report Summary - User Report - Attempt', 0, 1, N'/ep.web/app/index.html#/SuperAdminReports/TypeOfReports/UserDeatailsReport/Users/SubmissionsReport/Scheduling/ID', 1, N'SPR025', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,96
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,96
END



IF EXISTS (SELECT 1  FROM  rpt.RoleToprivilages WHERE ID=103)
BEGIN
update rpt.RoleToprivilages set RoleId=5 where id=103
END

IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=97)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (97, N'EULA-License Agreement', N'EULA-License Agreement', 0, 1, N'EULA', 1, N'SPR026', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 3,97
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 7,97
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 1,97
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,97
	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 5,97
END




IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=1)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (1, N'Login' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=2)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (2, N'Logout' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=3)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (3, N'Forgot Password' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=4)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (4, N'Notification deletion' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=5)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (5, N'Notification Read' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=6)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (6, N'EULA Accepted' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=7)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (7, N'EULA Rejected' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=8)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (8, N'Organization Creation' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=9)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (9, N'Organization Modification' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=10)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (10, N'Organization disable/Enable' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=11)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (11, N'User Creation' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=12)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (12, N'User Modification' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=13)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (13, N'Change Proctor' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=14)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (14, N'User Enable' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=15)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (15, N'User Disable' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=16)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (16, N'Edit profile' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=17)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (17, N'Proctor Availability Creation' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=18)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (18, N'Proctor Availability Modification' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=19)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (19, N'Proctor Availability Deletion' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=20)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (20, N'Hold Photo Verification' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=21)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (21, N'Reject Photo Verification' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=22)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (22, N'Approve Photo Verification' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=23)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (23, N'Pause exam' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=24)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (24, N'Resume exam' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=25)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (25, N'Terminate exam' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=26)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (26, N'Add Extra Time' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=27)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (27, N'Assign Candidate' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=28)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (28, N'Approve Candidiate' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=29)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (29, N'Reject Candidate' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=30)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (30, N'Revert the Candidate changes' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=31)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (31, N'Forward candidate' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=32)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (32, N'Proctor Remarks' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=33)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (33, N'Approved Candididate after video analysis' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=34)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (34, N'Rejected the Candididate after video analysis' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=35)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (35, N'Candidate tagging' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=36)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (36, N'Admin tagging' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=37)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (37, N'Flag' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=38)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (38, N'Annotation' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=39)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (39, N'Capture Headshot' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=40)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (40, N'Capture Photo ID' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=41)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (41, N'Room Video' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=42)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (42, N'Begin Exam' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=43)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (43, N'Login Failed due to wrong Attempts more than 4 Times!' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=44)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (44, N'Change Password' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=46)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (46, N'Changed the video Analysis status from pending to Inprogess status' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=47)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (47, N'Customer Creation' )
END
IF NOT EXISTS (SELECT 1 FROM RPT.tblAuditEvents WHERE EventId=48)
BEGIN
	INSERT [RPT].[tblAuditEvents] ([EventId], [EventName]) 
	VALUES (48, N'Customer Modification' )
END
--------------------[RPT].[tblProctoringType]-----------------------------
SET IDENTITY_INSERT [RPT].[tblProctoringType] ON 
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblProctoringType] WHERE [ProctoringTypeId]=1)
BEGIN
	INSERT [rpt].[tblProctoringType] ([ProctoringTypeId], [ProctoringType], [Isdeleted],[Mode]) 
	VALUES (1, N'Live', 0,3)
END
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblProctoringType] WHERE [ProctoringTypeId]=2)
BEGIN
	INSERT [rpt].[tblProctoringType] ([ProctoringTypeId], [ProctoringType], [Isdeleted],[Mode]) 
	VALUES (2, N'Remote', 0,2)
END
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblProctoringType] WHERE [ProctoringTypeId]=3)
BEGIN
	INSERT [rpt].[tblProctoringType] ([ProctoringTypeId], [ProctoringType], [Isdeleted],[Mode]) 
	VALUES (3, N'Image', 0,1)
END
SET IDENTITY_INSERT [RPT].[tblProctoringType] OFF
---------------------------tblStudentCountConfig-----------------------------------------------
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblStudentCountConfig] WHERE [StudentCountSet]=8)
BEGIN
	INSERT [rpt].[tblStudentCountConfig] (  [StudentCountSet], [Isdeleted]) 
	VALUES (  8, 0)
END
-----08-09-2023


--04-10-2023

IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=98)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (98, N'AssessmentDashboard', N'AssessmentDashboard', 0, 1, N'/ep.web/app/index.html#/AssessmentDashboard', 1, N'SPR027', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,98
 
ENDIF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=99)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (99, N'ScheduleList', N'ScheduleList', 0, 1, N'/ep.web/app/index.html#/ScheduleList', 1, N'SPR028', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,99
 
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=100)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (100, N'SubmissionList', N'SubmissionList', 0, 1, N'/ep.web/app/index.html#/SubmissionList', 1, N'SPR029', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,100
 
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=101)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (101, N'AttemptsList', N'AttemptsList', 0, 1, N'/ep.web/app/index.html#/AttemptsList', 1, N'SPR030', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,101
 
END
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=102)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (102, N'ReviewList', N'ReviewList', 0, 1, N'/ep.web/app/index.html#/ReviewList', 1, N'SPR031', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,102
 
END

 --13-10-2023
IF NOT EXISTS (SELECT 1 FROM RPT.Privilages WHERE ID=103)
BEGIN
	INSERT [RPT].[Privilages] ([ID], [Name], [Description], [ParentID], [PrivilageType], [Url], [CustomerID], [PrivilageCode], [Order], [PrivilageTypeID], [ParentPrivilages], [OrganizationID]) 
	VALUES (103, N'PhotoReview_Opt ', N'PhotoReview_Opt ', 0, 1, N'/ep.web/app/index.html#/Dashboard/submissionlisting/PhotoReview_Opt', 1, N'SPR032', 1, NULL, N'0,0', 1)

	INSERT INTO [RPT].RoleToPrivilages(Roleid,Privilageid)
	SELECT 2,103
 
END


--20-11-2023



SET IDENTITY_INSERT rpt.tblEvents ON

IF NOT EXISTS(SELECT 1 FROM RPT.tblEvents WHERE Eventid=59)
INSERT INTO RPT.tblEvents(eventid,Eventname)
SELECT 59,'Customer Admin Update'

SET IDENTITY_INSERT rpt.tblEvents OFF


SET IDENTITY_INSERT rpt.tblEvents ON

IF NOT EXISTS(SELECT 1 FROM RPT.tblEvents WHERE Eventid=60)
INSERT INTO RPT.tblEvents(eventid,Eventname)
SELECT 60,'Customer Admin Enabled'

SET IDENTITY_INSERT rpt.tblEvents OFF

SET IDENTITY_INSERT rpt.tblEvents ON

IF NOT EXISTS(SELECT 1 FROM RPT.tblEvents WHERE Eventid=61)
INSERT INTO RPT.tblEvents(eventid,Eventname)
SELECT 61,'Customer Admin Disabled'

SET IDENTITY_INSERT rpt.tblEvents OFF


--19-01-2024
----Void Case --


IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Navigating away from exam screen')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])    
VALUES ( N'Navigating away from exam screen','V001')  
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Partial submission of data/images')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])    
VALUES ( N'Partial submission of data/images','V002')  
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Partial submission of answers')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])  VALUES ( N'Partial submission of answers','V003')  
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Unauthorised person(s) in the exam area')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])  VALUES ( N'Unauthorised person(s) in the exam area','V004')  
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Learner not clearly visible in the webcam viewing range')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])    
VALUES ( N'Learner not clearly visible in the webcam viewing range','V005') 
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Excessively noisy environment')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])   
VALUES ( N'Excessively noisy environment','V006')  
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Unable to verify ID')  
BEGIN   
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])    
VALUES ( N'Unable to verify ID','V007')  
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Unauthorised materials or electronic devices present')  
BEGIN
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])
VALUES ( N'Unauthorised materials or electronic devices present','V008')
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Diverting attention away from the screen')
BEGIN   INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])
VALUES ( N'Diverting attention away from the screen','V009')
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Eating during the exam')
BEGIN
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])
VALUES ( N'Eating during the exam','V010')
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Changing location during the exam')
BEGIN 
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])
VALUES ( N'Changing location during the exam','V011')
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Unforeseen circumstances')
BEGIN
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])
VALUES ( N'Unforeseen circumstances','V012')
END

IF NOT EXISTS(SELECT 1 FROM [RPT].[tblvoidcases] WHERE [voidCase]=N'Reallocation Enabled')
BEGIN 
INSERT [RPT].[tblvoidcases] ([voidCase],[VCode])    
VALUES ( N'Reallocation Enabled','V013') 
END


--30-01-2024
SET IDENTITY_INSERT [RPT].[tblRole] ON 
GO
IF NOT EXISTS(SELECT 1 FROM [RPT].[tblRole]  WHERE Roleid=8)
INSERT [RPT].[tblRole] ([RoleId], [RoleName], [IsDeleted], [CreatedDate], [UpdatedDate]) VALUES (8, N'Invigilator', 0, CAST(N'2016-06-28T04:13:20.1500000' AS DateTime2), NULL)
SET IDENTITY_INSERT [RPT].[tblRole] OFF 
GO


--30-07-2024

BEGIN
    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'High')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('High', 0, '',2); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Medium')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Medium', 0, '',1); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Low')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Low', 0, '',0); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'No front face detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('No front face detected', 1, '#FFAF00',4); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Additional person present')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Additional person present', 1, '#BC9F8B',5); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Excessive number of movements')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Excessive number of movements', 2, '#8C3061',6); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Looks like looking somewhere else other than monitor')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Looks like looking somewhere else other than monitor', 2, '#C63C51',7); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Electronic items detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Electronic items detected', 1, '#D95F59',8); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Unidentified object is being used')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode ,flagid) VALUES ('Unidentified object is being used', 2, '#9CA986',9); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Candidate not present')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Candidate not present', 1, '#808D7C',10); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'No frontal face detected with a confidence level less than 75')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('No frontal face detected with a confidence level less than 75', 1, '#5F6F65',11);
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Frontal face detected with a confidence level greater than 75')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Frontal face detected with a confidence level greater than 75', 3, '#4F1787',12); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Book Detected multiple faces')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Book Detected multiple faces', 1, '#180161',13); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Multiple face and electronic item detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Multiple face and electronic item detected', 1, '#EB3678',14); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Multiple face and external item detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Multiple face and external item detected', 1, '#FB773C',15); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Frontal face detected with a confidence level greater than 95')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Frontal face detected with a confidence level greater than 95', 3, '#F8EDED',16); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Candidate looking away from screen')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Candidate looking away from screen', 2, '#173B45',17); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Mobile Phone detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Mobile Phone detected', 1, '#694F8E',18); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Unknown person replaced the candidate')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Unknown person replaced the candidate', 1, '#B692C2',19); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Candidate Face Partially Visible')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Candidate Face Partially Visible', 2, '#E3A5C7',20); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Eyeball movement detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Eyeball movement detected', 2, '#03346E',21); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Smart Watch detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Smart Watch detected', 1, '#6EACDA',22); 
    END;

    IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Earphone or Headphone detected')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Earphone or Headphone detected', 1, '#E2E2B6',23); 
    END;

	IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Break Time')
    BEGIN
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Break Time', 0, '',3); 
    END;
END;

--06-08-2024
BEGIN
IF NOT EXISTS (SELECT 1 FROM RPT.tblflags WHERE flags = 'Scheduled Break Time') 
        INSERT INTO RPT.tblflags (flags, parentid, colorcode,flagid) VALUES ('Scheduled Break Time', 3, '#4A249D',24); 
    END;

--