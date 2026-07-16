select a.empno, a.name, a.deptno, a.dname, a.area, a.pay
from (select 
*
from emp2 e, dept2 d
where e.deptno = d.dcode) a, 
(select avg(a.pay) seoul_avg
from    (select 
            *
        from emp2 e, dept2 d
        where e.deptno = d.dcode) a,
        (select 
            *
        from emp2 e, dept2 d
        where e.name = 'AL Pacino' and e.deptno = d.dcode) b
        where a.area = b.area) b
where a.pay > b.seoul_avg;
