/* Write your T-SQL query statement below */

select
    d.id,
    d.visit_date,
    d.people
from (
    select
        c.id,
        c.visit_date,
        c.people,
        c.con_group,
        sum(1) over(partition by con_group) as con_count
    from (
        select
            b.id,
            b.visit_date,
            b.people,
            b.id - b.rn as con_group
        from (
            select
                a.id,
                a.visit_date,
                a.people,
                row_number() over(order by a.id asc) as rn
            from (
                select
                    id,
                    visit_date,
                    people
                from Stadium
                where 1=1
                    and people >= 100
            ) a
        ) b
    ) c
    group by 
        c.id,
        c.visit_date,
        c.people,
        c.con_group
) d
where 1=1
    and d.con_count >= 3
