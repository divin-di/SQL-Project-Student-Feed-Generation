DROP TABLE IF EXISTS Feed_2;
CREATE TABLE Feed_2 (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Gender CHAR(1),
    DOB DATE,
    EntryDate DATE,
    Major VARCHAR(50),
    GPA FLOAT,
    Address VARCHAR(100),
    City VARCHAR(50),
    State CHAR(2),
    ZipCode VARCHAR(10),
    GuardianName VARCHAR(100)
);
DROP TABLE IF EXISTS Feed_3;
CREATE TABLE Feed_3 (
    StudentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Gender CHAR(1),
    DOB DATE,
    EntryDate DATE,
    Major VARCHAR(50),
    GPA FLOAT,
    Address VARCHAR(100),
    City VARCHAR(50),
    State CHAR(2),
    ZipCode VARCHAR(10),
    GuardianName VARCHAR(100),
    GraduationDate DATE,
    CreditsEarned INT,
    TuitionBalance MONEY,
    IsInternational BIT,
    Status VARCHAR(20)
);
