CREATE DATABASE HospitalManagementSystem;
USE HospitalManagementSystem;



--Creating Department Table

CREATE TABLE DEPARTMENT(
	DepartmentID VARCHAR(10) PRIMARY KEY,
	DepartmentName VARCHAR(50) NOT NULL,
	);
SELECT * FROM DEPARTMENT;

-- CREATE DOCTORS TABLE

CREATE TABLE Doctors(
	DoctorsID VARCHAR(10) PRIMARY KEY,
	FirstName VARCHAR(30)NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Specialization VARCHAR(225),
	PhoneNumber VARCHAR(20),
	DepartmentID VARCHAR(10),
	CONSTRAINT FK_Doctor_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) --FOREIGN KEY
	);

SELECT * FROM Doctors;

--CREATING PATIENTS  TABLE

CREATE TABLE Patient (
	PatientsID VARCHAR(10) PRIMARY KEY,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	DateOfBirth DATE,
	Gender char(1),
	PhoneNumber VARCHAR(20),
	Address VARCHAR(255),
	BloodType VARCHAR(10),
	);

SELECT * FROM Patient;


-- CREATING DEPARTMENTS LOCATION

CREATE TABLE DepartmentLocation(
	DepartmentLocationID VARCHAR(10) PRIMARY KEY,
	DepartmentLocation VARCHAR(30)
	);
SELECT * FROM DepartmentLocation;


--CREATING APPOINTMENTS TABLE

CREATE TABLE Appointment(
	AppointmentID VARCHAR(10) PRIMARY KEY,
	PatientsID VARCHAR(10) NOT NULL,
	DoctorsID VARCHAR(10),
	AppointmentDate DATE NOT NULL,
	ReasonForVisit VARCHAR (150),
	Status VARCHAR(100),
	DepartmentLocationID VARCHAR(10),
	CONSTRAINT FK_Appointment_PatientID FOREIGN KEY (PatientsID) REFERENCES Patient(PatientsID), --FOREIGN KEY FOR PATIENTS
	CONSTRAINT FK_Appointment_DoctorsID FOREIGN KEY (DoctorsID) REFERENCES Doctors(DoctorsID), --FOREIGN KEY FOR DOCTORS
	CONSTRAINT FK_Appointment_DepartmentLocationID FOREIGN KEY (DepartmentLocationID) REFERENCES DepartmentLocation(DepartmentLocationID) --FOREIGN KEY FOR DEPARTMENT LOCATION
	);

SELECT * FROM Appointment;


--CREATING MEDICATION TABLE

CREATE TABLE Medication(
	MedicationID VARCHAR(10) PRIMARY KEY,
	MedicationName VARCHAR(100) NOT NULL
	);

SELECT * FROM Medication;


--CREATE  TREATMENTS TABLE

CREATE TABLE Treatment(
	TreatmentID VARCHAR(10) PRIMARY KEY,
	AppointmentID VARCHAR(10) NOT NULL,
	TreatmentDescription TEXT,
	TreatmentCost DECIMAL (10, 2),
	MedicationID VARCHAR(10),
	DoctorsID VARCHAR(10),
	CONSTRAINT FK_Treatment_AppoinmentID FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID), --FOREIGN KEY FOR APPOINTMENTS
	CONSTRAINT FK_Treatment_MedicationID FOREIGN KEY (MedicationID) REFERENCES Medication(MedicationID), --FOREIGN KEY FOR MEDICATIONS
	CONSTRAINT FK_Treatment_DoctorsID FOREIGN KEY (DoctorsID) REFERENCES Doctors(DoctorsID) --FOREIGN KEY FOR DOCTORS
	);

	
SELECT * FROM Treatment;


--CREATE MEDICAL RECORDS

CREATE TABLE MedicalRecord(
	RecordID VARCHAR(10) PRIMARY KEY,
	AppointmentID VARCHAR(10) NOT NULL,
	ReportDetails TEXT,
	DoctorsNotes VARCHAR(255),
	CONSTRAINT FK_MedicalRecords_AppoinmentID FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID) --FOREIGN KEY FOR APPOINTMENTS
	);

SELECT * FROM MedicalRecord;




--INSERTING VALUES INTO DEPARTMENTS

INSERT INTO DEPARTMENT VALUES (
	'DP001', 'Cardiology'),
	('DP002', 'Ophthalmology'),
	('DP003', 'Neonatology'),
	('DP004', 'Dermatology'),
	('DP005', 'Otolaryngologyy'
);

SELECT * FROM DEPARTMENT;


--INSERTING VALUES INTO DOCTORS TABLE

INSERT INTO Doctors VALUES (
	'DR001', 'Tiwatope', 'Adeoye', 'Cardiology', '09076752172', 'DP001'),
	('DR002', 'Williams', 'Faith', 'Ophthalmology', '08176752172', 'DP002'),
	('DR003', 'Enioluwa', 'Joel', 'Neonatology', '08176776512', 'DP003'),
	('DR004', 'Murewa', 'Barnabas', 'Dermatology', '07076776512', 'DP004'),
	('DR005', 'Christopher', 'Martinez', 'Otolaryngology', '09076776765', 'DP005'),
	('DR006', 'Elizabeth', 'Lucas', 'Ophthalmology', '09078762172', 'DP002'),
	('DR007', 'Karen', 'Jones', 'Neonatology', '08176734215', 'DP003'),
	('DR008', 'Cliton', 'Nickel', 'Cardiology', '09067552172', 'DP001'),
	('DR009', 'Patricia', 'Brown', 'Ophthalmology', '08176765432', 'DP002'),
	('DR010', 'Lauren', 'David', 'Neonatology', '08197656512', 'DP003'),
	('DR011', 'Dabirasire', 'Bamidele', 'Dermatology', '07076776900', 'DP004'),
	('DR012', 'Rebecca', 'Martinez', 'Otolaryngology', '08170096765', 'DP005'),
	('DR013', 'Judith', 'Jude', 'Ophthalmology', '09078753172', 'DP002'),
	('DR014', 'Grace', 'Wealth', 'Dermatology', '09067765121', 'DP004'),
	('DR015', 'Mary', 'Andrew', 'Otolaryngology', '08126776765', 'DP005'),
	('DR016', 'Fikayomi', 'Martinz', 'Ophthalmology', '08154362172', 'DP002'),
	('DR017', 'Thomas', 'Peter', 'Neonatology', '08187000215', 'DP003'),
	('DR018', 'Iremide', 'Laurance', 'Cardiology', '09068753172', 'DP001'),
	('DR019', 'Angel', 'Smith', 'Ophthalmology', '07070985432', 'DP002'),
	('DR020', 'Gift', 'Samson', 'Neonatology', '08164316512', 'DP003'
);

SELECT * FROM Doctors;


-- INSERTING VALUES INTO PATIENTS TABLE

INSERT INTO Patient VALUES (
	'P001', 'Faith', 'Jayden', 'November 11, 1986', 'F', '08187387018', 'Wuse, Abuja, Nigeria', 'O-'),
	('P002', 'Jane', 'Peter', 'November 24, 1987', 'F', '09087387018', '567 Maple St, Springfield, USA', 'O-'),
	('P003', 'John', 'Timber', 'January 2, 1999', 'M', '09087399008', '577 Maple St,Springfield, USA', 'A-'),
	('P004', 'Alfred', 'Cliton', 'June 14, 1987', 'M', '09087387088', '124 Palm Ave, Miami, Florida, USA', 'AB-'),
	('P005', 'Winny', 'Fred', 'February 24, 1987', 'F', '08187387000', '432, Ocean Blvd, Santa Monica, Califonia, USA', 'A+'),
	('P006', 'Victor', 'Clever', 'September 1, 1977', 'M', '07099738701', '765 Desert Rd, Phoenix, Arizona, USA', 'AB-'),
	('P007', 'Kate', 'Andrew', 'March 25, 1996', 'F', '07066538481', '890, Lakeshore Dr, Chicago, USA', 'O+'),
	('P008', 'Harlan', 'Smith', 'April 21, 1993', 'M', '08166538481', '891, Lakeshore Dr,Chicago, USA', 'AB+'),
	('P009', 'Angeina', 'Davis', 'May 10, 1976', 'F', '07098387010', '1600 Pennysylvania Ave NW, Washington, USA', 'B-'),
	('P010', 'Harden', 'Miller', 'November 26, 1989', 'M', '09027387023', '456 Ranch Rd, Asutin, Texas, USA', 'B-'),
	('P011', 'Emmanuel', 'Rodriguez', 'January 5, 1993', 'M', '08123399009', '123 Main St,New York', 'AB-'),
	('P012', 'Boothe', 'Anderson', 'July 14, 2003', 'M', '08023387087', '234 Fremont St, Las Vegas, Neveda, USA', 'AB-'),
	('P013', 'Challie', 'Jackson', 'February 23, 1997', 'M', '07045387000', '321, River RD, Newark, New Jersey, USA', 'A+'),
	('P014', 'Peter', 'Taylor', 'September 1, 1992', 'M', '09087978701', '765 Desert Rd, Phoenix, Arizona, USA', 'AB+'),
	('P015', 'Maryjane', 'Wilson', 'August 25, 1996', 'F', '08165438481', '880, Lakeshore Dr, Chicago, USA', 'O+'),
	('P016', 'Wealth', 'Lopez', 'April 12, 1993', 'F', '07098653848', '789 Magnolia Ln, Brimingham, Alabama, USA', 'AB+'),
	('P017', 'Matthew', 'Brown', 'January 22, 1998', 'M', '08144687008', '345 Aspen Way, Denver, Colorado, USA', 'A-'),
	('P018', 'Peace', 'Cliton', 'October 14, 1994', 'F', '07086387088', '194 Palm Ave, Miami, Florida, USA', 'AB-'),
	('P019', 'Nimi', 'James', 'December 24, 2000', 'F', '09064438700', '422, Ocean Blvd, Santa Monica,Califonia', 'A+'),
	('P020', 'Sheldon', 'Thomas', 'September 7, 2001', 'M', '07098642601', '795 Desert Rd, Phoenix,Arizona, USA', 'O+'
	);

SELECT * FROM Patient;


-- INSERTING VALUES INTO DEPARTMENT LOCATION

INSERT INTO DepartmentLocation VALUES (
	'DP001', 'BLOCK A'),
	('DP002', 'BLOCK B'),
	('DP003', 'BLOCK C'),
	('DP004', 'BLOCK D'),
	('DP005', 'BLOCK E'
);
SELECT * FROM DepartmentLocation;


-- INSERING VALUES INTO APPOINTMENT

INSERT INTO Appointment VALUES (
	'A001', 'P001', 'DR001', '2024/09/21', 'Follow up Check', 'Scheduled', 'DP001'),
	('A002', 'P002', 'DR002', '2024/09/02', 'Follow-up Check', 'Completed', 'DP002'),
	('A003', 'P003', 'DR003', '2024/08/17', 'Cataract Surgery', 'Scheduled', 'DP001'),
	('A004', 'P004', 'DR004', '2024/09/17', 'Routine Check up', 'Scheduled', 'DP004'),
	('A005', 'P005', 'DR005', '2024/11/08', 'Routine Check up', 'Completed', 'DP005'),
	('A007', 'P006', 'DR006', '2024/09/02', 'Eye pain', 'Scheduled', 'DP002'),
	('A006', 'P007', 'DR007', '2024/09/03', 'Heart Palpitations', 'Cancelled', 'DP001'),
	('A008', 'P008', 'DR008', '2024/09/11', 'Follow up Check ', 'Cancelled', 'DP001'),
	('A009', 'P009', 'DR009', '2024/09/01', 'Post Surgery Follow up', 'Scheduled', 'DP002'),
	('A010', 'P010', 'DR010', '2024/10/04', 'Post surgery follow up', 'Scheduled', 'DP001'),
	('A011', 'P011', 'DR011', '2024/11/25', 'Diabetic Management', 'Completed', 'DP002'),
	('A012', 'P012', 'DR012', '2024/10/07', 'Follow up check', 'Completed', 'DP002'),
	('A013', 'P013', 'DR013', '2024/11/06', 'Follow up check', 'Scheduled', 'DP003'),
	('A014', 'P014', 'DR014', '2024/09/12', 'Myocardial Surgery', 'Cancelled', 'DP003'),
	('A015', 'P015', 'DR015', '2024/10/08', 'Post-Surgery Follow up', 'Scheduled', 'DP001'),
	('A016', 'P016', 'DR016', '2024/11/27', 'Skin Irritation', 'Scheduled', 'DP004'),
	('A017', 'P017', 'DR017', '2024/08/05', 'Hearing Test', 'Completed', 'DP005'),
	('A018', 'P018', 'DR018', '2024/10/09', 'Follow up Chek', 'Completed', 'DP003'),
	('A019', 'P019', 'DR019', '2024/09/19', 'Routine Check up', 'Completed', 'DP003'),
	('A020', 'P020', 'DR020', '2024-09-13', 'Acne Symptons', 'Completed', 'DP004'
	);

SELECT * FROM Appointment;

-- INSERTING INTO MEDICATION

INSERT INTO Medication VALUES (
	'M001', 'Atenolol'),
	('M002', 'Propranolol'),
	('M003', 'Brimonidine'),
	('M004', 'Latanoprost'),
	('M005', 'Palivizumab'),
	('M006', 'Caffeine'),
	('M007', 'Hydrocortosone'),
	('M008', 'Tacrolimus'),
	('M009', 'Mometasone'),
	('M010', 'Flutocasone'),
	('M011', 'Ciprofloxacin'),
	('M012', 'Amoxicillin'),
	('M013', 'Azithromycin'),
	('M014', 'Prednisolone	'),
	('M015', 'Metroprolol'),
	('M016', 'Losartan'),
	('M017', 'Timolol'),
	('M018', 'Cyclopentolate'),
	('M019', 'Surfactant'),
	('M020', 'Phenobarbital'
);
SELECT * FROM Medication;

---INSERTING VALUES INTO TREATMENTS

INSERT INTO Treatment VALUES (
	'TR001', 'A001', 'Blood pressure management', 200000.00, 'M001', 'DR001'),
	('TR002', 'A002', 'Beta-blocker therapy', 300000.00, 'M002', 'DR002'),
	('TR003', 'A003', 'Glaucoma management', 800000.00, 'M003', 'DR003'),
	('TR004', 'A004', 'Latanoprost for eye pressure', 950000.00, 'M004', 'DR004'),
	('TR005', 'A005', 'Respiratory syncytial virus (RSV) treatment', 50000.00, 'M005', 'DR005'),
	('TR006', 'A006', 'Caffeine citrate for apnea in premature infants', 950000.00, 'M006', 'DR002'),
	('TR007', 'A007', 'Skin inflammation management', 950000.00, 'M007', 'DR003'),
	('TR008', 'A008', 'Tropical treatment for dermatitis', 300000.00, 'M008', 'DR001'),
	('TR009', 'A009', 'Eczema treatment', 830000.00, 'M009', 'DR002'),
	('TR010', 'A010', 'Psoriasis treatment', 500000.00, 'M010', 'DR003'),
	('TR011', 'A011', 'Antibiobic therapy for sinus infection', 280000.00, 'M011', 'DR004'),
	('TR012', 'A012', 'Amoxicillin for ear infection', 650000.00, 'M012', 'DR005'),
	('TR013', 'A013', 'Azithromycin for throat infection', 320000.00, 'M013', 'DR002'),
	('TR014', 'A014', 'Prednisolone for laryngitis', 805000.00, 'M014', 'DR004'),
	('TR015', 'A015', 'Hypertension management with metoprolol', 950000.00, 'M015', 'DR005'),
	('TR016', 'A016', 'Hypertension management with Losartan', 150000.00, 'M016', 'DR002'),
	('TR017', 'A017', 'Glaucoma treatment with Timolol', 420000.00, 'M017', 'DR003'),
	('TR018', 'A018', 'Pupil dilation for eye exam', 200000.00, 'M018', 'DR001'),
	('TR019', 'A019', 'Surfactant therapy for neonatal respiratory distress', 660000.00, 'M019', 'DR002'),
	('TR020', 'A020', 'Seizure management with phenobarbital', 800000.00, 'M020', 'DR003'

);

SELECT * FROM Treatment;

INSERT INTO MedicalRecord VALUES (
	'MR001', 'A001', 'Blood pressure within normal range, patient responding well to Atenolol.', 'Continue with current medication.'),
	('MR002', 'A002', 'Patient showed improvement with beta-blocker therapy.', 'Monitor side effect and adjust dosage if necesary.'),
	('MR003', 'A003', 'Intraocular pressure reduced after starting glaucoma treatment.', 'Recommed continued us of Bromonidine.'),
	('MR004', 'A004', 'Patient eye pressure improving woth Latanoprost.', 'Advise follow-up after two weeks.'),
	('MR005', 'A005', 'RSV treatment administered, patient stabilized.', 'Monitor respiratory status for further complication.'),
	('MR006', 'A006', 'Caffeine Citate effectiveky reducing apnea episodea.', 'Continue current dosage.'),
	('MR007', 'A007', 'Skin inflammation reduced with Hydrocortisone treatment.', 'Continue foe another week and reasses.'),
	('MR008', 'A008', 'Dermatitis symptons improving with Tacrolimu.', 'Monitor for any adverse reactions.'),
	('MR009', 'A009', 'Eczema lesions responding to Mometasone treatment.', 'Recommend continued use.'),
	('MR010', 'A010', 'Psoriasis flares reduced with Fluticasone.', 'Advice use of emollients alongside steroid.'),
	('MR011', 'A011', 'Sinus infection improved after ciprofloxacin. ', 'Finish antibiotics course and schedule a follow up.'),
	('MR012', 'A012', 'Ear infection improving with Amoxicillin', 'Recommend completing the antibiotics course'),
	('MR013', 'A013', 'Throat infection subsiding with Azithromycin.', 'No further intervention needed at this point.'),
	('MR014', 'A014', 'Laryngitis inflammation reduced with prednisolone.', 'Advise voice rest and hydration.'),
	('MR015', 'A015', 'Blood pressure controlled with Metropolol.', 'Continue current treatment'),
	('MR016', 'A016', 'Hypertension under control with Losartan.', 'Advise patient to continue regular monitoring.'),
	('MR017', 'A017', 'Glucoma symptons managed well with Timolol.', 'No adverse reactions, continue as prescribed.'),
	('MR018', 'A018', 'Pupil dilation effective for eye examination.', 'No complication observed, follow-up schedule.'),
	('MR019', 'A019', 'Respiratory distress symptoms improving with surfactant therapy.', 'Patient remain under observation.'),
	('MR020', 'A020', 'Seizures reduced with Phenobarbital.', 'Monitor for any side effects of drug interactions.'
);
SELECT * FROM MedicalRecord;