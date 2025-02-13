use world;

-- 1,
-- Sử dụng lại database

-- 2,
DELIMITER //
create procedure CalculatePopulation(in p_countryCode char(3), out total_population int)
begin
	select sum(c.Population) into total_population from city c where c.CountryCode = p_countryCode;
end//
DELIMITER //

-- 3,
set @total_population = 0;
call CalculatePopulation('NLD',@total_population);
select @total_population;

-- 4,
drop procedure CalculatePopulation;