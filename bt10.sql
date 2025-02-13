-- 1,
USE world;

-- 2,
CREATE VIEW OfficialLanguageView AS
SELECT 
    country.Code AS CountryCode,
    country.Name AS CountryName,
    countrylanguage.Language
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';

-- 3,
SELECT * FROM OfficialLanguageView;

-- 4,
CREATE INDEX idx_city_name ON city(Name);

-- 5,
DELIMITER //
CREATE PROCEDURE GetSpecialCountriesAndCities(IN language_name VARCHAR(30))
BEGIN
    SELECT country.Name AS CountryName, city.Name AS CityName, city.Population AS CityPopulation, SUM(city.Population) AS TotalPopulation
    FROM city
    JOIN country ON city.CountryCode = country.Code
    JOIN countrylanguage cl ON country.Code = cl.CountryCode
    WHERE cl.Language = language_name AND city.Name LIKE 'New%'
    GROUP BY country.Name, city.Name
    HAVING TotalPopulation > 5000000
    ORDER BY TotalPopulation DESC
    LIMIT 10;
END //
DELIMITER ;

-- 6,
CALL GetSpecialCountriesAndCities('English');
