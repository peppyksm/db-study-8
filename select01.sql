/*-------------------------------*/
1. 조회하기 SELECT

SELECT 조회대상 (컬럼명) FROM 테이블명;
조회대상 * : 전체컬럼 ALL ex) SELECT * FROM ~~

테이블 구조 확인 (Describe)
DESC 테이블명;

desc emp;
desc emp
desc emp
desc emp

다소문자 구분 x
select * from dept;
SELECT * FROM DEPT;

select * from fruit;  --fruit 테이블의 모든 컬럼 데이터 조회
select name from fruit; --fruit 테이블 의 NAME 컬럼 데이터 조회
select * from loan;
select * from product;

select * from emp;
select job from emp;
select job, hiredate, mgr from emp; --emp 테이블의 다수의 컬럼 데이터 조회

--가독성
select
    job,
    hiredate,
    mgr
from emp;

/*-------------------------------*/
-- 컬럼명 별도 지정 (별칭 지정)
SELECT
    컬럼명 AS "컬럼별칭",
    컬럼명 "컬럼별칭",
    컬럼명 컬럼별칭
FROM 테이블명;

SELECT
    empno AS"사원번호",
    ename "사원명",
    job 직업,
    sal "급여 데이터"  --띄어쓰기 있는 경우 ""로 감싸서
from emp;

--같은 컬럼을 여러번 불러오는것도 가능(별칭 안쓰면 컬럼명 뒤에 _넘버 붙음)
select
    empno,
    empno empnumber,
    empno employeeno 
from emp;

/*-------------------------------*/
--조회데이터 리터럴 값 활용

select '문자', 123 from emp; --emp 테이블의 행이 12개여서 12개만큼


select '문자', 123 from dual; --dual 임시테이블
select * from dual;

select '문자확인' as "문자컬럼별칭",
        123+234-33 숫자연산결과
from dual;

select dname, loc, '문자안녕', 12345 from dept;
select q'[이 안에다가 문자를 '작은"큰 이렇게]' from dual; --'혹은 " 넣을때는 q[문자'"문자]




/*-------------------------------*/
-- 문자 이어 붙이기 ||

select '문자' || '이어붙이기' from dual;
select * from dept;
select deptno, dname from dept;
select deptno || dname from dept;
select
    '부서번호 : ' || deptno AS "부서번호",
    deptno,
    '부서번허 + 500 = ' || (deptno + 500) "부서번호 더하기 500"
from dept;


/*-------------------------------*/
-- DISTINCT 중복제거
select * from emp;
select job from emp;
select DISTINCT job from emp; -- 중복된 항목을 모두 제거
select DISTINCT(job) from emp; -- 위와 같은 뜻

select DISTINCT job, deptno from emp; -- 두 컬럼을 조합했을 때 중복인 값만 제거