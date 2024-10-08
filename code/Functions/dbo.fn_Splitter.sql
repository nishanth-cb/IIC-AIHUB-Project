IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_Splitter]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fn_Splitter]
GO
/******************************************************************************************************     
Created By & Date:Ram kumar G :Ram kumar G;28.12.2016     
Object Name:[Assign].[UspGetQuestionsforAssessment]        
Purpose: To get All Eassay Question belongs in The Test.      
Version:2.3.0      
Remarks:      Reviewed By & Date:      
Fix Status:       
History      
#;Who;Date;Version;Review By; Status     
******************************************************************************************************/  
CREATE  FUNCTION [dbo].[fn_Splitter] (@String nvarchar(Max),@Delimiter NVARCHAR(10))    
 RETURNS @StringTable TABLE  (OpString NVARCHAR(MAX),ID INT IDENTITY(1,1))  
 --WITH ENCRYPTION
AS    
 BEGIN
	DECLARE @Pos1 INT,@Pos2 INT ,@Len TINYINT 
	IF LEN(@Delimiter)=0
		SET @Len=1
	ELSE 
		SET @Len=LEN(@Delimiter)
		
	SET @String =  @String + @Delimiter -- Append comma  

	SET @Pos1=1    -- Start from first character   
	SET @Pos2=1  
	WHILE @Pos1<LEN(@String)  
	BEGIN  
		SET @Pos1 = CharIndex(@Delimiter,@String,@Pos1)  
		INSERT @StringTable (OpString)  
			SELECT  Substring(@String,@Pos2,@Pos1-@Pos2)
		SET @Pos2=@Pos1+@Len 
		SET @Pos1 = @Pos1+@Len
	END   
 RETURN  
END

