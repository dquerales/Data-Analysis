/*
	Covid 2019 data exploration (2020-2021) (Last update data: 30/12/2021)
*/

-- use schema
USE covid;

-- Summary 1: Total cases, Total deaths & DeathPercentage
SELECT 
    MAX(total_cases) AS TotalCases,  MAX(total_deaths) AS TotalDeaths, (MAX(total_deaths)/MAX(total_cases)*100) AS DeathPercentage
FROM
    clean_owid_covid;

-- Summary 2: World Population, People Fully Vaccinated & VaccinationPercentage
SELECT 
    MAX(population) AS WorldPopulation ,  MAX(people_fully_vaccinated) AS PeopleFullyVaccinated, MAX(people_fully_vaccinated)/MAX(population)*100 AS VaccinationPercentage
FROM
    clean_owid_covid;

-- All New Cases by Date
SELECT 
    date, MAX(new_cases) AS NewCases
FROM
    clean_owid_covid
GROUP BY date
ORDER BY date;

-- Top 5 Country with Most Deaths
SELECT 
    location,
    MAX(total_deaths) AS TotalDeaths
FROM
    clean_owid_covid
WHERE
    continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeaths DESC
LIMIT 5;

-- People Fully Vaccinated by Country
SELECT 
    location,
    MAX(people_fully_vaccinated) AS PeopleFullyVaccinated,
    MAX(people_fully_vaccinated)/MAX(population)*100 AS PercentagePeopleFullyVaccinated
FROM
    clean_owid_covid
WHERE
    continent IS NOT NULL
GROUP BY location
ORDER BY PeopleFullyVaccinated DESC;