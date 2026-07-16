
DDL 제약조건 KEY
PK(Primary Key) 기본키 (테이블에 한개만 설정 가능)
FK(Foreign Key) 외래키

CREATE TABLE T3
(
    no number(3) PRIMARY KEY,  --기본키 설정, (not null, unique 포함)
    name varchar2(16),
    birth date
);

select * from T3;

insert into t3 values(1, 'n1', sysdate);
insert into t3 values(1, 'n1', sysdate);    --no컬럼 pk 중복 -> 실패
insert into t3 values(null, 'n1', sysdate); --no컬럼 pk notnull -> 실패




CREATE TABLE T4
(
    no number(3) PRIMARY KEY,           --기본키 설정
    id varchar2(32) PRIMARY KEY,        --기본키 설정
    name varchar2(16) not null,         --테이블은 하나의 pk만 가질수 있으므로 실패
    birth date, default sysdate
);

CREATE TABLE T4
(
    no number(3),
    id varchar2(32),
    name varchar2(16) not null,
    birth date, default sysdate,
    CONSTRAINT T4_PK PRIMARY KEY id (no, id) -- no id 두개 컬럼을 조합으로 PK 설정
);



--------------------------------------------------
