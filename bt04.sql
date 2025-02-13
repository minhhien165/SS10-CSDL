-- 1,
USE world;
-- database world

-- 2,
DELIMITER //
CREATE PROCEDURE UpdateCityPopulation(INOUT city_id INT, IN new_population INT)
BEGIN
    UPDATE city 
    SET Population = new_population 
    WHERE ID = city_id;
    SELECT ID AS CityID, Name, Population
    FROM city 
    WHERE ID = city_id;
END //
DELIMITER ;

-- 3,
SET @city_id = 99;
CALL UpdateCityPopulation(@city_id, 8500000);

-- 4,
DROP PROCEDURE IF EXISTS UpdateCityPopulation;

