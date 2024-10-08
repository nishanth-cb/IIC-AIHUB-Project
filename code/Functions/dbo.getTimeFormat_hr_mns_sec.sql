IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getTimeFormat_hr_mns_sec]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[getTimeFormat_hr_mns_sec]
GO

CREATE FUNCTION [dbo].[getTimeFormat_hr_mns_sec](@intInputSec AS BIGINT)
RETURNS VARCHAR(40)
--With Encryption
AS  
BEGIN 
	DECLARE @intHrs AS INT
	SET @intHrs=00
	DECLARE @intMins AS INT
	SET @intMins=00
	DECLARE @intSec AS INT
	SET @intSec=00
	SET @intHrs=@intInputSec/3600
	SET @intMins=(@intInputSec%3600)/60
	SET @intSec=(@intInputSec%3600)%60
	DECLARE @strHrs VARCHAR(10)
	If LEN(@intHrs)=1
		SET @strHrs= '0'+ CAST (@intHrs AS VARCHAR)
	ELSE
		SET @strHrs= CAST (@intHrs AS VARCHAR)
	DECLARE @strMins VARCHAR(10)
	If LEN(@intMins)=1
		SET @strMins= '0'+ CAST (@intMins AS VARCHAR)
	ELSE
		SET @strMins= CAST (@intMins AS VARCHAR)
	DECLARE @strSec VARCHAR(10)
	If LEN(@intSec)=1
		SET @strSec= '0'+ CAST (@intSec AS VARCHAR)
	ELSE
		SET @strSec= CAST (@intSec AS VARCHAR)
	RETURN  COALESCE(CAST(@strHrs AS VARCHAR),'00')+ ':'+  COALESCE(CAST(@strMins AS VARCHAR),'00') +':'+COALESCE(CAST(@strSec AS VARCHAR),'00')
END


