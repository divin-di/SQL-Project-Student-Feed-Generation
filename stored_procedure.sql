USE testDB;
GO

CREATE OR ALTER PROCEDURE StudentFeed
    @FeedName VARCHAR(20),
    @RowCount INT

AS
BEGIN
   
   DECLARE @i INT = 1 ;

   WHILE @i <= @RowCount

   BEGIN
      IF @FeedName = 'Feed_1'
      BEGIN 
	      INSERT INTO dbo.Feed_1
		  SELECT
		       @i,
			   'A'+ CAST(@i AS VARCHAR) ,   --first name
			   'Z'+ CAST(@i AS VARCHAR) ,   --last
			   'student' + CAST(@i AS VARCHAR) + '@school.com', --email
			   '848-000-1' + RIGHT('000' + CAST(@i AS VARCHAR), 3) ,
			   CASE WHEN @i % 2 = 0 THEN 'M' ELSE 'F' END, --gender
			   DATEADD(DAY, -(@i  + 7000), GETDATE()), -- DOB
		       DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 30, GETDATE()) ,
			   CASE WHEN @i % 3 = 0 THEN 'CS' ELSE 'EC' END,
			   ROUND(2 + RAND()*2, 2) 
			   
	  END

	 ELSE IF @FeedName = 'Feed_2'
	 BEGIN
	    INSERT INTO Feed_2
		SELECT 
		     @i,
			 'A'+ CAST(@i AS VARCHAR) ,   
			 'Z'+ CAST(@i AS VARCHAR) , 
			 'student' + CAST(@i AS VARCHAR) + '@school.com', --email
			 '848-000-1' + RIGHT('000' + CAST(@i AS VARCHAR), 3) ,
			  CASE WHEN @i % 2 = 0 THEN 'M' ELSE 'F' END,
			  DATEADD(DAY, -(@i  + 7000), GETDATE()) ,
			  DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 30, GETDATE()) ,
			  CASE WHEN @i % 3 = 0 THEN 'CS' ELSE 'EC' END,
			  ROUND(2 + RAND()*2, 2),
			  'Dorm Room' + CAST(@i AS VARCHAR),
              case when @i % 2 = 0 THEN 'City1' ELSE 'City2' END,
              'Test_State',
              '00101',
              'Guardian of A' + CAST(@i AS VARCHAR)

	 END

	ELSE IF @FeedName = 'Feed_3' and @i <= 16 
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
               CASE WHEN @i>14 and @i % 2 = 0 THEN 'Inactive' ELSE 'Active' END

	  END


	ELSE IF @FeedName = 'Feed_3' and @i > 16 
	BEGIN
	    INSERT INTO Feed_3
		SELECT 
		     @i,
			 'A'+ CAST((@i-16) AS VARCHAR) ,   
			 'Z'+ CAST((@i-16) AS VARCHAR) , 
			 'student' + CAST((@i-16) AS VARCHAR) + '@school.com', --email
			 '848-000-1' + RIGHT('000' + CAST((@i-16) AS VARCHAR), 3) ,
			  CASE WHEN (@i-16) % 2 = 0 THEN 'M' ELSE 'F' END,
			  DATEADD(DAY, -((@i-16) + 7000), GETDATE()) ,
			  DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 30, GETDATE()) ,
			  CASE WHEN (@i-16) % 3 = 0 THEN 'CS' ELSE 'EC' END,
			  ROUND(2 + RAND()*2, 2),
			  'Dorm Room' + CAST((@i-16) AS VARCHAR),
              case when (@i-16) % 2 = 0 THEN 'City1' ELSE 'City2' END,
              'Test_State',
              '00101',
              'Guardian of A' + CAST((@i-16) AS VARCHAR),
			   DATEADD(DAY, ((@i-16) + 1) * 120, GETDATE()),
               30 + (@i-16) * 3,
               ROUND(1000 + RAND() * 5000, 2),
               (@i-16) % 2,
               CASE WHEN (@i-16)>14 and (@i-16) % 2 = 0 THEN 'Inactive' ELSE 'Active' END

		END


		SET @i += 1;
	END
END;


		     

        