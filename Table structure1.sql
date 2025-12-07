DROP TABLE IF EXISTS Feed_1;
CREATE TABLE Feed_1 (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Gender CHAR(1),
    DOB DATE,
    EntryDate DATE,
    Major VARCHAR(50),
    GPA FLOAT
);