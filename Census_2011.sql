use census;
#1 Checking the Number of Rows In Each Table
SELECT COUNT(*)
FROM census_a;

SELECT COUNT(*)
FROM census_b;

#2 Getting to know the data
SELECT COUNT(DISTINCT state)
FROM census_a;

SELECT COUNT(DISTINCT state)
FROM census_b;

SELECT COUNT(DISTINCT district)
FROM census_a;

SELECT COUNT(DISTINCT district)
FROM census_b;

#3) Exploring the Numbers
SELECT SUM(population) AS sum_of_population,
		ROUND(AVG(area_km2), 1) AS avg_area
FROM census_a;
SELECT ROUND(AVG(growth_rate), 1) AS Avg_growth_rate,
	   ROUND(AVG(sex_ratio), 1) AS avg_sex_ratio,
	   ROUND(AVG(literacy), 1) AS avg_literacy_rate
FROM census_b;

#4) Population Density
SELECT d2.state, d1.population, d1.area_km2,round(d1.population/area_km2,1) as Population_Density
FROM Census_a d1
INNER JOIN 
census_b d2
ON d1.state = d2.state
GROUP BY d2.state;


#5) Growth Rate vs Literacy Rate
SELECT d1.district, d2.growth_rate, d2.literacy
FROM census_a d1
INNER JOIN
census_b d2
ON d1.district = d2.district
ORDER BY d2.growth_rate DESC;

#6) Top 5 States In Population, Literacy Rate, Growth Rate, Sex Ratio
SELECT state, literacy #one column change for other metrics mentioned above
FROM census_b
GROUP BY state
ORDER BY literacy desc; 

#I didnt want to make the code longer

#7) Checking Highest Growth Rate, Literacy Rate, Sex Ratio
SELECT state, max(growth_rate) AS max_growth_rate, max(sex_ratio) max_sex_ratio, max(literacy) max_literacy
FROM census_b

#8) Top 5 States With Lowest Literacy Rate
SELECT d2.state, d2.literacy as Lowest_Literacy_Rate
FROM census_a d1
INNER JOIN census_b d2
ON d1.state = d2.state
GROUP BY d1.state
ORDER BY d2.literacy
LIMIT 5;

#9) Subquery On Two Table Not Having Same No. of State Rows
SELECT d1.state, d1.population, d1.area_km2
FROM census_a d1
WHERE d1.state IN (select d2.state
FROM census_b d2
ORDER BY d1.population desc);

#10) Creating Table For Top States with Literacy Rate
CREATE TABLE top_states (State VARCHAR(255), High_literacy_Rate INT);

INSERT INTO top_states
SELECT state, literacy
FROM census_b
GROUP BY state
ORDER BY Literacy DESC
LIMIT 20;

#11) Converting State Names to Uppercase In New Table
SELECT upper(state) as STATES
FROM top_states;

#12) Creating View For Districts
CREATE OR REPLACE VIEW District_Info AS
SELECT d1.district, d1.area_km2, d1.population,d2.sex_ratio,d2.literacy
FROM census_a d1
INNER JOIN census_b d2
ON d1.district = d2.district
ORDER BY d1.population DESC;



