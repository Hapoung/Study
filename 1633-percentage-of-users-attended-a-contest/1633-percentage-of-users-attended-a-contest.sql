/* Write your T-SQL query statement below */


select
    d.contest_id,
    d.[percentage]
from (
    select
        c.contest_id,
        round(count(distinct c.user_id)*100.0 / (select count(distinct user_id) from users), 2) as [percentage]
    from (
        select 
            a.user_id,
            b.contest_id
        from (
            select
                user_id,
                user_name
            from users
        ) as a
        left join (
            select
                contest_id,
                user_id
            from register
        ) as b
        on a.user_id = b.user_id
    ) as c
    group by c.contest_id
) d
where 1=1
    and d.contest_id is not null
order by d.[percentage] desc, d.contest_id asc
