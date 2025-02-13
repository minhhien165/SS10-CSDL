USE world;
-- 2,
DELIMITER $$
CREATE PROCEDURE pro_infor(IN country_code VARCHAR(3))  
BEGIN  
    SELECT c.ID, c.Name, c.Population  
    FROM city c  
    WHERE c.CountryCode = country_code;  
END $$  
DELIMITER ; 

-- 3,
CALL pro_infor('USA');

-- 4,
drop procedure pro_infor;
