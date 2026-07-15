DDL
테이블 조작


테이블 생성

create table 테이블명
(
    컬럼명 컬럼타입 기타속성/제약, 
    컬럼명 컬럼타입 기타속성/제약, 
    컬럼명 컬럼타입 기타속성/제약, 
    컬럼명 컬럼타입 기타속성/제약, 
);  --숫자 문자 날짜


create table new_table1   --테이블 스키마(schema)
(
    no NUMBER(3),           --숫자형 3자리수
    name VARCHAR2(16),      --문자형 16바이트
    birth DATE              --날짜형
);

select * from new_table1;


create table new_table2   --테이블 스키마(schema)
(
    no NUMBER(3),           --숫자형 3자리수
    name VARCHAR2(16),      --문자형 16바이트
    birth DATE              --날짜형
);

select * from new_table2;


select * from tab; --전체 테이블 조회
select * from tab where tname like '%NEW%';  --테이블 중 NEW라는 키워드가 포함된 테이블 찾기


--------------------------------------
테이블 복사

select * from dept2;



--dept2 테이블 구조 + 데이터 -> 복사 -> dept3 새로운 테이블 생성
select * from dept3;

create table dept3
AS
select * from dept2;


--dept2 테이블 구조 일부 + 데이터 -> 복사 dept4 새로운 테이블 생성

create table dept4
AS
select dcode, dname from dept2;

select * from dept4;


--dept2 테이블 구조만 복사 (데이터 제외) -> 복사 -> dept5 생성

create table dept5
AS
select * from dept2
where 1=2;  --데이터 조회 안되도록 거짓 조건 추가

select * from dept5;



--------------------------------
테이블 변경(수정)
select * from dept4;
>loc 컬럼 추가

alter table dept4
add (loc varchar2(32) );

>lv 컬럼 추가 기본값 1
alter table dept4
add (lv number(3) default 1);

>컬럼 삭제
alter table dept4
drop column lv;

--테이블 자체를 삭제
drop table 테이블명;

--테이블 내부 데이터 포맷(초기화)
truncate table 테이블명;

DDL : rollback 불가, 자동 commit 발생


select * from dept4;

truncate table dept4;
drop table dept4;
