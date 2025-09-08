-- =========================================================
-- SQL QUERIES DOCUMENTATION
-- Author: Your Name
-- Database: HOSPITAL_MANAGMENT_SYSTEM
-- Description: Example queries to retrieve, manipulate,
-- and analyze hospital management system data.
-- =========================================================

-- ===============================
-- 1. List all physicians in alphabetical order
-- ===============================
SELECT NAME AS PHYSICIAN_NAME
FROM PHYSICIAN
ORDER BY NAME;

-- ===============================
-- 2. Full names of male patients
-- ===============================
SELECT CONCAT(NAME,' ',SURNAME) AS PATIENTS_FULLNAME, GENDER
FROM PATIENT
WHERE GENDER = 'MALE';

-- ===============================
-- 3. Registered nurses who are heads of their departments
-- ===============================
SELECT *
FROM NURSE
WHERE POSITION = 'Head Nurse' 
  AND REGISTERED = 'YES';

-- ===============================
-- 4. Nurses who are either Team Leader or not registered
-- ===============================
SELECT NAME, POSITION, REGISTERED
FROM NURSE
WHERE POSITION = 'Team Leader' 
   OR REGISTERED = 'NO';

-- ===============================
-- 5. Average cost of all medical procedures
-- ===============================
SELECT AVG(COST) AS AVERAGE_COST
FROM PROCEDURES;

-- ===============================
-- 6. Procedures costing more than 2000
-- ===============================
SELECT NAME AS PROCEDURE_NAME, COST AS PROCEDURE_COST
FROM PROCEDURES
WHERE COST > 2000;

-- ===============================
-- 7. Update patient name to Robert Fernandez for patient_id 5
-- ===============================
UPDATE PATIENT
SET NAME = 'Robert', SURNAME = 'Fernandez'
WHERE PATIENT_ID = 5;

-- Verify update
SELECT * FROM PATIENT;

-- ===============================
-- 8. Drop the phone column from the patient table
-- ===============================
ALTER TABLE PATIENT
DROP COLUMN phone;

-- Verify structure
SELECT * FROM PATIENT;

-- ===============================
-- 9. Second highest cost of medical procedures
-- ===============================
SELECT NAME, MAX(COST) AS PROCEDURE_COST
FROM PROCEDURES
GROUP BY NAME
ORDER BY PROCEDURE_COST DESC
LIMIT 1,1;

-- ===============================
-- 10. Patients whose full name starts with 'A'
-- ===============================
SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER
FROM PATIENT
WHERE CONCAT(NAME,' ',SURNAME) LIKE 'A%';

-- ===============================
-- 11. Patients whose full name has 'M' as the third letter
-- ===============================
SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER
FROM PATIENT
WHERE CONCAT(NAME,' ',SURNAME) LIKE '__M%';

-- ===============================
-- 12. Patients whose name starts with 'J' and ends with 'Z'
-- ===============================
SELECT CONCAT(NAME,' ',SURNAME) AS FULL_NAME, GENDER
FROM PATIENT
WHERE CONCAT(NAME,' ',SURNAME) LIKE 'J%Z';

-- ===============================
-- 13. Patient details for patient_id 11 to 20
-- ===============================
SELECT *
FROM PATIENT
LIMIT 10, 10;

-- ===============================
-- JOINS
-- ===============================

-- 14. Physicians who are heads of their departments
SELECT P.NAME AS DOCTOR_NAME, D.DEPT_NAME
FROM PHYSICIAN P
INNER JOIN DEPARTMENT D
ON P.EMPLOYEEID = D.HEAD;

-- 15. Patients with their primary physician
SELECT CONCAT(P.NAME,' ',P.SURNAME) AS PATIENT_NAME, PH.NAME AS PRIMARY_PHYSICIAN
FROM PATIENT P
LEFT JOIN PHYSICIAN PH
ON P.PRIMARY_CHECK = PH.EMPLOYEEID;

-- 16. Physicians with their primary affiliated department
SELECT P.NAME AS PHYSICIAN_NAME, D.DEPT_NAME AS DEPARTMENT_NAME
FROM PHYSICIAN P
INNER JOIN AFFILIATED_WITH AW
ON P.EMPLOYEEID = AW.PHYSICIANID
INNER JOIN DEPARTMENT D
ON AW.DEPARTMENTID = D.DEPARTMENT_ID
WHERE AW.PRIMARYAFFILIATION = 't';

-- 17. Physician name, position, and affiliated department(s)
SELECT P.NAME AS PHYSICIAN_NAME, P.POSITION AS PHYSICIAN_POSITION, D.DEPT_NAME AS DEPARTMENT_NAME
FROM PHYSICIAN P
JOIN AFFILIATED_WITH A
ON P.EMPLOYEEID = A.PHYSICIANID
JOIN DEPARTMENT D
ON A.DEPARTMENTID = D.DEPARTMENT_ID;

-- 18. Patients with their primary physician and diagnosis with prescription
SELECT PH.EMPLOYEEID, PH.NAME AS PHYSICIAN_NAME, PH.POSITION AS DESIGNATION,
       P.PATIENT_ID, CONCAT(P.NAME,' ',P.SURNAME) AS PATIENT_TREATED,
       P.GENDER, PD.DIAGNOSIS, PD.PRESCRIPTION
FROM PATIENT_DIAGNOSIS PD
LEFT JOIN PHYSICIAN PH
ON PD.PHYSICIAN_ID = PH.EMPLOYEEID
LEFT JOIN PATIENT P
ON P.PATIENT_ID = PD.PATIENT_ID;

-- ===============================
-- SUBQUERIES
-- ===============================

-- 19. Maximum cost of medical procedure
SELECT NAME, COST
FROM PROCEDURES
WHERE COST IN (SELECT MAX(COST) FROM PROCEDURES);

-- 20. Details of patients diagnosed with chronic pain
SELECT *
FROM PATIENT
WHERE PATIENT_ID IN (SELECT PATIENT_ID FROM PATIENT_DIAGNOSIS WHERE DIAGNOSIS = 'Chronic Pain');

-- 21. Procedures costing more than average cost
SELECT NAME AS PROCEDURE_NAME, COST AS PROCEDURE_COST
FROM PROCEDURES
WHERE COST > (SELECT AVG(COST) FROM PROCEDURES);

-- 22. Procedures costing less than average cost
SELECT NAME AS PROCEDURE_NAME, COST AS PROCEDURE_COST
FROM PROCEDURES
WHERE COST < (SELECT AVG(COST) FROM PROCEDURES);

-- 23. Physicians who are either Head Chief or Senior
SELECT *
FROM PHYSICIAN
WHERE POSITION IN (
    SELECT POSITION 
    FROM PHYSICIAN
    WHERE POSITION LIKE '%Senior%' OR POSITION LIKE '%Head Chief%'
);

-- 24. Physicians whose primary affiliation has not been done
SELECT *
FROM PHYSICIAN
WHERE EMPLOYEEID IN (
    SELECT PHYSICIANID
    FROM AFFILIATED_WITH
    WHERE PRIMARYAFFILIATION = 'f'
);
