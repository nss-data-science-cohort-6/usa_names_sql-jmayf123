-- -- Question 1: How many rows are in the names table?
-- SELECT COUNT(*)
-- FROM names;
-- -- There are 1957046 rows in the names table.

-- -- Question 2: How many total registered people appear in the dataset?
-- SELECT SUM(num_registered)
-- FROM names;
-- -- There are a total of 351653025 registered people in the dataset. 

-- -- Question 3: Which name had the most appearances in a single year in the dataset?
-- SELECT *
-- FROM names
-- ORDER BY num_registered DESC
-- LIMIT 1;
-- -- The name "Linda" had the most appearances in 1 year, 99689. 

-- -- Question 4: What range of years are included?
-- SELECT MIN(year), 
-- 		MAX(year)
-- FROM names;
-- -- The range of years is from 1880 to 2018.

-- -- Question 5: What year has the largest number of registrations?
-- SELECT year
-- FROM names
-- ORDER BY num_registered DESC
-- LIMIT 1;
-- -- 1947 was the year with the largest number of registrations.

-- -- Question 6: How many different (distinct) names are contained in the dataset?
-- SELECT COUNT(DISTINCT(name))
-- FROM names;
-- -- There are 98400 distinct names in the dataset.

-- -- Question 7: Are there more males or more females registered?
-- SELECT  gender, 
-- 		SUM(num_registered) AS total_registered
-- FROM names
-- GROUP BY gender;

-- -- Question 8: What are the most popular male and female names overall (i.e., the most total registrations)?
-- SELECT 	gender, 
-- 		name,
-- 		MAX(num_registered) AS max_registered
-- FROM names
-- GROUP BY gender, name
-- ORDER BY max_registered DESC;
-- -- The most popular male name was James, female name Linda. 

-- -- Question 9: What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
-- SELECT gender, 
-- 		name,
-- 		MAX(num_registered) AS max_registered,
-- 		year
-- FROM names
-- WHERE year BETWEEN 2000 AND 2009
-- GROUP BY gender, 
-- 		name, 
-- 		year
-- ORDER BY max_registered DESC;
-- -- The most popular boy and girl names of the first decade of the 2000's were Jacob and Emily, repectively.

-- -- Question 10: Which year had the most variety in names (i.e. had the most distinct names)?
-- SELECT year,
-- 		COUNT(DISTINCT(name)) AS num_unique_names
-- FROM names 
-- GROUP BY year
-- ORDER BY num_unique_names DESC
-- LIMIT 1;
-- -- The year with the most number of distinct names was 2008, with 32518 unique names. 

-- -- Question 11: What is the most popular name for a girl that starts with the letter X?
-- SELECT name, 
-- 		gender,
-- 		SUM(num_registered) AS total_num_registered
-- FROM names
-- WHERE name LIKE 'X%' AND gender = 'F'
-- GROUP BY name, gender
-- ORDER BY total_num_registered DESC
-- LIMIT 1;
-- -- The most popular girl name that starts with an "X" is Ximena, with 26145 total registered. 

-- -- Question 12: How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
-- SELECT COUNT(DISTINCT(name))
-- FROM names 
-- WHERE name LIKE 'Q%' AND 
-- 		name NOT LIKE '_u%'
-- -- There are only 46 distinct names that start with a 'Q', but whose second letter is not 'u'.

-- -- Question 13: Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
-- SELECT name, 
-- 		SUM(num_registered) AS total_registered
-- FROM names 
-- WHERE name LIKE 'Stephen' OR
-- 		name LIKE 'Steven'
-- GROUP BY name
-- -- Steven is the preffered spelling to Stephen, with 1286951 registrations to 860972 registrations, repectively. 

-- Question 14: What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

WITH 
unisex_names AS (	SELECT COUNT(*)
					FROM (SELECT COUNT(name)
							FROM names
							GROUP BY name
							HAVING COUNT(DISTINCT gender) = 2
						 ) AS foo
	  			), 
		
all_names AS (	SELECT COUNT(DISTINCT(name))
	   			FROM names
	  		 ) 
	  
SELECT (CAST(unisex_names.count AS FLOAT) / CAST(all_names.count AS FLOAT)) * 100 AS percentage_unisex
FROM unisex_names, all_names

























