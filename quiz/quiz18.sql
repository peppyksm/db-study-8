--1번
select
    s.name,
    s.deptno1,
    d.dname
from student s, department d
where deptno1 in(select deptno1
                from student
                where name = 'Anthony Hopkins')
and s.deptno1 = d.deptno
order by s.name;



--2번
select 
    p.name,
    p.hiredate,
    d.dname
from professor p, department d
where p.hiredate > (select hiredate
                from professor
                where name = 'Meg Ryan')
and p.deptno = d.deptno
order by hiredate;



--3번
select
    name,
    weight
from student
where weight > (select avg(weight) from student
                where deptno1 = 201);
                
              
              
                
--4번
select
    empno,
    name,
    deptno
from emp2
where deptno in(select dcode from dept2
                where area = 'Pohang Main Office');