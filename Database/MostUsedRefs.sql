SELECT Name, COUNT(*) as Num_Referenecs FROM reference GROUP BY Name ORDER BY Num_Referenecs DESC