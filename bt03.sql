-- 1,
USE `world`;

-- 2,
DELIMITER //
create procedure pro_Language( in proLanguage char(30))
begin
select CountryCode, Language, Percentage from countryLanguage where language = proLanguage and percentage > 50;
end //
DELIMITER //

-- 3,
call pro_Language('English');

-- 4,
drop procedure pro_language;