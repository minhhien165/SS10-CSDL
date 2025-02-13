-- 1,
USE world;

-- 2,
DELIMITER //
CREATE PROCEDURE GetEnglishSpeakingCountriesWithCities(IN language CHAR(30))
BEGIN
    SELECT co.Name AS CountryName,SUM(ci.Population) AS TotalPopulation
    FROM country co
    JOIN countrylanguage cl ON co.Code = cl.CountryCode
    JOIN city ci ON co.Code = ci.CountryCode
    WHERE cl.Language = language AND cl.IsOfficial = 'T'
    GROUP BY co.Code, co.Name
    HAVING TotalPopulation > 5000000
    ORDER BY TotalPopulation DESC
    LIMIT 10;
END //
DELIMITER ;

-- 3,
CALL GetEnglishSpeakingCountriesWithCities('English');

-- 4,
DROP PROCEDURE GetEnglishSpeakingCountriesWithCities;