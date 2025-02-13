-- 1,
USE world;

-- 2,
CREATE VIEW CountryLanguageView AS
SELECT c.Code AS CountryCode, c.Name AS CountryName, cl.Language, cl.IsOfficial
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T';

-- 3,
SELECT * FROM CountryLanguageView;

-- 4,
DELIMITER //
CREATE PROCEDURE GetLargeCitiesWithEnglish()
BEGIN
    SELECT city.Name AS CityName, country.Name AS CountryName, city.Population
    FROM city
    JOIN country ON city.CountryCode = country.Code
    JOIN countrylanguage cl ON country.Code = cl.CountryCode
    WHERE city.Population > 1000000 AND cl.Language = 'English' AND cl.IsOfficial = 'T'
    ORDER BY city.Population DESC
    LIMIT 20;
END //
DELIMITER ;

-- 5,
CALL GetLargeCitiesWithEnglish();

-- 6,
DROP PROCEDURE GetLargeCitiesWithEnglish;