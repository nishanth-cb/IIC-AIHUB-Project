IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnSplitter]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnSplitter]
GO
CREATE FUNCTION [dbo].[fnSplitter] (@IDs nvarchar(Max))    
 Returns @Tbl_IDs Table  (ID Int)  As    
 Begin   
  Set @IDs =  @IDs + ',' -- Append comma  
  Declare @Pos1 Int  -- Indexes to keep the position of searching  
  Declare @pos2 Int  
  Set @Pos1=1    -- Start from first character   
  Set @Pos2=1  
  While @Pos1<Len(@IDs)  
   Begin  
    Set @Pos1 = CharIndex(',',@IDs,@Pos1)  
    Insert @Tbl_IDs   
    Select  Cast(Substring(@IDs,@Pos2,@Pos1-@Pos2) As bigint)  
    Set @Pos2=@Pos1+1  -- Go to next non comma character  
    Set @Pos1 = @Pos1+1  -- Search from the next charcater  
   End 
   DELETE FROM @Tbl_IDs WHERE ID=0  
 Return  
End

GO