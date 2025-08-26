--- Exploratory Data Analysis
--- Our aim is to explore the data and find trends or patterns or anything interesting like outliers

--- Showing our full dataset
select* 
from layoffs;

--- checking for the total layoffs
SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs;

---Looking at Percentage to see how big these layoffs were
SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs
WHERE  percentage_laid_off IS NOT NULL;

---Which companies had 1 which is basically 100 percent of they company laid off
SELECT *
FROM world_layoffs.layoffs
WHERE  percentage_laid_off = 1;

---Let us  order by funds_raised_millions we can see how big some of these companies were
SELECT *
FROM world_layoffs.layoffs
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

---Companies with single biggest layoffs on a single day
SELECT company, total_laid_off
FROM world_layoffs.layoffs
ORDER BY 2 DESC
LIMIT 5;

--- Companies with the most Total Layoffs
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;


--- by location
SELECT location, SUM(total_laid_off)
FROM world_layoffs.layoffs
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;

--- countries and the total layoffs
SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs
GROUP BY country
ORDER BY 2 DESC;

---Industry and total layoffs
SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs
GROUP BY industry
ORDER BY 2 DESC;

--- The company stage with the most layoff
SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs
GROUP BY stage
ORDER BY 2 DESC;

select *
from layoffs;

--- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,5) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs
GROUP BY date
ORDER BY date ASC;



