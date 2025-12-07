USE testDB;
GO

CREATE OR ALTER PROCEDURE StudentFeed_UnitTests
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TestName NVARCHAR(100), @ActualRow INT ,@ColumnCount INT;

------Feed_1 row count and column count test-------

    SET @TestName = 'Feed_1 Row and Column Count Test';       

	SELECT @ColumnCount = COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'Feed_1';


    SELECT @ActualRow = COUNT(*)
    FROM testDB.dbo.Feed_1;

    IF @ActualRow = 10 and @ColumnCount = 10
        PRINT @TestName + ': PASS';
    ELSE
        PRINT @TestName + ': FAIL (Expected 10, Got ' + CAST(@ActualRow AS VARCHAR) +' rows and '+ CAST(@ColumnCount AS VARCHAR) + ' columns ' + ')';

-----Checking for null value-----

    SET @TestName = 'Feed_1 data discrepancy Test';          
    IF EXISTS (
        SELECT 1 FROM Feed_1 WHERE LastName IS NULL OR StudentID IS NULL OR Email NOT LIKE '%@%' OR LEN(replace(PHONE,'-',''))>10
    )
        PRINT @TestName + ': FAIL (Null or bad email found)';
    ELSE
        PRINT @TestName + ': PASS';



   ---- Checking Feed_1 for Duplicate Rows  -----

    SET @TestName = 'Feed_1 Duplicate Row Test';

    IF EXISTS (
        SELECT StudentID, FirstName, LastName, Email, PHONE
        FROM Feed_1
        GROUP BY StudentID, FirstName, LastName, Email, PHONE
        HAVING COUNT(*) > 1
    )
        PRINT @TestName + ': FAIL (Duplicates found)';
    ELSE
        PRINT @TestName + ': PASS';


    ---- Feed_2 row count and column coungt ----
    SET @TestName = 'Feed_2 Schema Column and row Count';

	SELECT @ColumnCount = COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'Feed_2';

    SELECT @ActualRow = COUNT(*)
    FROM testDB.dbo.Feed_2;

    IF @ActualRow = 15 and @ColumnCount = 15
        PRINT @TestName + ': PASS';
    ELSE
        PRINT @TestName + ': FAIL (Expected 15, Got ' + CAST(@ActualRow AS VARCHAR) +' rows and '+ CAST(@ColumnCount AS VARCHAR) + ' columns ' + ')';


  ----- Feed_2 data error check -----

		    SET @TestName = 'Feed_2 data discrepancy Test';
    IF EXISTS (
        SELECT 1 FROM Feed_2 WHERE LastName IS NULL OR StudentID IS NULL OR Email NOT LIKE '%@%' OR LEN(replace(PHONE,'-',''))>10
    )
        PRINT @TestName + ': FAIL (Null or bad email found)';
    ELSE
        PRINT @TestName + ': PASS';

		   ---- Checking Feed_2 for Duplicate Rows  -----

    SET @TestName = 'Feed_1 Duplicate Row Test';

    IF EXISTS (
        SELECT StudentID, FirstName, LastName, Email, PHONE
        FROM Feed_2
        GROUP BY StudentID, FirstName, LastName, Email, PHONE
        HAVING COUNT(*) > 1
    )
        PRINT @TestName + ': FAIL (Duplicates found)';
    ELSE
        PRINT @TestName + ': PASS';



    ----Feed_3 column and row count check ---
    SET @TestName = 'Feed_3 Schema Column and Row Count';
	SELECT @ColumnCount = COUNT(*)
    FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_NAME = 'Feed_3';

    SELECT @ActualRow = COUNT(*)
    FROM testDB.dbo.Feed_3;

    IF @ActualRow = 20 and @ColumnCount = 20
        PRINT @TestName + ': PASS';
    ELSE
        PRINT @TestName + ': FAIL (Expected 20, Got ' + CAST(@ActualRow AS VARCHAR) +' rows and '+ CAST(@ColumnCount AS VARCHAR) + ' columns ' + ')';





		    SET @TestName = 'Feed_3 data error check';
    IF EXISTS (
        SELECT 1 FROM Feed_3 WHERE LastName IS NULL OR StudentID IS NULL OR Email NOT LIKE '%@%' OR LEN(replace(PHONE,'-',''))>10
    )
        PRINT @TestName + ': FAIL (Null or bad email found)';
    ELSE
        PRINT @TestName + ': PASS';


	---- Checking Feed_3 for Duplicate Rows  -----

    SET @TestName = 'Feed_3 Duplicate Row Test';

    IF EXISTS (
        SELECT StudentID, FirstName, LastName, Email, PHONE
        FROM Feed_3
        GROUP BY StudentID, FirstName, LastName, Email, PHONE
        HAVING COUNT(*) > 1
    )
        PRINT @TestName + ': FAIL (Duplicates found)';
    ELSE
        PRINT @TestName + ': PASS';


END;
GO
