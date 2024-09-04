IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnKeywordsSplitter]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnKeywordsSplitter]
GO
CREATE FUNCTION [dbo].[fnKeywordsSplitter] (@keywords Varchar(4000))    
 Returns @Tbl_Keywords Table  (Keyword nvarchar(4000))  As    
 Begin   
  Set @keywords =  @keywords + ',' -- Append comma  
  Declare @Pos1 Int  -- Indexes to keep the position of searching  
  Declare @pos2 Int  
  Set @Pos1=1    -- Start from first character   
  Set @Pos2=1  
  While @Pos1<Len(@keywords)  
   Begin  
    Set @Pos1 = CharIndex(',',@keywords,@Pos1)  
    Insert @Tbl_Keywords   
    Select  Cast(LTRIM(RTRIM(Substring(@keywords,@Pos2,@Pos1-@Pos2))) As nvarchar(4000))  
    Set @Pos2=@Pos1+1  -- Go to next non comma character  
    Set @Pos1 = @Pos1+1  -- Search from the next charcate  
   End   
 Return  
End
