select * from professor;

--CASE 에서 반환되는 값의 형식은 다 같아야함


-- 1번 case
select
    profno,
    name,
    pay,
    bonus,
    CASE
        WHEN BONUS is null THEN to_char((pay*12), '9,999')
        ELSE to_char((pay*12 + bonus), '9,999')
    END TOTAL
from professor
where deptno = 201;

-- 1번 decode
select
    profno,
    name,
    pay,
    bonus,
    DECODE(bonus, null, (pay*12), (pay*12+bonus)) TOTAL
from professor
where deptno = 201;


-- 1번 nvl
select
    profno,
    name,
    pay,
    bonus,
    (pay * 12 + (nvl(bonus, 0))) total
from professor
where deptno = 201;


-- 1번 nvl2
select
    profno,
    name,
    pay,
    bonus,
    nvl2(bonus, (pay*12+bonus), (pay*12)) TOTAL
from professor
where deptno = 201;



-- 2번 case
select
    empno,
    ename,
    comm,
    CASE
        WHEN comm is NULL THEN 'NULL' 
        ELSE 'Exist'
    END CASE
from emp
where deptno = 30;


-- 2번 decode
select
    empno,
    ename,
    comm,
    DECODE(comm, null, 'NULL', 'Exist') DECODE
from emp
where deptno = 30;


-- 2번 nvl2
select
    empno,
    ename,
    comm,
    NVL2(comm, 'Exist', 'NULL') NVL2
from emp
where deptno = 30;