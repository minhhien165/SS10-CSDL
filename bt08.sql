-- 1,
USE world;

-- 2 ,
DELIMITER //
CREATE PROCEDURE GetCountriesByCityNames()
BEGIN
    SELECT co.Name AS CountryName, cl.Language AS OfficialLanguage, SUM(ci.Population) AS TotalPopulation
    FROM country co
    JOIN countrylanguage cl ON co.Code = cl.CountryCode
    JOIN city ci ON co.Code = ci.CountryCode
    WHERE ci.Name LIKE 'A%' AND cl.IsOfficial = 'T'
    GROUP BY co.Code, co.Name, cl.Language
    HAVING TotalPopulation > 2000000
    ORDER BY CountryName ASC; 
END //
DELIMITER ;

-- 3,
CALL GetCountriesByCityNames();

-- 4,
DROP PROCEDURE GetCountriesByCityNames;

