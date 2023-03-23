--1. Creation of Database Below 
CREATE DATABASE MN323ManavNanda;



--2. Creation OF Table Below With An Count Of 27 Fields And Use of 7 Datatypes 

CREATE TABLE MNStudent(
MNEnrollmentNumber INT PRIMARY KEY Identity(1001,1),
MNTitle VARCHAR(20),
MNFirstName VARCHAR(60) NOT NULL,
MNLastName VARCHAR(60) NOT NULL,
MNFatherName VARCHAR(100) NOT NULL,
MNMotherName VARCHAR(100) NOT NULL,
MNEmail VARCHAR(150) NOT NULL UNIQUE,
MNGender VARCHAR(10) NOT NULL,
MNCountryCode VARCHAR(6) NOT NULL,
MNPhoneNumber VARCHAR(10) NOT NULL,
MNAlternatePhoneNumber VARCHAR(10),
MNUniversityEmail VARCHAR(150) UNIQUE,
MNDOB DATE NOT NULL,   
MNDepartment VARCHAR(80),
MNAdmissionDate TIMESTAMP,
MNPermanentAddress TEXT NOT NULL,
MNTemporaryAddress TEXT, 
MNState VARCHAR(50) NOT NULL,
MNCity VARCHAR(100) NOT NULL,
MNCountry  VARCHAR (100) NOT NULL,
MNPincode VARCHAR (10) NOT NULL,
MNMentorName VARCHAR (100),
MNMentorEmail VARCHAR(150),
MNMentorPhoneNumber VARCHAR(10),
MNAdmissionYear SMALLINT NOT NULL,
MNCitizenship VARCHAR(50) NOT NULL,
MNStudentPhoto VARBINARY(MAX)
);



--3. Alter Table Commands Below

ALTER TABLE MNStudent  
ADD MNPassingYear SMALLINT NOT NULL;     --Add an Field using alter 

ALTER TABLE MNStudent
ALTER COLUMN MNCountryCode CHAR(5) NOT NULL;   --Alter Column Using Alter Command

EXEC sp_rename 'MNStudent.MNAdmissionYear', 'MNAdmissionSession', 'COLUMN';   --RENAME or Modify Column Using New EXEC Command
ALTER TABLE MNStudent 
ALTER COLUMN MNAdmissionSession VARCHAR(50) NULL;     --Alter Column Using Alter Command

ALTER TABLE MNStudent
DROP COLUMN MNPassingYear;  --DROP Column Using Alter Command



--4.Add Constraints using Alter(Implement All the Constraints).

ALTER TABLE MNStudent
ADD CONSTRAINT MNUniversityEmail UNIQUE (MNUniversityEmail);  --Adding of Unique Constraint

ALTER TABLE MNStudent
ALTER COLUMN MNFirstName VARCHAR(60) NOT NULL;    -- Adding of NOt Null Constraint

ALTER TABLE MNStudent
ADD CONSTRAINT MNEnrollmentNumber PRIMARY KEY (MNEnrollmentNumber);  --Adding of Primary key Constraint 

ALTER TABLE MNStudent
ADD CONSTRAINT MNPhoneNumber CHECK (MNPhoneNumber LIKE '[0-9]%')   --Adding of Check Constraint

CREATE TABLE States(    --Creation Of Table For Using Foreign Key Constraint
StateId int Primary Key Identity(1,1),
StateName VARCHAR(70) NOT NULL
);

INSERT INTO States (StateName) values('Gujarat'),('Bangalore'),('Mumbai');

ALTER TABLE MNStudent
ADD CONSTRAINT fk_key FOREIGN KEY(MNState) REFERENCES States(StateId)   -- Refrencing of Primary key as Foreign Key
DELETE FROM MNStudent



--5. Insertion Of records Below

INSERT INTO MNStudent 
(MNTitle, MNFirstName, MNLastName, MNFatherName, MNMotherName, MNEmail, 
MNGender, MNCountryCode, MNPhoneNumber, MNUniversityEmail, MNDOB, 
MNDepartment, MNPermanentAddress, MNTemporaryAddress, 
MNState, MNCity, MNCountry, MNPincode, MNMentorName, MNMentorEmail, 
MNMentorPhoneNumber, MNCitizenship)
VALUES
--Value-1
('Mr', 'Manav', 'Nanda', 'Navin Bhai', 'Rajeshree Ben', 'manav@gmail.com', 
'Male', '+91', '1234567890', 'manav.nanda@marwadiuniversity', '2002-04-24', 
'Information Technology', 'Sadhna Colony jamnagar', 
'Prahladnagar Ahmedabad', 1, 'Gujarat', 'India', '361005', 'Prof. Riddhi Kotak', 
'Riddhi@marwadiuniversity.edu', '1234567891', 'INDIAN'),

--Value-2
('Mr', 'Yash', 'Nanda', 'Navin Bhai', 'Rajeshree Ben', 'Yash@gmail.com', 
'Male', '+91', '1234567891', 'yash.nanda@marwadiuniversity', '2004-10-17', 
'Information Technology', 'Sadhna Colony jamnagar', 
'Prahladnagar Ahmedabad', 1, 'Gujarat', 'India', '361005', 'Prof. Riddhi Kotak', 
'Riddhi@marwadiuniversity.edu', '1234567891', 'INDIAN'),

--Value-3
('Mr', 'Jay', 'Nanda', 'Navin Bhai', 'Rajeshree Ben', 'Jay@gmail.com', 
'Male', '+91', '1234567892', 'jay.nanda@marwadiuniversity', '2003-04-24', 
'Information Technology', 'Sadhna Colony jamnagar', 
'Prahladnagar Ahmedabad', 2, 'Gujarat', 'India', '361005', 'Prof. Riddhi Kotak', 
'Riddhi@marwadiuniversity.edu', '1234567892', 'INDIAN'),

--Value-4
('Mr', 'Rushik', 'Jethva', 'r', 'j', 'Rushik@gmail.com', 
'Male', '+91', '1234567893', 'rushik.j@marwadiuniversity', '2001-04-24', 
'Information Technology', 'Sadhna Colony jamnagar', 
'Prahladnagar Ahmedabad', 2, 'Gujarat', 'India', '361005', 'Prof. Riddhi Kotak', 
'Riddhi@marwadiuniversity.edu', '1234567893', 'INDIAN'),

--Value-5
('Mr', 'Sanjay', 'Jethva', 'r', 'j', 'Sanjay@gmail.com', 
'Male', '+91', '1234567894', 'Sanjay.j@marwadiuniversity', '2001-04-24', 
'Information Technology', 'Sadhna Colony jamnagar', 
'Prahladnagar Ahmedabad', 3, 'Gujarat', 'India', '361005', 'Prof. Riddhi Kotak', 
'Riddhi@marwadiuniversity.edu', '1234567894', 'INDIAN'),

--Value-6
('Mr', 'Jay', 'Jethva', 'r', 'j', 'Jay2@gmail.com', 
'Male', '+91', '1234567895', 'Jay.j@marwadiuniversity', '2001-04-24', 
'Information Technology', 'Sadhna Colony jamnagar', 
'Prahladnagar Ahmedabad', 3, 'Gujarat', 'India', '361005', 'Prof. Riddhi Kotak', 
'Riddhi@marwadiuniversity.edu', '1234567895', 'INDIAN')
;


--6. Delete Of Record Below

DELETE FROM MNSTUDENT WHERE MNEnrollmentNumber = 1015;   -- Deletion Of Record Whos id is 1015


--7. Update Of Record Below 

BEGIN TRAN
UPDATE MNStudent
SET MNFirstName = 'new',
    MNLastName = 'Name',
    MNGender = 'Male',
    MNPhoneNumber = '121222145'
WHERE MNEnrollmentNumber = 1020;
COMMIT TRAN;
ROLLBACK TRAN;



--8. Retrieve Records Below 

SELECT * FROM MNStudent;  -- To Get All Records
SELECT * FROM States;
SELECt * FROM MNStudent where MNEnrollmentNumber = 1014;   -- To Get Specific Record
SELECt * FROM MNStudent where MNEnrollmentNumber = 1013;
SELECt * FROM MNStudent where MNEnrollmentNumber = 1012;

















