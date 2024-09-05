/* Write your T-SQL query statement below */

select distinct
    product_id
from Products
where 1=1
    and low_fats = 'Y'
    and recyclable = 'Y'
;

