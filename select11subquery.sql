/********--------------------*/
서브쿼리 (Sub-Query)

SELECT (쿼리: 스칼라 서브쿼리)
FROM   (쿼리: 인라인 뷰)
WHERE  (쿼리: 서브쿼리)
;

SELECT * from emp;

20번 부서 사람들만 조회
SELECT * from emp
where deptno = 20
;

사번이 7844인 사원과 같은 부서 사람들 조회

SELECT * from emp
where deptno = 30;  --직접 데이터 확인 -> 부서번호 하드코딩


SELECT * from emp
where deptno = (SELECT deptno from emp    
                where empno = 7844);

SELECT deptno from emp       --7844사번을 가진 사원의 부서번호
where empno = 7844;



-----------
select * from emp2;
select * from dept2;

포항 사무실에서 일하는 직원 목록 조회

select * from dept2
where area = 'Pohang Main Office';


-- JOIN 
select *
from emp2 e, dept2 d
where e.deptno = d.dcode
and d.area = 'Pohang Main Office';

-- 서브쿼리 
select *
from emp2 
where deptno IN (select dcode       
                from dept2
                where area = 'Pohang Main Office');

IN ('0001', '1003', '1006', '1007')


0001번팀을 제외하고 포항 사무실에서 일하는 직원 목록 조회;

select *
from emp2 
where deptno IN (select dcode       
                from dept2
                where area = 'Pohang Main Office'
                AND dcode <> '0001');
                
select *
from emp2 
where deptno IN (select dcode       
                from dept2
                where area = 'Pohang Main Office')
AND deptno <> '0001';


-------------
select *
from emp2 
where deptno IN (select dcode       
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);

select *
from emp2 
where EXISTS (select dcode       
                  from dept2
                  where area = 'Pohang Main Office'
                  and dcode = deptno);

select *
from emp2 e2
where EXISTS (select dcode       
                  from dept2
                  where area = 'Pohang Main Office'
                  and dcode = e2.deptno);
                  
            select dcode       
              from dept2
              where area = 'Pohang Main Office'
              and dcode = '1002';

--------------------------------------
학생 student

> 학번 9513 학생보다 키 작은 학생들 조회

select * 
from student
where height < (select height
                from student
                where studno = 9513);

select height
from student
where studno = 9513;

> 2학년 학생들 기준 제일 많은 몸무게보다  (2학년 학생중 제일 무거운 학생의 몸무게) 보다 
  전체학생들 중에서 더 많은 몸무게 나가는 학생 목록 조회

select *
from student
where weight > (select MAX(weight)
                from student
                where grade = 2)
;

select MAX(weight)
from student
where grade = 2;
 
---- 각 학년별로 가장 큰 몸무게
select *
from student
where weight <ANY (select MAX(weight)
                    from student
                    group by grade )
;
    ANY ALL
    
    < ANY 83       (81  82  83  58)
    < ALL 58           
    > ANY 58
    > ALL 83
 

>> 단일행 비교   =   IN 
>> 다중행 비교   IN, NOT IN, >ANY ALL
>> 다중컬럼 비교  (컬럼수를 맞춰서 비교)

---- 각 학년별로 가장 큰 몸무게

--  학년, 몸무게
select *
from student
where weight IN (   --몸무게만 비교하면, 학년별 최대 몸무게 학생 추출에 문제 발생 가능성 있음
                select MAX(weight)  
                from student
                group by grade);

select *
from student
where (grade, weight) IN (select grade, MAX(weight)  
                            from student
                            group by grade);
                            

--emp2 기준   전체 평균급여보다 많이 받는 직원 조회

select *
from emp2
where pay > (select AVG(pay)
            from emp2);

------------------------------------

-- 어떤 특정 사람의 포지션에 평균 급여
select AVG(pay)
from emp2 
where position = (
                --select position
                select position
                from emp2
                --where name = 'AL Pacino';
                where empno = 19960101);

--emp2 기준   각자, 자신과 같은 직급(position)의 평균 급여보다 많이 받는 직원 조회

select name, pay, position
from emp2;

select *
from emp2 A
where pay > ( --평균
            select AVG(pay)
            from emp2 B
            where B.position = A.position
            --where position = 현재비교하는대상position
            );

select AVG(pay)
            from emp2 B
            where B.position = 'Section head';


----emp2 기준   자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원목록 조회.

select *
from emp2 A
where pay < ( --emptype 같은 평균급여
            select AVG(pay)
            from emp2 B
            where B.emp_type = A.emp_type);




/******************************************/
select * from emp2;
select * from dept2;

사원이름 부서번호 부서이름

--JOIN
select e.name, e.deptno, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;

--SUBQUERY 
select 
    e.name,
    e.deptno,
    (select dname
       from dept2
      where dcode = e.deptno) dname
from emp2 e; 

select dname
from dept2
where dcode = '1007';


select * from panmae;
select * from product;

--JOIN
select
    A.p_date,
    A.p_code,
    B.p_name
from panmae A, product B
where A.P_code = B.p_code;

--Subquery
select  
    a.P_date,
    a.p_code,
    (select p_name
        from product
        where p_code = a.p_code) 상품명
from panmae A;

select p_name
from product
where p_code = 102;




/******************************************/

select job, mgr, sal, comm, deptno
from emp;


select empno, ename, job --sal from 절에 속해있는 select 결과를 테이블(뷰)로 간주
from (
    select empno, ename, job
    --select *
    from emp )
;    

--select empno, ename, job
select enum, emp_name, jjb
from (
    select   --컬럼 별칭을 설정하면 외부에서 조회시 기본 컬럼명으로 인식
        empno enum,
        ename emp_name,
        job jjb
    from emp )
;    


select *
from (
    select e.empno, e.name, e.deptno, d.dname
    from emp2 e, dept2 d
    where e.deptno = d.dcode);



----emp2 기준   자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원목록 조회.

--select AVG(PAY) --함수로 인식되서 컬럼선택 불가
--select emp_type, avg_pay
select *
from 
   emp2 A,   (
                select emp_type, TRUNC(AVG(pay)) avg_pay
                from emp2
                group by emp_type
                ) B
where A.emp_type = B.emp_type
AND A.pay < B.avg_pay;






