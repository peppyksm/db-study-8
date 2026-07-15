서브쿼리

ROWNUM 활용

select
    rownum,
    ceil(rownum / 3 ),
    studno,
    name
from student;


select rownum, studno, name, height
from(
        select
            rownum,
            ceil(rownum / 3 ),
            studno,
            name,
            height
        from student
        order by height);
        
        
select * from student
where rownum <= 5;   --기존 배정된 rownum으로 인식, 정렬 이후 rownum과 다름

--키 큰 사람 5명 조회
select * from student
order by height desc;

select rownum, s.* 
from student s;

select rownum, s.* 
from student s
order by height desc;

select rownum, studno, name, height 
from(
        select * 
        from student s
        order by height desc)
where rownum <= 5;


--팀번호로 팀 조회
select 
    rownum,
    ceil(rownum / 3),
    studno,
    name
from student
where ceil(rownum / 3 ) = 3;  --인식 제대로 안됨

select *
from(select 
    rownum rn,
    ceil(rownum / 3) team,
    studno,
    name
    from student)
where team = 3;



---------------------------------
group by 집계 -> subquery, join

부서별 최대급여
select deptno, max(sal), ename --집계 결과 + 일반 컬럼 값 동시조회 힘듦
from emp 
group by deptno, ename; --집계 기분으로 활용 여부 -> 목적에 맞는 그룹화가 아님


select deptno, max(sal)
from emp 
group by deptno;


select *
from emp a, (select deptno, max(sal) max_sal
                from emp 
                group by deptno) b
where a.deptno = b.deptno;


--부서별 최대 급여 + 부서명
select deptno, max(sal)
from emp 
group by deptno;

select e.deptno, d.dname, e.max_sal
from dept d, (select deptno, max(sal) max_sal
                from emp 
                group by deptno) e
where d.deptno = e.deptno;



select deptno, max(sal), (select dname from dept where deptno = e.deptno)
from emp e
group by deptno;


select deptno, max_sal, (select dname from dept where deptno = e.deptno)
from 
        (select deptno, max(sal) max_sal
        from emp 
        group by deptno) e;
        
        
        
        
select deptno, dname, max(sal)
from(
        select e.deptno, e.sal, d.dname
        from emp e, dept d
        where e.deptno = d.deptno
)
group by deptno, dname;