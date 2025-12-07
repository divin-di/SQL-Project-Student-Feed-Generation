--SELECT COUNT(*) 
	--FROM INFORMATION_SCHEMA.COLUMNS
  --  WHERE TABLE_NAME =  'Feed_2' and TABLE_SCHEMA = 'dbo'
USE testDB 
GO
	SELECT
   (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Feed_1') AS TotalColumns,
 COUNT(*) AS TotalRows
FROM testDB.dbo.Feed_1

--SELECT
 --   COUNT(*) AS TotalColumns
--FROM sys.columns
--WHERE object_id = OBJECT_ID('Feed_1')
    --SET @TestName = 'Feed_1 Null/Malformed Email Test';
    IF EXISTS (
        SELECT 1 FROM Feed_1 WHERE LastName IS NULL OR StudentID IS NULL OR Email NOT LIKE '%@%'
    )
        PRINT ': FAIL (Null or bad email found)';
    ELSE
        PRINT  ': PASS'

SELECT 1 FROM Feed_2 WHERE LastName IS NULL OR StudentID IS NULL OR Email NOT LIKE '%@%' OR LEN(PHONE)>10