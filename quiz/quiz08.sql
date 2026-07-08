

select * from emp;

-- 1번
select
    empno,
    ename,
    to_char(to_number((sal * 12)+comm), '$99,999') as salary
from emp
where ename = 'ALLEN';


-- 2번
select
    empno,
    ename,
    to_char(to_date(hiredate), 'YYYY-MM-DD') as HIREDATE,
    to_char(((sal * 12)+comm), '$99,999') as SAL,
    to_char((((sal * 12)+comm)*1.15), '$99,999') as "15%인상"
from emp
where comm is not null;