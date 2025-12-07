
  with duplicate_3 as (SELECT  *, ROW_NUMBER() OVER (PARTITION BY StudentID,FirstName,LastName,Email,Phone,Gender,DOB,Major,GPA,Address,GuardianName,CreditsEarned,IsInternational,Status
  order by FirstName,LastName) Row_num
  from feed_3)
  DELETE from duplicate_3
  where row_num > '1'
