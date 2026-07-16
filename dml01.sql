DML 테이블 내부의 데이터 조작

데이터(행) 컬럼 값들..
저장 INSERT
수정 UPDATE
삭제 DELETE
병합 MERGE


--INSERT 저장
INSERT into 테이블명 (컬럼명, 컬럼명, ...)
VALUES (데이터값, 데이터값, 데이터값, ...)

--전체 컬럼에 데이터 저장 + 컬럼 순서 맞춰서 저장 --> 컬럼명 생략 가능
INSERT into 테이블명
VALUES (데이터값, 데이터값, 데이터값, ...);

select * 
from new_table1;

INSERT into new_table1 (no, name, birth)
values(1, '이름1', sysdate);

commit;     --위 체크 버튼
rollback;   --위 돌리기 버튼

INSERT into new_table1 (name, no, birth) --컬럼명의 순서를 바꾸면 값 순서도 그대로  
values('이름2', 2, sysdate);

INSERT into new_table1 (name, no, birth)
values('이름2', 2, TO_DATE('2020-01-30'));

INSERT into new_table1
values(1, '이름4', sysdate);

INSERT into new_table1(no, name)
values(5, '이름5');

INSERT into new_table1
values(6, '이름6', null);

insert all
into new_table1 values(7, '이름7', null)
into new_table1 values(8, '이름8', sysdate)
into new_table1 values(9, '이름9', to_char('2025-12-11'))
select * from dual;


---------------------------------------
다른 테이블 데이터 조회 -> 복사, 저장

select * from new_table1;
select * from new_table2;

insert into new_table2
select no, name, birth from new_table1
where no < 5;

insert into new_table2
select 10, '이름10', sysdate from dual;

----------------------------------------

수정 UPDATE

UPDATE 테이블명 
SET 컬럼명 = 값,
    컬럼명 = 값,
    컬럼명 = 값
WHERE 조건;

select * 
from dept3;

Seoul Branch Office - > Incheon Branch Office

update dept3
SET area = 'Incheon Branch Office'; -- where 조건 지정 안하면 전체 AREA 데이터값이 바껴버림

update dept3
SET area = 'Incheon Branch Office'
where area = 'Seoul Branch Office'; -- 조건을 지정해서 바꿔야 대상이 잡힘


Sales1 Team => Sales First Team

select * from dept3
where dcode = 1008;

update dept3
set dname = 'Sales First Team'
where dcode = 1008;



--테이블 복사
create table professor2
as
select * from professor;

select * from professor2;


bonus 받는 교수들 보너스금액 +100 인상 저장

update professor2
set bonus = 200
where profno = 1001;

UPDATE professor2
SET bonus = bonus + 100
where bonus is not null;

----------------------------------
Transaction
TCL

commit;     확정
rollback;   취소(되돌리기)

DML (insert, update, delete)    -> commit or rollback 수행

select * from new_table2;

insert into new_table2 values(11, '이름11', sysdate);



-----------------------------------
DELETE 데이터 삭제
(DB Toll 에서 delete 쿼리 수행시 rollback 가능, 단, 자동 commit 설정이 아닌 상태일 경우)

DELETE FROM 테이블명 
WHERE 조건;


select * from dept3;

DELETE FROM dept3
where dcode = '0001';  --where 조건 지정 안하면 전체 데이터 삭제됨

