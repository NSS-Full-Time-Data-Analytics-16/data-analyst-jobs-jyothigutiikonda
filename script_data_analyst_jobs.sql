SELECT * 
FROM data_analyst_jobs;

--1.How many rows are in the data_analyst_jobs table?-- 1793



SELECT DISTINCT count(*)
FROM data_analyst_jobs;

--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?-- EXXONMOBILE

SELECT *
FROM data_analyst_jobs
LIMIT 10;

--3.How many postings are in Tennessee? ---21 postings

SELECT COUNT(title) as no_of_postings_tn
FROM data_analyst_jobs
WHERE location ='TN';


--How many are there in either Tennessee or Kentucky?--27

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE location LIKE 'TN' OR location LIKE 'KY';

---4.How many postings in Tennessee have a star rating above 4? --3 postings having star rating above 4

SELECT COUNT(title) as no_of_postings_tn
FROM data_analyst_jobs
WHERE location ='TN'
AND star_rating >4;


--5.How many postings in the dataset have a review count between 500 and 1000? ---151

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;


--	6.Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`.
-- Which state shows the highest average rating? NE 4.20

SELECT location As state,ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC
LIMIT 1;



---7.Select unique job titles from the data_analyst_jobs table. How many are there? --881

SELECT COUNT (DISTINCT title) As unique_job_titles
FROM data_analyst_jobs;

---8.How many unique job titles are there for California companies?--230

SELECT COUNT (DISTINCT title) 
FROM data_analyst_jobs
WHERE location ='CA'

--9.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations
--How many companies are there with more that 5000 reviews across all locations?--41 companies
SELECT company,ROUND(AVG(star_rating),2) as avg_rating
FROM data_analyst_jobs
WHERE review_count>5000
GROUP BY company;



--10.Add the code to order the query in #9 from highest to lowest average star rating. 
---Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? --microsoft- 4.20
SELECT company,ROUND(AVG(star_rating),2) as avg_rating
FROM data_analyst_jobs
WHERE review_count>5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC
LIMIT 1;


---11.Find all the job titles that contain the word ‘Analyst’.?-- 1669
-- How many different job titles are there? 
SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'

-- How many different job titles are there? --774
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'

--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?











