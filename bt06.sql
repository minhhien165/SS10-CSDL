-- 1,
USE world;

-- 2,
DELIMITER //
CREATE PROCEDURE GetCountriesWithLargeCities()
BEGIN
    SELECT co.Name AS CountryName, SUM(ci.Population) AS TotalPopulation
    FROM country co
    JOIN city ci ON co.Code = ci.CountryCode
    WHERE co.Continent = 'Asia'
    GROUP BY co.Code, co.Name
    HAVING TotalPopulation > 10000000
    ORDER BY TotalPopulation DESC;
END //
DELIMITER ;

-- 3,
CALL GetCountriesWithLargeCities();

-- 4,
DROP PROCEDURE GetCountriesWithLargeCities;