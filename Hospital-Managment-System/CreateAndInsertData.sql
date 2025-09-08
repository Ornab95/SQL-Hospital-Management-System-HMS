-- =========================================================
-- SQL SCRIPT: Hospital Management System
-- Author: Ornab Biswass
-- Database: HOSPITAL_MANAGMENT_SYSTEM
-- Description: SQL script to create tables, insert sample data,
--              and perform data retrieval for a hospital management system.
-- =========================================================

-- Create a new database
CREATE DATABASE HOSPITAL_MANAGMENT_SYSTEM;

-- Switch to the new database
USE HOSPITAL_MANAGMENT_SYSTEM;

-- ===============================
-- Physician Table (Doctors)
-- ===============================
CREATE TABLE Physician(
  employeeid INT PRIMARY KEY,              -- Unique ID for each physician
  name VARCHAR(150) NOT NULL,              -- Physician full name
  position VARCHAR(150) NOT NULL           -- Job title/role (e.g., Attending Physician)
);
-- Insert Bangladeshi Physicians data
INSERT INTO Physician(employeeid,name,position) 
VALUES
(1,'Dr. Abdullah Al Mamun','Staff Internist'),
(2,'Dr. Farhana Akter','Attending Physician'),
(3,'Dr. Mahmudul Hasan','Surgical Attending Physician'),
(4,'Dr. Shafiqul Islam','Senior Attending Physician'),
(5,'Dr. Khaled Hossain','Head Chief of Pulmonology'),
(6,'Dr. Nusrat Jahan','Surgical Attending Physician'),
(7,'Dr. Rashed Karim','Surgical Attending Physician'),
(8,'Dr. Tania Rahman','Resident'),
(9,'Dr. Arif Chowdhury','Attending Psychiatrist'),
(10,'Dr. Mst. Jahanara Begum','Senior Attending Nephrologist'),
(11,'Dr. Rakibul Alam','Resident'),
(12,'Dr. Tamanna Sultana','Senior Attending Gynecologist'),
(13,'Dr. Nazmul Haque','Cardiologist'),
(14,'Dr. Fahim Rahman','Assistant Intensivist'),
(15,'Dr. Laila Khatun','Senior ENT Surgeon'),
(16,'Dr. Sajib Ahmed','Junior Resident'),
(17,'Dr. Shahnaz Parvin','Assistant Orthopedic Surgeon'),
(18,'Dr. Kamrul Hasan','Head Chief of Gastroenterology'),
(19,'Dr. Anika Islam','Assistant Neuro Surgeon'),
(20,'Dr. Mehedi Hasan','Junior Intensivist'),
(21,'Dr. Shahidul Alam','Head Chief of Orthopedics'),
(22,'Dr. Sumaiya Akter','Head Chief of Neonatal'),
(23,'Dr. Rezaul Karim','Staff Internist'),
(24,'Dr. Mahfuz Rahman','Assistant Physiotherapist'),
(25,'Dr. Sadia Yasmin','Senior Intensivist'),
(26,'Dr. Farid Uddin','Assistant Gastro Surgeon'),
(27,'Dr. Humayun Kabir','Head Chief of Physiotherapy'),
(28,'Dr. Shakil Ahmed','Senior Attending Urologist'),
(29,'Dr. Afsana Hossain','Intensivist'),
(30,'Dr. Aminul Islam','Senior Attending Neurologist'),
(31,'Dr. Saiful Islam','Senior Resident'),
(32,'Dr. Jui Chowdhury','Junior Resident'),
(33,'Dr. Tahmid Hasan','Assistant Neonatologist'),
(34,'Dr. Samira Rahman','Senior Resident'),
(35,'Dr. Habibur Rahman','Head Chief of Urology');


-- ===============================
-- Department Table
-- ===============================
CREATE TABLE department(
  department_id INT PRIMARY KEY,           -- Unique ID for each department
  dept_name VARCHAR(150) NOT NULL,         -- Department name (Cardiology, Surgery, etc.)
  head INT NOT NULL,                       -- Head of department (references a physician)
  FOREIGN KEY(head) REFERENCES Physician(employeeid)  -- Ensures head exists in Physician table
);

Insert into department(department_id,dept_name,head)
values
(1,'General Medicine',4),
(2,'Surgery',7),
(3,'Psychiatry',9),
(4,'Cardiology',13),
(5,'Nephrology',10),
(6,'Urology',35),
(7,'Neurology',30),
(8,'Physiotherapy',27),
(9,'ENT',15),
(10,'Pulmonology',5),
(11,'Gastroenterology',18),
(12,'Gynecology',12),
(13,'Neonatal',22),
(14,'Critical care',25),
(15,'Orthopedics',21);


-- ===============================
-- Affiliated_with Table
-- ===============================
CREATE TABLE affiliated_with(
  physicianid INT NOT NULL,                -- Physician ID (references Physician)
  departmentid INT NOT NULL,               -- Department ID (references Department)
  primaryaffiliation VARCHAR(1) NOT NULL,  -- 't' (true) if main dept, 'f' if secondary
  FOREIGN KEY(physicianid) REFERENCES Physician(employeeid),
  FOREIGN KEY(departmentid) REFERENCES department(department_id)
);

INSERT INTO affiliated_with(physicianid,departmentid,primaryaffiliation) 
VALUES
(1,1,'t'),
(2,1,'t'),
(3,1,'f'),
(3,2,'t'),
(4,1,'t'),
(5,10,'t'),
(6,2,'t'),
(7,1,'f'),
(7,2,'t'),
(8,1,'t'),
(9,3,'t'),
(10,5,'t'),
(11,4,'f'),
(12,12,'t'),
(13,4,'t'),
(14,14,'f'),
(15,9,'t'),
(16,10,'f'),
(17,15,'t'),
(18,11,'t'),
(19,7,'t'),
(20,14,'f'),
(21,15,'t'),
(22,13,'t'),
(23,14,'f'),
(24,8,'t'),
(25,14,'t'),
(26,11,'f'),
(27,8,'t'),
(28,6,'t'),
(29,14,'t'),
(30,7,'t'),
(31,5,'f'),
(32,4,'f'),
(33,13,'t'),
(34,11,'t'),
(35,6,'t');

-- ===============================
-- Nurse Table
-- ===============================
CREATE TABLE Nurse(
  nurse_id INT NOT NULL,                   -- Unique ID for nurse (better to make PRIMARY KEY)
  name VARCHAR(150) NOT NULL,              -- Nurse name
  position VARCHAR(150) NOT NULL,          -- Nurse job role (Head Nurse, Team Leader, etc.)
  registered VARCHAR(10) NOT NULL          -- Whether nurse is registered ('Yes'/'No')
);
INSERT INTO Nurse(nurse_id,name,position,registered)
VALUES 
(1,'Carla Espinosa','Head Nurse','Yes'),
(2,'Laverne Roberts','Nurse','Yes'),
(3,'Paul Flowers','Nurse','No'),
(4,'Anna Rubel','Team Leader','No'),
(5,'Teresa Buttler','Sister Ir','Yes'),
(6,'Katthie Mathews','Nurse','Yes'),
(7,'Rose Hughes','Head Nurse','Yes'),
(8,'Carolina Gomez','Nurse','No'),
(9,'Danna Martinez','Sister IR','No'),
(10,'Olive Peterson','Head Nurse','Yes'),
(11,'Amelia Murray','Team Leader','Yes'),
(12,'Helena Martinez','Nurse','No'),
(13,'Olivia Patterson','NS Supdt','Yes'),
(14,'Diana Bell','Nurse','No'),
(15,'Bella Simmons','Nurse','Yes'),
(16,'Jaqueline Olsen','Nurse','No'),
(17,'Cali McBride','Team Leader','Yes'),
(18,'Madilynn Velazquez','Nurse','No'),
(19,'Kelsie Avery','Sister Ir','Yes'),
(20,'Lailah McIntosh','Nurse','Yes'),
(21,'Jamiya Villarreal','Head Nurse','Yes'),
(22,'Harmony Ramsey','Nurse','No'),
(23,'Kiley Nguyen','Sister Ir','Yes'),
(24,'Mercedec Nguyen','Team Leader','Yes'),
(25,'Averie Kennedy','Nurse','No'),
(26,'Kinley Fernandez','Nurse','No'),
(27,'Nia Knox','Head Nurse','No'),
(28,'Raven Singleton','Nurse','Yes'),
(29,'Stephanie Collins','Team Leader','Yes'),
(30,'Gisselle Gray','Nurse','No'),
(31,'Liliana Pace','Head Nurse','Yes'),
(32,'Adelaide Jimenez','Nurse','Yes'),
(33,'Aryana Harding','Sister Ir','No');

-- ===============================
-- Patient Table
-- ===============================
CREATE TABLE Patient(
  patient_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for patient (auto-generated)
  name VARCHAR(100) NOT NULL,                -- Patient first name
  surname VARCHAR(100) NOT NULL,             -- Patient last name
  address VARCHAR(100) NOT NULL,             -- Patient address
  gender VARCHAR(150) NOT NULL,              -- Gender of patient
  phone VARCHAR(150) NOT NULL,               -- Contact phone number
  primary_check INT NOT NULL,                -- Doctor responsible for primary check-up
  FOREIGN KEY(primary_check) REFERENCES Physician(employeeid) -- Must match a Physician
);
INSERT INTO Patient(patient_id,name,surname,address,gender,phone,primary_check)
VALUES
(1,'Abdullah','Rahman','42 Dhanmondi, Dhaka','Male','01711-025689',2),
(2,'Farhana','Akter','37 Uttara, Dhaka','Female','01712-051265',2),
(3,'Mahmud','Hasan','101 Agrabad, Chattogram','Male','01812-120434',9),
(4,'Shafiqul','Islam','1100 Kazir Dewri, Chattogram','Male','01612-204834',17),
(5,'Khaled','Hossain','123 Shibbari Road, Khulna','Male','01912-123456',24),
(6,'Nusrat','Jahan','56 Rajshahi University Area','Female','01713-234567',7),
(7,'Rasel','Ahmed','789 Bagura Sadar, Bogura','Male','01813-345678',13),
(8,'Shanta','Khatun','101 Pabna Town, Pabna','Female','01613-456789',25),
(9,'Arif','Chowdhury','234 Sylhet Sadar, Sylhet','Male','01714-567890',28),
(10,'Jahanara','Begum','567 Comilla Kotbari, Cumilla','Female','01814-678901',19),
(11,'Rakibul','Alam','890 Barisal Sadar, Barisal','Male','01914-789012',5),
(12,'Tamanna','Sultana','111 Rangpur Town, Rangpur','Female','01715-890123',33),
(13,'Nazmul','Haque','222 Mymensingh Sadar, Mymensingh','Male','01815-901234',3),
(14,'Samia','Akter','333 Jashore Town, Jashore','Female','01615-012345',18),
(15,'Fahim','Rahman','444 Dinajpur Town, Dinajpur','Male','01716-123457',6),
(16,'Anika','Islam','555 Gazipur Chowrasta, Gazipur','Female','01816-234568',19),
(17,'Sajid','Khan','666 Sirajganj Town, Sirajganj','Male','01916-345679',15),
(18,'Shahnaz','Parvin','777 Rajbari Sadar, Rajbari','Female','01717-456780',26),
(19,'Mehedi','Hasan','888 Noakhali Sadar, Noakhali','Male','01817-567891',6),
(20,'Sumaiya','Akter','999 Feni Sadar, Feni','Female','01617-678902',20),
(21,'Rezaul','Karim','121 Tangail Sadar, Tangail','Male','01718-789013',28),
(22,'Sadia','Yasmin','232 Brahmanbaria Town, Brahmanbaria','Female','01818-890124',6),
(23,'Mahfuz','Rahman','343 Natore Sadar, Natore','Male','01918-901235',25),
(24,'Nabila','Akter','454 Panchagarh Town, Panchagarh','Female','01719-012346',19),
(25,'Hasib','Mahmud','565 Thakurgaon Town, Thakurgaon','Male','01819-123457',24),
(26,'Mim','Akter','676 Kurigram Sadar, Kurigram','Female','01919-234568',28),
(27,'Shakil','Ahmed','787 Pirojpur Town, Pirojpur','Male','01720-345679',27),
(28,'Afsana','Hossain','898 Jhalokati Town, Jhalokati','Female','01820-456780',6),
(29,'Aminul','Islam','909 Gaibandha Town, Gaibandha','Male','01620-567891',33),
(30,'Jui','Chowdhury','343 Magura Sadar, Magura','Female','01721-678902',10),
(31,'Saiful','Islam','454 Chuadanga Town, Chuadanga','Male','01821-789013',5),
(32,'Samira','Rahman','565 Habiganj Town, Habiganj','Female','01921-890124',18),
(33,'Tahmid','Hasan','676 Chandpur Town, Chandpur','Male','01722-901235',2),
(34,'Maliha','Begum','787 Khagrachari Town, Khagrachari','Female','01822-012346',13),
(35,'Habib','Rahman','898 Bandarban Town, Bandarban','Male','01922-123457',20),
(36,'Rafi','Hasan','909 Lakshmipur Town, Lakshmipur','Male','01723-234568',21),
(37,'Orin','Akter','343 Sunamganj Town, Sunamganj','Female','01823-345679',9),
(38,'Tania','Rahman','454 Cox’s Bazar Sadar, Cox’s Bazar','Female','01923-456780',30),
(39,'Sabbir','Hossain','565 Nilphamari Town, Nilphamari','Male','01724-567891',15);

-- ===============================
-- Patient Diagnosis Table
-- ===============================
CREATE TABLE PATIENT_DIAGNOSIS(
  diagnosis VARCHAR(150) NOT NULL,          -- Illness/condition diagnosed
  prescription VARCHAR(150) NOT NULL,       -- Medicines/treatment prescribed
  patient_id INT NOT NULL,                  -- Refers to patient
  physician_id INT NOT NULL,                -- Refers to diagnosing physician
  FOREIGN KEY(patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY(physician_id) REFERENCES Physician(employeeid)
);
INSERT INTO PATIENT_DIAGNOSIS(Diagnosis,Prescription,Patient_ID,Physician_id)
VALUES
('Hypertension','Lisinopril',1,2),
('Arthritis','Naproxen & Aspirin',4,17), 
('Anxiety Disorder','Fluoxetine',3,9),     
('Muscular Dystrophy','Corticosteroids',5,24),                            
('Asthma','Albuterol',2,2),        
('IgA Nephropathy','Budesonide',30,10),     
('Chronic Pain','Tramadol',6,7),    
('Acoustic neuroma','Radiation therapy',7,13),     
('Septic Shock','Corticosteroids:Hydrocortisone',8,25),   
('Kidney Stones','Ibuprofen, Acetaminophen',9,28),     
('Parkinsons Disease,Pramipexole','Ropinirole',10,19),  
('Chronic Obstructive Pulmonary Disease (COPD)','Fluticasone,Budesonide',11,5), 
('Neonatal Jaundice','Phototherapy',12,33),  
('Chronic Pain','Tramadol',13,3),       
('Gallstones','Cholecystectomy',14,18),        
('Type 1 Diabetes','Insulin',15,6),                                  
('Migraine','Triptans',16,19),      
('Tonsillitis','Penicillin VK',17,15),         
('Inflammatory Bowel Disease','Mesalamine',18,26),       
('Coronary Artery Disease','Aspirin',19,6),     
('Chronic Obstructive Pulmonary Disease (COPD)','Tiotropium',20,20),   
('Urinary Tract Infection (UTI)','Nitrofurantoin',21,28),    
('Attention Deficit Disorder','Dextroamphetamine',22,6),      
('Traumatic Brain Injury (TBI)','Propofol,Midazolam',23,25),             
('Neuropathic Pain','Amitriptyline',24,19),                  
('Chronic Obstructive Pulmonary Disease','Breathing exercises',25,24),      
('Overactive Bladder','Oxybutynin',26,28),             
('Sports Injuries','muscle relaxants',27,27),                
('Psoriasis','Methotrexate',28,6),                            
('Respiratory Distress Syndrome','Beractant',29,33),
('Coronavirus Disease 2019 (COVID-191)','Remdesivir',31,5),   
('Chronic Gastritis','Pantoprazole',32,18),      
('Generalized Anxiety Disorder (GAD)','Buspirone',33,2),    
('Sinusitis','Acetaminophen',34,13),     
('Burn Injuries','Acetaminophen',35,20),
('Osteoporosis','Calcitonin',36,21),
('Depression','Fluoxetine',37,9),
('Myasthenia Gravis','Pyridostigmine',38,30),
('Otitis Media','Amoxicillin',39,15);

-- ===============================
-- Procedures Table
-- ===============================
CREATE TABLE procedures(
  code INT PRIMARY KEY,                     -- Unique procedure code
  name VARCHAR(150) NOT NULL,               -- Procedure/test name (e.g., MRI, X-ray)
  cost INT NOT NULL                         -- Cost of the procedure
);
INSERT INTO procedures(code,name,cost)
VALUES
(1,'X-ray-Chest',1000),
(2,'X-ray-Abdomen',1200),
(3,'X-ray-Skull',900),
(4,'X-ray-Spine',1500),
(5,'MRI-Brain',5000),
(6,'MRI-Spine',6000),
(7,'CT Scan-Abdomen',3000),
(8,'CT Scan-Pelvis',3500),
(9,'Ultrasound-Abdomen',700),
(10,'Ultrasound-Obstetric',2500),
(11,'Mammogram',1200),
(12,'Bone Density Scan (DEXA)',1800),
(13,'PET-CT Scan',5000),
(14,'Fluoroscopy - Upper GI Series',7000),
(15,'Fluoroscopy - Barium Enema',4500),
(16,'Nuclear Medicine - Thyroid Scan',450),
(17,'Angiography - Cerebral',800),
(18,'Interventional Radiology - Biopsy',700),
(19,'X-ray-Extremities',300),
(20,'MRI-Knee',4000);

-- ===============================
-- Data Retrieval Queries
-- ===============================
SELECT * FROM physician;         -- View all physicians
SELECT * FROM affiliated_with;   -- View all physician-department relationships
SELECT * FROM department;        -- View all departments
SELECT * FROM nurse;             -- View all nurses
SELECT * FROM patient;           -- View all patients
SELECT * FROM patient_diagnosis; -- View all diagnoses and prescriptions
SELECT * FROM procedures;        -- View all procedures with cost

-- ===============================
-- Table Descriptions (Structure)
-- ===============================
DESC physician;           -- Show structure of Physician table
DESC affiliated_with;     -- Show structure of Affiliated_with table
DESC department;          -- Show structure of Department table
DESC nurse;               -- Show structure of Nurse table
DESC patient;             -- Show structure of Patient table
DESC patient_diagnosis;   -- Show structure of Patient_Diagnosis table
DESC procedures;          -- Show structure of Procedures table
-- drop database HOSPITAL_MANAGMENT_SYSTEM; 