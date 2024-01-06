SELECT m.name, SUM(price * numdoses) AS Total_Spending FROM prescription p JOIN Medication m ON p.idMedication = m.idMedication WHERE date BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE() GROUP BY name;
SELECT SUM(price * numdoses) AS Total_Spending FROM prescription WHERE date BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE();
