-- make an index
SET @rowindex := -1;

select lat_n
from
(select @rowindex:=@rowindex + 1 AS rowindex, lat_n 
from station
order by lat_n) as d
where d.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));