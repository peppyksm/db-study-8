select * from temp_dept2;

--1번
insert into temp_dept2
values(9010, 'temp_10', 1006, 'temp area');

--2번
insert into temp_dept2(dcode, dname, pdept)
values(9020, 'temp_20', 1006);



--3번
CREATE TABLE new_professor
AS
select profno, name, pay, bonus
from professor
where profno <= 3000;


select * from new_professor;


--4번
UPDATE new_professor
set bonus = 100
where name = 'Winona Ryder';