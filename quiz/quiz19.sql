--1번
select 
    e.name, e.position, e.pay
from emp2 e
where pay > (select min(pay) from emp2 where position = 'Section head')
order by position;


--2번
select
    name,
    grade,
    weight
from student
where weight < (select min(weight)
                    from student
                    where grade = 2);
                    
--3번

select * 
from emp2;


select * 
from dept2;

--부서별 평균 연봉
select deptno, avg(pay) avg_pay
from emp2
group by deptno;




--여기서 제일 작은 연봉

-- 정렬 후 rownum으로 찾기
select avg_pay
from (
select deptno, avg(pay) avg_pay
from emp2
group by deptno
order by avg_pay)
where rownum = 1;

-- min 함수로 찾기
select min(avg_pay)
from (
select deptno, avg(pay) avg_pay
from emp2
group by deptno);


select d.dname, e.name, e.pay
from emp2 e, dept2 d
where pay < (select min(avg_pay)
from (
        select deptno, avg(pay) avg_pay
        from emp2
        group by deptno)
)
and e.deptno = d.dcode;