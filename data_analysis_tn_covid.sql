#data analysis

SELECT *
FROM tn_covid_vax;

#grouping by county and month, SHELBY had highest vaccine count, may had highest vaccine count

SELECT month(`DATE`), COUNTY, SUM(VACCINE_COUNT), SUM(RECIPIENT_COUNT)
FROM tn_covid_vax
GROUP BY COUNTY, month(`DATE`)
ORDER BY SUM(VACCINE_COUNT) DESC;

SELECT  COUNTY, SUM(VACCINE_COUNT), SUM(RECIPIENT_COUNT)
FROM tn_covid_vax
GROUP BY COUNTY
ORDER BY SUM(VACCINE_COUNT) DESC;

SELECT COUNTY, SUM(VACCINE_COUNT), SUM(RECIPIENT_COUNT)
FROM tn_covid_vax
GROUP BY COUNTY
ORDER BY COUNTY ASC;

SELECT month(`DATE`), SUM(VACCINE_COUNT), SUM(RECIPIENT_COUNT)
FROM tn_covid_vax
GROUP BY month(`DATE`)
ORDER BY SUM(VACCINE_COUNT) DESC;


#ranking by month

WITH Ranking_Month (COUNTY, `DATE`, VACCINE_COUNT) AS
(SELECT COUNTY, MONTH(`DATE`), SUM(VACCINE_COUNT)
FROM tn_covid_vax
GROUP BY COUNTY, MONTH(`DATE`))
SELECT * ,
 DENSE_RANK() OVER (partition by `DATE` ORDER BY VACCINE_COUNT DESC) AS ranking
FROM Ranking_Month
ORDER BY ranking ASC;

WITH Ranking_Month (COUNTY, `DATE`, VACCINE_COUNT) AS
(SELECT COUNTY, MONTH(`DATE`), SUM(VACCINE_COUNT)
FROM tn_covid_vax
GROUP BY COUNTY, MONTH(`DATE`))
SELECT * ,
 DENSE_RANK() OVER (partition by `DATE` ORDER BY VACCINE_COUNT DESC) AS ranking
FROM Ranking_Month
ORDER BY ranking ASC;

#rolling total of total vaccine count for all counties

WITH Rolling_Total AS 
(SELECT Substring(`date`, 1,7) AS `Month`, SUM(VACCINE_COUNT) AS total_vax
FROM tn_covid_vax
GROUP BY `Month`
ORDER BY 1 ASC)
SELECT `Month`, total_vax, SUM(total_vax) OVER(ORDER BY `Month`) AS rolling_total
FROM Rolling_Total;

#narrowing to greater chatt area

SELECT *
FROM tn_covid_vax
WHERE county = 'HAMILTON' OR 
county = 'MARION' OR 
county ='SEQUATCHIE'
ORDER BY county;

#narrowing to greater nash area

SELECT *
FROM tn_covid_vax
WHERE county = 'DAVIDSON' OR
county = 'CHEATHAM' OR 
county ='SUMNER' OR
county ='WILLIAMSON' OR
county ='DICKSON' OR
county ='RUTHERFORD' OR
county ='WILSON' OR
county ='ROBERTSON' OR
county ='MAURY' OR
county ='TROUSDALE' OR
county ='CANNON' OR
county ='SMITH' OR
county ='MACON'
ORDER BY county ASC;

#greater memphis area
SELECT *
FROM tn_covid_vax
WHERE county = 'SHELBY' or
county = 'MARSHALL' OR
county = 'TUNICA' OR
county = 'CRITTENDEN' OR 
county = 'DESOTO' OR
county = 'TATE' OR
county = 'FAYETTE' OR
county = 'TIPTON'
ORDER BY county asc;




