/*------------------------------*/
단일행 함수

SELECT * FROM dual;
dual : 더미 데이터가 있는 임시 테이블

SELECT INITCAP('abc') from dual;
select ename, INITCAP(ename) from emp;

select name, LOWER(name), UPPER(name)
from student;

select name, LENGTH(name)
from student;

select
    LENGTH('abcd'), LENGTHB('abcd'),
    LENGTH('한글'), LENGTHB('한글') --한글 한글자에 3byte 
from dual;


--이름이 다섯자 이상 이름 가진 사람만 조회
select *
from emp
where LENGTH(ename) >= 5;

select 
    '아침' || '점심',
    CONCAT('아침', '점심')
FROM dual;

select 
    '아침' || '점심' || '저녁',
    CONCAT(  CONCAT('아침', '점심') , '저녁')
FROM dual;


--SUBSTR(대상값|컬럼명, 시작지점(1~), 자릿수)
select
    SUBSTR('abcdefg', 1, 3),
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -4, 2),
    SUBSTR('abcdefg', -3, 3)
from dual;


-- INSTR(대상값|컬럼명, 찾는값)
-- INSTR(대상값|컬럼명, 찾는값, 시작위치)
-- INSTR(대상값|컬럼명, 찾는값, 시작위치, 몇번째값)

select
    '2026-01-02 10:11:33',
    INSTR('2026-01-02 10:11:33', '-'),
    INSTR('2026-01-02 10:11:33', '-', 6),
    INSTR('2026-01-02 10:11:33', ':', 15),
    INSTR('2026-01-02 10:11:33', '-', 1, 2)
from dual;


select
    tel,
    INSTR(tel, ')'),
    INSTR(tel, '-')
from student;


--LPAD RPAD  왼쪽 오른쪽 채우기
select
    LPAD('문자', 10, '-'),
    RPAD('13ab', 8, '*'),
    LPAD(5, 2, 0),
    LPAD(5, 3, 0),
    LPAD(77, 2, 0)
from dual;

select
    '*' || ' abcd ' || '*',
    '*' || LTRIM(' abcd ') || '*',
    '*' || RTRIM(' abcd ') || '*',
    '*' || TRIM(' abcd ') || '*',
    LTRIM('**abcd**', '*'),
    RTRIM('**abcd**', '*')
from dual;

--REPLACE(기준값, 찾는대상, 바꿀값)
select 
    REPLACE('abcde', 'c', '/')
from dual;

select 
    birthday,
    replace(birthday, '/', '$')
from student;


/*-------------------------------*/
숫자

SELECT
    ROUND(1.123),  --반올림
    ROUND(1.789),
    ROUND(1.789, 1),     --소수점 1번째 자리수까지
    ROUND(1.789613, 3),
    ROUND(1.789613, 0),
    ROUND(3561.4564, -1),
    TRUNC(1.12244),   --버림
    TRUNC(1.167844, 2),
    MOD(15, 4),  --나머지연산 15%4 
    CEIL(123.123),  --인접한 큰 정수
    FLOOR(123.123),  --인접한 작은 정수
    POWER(6, 3)  -- 6의 3제곱  6*6*6
FROM dual;


--그룹화 CEIL 함수 활용
select
    rownum,    --조회결과에대해서 행번호
    CEIL(rownum/3) 그룹번호,  
    CEIL(rownum/4) 팀번호,
    empno,
    ename
from emp;

--    1/3 = 0.33   2/3 = 0.66    3/3 = 1
--            1           1            1
--    4/3 = 1.33   5/3 = 1.66    6/3 = 2   -----> 2

--   1/4 2/4 3/4 4/4 --> 1
--   5/4 6/4 7/4 8/4 --> 2



/*-------------------------------*/
--날짜

select
    SYSDATE, --현재 날짜
    SYSTIMESTAMP, --현재 날짜시간
    MONTHS_BETWEEN('2024-01-05', '2024-03-05'),
    MONTHS_BETWEEN('2024-11-05', '2024-04-20')
    -- 앞날짜 - 뒷날짜 -> 월단위 환산
from dual;

select 
    ADD_MONTHS(SYSDATE, 3),
    ADD_MONTHS(SYSDATE, 6),
    ADD_MONTHS(SYSDATE, -4),
    LAST_DAY(SYSDATE),  --해당 날짜(월)기준 마지막 일자    28 29 30 31
    NEXT_DAY(SYSDATE, '토'),
    NEXT_DAY(SYSDATE, '화')
from dual;

select
    sysdate,
    ROUND(SYSDATE),
    TRUNC(SYSDATE),
    TRUNC(SYSDATE, 'YY'),  --Year Month Day|Date
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'DD'),
    ADD_MONTHS(SYSDATE, 1),   --월단위 계산 +1월
    SYSDATE + 3,       --일단위 계산 +3일
    SYSDATE + 7,
    --다음달 첫날
    LAST_DAY(SYSDATE)+1,
    TRUNC( ADD_MONTHS(SYSDATE, 1), 'MM'),
    --전월의 마지막
    LAST_DAY(ADD_MONTHS(SYSDATE, -1)),
    TRUNC(SYSDATE, 'MM')-1
from dual;





