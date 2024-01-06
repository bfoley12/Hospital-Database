CREATE PROCEDURE `select_foreign_patients` ()
BEGIN
SELECT * FROM Patients WHERE isnull(SSN);
END
