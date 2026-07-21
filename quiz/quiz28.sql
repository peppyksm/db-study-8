--1. 아래 조건에 테이블 생성
CREATE TABLE T_ITEM_LIST
(
    no NUMBER(6) PRIMARY KEY,
    item_name VARCHAR2(24) not null,
    price NUMBER(6),
    create_date DATE DEFAULT sysdate
);


2. 다음 조건에 맞는 시퀀스를 생성하시오.
CREATE SEQUENCE T_ITEM_LIST_PK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE;


3. 생성한 시퀀스의 값을 불러서 사용하는 방법을 작성하시오.
T_ITEM_LIST 테이블에 값을 넣을때 no값에 T_ITEM_LIST_PK_SEQ.nextval 값을 넣음

4. 해당 시퀀스를 활용하여, 테이블에 INSERT 처리 하는 쿼리문을 작성하시오.
INSERT INTO T_ITEM_LIST(no, item_name, price)
values (T_ITEM_LIST_PK_SEQ.nextval, '김승민', 111111);

INSERT INTO T_ITEM_LIST(no, item_name, price)
values (T_ITEM_LIST_PK_SEQ.nextval, '김명현', 222222);

select * from T_ITEM_LIST;