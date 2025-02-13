
use world;

-- 1,
-- Import table database

-- 2,
DELIMITER //
create procedure pro_infor( in country_code int)
begin
	select c.id, c.name, c.population from city c;
end;
DELIMITER//

-- 3,
call pro_infor(1);

-- 4,
drop procedure pro_infor;