CREATE OR ALTER PROCEDURE REPLACING_DUPLICATES
@FeedName VARCHAR(20),
 @RowCount INT
AS
BEGIN 
    DECLARE @i INT = 16;
	WHILE @i < @RowCount
	BEGIN
	 IF @FeedName = 'Feed_3' 
	  BEGIN
	    INSERT INTO Feed_3
		  
		    SELECT 
		     @i,
			 'A'+ CAST(@i AS VARCHAR) ,   
			 'Z'+ CAST(@i AS VARCHAR) , 
			 'student' + CAST(@i AS VARCHAR) + '@school.com', --email
			 '848-000-1' + RIGHT('000' + CAST(@i AS VARCHAR), 3) ,
			  CASE WHEN @i % 2 = 0 THEN 'M' ELSE 'F' END,
			  DATEADD(DAY, -(@i + 7000), GETDATE()) ,
			  DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 30, GETDATE()) ,
			  CASE WHEN @i % 3 = 0 THEN 'CS' ELSE 'EC' END,
			  ROUND(2 + RAND()*2, 2),
			  'Dorm Room' + CAST(@i AS VARCHAR),
              case when @i % 2 = 0 THEN 'City1' ELSE 'City2' END,
              'Test_State',
              '00101',
              'Guardian of A' + CAST(@i AS VARCHAR),
			   DATEADD(DAY, (@i + 1) * 120, GETDATE()),
               30 + @i * 3,
               ROUND(1000 + RAND() * 5000, 2),
               @i % 2,
               CASE WHEN @i>12 and @i % 2 = 0 THEN 'Inactive' ELSE 'Active' END
			END
			SET @i += 1
	  END
END;

