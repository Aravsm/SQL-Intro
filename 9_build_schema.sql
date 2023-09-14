Create database Ex_9;
use Ex_9;

select * from exc9;
-- 9.1 give the total number of recordings in this table
SELECT COUNT(*)FROM exc9;


-- 9.2 the number of packages listed in this table?
SELECT COUNT(DISTINCT package)
FROM exc9;


-- 9.3 How many times the package "Rcpp" was downloaded?
select count(*) from exc9 where package =' rcpp';


-- 9.4 How many recordings are from China ("CN")?
select count(*) from exc9 where country = 'cn';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package, count(*) from exc9
group by package order by 2 desc;


-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select a.package, count(*) from (select * from exc9
where substr(time,1,5)< "11:00" and substr(time,1,5) >"09:00") as a
group by a.package order by 2 desc;


 -- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
 SELECT COUNT(*)
FROM exc9
WHERE country = 'CN' 
OR country = 'JP'
OR country = 'SG';

SELECT COUNT(*)
FROM exc9
WHERE country IN ('CN' , 'JP', 'SG');
 
 
-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
SELECT TEMP.country
FROM(SELECT country, COUNT(*) AS downloads
FROM exc9
GROUP BY country) AS TEMP
WHERE TEMP.downloads > (SELECT COUNT(*)
FROM exc9 WHERE country = 'CN');


-- 9.9 Print the average length of the package name of all the UNIQUE packages

SELECT AVG(LENGTH(temp.packages)) 
FROM (SELECT DISTINCT package as packages
FROM exc9) temp;


-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT temp.a package, temp.b count
FROM(SELECT package a, count(*) b
FROM exc9 GROUP BY package
ORDER BY b DESC LIMIT 2) temp
ORDER BY temp.b ASC LIMIT 1;


-- 9.11 Print the name of the package whose download count is bigger than 1000.
SELECT package
FROM exc9
GROUP BY package
HAVING count(*) > 1000;


SELECT temp.package
FROM (SELECT package, COUNT(*) AS count
FROM exc9 GROUP BY package) AS temp
WHERE temp.count > 1000;



-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
    
SELECT SUBSTR(r_os, 1, 5) AS OS, 
COUNT(*) AS (Download Count), 
SUBSTR(COUNT(*)/((SELECT COUNT(*) FROM exc9)*1.0)*100, 1, 4) || "%" AS PROPORTION
FROM table_1
GROUP BY SUBSTR(r_os, 1, 5);
    
    
    