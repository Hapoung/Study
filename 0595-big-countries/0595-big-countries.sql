/* Write your T-SQL query statement below */

select
    name,
    population,
    area
from World
where 1=1
    and (area >= 3000000 or population >= 25000000)
;