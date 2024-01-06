CREATE FUNCTION `get_patient_prescriptions`(patient INT)
RETURNS INTEGER
BEGIN
SELECT  * FROM Patient p JOIN Prescription pres ON p.idPatient = pres.idPatient WHERE p.idPatient = patient;

RETURN 1;
END
