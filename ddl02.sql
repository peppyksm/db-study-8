DDL 테이블 제약조건

> DEFAULT : 저장되는 값이 없을때 저장될 기본값;

CREATE TABLE new_table3
(
    no NUMBER(3) DEFAULT 0,             --숫자형 3자리수
    name VARCHAR(16) DEFAULT 'NONAME', --문자형 16바이트
    birth DATE DEFAULT SYSDATE          --날짜형
);

INSERT INTO new_table3
VALUES(1, 'name1', TO_DATE('2020-01-01'));

select * from new_table3;

INSERT INTO NEW_TABLE3
VALUES(2, null, TO_DATE('2020-01-02'));

INSERT INTO NEW_TABLE3 (no, birth)
VALUES(2, TO_DATE('2020-01-02'));

INSERT INTO NEW_TABLE3(name, birth)
VALUES('name4', TO_DATE('2020-01-04'));

INSERT INTO NEW_TABLE3(no, name)
VALUES(5, 'name5');


---------------------------------------------
UNIQUE : 중복되지 않는 유일한 값
NOT NULL : null 값 저장 불가 (Nullable No)

무결성 ( DB 가장 기본 내용 : 중복X + NOT NULL) : 데이터 올바르게, 일관되게, 유지
    > 정확성 : 실제 값 올바르게 저장
            키 저장 172.4 -> 1724          X
            생일 1995-10-30 -> 1995-20-30  X
    > 일관성 : 같은 의미 데이터는 일관된 값 (데이터가 동일)  
            식당 포스기 : 15,000원
            키오스크 주문내역 : 13,000원
    > 완전성 : 필요 데이터가 존재 
            회원가입시 전화번호 인증 필수 : 전화번호=null 
            배달주문 메뉴내역O 주문자정보X : 필수인 주문자 정보가 없다
    > 신뢰성 : 데이터에 대한 믿음 신뢰
            계좌 잔액 10만원  -> 잔액 조회시 계산 오류로 8만원 표시     X
            신발 구매 재고확인 1개 -> 창고에 가지러 갔더니 0개          X
            
CHECK : 저장 가능한 범위 설정

----------------------------------
CREATE TABLE T1
(
    no number(3) UNIQUE,
    name varchar2(16) NOT NULL,
    birth date
);

select * from t1;

INSERT INTO t1
VALUES (1,'name1', SYSDATE);



INSERT INTO t1
VALUES (2,null, SYSDATE); --NOT NULL 제약 name 컬럼에 null 저장 -> 실패

INSERT INTO t1
VALUES (2,'name2', SYSDATE);



INSERT INTO t1
VALUES (2,'name3', SYSDATE); --UNIQUE 제약 no 컬럼에 중복된값 저장 -> 실패

INSERT INTO t1
VALUES (3,'name3', SYSDATE);



INSERT INTO t1 (no, birth)      --생략한 name 컬럼에는 null 값이 저장될 예정
VALUES (4, SYSDATE);            --name은 not null 제약, 실패


INSERT INTO t1(name, birth)     --생략한 no 컬럼에 null 값이 저장
VALUES ('name4', SYSDATE);      --no는 unique만, not null 제약이 없으므로 성공

INSERT INTO t1(name, birth)     
VALUES ('name5', SYSDATE);


------------------------------------

CREATE TABLE T2
(
    no NUMBER(3) CONSTRAINT T2_NO_UNIQUE UNIQUE,  --CONSTRAINT 제약이름 제약속성
    name VARCHAR2(16) CONSTRAINT T2_NAME_NOTNULL NOT NULL,
    birth DATE,
    score NUMBER(3) CONSTRAINT T2_SCORE_CHECK CHECK (score BETWEEN 0 AND 100), --저장 값 범위 지정
    pass VARCHAR2(2) CONSTRAINT T2_PASS_CHECK CHECK (pass IN ('Y','N'))
);

OracleDB 데이터타입
숫자/문자/날짜
NUMBER/VARCHAR2/DATE

NUMBER(자리수)
NUMBER(3) : 3자리수
NUMBER(6) : 6자리수

NUMBER(전체자리수, 소수점자리수)
NUMBER(6,3) : 전체자리수 6자리, 소수점 3자리
                123.456 O   10.551 O    1234.56 X <- NUMBER(7,3)
                
NUMBER 만 표기 : 38자리수

VARCHAR2(바이트수)
VARCHAR2(6) 6바이트 O  6자리 글자 X    한글 한글자 3byte  -> 한글기준 2글자

DATE / TIMESTAMP



23 이전 버전은 BOOLEAN 타입 없어서 Y/N, TRUE/FALSE, T/F, 1,0 등으로 구분

23 이후버전은 BOOLEAN 제공

-------------------------------------------

INSERT INTO T2
VALUES(1, 'name1', SYSDATE, 60, 'Y');

select * from t2;



INSERT INTO T2
VALUES(1, 'name1', SYSDATE, 60, 'Y');   --no 중복 제약 위배 -> 실패

INSERT INTO T2
VALUES(2, null, SYSDATE, 60, 'Y');      --name not null 위배 -> 실패

INSERT INTO T2
VALUES(2, 'name2', SYSDATE, 160, 'Y');  --score check 범위 위배 -> 실패



INSERT INTO T2
VALUES(2, 'name2', SYSDATE, 70, 'Y');       --위배 사항 x -> 성공



INSERT INTO T2
VALUES(3, 'name3', SYSDATE, 80, 'Y');       --pass check 범위 y n 위배 -> 실패

INSERT INTO T2
VALUES(3, 'name3', SYSDATE, 30, 'Y');