/*===========================================================
  UNIT 2 PROJECT EXAMPLE
  Scott Adams
  Promotable
=============================================================*/


/*---------- STEP 1: Explore Table -----------*/

SHOW COLUMNS FROM Churn;
SELECT * FROM Churn LIMIT 10;


/*---------- STEP 2: Examine Distributions of Main Variables ---------*/

SELECT MIN(Age), MAX(Age), STDDEV(Age),AVG(Age) 
FROM Churn;

SELECT MIN(CreditScore), MAX(CreditScore),STDDEV(CreditScore), AVG(CreditScore) 
FROM Churn;

SELECT Geography, COUNT(Geography) AS Frequency
	FROM Churn
	GROUP BY Geography;


/*---------- STEP 3: CREATE AGE GROUP VARIABLE ----------*/

/* Agegrp: 1 = 18-29, 2 = 30-64, 3 = 65+ */

ALTER TABLE Churn
	ADD COLUMN Agegrp Varchar(30);


UPDATE Churn 
SET Agegrp = CASE
	WHEN Age BETWEEN 0 AND 29 THEN 1
	WHEN Age BETWEEN 30 AND 64 THEN 2
	WHEN Age >= 65 THEN 3
END;


/*---------- SETP 4: Analysis -----------*/

SELECT AVG(CreditScore), Agegrp
FROM Churn
GROUP BY Agegrp;

SELECT AVG(CreditScore), Agegrp, Geography
FROM Churn
GROUP BY Agegrp, Geography
ORDER BY Geography, Agegrp;



/*SELECT CustomerID, CASE
	WHEN Gender = "Female" THEN 1
	WHEN Gender = "Male" THEN 0
END AS female, Gender
FROM case1;



SELECT AVG(CASE
	WHEN Gender = "Female" THEN 1
	WHEN Gender = "Male" THEN 0
END)*100 AS female
FROM case1;*/

('w',geo)

/*ALTER TABLE Germany1
ADD COLUMN CreditScore varchar(30);*/

UPDATE Germany1 a
SET CreditScore = (SELECT CreditScore FROM Germany2 WHERE a.CustomerID = Germany2.CustomerID);

SELECT * FROM Germany1 LIMIT 1;
SELECT * FROM Germany2 LIMIT 1;