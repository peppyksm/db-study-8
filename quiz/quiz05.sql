

-- 1번
select
    studno as 번호,
    name as 이름,
    id as 아이디
from student
where height between 160 and 175
union all
select 
    profno as 번호,
    name as 이름,
    id as 아이디
from professor
where deptno in (101,102,103,201) and bonus is null;




-- 2번


select
    '이름:'||name as 이름, 
    '아이디:'||id as 아이디,
    '주민번호:'||substr(jumin, 1, 6) || '-' || substr(jumin, 7) as 주민번호
from student;