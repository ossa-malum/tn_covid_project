#Data cleaning

SELECT * 
FROM tn_covid_vax2;

#remove duplicates

SELECT DISTINCT COUNTY
FROM tn_covid_vax2 
ORDER BY 1;

#standardize data--change date to right format

SELECT `DATE`,
str_to_date(`DATE`, '%m/%d/%Y')
FROM tn_covid_vax2;

UPDATE tn_covid_vax2
SET `DATE` = str_to_date(`DATE`, '%m/%d/%Y');

ALTER TABLE tn_covid_vax2
MODIFY COLUMN `DATE` DATE;

#change blank data to null

UPDATE tn_covid_vax2
SET VACCINE_COUNT = NULL
WHERE VACCINE_COUNT = '';

UPDATE tn_covid_vax2
SET RECIPIENT_COUNT = NULL
WHERE RECIPIENT_COUNT = '';

UPDATE tn_covid_vax2
SET NEW_RECIPIENT_COUNT = NULL
WHERE NEW_RECIPIENT_COUNT = '';

UPDATE tn_covid_vax2
SET RECIP_FULLY_VACC = NULL
WHERE RECIP_FULLY_VACC = '';

UPDATE tn_covid_vax2
SET NEW_RECIP_FULLY_VACC = NULL
WHERE NEW_RECIP_FULLY_VACC = '';

#remove unnecessary columns

ALTER TABLE tn_covid_vax2
DROP COLUMN RECIP_ADDL_DOSE;

ALTER TABLE tn_covid_vax2
DROP COLUMN NEW_RECIP_ADDL_DOSE;