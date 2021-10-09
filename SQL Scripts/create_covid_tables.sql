/*Creating table for joined vaccine*/
DROP TABLE IF EXISTS province_vaccine_joined;
CREATE TABLE province_vaccine_joined AS
WITH
ab AS (
    SELECT
        date,
        province,
        vaccine_administered
    FROM covid_vaccine
    WHERE
        province = "Alberta"),

bc AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = "BC"),

nb AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'New Brunswick'),

mb AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Manitoba'),      
        
nl AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'NL'),
        
ns AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Nova Scotia'),
        
        
nu AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Nunavut'),
        
nwt AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'NWT'),
        
ont AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Ontario'),
        
pei AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'PEI'),
        
qc AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Quebec'),
        
sa AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Saskatchewan'),
        
yu AS (
    SELECT
        date,
        province,
        vaccine_administered 
    FROM covid_vaccine
    WHERE
        province = 'Yukon')
        
SELECT
    ab.date,
    ab.vaccine_administered AS AB,
    bc.vaccine_administered AS BC,
    mb.vaccine_administered AS MB,
    nb.vaccine_administered AS NB,
    nl.vaccine_administered AS NL,
    ns.vaccine_administered AS NS,
    nu.vaccine_administered AS NU,
    nwt.vaccine_administered AS NWT,
    ont.vaccine_administered AS ONT,
    pei.vaccine_administered AS PEI,
    qc.vaccine_administered AS QC,
    sa.vaccine_administered AS SA,
    yu.vaccine_administered AS YU
    
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
    
ALTER TABLE province_vaccine_joined
MODIFY date DATE; 


/*Creating table for joined vaccine_dis*/
DROP TABLE IF EXISTS province_vaccine_dis_joined;
CREATE TABLE province_vaccine_dis_joined AS
WITH
ab AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed
    FROM covid_vaccine_dis
    WHERE
        province = "Alberta"),

bc AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = "BC"),

nb AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'New Brunswick'),

mb AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Manitoba'),      
        
nl AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'NL'),
        
ns AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Nova Scotia'),
        
nu AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Nunavut'),
        
nwt AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'NWT'),
        
ont AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Ontario'),
        
pei AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'PEI'),
        
qc AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Quebec'),
        
sa AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Saskatchewan'),
        
yu AS (
    SELECT
        date,
        province,
        cumulative_vaccine_distributed 
    FROM covid_vaccine_dis
    WHERE
        province = 'Yukon')       
        
SELECT
    ab.date,
    ab.cumulative_vaccine_distributed AS AB,
    bc.cumulative_vaccine_distributed AS BC,
    mb.cumulative_vaccine_distributed AS MB,
    nb.cumulative_vaccine_distributed AS NB,
    nl.cumulative_vaccine_distributed AS NL,
    ns.cumulative_vaccine_distributed AS NS,
    nu.cumulative_vaccine_distributed AS NU,
    nwt.cumulative_vaccine_distributed AS NWT,
    ont.cumulative_vaccine_distributed AS ONT,
    pei.cumulative_vaccine_distributed AS PEI,
    qc.cumulative_vaccine_distributed AS QC,
    sa.cumulative_vaccine_distributed AS SA,
    yu.cumulative_vaccine_distributed AS YU
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
    ON ab.date = yu.date
ORDER BY date DESC;
   
ALTER TABLE province_vaccine_dis_joined;
   
   
/*Creating table for joined test*/
DROP TABLE IF EXISTS province_test_joined;
CREATE TABLE province_test_joined AS
WITH
ab AS (
    SELECT
        date,
        province,
        cumulative_testing
    FROM covid_test
    WHERE
        province = "Alberta"),

bc AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = "BC"),

nb AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'New Brunswick'),

mb AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Manitoba'),      
        
nl AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'NL'),
        
ns AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Nova Scotia'),
        
        
nu AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Nunavut'),
        
nwt AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'NWT'),
        
ont AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Ontario'),
        
pei AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'PEI'),
        
qc AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Quebec'),
        
re AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Repatriated'),
        
sa AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Saskatchewan'),
        
yu AS (
    SELECT
        date,
        province,
        cumulative_testing 
    FROM covid_test
    WHERE
        province = 'Yukon')       
        
SELECT
    ab.date,
    ab.cumulative_testing AS AB,
    bc.cumulative_testing AS BC,
    mb.cumulative_testing AS MB,
    nb.cumulative_testing AS NB,
    nl.cumulative_testing AS NL,
    ns.cumulative_testing AS NS,
    nu.cumulative_testing AS NU,
    nwt.cumulative_testing AS NWT,
    ont.cumulative_testing AS ONT,
    pei.cumulative_testing AS PEI,
    qc.cumulative_testing AS QC,
    re.cumulative_testing AS RE,
    sa.cumulative_testing AS SA,
    yu.cumulative_testing AS YU
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
JOIN re
    ON ab.date = re.date
JOIN sa
    ON ab.date = sa.date
JOIN yu
    ON ab.date = yu.date;

ALTER TABLE province_test_joined;
   
   
/*Creating table for joined cases*/
DROP TABLE IF EXISTS province_cases_joined;
CREATE TABLE province_cases_joined AS
WITH
ab AS (
    SELECT
        date,
        province,
        cumulative_case
    FROM covid_cases
    WHERE
        province = "Alberta"),

bc AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = "BC"),

nb AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'New Brunswick'),

mb AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Manitoba'),      
        
nl AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'NL'),
        
ns AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Nova Scotia'),
        
        
nu AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Nunavut'),
        
nwt AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'NWT'),
        
ont AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Ontario'),
        
pei AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'PEI'),
        
qc AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Quebec'),
        
re AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Repatriated'),
        
sa AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Saskatchewan'),
        
yu AS (
    SELECT
        date,
        province,
        cumulative_case 
    FROM covid_cases
    WHERE
        province = 'Yukon')       
        
SELECT
    ab.date,
    ab.cumulative_case AS AB,
    bc.cumulative_case AS BC,
    mb.cumulative_case AS MB,
    nb.cumulative_case AS NB,
    nl.cumulative_case AS NL,
    ns.cumulative_case AS NS,
    nu.cumulative_case AS NU,
    nwt.cumulative_case AS NWT,
    ont.cumulative_case AS ONT,
    pei.cumulative_case AS PEI,
    qc.cumulative_case AS QC,
    re.cumulative_case AS RE,
    sa.cumulative_case AS SA,
    yu.cumulative_case AS YU
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
JOIN re
    ON ab.date = re.date
JOIN sa
    ON ab.date = sa.date
JOIN yu
    ON ab.date = yu.date;
    
ALTER TABLE province_cases_joined
MODIFY date DATE 

