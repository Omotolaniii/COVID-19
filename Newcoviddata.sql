SELECT * 
FROM NewCovidData;

--Global numbers
SELECT SUM(CAST(new_cases AS FLOAT)) AS total_cases, SUM(CAST(new_deaths AS FLOAT)) AS total_deaths, 
SUM(CAST(new_deaths AS FLOAT))/SUM(CAST(new_cases AS FLOAT)) * 100 AS death_percentage
FROM NewCovidData
WHERE continent is not null;


--Total cases and deaths by location
SELECT TOP 10 location, SUM(CAST(new_cases AS FLOAT)) AS Total_cases, SUM(CAST(new_deaths AS FLOAT)) AS Total_deaths
FROM NewCovidData
WHERE continent is not null
GROUP BY location
ORDER BY Total_cases DESC;

---Trend of new_cases_per million
SELECT date, SUM(CAST(new_cases_per_million AS FLOAT)) AS Total_new_cases
FROM NewCovidData
GROUP BY date
ORDER BY date DESC;

--Percentagepopulationinfected BY LOCATION
SELECT location, population, date, Max(total_cases) AS highestInfectioncount,
Max((cast(total_cases as float))/(cast(population as float)))*100 AS PercentagePopulationInfected
FROM NewCovidData
--where continent is not null
GROUP BY location, population, date
ORDER BY PercentagePopulationInfected desc;




