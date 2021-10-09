DROP TABLE IF EXISTS province_7day_avg;
CREATE TABLE province_7day_avg AS
WITH 
x AS (
	SELECT 
		*,
	    avg(active_cases) 
	OVER(PARTITION BY 
		province
	ORDER BY date
	ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
	AS 7day_moving_avg
	FROM covid_cases cc),

ab AS(
	SELECT
		date,
		active_cases,
		7day_moving_avg
	FROM x
	WHERE province = "Alberta"),

bc AS(
	SELECT
		date,
		active_cases,
		7day_moving_avg
	FROM x
	WHERE province = "BC"),


nb AS (
    SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'New Brunswick'),

mb AS (
    SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Manitoba'),      
        
nl AS (
    SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'NL'),
        
ns AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Nova Scotia'),
        
        
nu AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Nunavut'),
        
nwt AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'NWT'),
        
ont AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Ontario'),
        
pei AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'PEI'),
        
qc AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Quebec'),
        
sa AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Saskatchewan'),
        
yu AS (
   	SELECT
    	date,
		active_cases,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Yukon')
        
SELECT
    ab.date,
    ab.7day_moving_avg AS AB,
    bc.7day_moving_avg AS BC,
    mb.7day_moving_avg AS MB,
    nb.7day_moving_avg AS NB,
    nl.7day_moving_avg AS NL,
    ns.7day_moving_avg AS NS,
    nu.7day_moving_avg AS NU,
    nwt.7day_moving_avg AS NWT,
    ont.7day_moving_avg AS ONT,
    pei.7day_moving_avg AS PEI,
    qc.7day_moving_avg AS QC,
    sa.7day_moving_avg AS SA,
    yu.7day_moving_avg AS YU
FROM ab

JOIN bc
    ON ab.date = bc.date
JOIN mb
    ON ab.date = mb.date
JOIN nb
    ON ab.date = nb.date
JOIN nl
    ON ab.date = nl.date
JOIN ns
    ON ab.date = ns.date
JOIN nu
    ON ab.date = nu.date
JOIN nwt
    ON ab.date = nwt.date
JOIN ont
    ON ab.date = ont.date
JOIN pei
    ON ab.date = pei.date
JOIN qc
    ON ab.date = qc.date
JOIN sa
    ON ab.date = sa.date
JOIN yu
    ON ab.date = yu.date;
ALTER TABLE province_7day_avg
MODIFY date DATE;

DROP TABLE IF EXISTS province_7day_avg_vac;
CREATE TABLE province_7day_avg_vac AS
WITH 
x AS (
	SELECT 
		*,
	    avg(cumulative_vaccine_administered) 
	OVER(PARTITION BY 
		province
	ORDER BY date
	ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
	AS 7day_moving_avg
	FROM covid_vaccine cc),

ab AS(
	SELECT
		date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
	WHERE province = "Alberta"),

bc AS(
	SELECT
		date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
	WHERE province = "BC"),


nb AS (
    SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'New Brunswick'),

mb AS (
    SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Manitoba'),      
        
nl AS (
    SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'NL'),
        
ns AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Nova Scotia'),
        
        
nu AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Nunavut'),
        
nwt AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'NWT'),
        
ont AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Ontario'),
        
pei AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'PEI'),
        
qc AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Quebec'),
        
sa AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Saskatchewan'),
        
yu AS (
   	SELECT
    	date,
		cumulative_vaccine_administered,
		7day_moving_avg
	FROM x
    WHERE
        province = 'Yukon')
        
SELECT
    ab.date,
    ab.7day_moving_avg AS AB,
    bc.7day_moving_avg AS BC,
    mb.7day_moving_avg AS MB,
    nb.7day_moving_avg AS NB,
    nl.7day_moving_avg AS NL,
    ns.7day_moving_avg AS NS,
    nu.7day_moving_avg AS NU,
    nwt.7day_moving_avg AS NWT,
    ont.7day_moving_avg AS ONT,
    pei.7day_moving_avg AS PEI,
    qc.7day_moving_avg AS QC,
    sa.7day_moving_avg AS SA,
    yu.7day_moving_avg AS YU
FROM ab

JOIN bc
    ON ab.date = bc.date
JOIN mb
    ON ab.date = mb.date
JOIN nb
    ON ab.date = nb.date
JOIN nl
    ON ab.date = nl.date
JOIN ns
    ON ab.date = ns.date
JOIN nu
    ON ab.date = nu.date
JOIN nwt
    ON ab.date = nwt.date
JOIN ont
    ON ab.date = ont.date
JOIN pei
    ON ab.date = pei.date
JOIN qc
    ON ab.date = qc.date
JOIN sa
    ON ab.date = sa.date
JOIN yu
    ON ab.date = yu.date;
ALTER TABLE province_7day_avg_vac
MODIFY date DATE