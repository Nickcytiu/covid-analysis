DROP TABLE IF EXISTS stocks_VIX_updated;
CREATE TABLE stocks_VIX_updated AS
SELECT 
	`DATE`,
	`OPEN`
FROM 
	stocks_VIX sv 
WHERE
	`DATE` >= "2020-01-01"
ORDER BY
	`DATE` DESC;

DROP TABLE IF EXISTS vix_cases_joined;
CREATE TABLE vix_cases_joined AS
WITH X AS(
SELECT
	DATE,
	OPEN
FROM
	stocks_VIX sv),

Y AS(
SELECT
	*
FROM province_cases_joined pcj)

SELECT
	X.OPEN,
	Y.*
FROM X
JOIN Y	
ON
	X.DATE = Y.date;
