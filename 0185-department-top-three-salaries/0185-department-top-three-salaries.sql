/* Write your T-SQL query statement below */

select
    d.Department,
    d.Employee,
    d.Salary
from (
    select
        c.*,
        dense_rank() over(partition by departmentId order by salary desc) as rn
    from (
        select
            a.id,
            a.name as Employee,
            a.salary as Salary,
            a.departmentId,
            b.name as Department
        from Employee a 
        left join Department b
        on a.departmentId = b.id
    ) c 
) d
where 1=1
    and d.rn <= 3
