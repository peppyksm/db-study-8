select * from emp;

-- 1번
select 
    ename,
    substr(ename, 1, 2) || '--' || substr(ename, 5)
from emp
where deptno = 20;


--replace 함수
select 
    ename,
    substr(ename, 3, 2),
    replace(ename, substr(ename, 3, 2), '--') REPLACE,
    substr(ename, 1, 2) || '--' || substr(ename, 5) replace
from emp
where deptno = 20;



--2번
select
    name,
    substr(jumin,1,6) || '-/-/-/-' as 주민뒷자리숨김
from student
where deptno1 = 101;



--3번
select
    name,
    tel,
    substr(tel, 1, 4) || '***' || substr(tel, 8, 5) as REPLACE,
    replace(tel, substr(tel,5,3), '***'),
    instr(tel,')'),
    instr(tel, '-')
from student
where deptno1 = 102;


--option
select
    name,
    tel,
    substr(tel, 1, instr(tel, ')')) || '***' || substr(tel, -5) as REPLACE,
    instr(tel, '-', -1) - instr(tel, ')', -1)  length
from student;

select * from student;




select
    rpad(1,5,0),
    lpad('*', 3, '*'),
    lpad('*', 4, '*')
from dual;



select
    tel,
    instr(tel, '-') - instr(tel, ')') - 1
from student;

select
    tel,
    substr(tel, 1, instr(tel,')')),
    lpad('*', ( instr(tel, '-') - instr(tel, ')') - 1), '*'),
    substr(tel, -5, 5), 
    substr(tel, 1, instr(tel,')')) || lpad('*', ( instr(tel, '-') - instr(tel, ')') - 1), '*') ||  substr(tel, -5, 5)
from student;



--4번
select
    name,
    tel,
    substr(tel, 1, (instr(tel, '-'))) || '****' as REPLACE 
from student
where deptno1 = 101;

