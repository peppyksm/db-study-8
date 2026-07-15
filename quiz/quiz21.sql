--1번
select
    d.dname,
    mh,
    s.name,
    s.height
from department d, student s, (select
                                    deptno1 dn1, max(height) mh
                                from student
                                group by deptno1)
where deptno = s.deptno1 and s.deptno1 = dn1 and s.height = mh;



--2번
select
    grade,
    name,
    height,
    ah
from student, (select
                    grade g, avg(height) ah
                from student
                group by grade)
where height > ah and grade = g
order by grade;
