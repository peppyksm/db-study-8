select * from professor;
select * from department;

select
    deptno dept, min(hiredate) min_hire
from professor
group by deptno;



--1번
select
    profno, name
from professor, (select
                    deptno dept, min(hiredate) min_hire
                    from professor
                    group by deptno)
where deptno = dept and hiredate = min_hire
order by hiredate;




--2번
select
    name, position, max_pay pay
from emp2, (select 
            position pos,
            max(pay) max_pay
            from emp2
group by position)
where pay = max_pay and position = pos
order by pay;