
-- 1번
select
    name as 이름,
    substr(birthday, 1, 2) as 년도,
    substr(birthday, 4, 2) as 월, 
    substr(birthday, 7, 2) as 일
from student;

-- 2번
select
    name,
    tel,
    instr(tel, ')') as 괄호위치
from student
where deptno1 = 201;

-- 3번
select 
    name,
    tel,
    instr(tel, ('3')) as 첫3위치
from student
where deptno1 = 101;

-- 4번
select
    name,
    tel,
    substr(tel, 1, instr(tel, ')' ) -1) as 지역번호
from student
where deptno1 = 201;






-- substr(문자열 자르기) --substr(쿼리명, 자를 위치, 얼마나 자를지)
-- instr(특정 문자열 위치 찾기), instr(쿼리명, '찾을 문자열')
-- order by(정렬), order by 쿼리명 acs(오름차순) desc(내림차순)
-- where 쿼리명 = 조건; 조건에 맞는 항목만 출력)