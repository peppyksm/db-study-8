/*---------------타입변환-----------------*/

TO_CHAR     문자로
TO_DATE     날짜로
TO_NUMBER   숫자로

select 2+2 from dual;
select 2+'2' from dual; --자동형변환(묵시적형변환)
select 2 || '2' from dual;
select 2 + TO_NUMBER('2') from dual; --명시적형변환

select
    TO_CHAR(12341),
    TO_CHAR(123.503),
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'YY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
from dual;


select
    jumin,
    birthday,
    to_char(birthday, 'yy') 년,
    to_char(birthday, 'mm') 월,
    to_char(birthday, 'dd') 일,
    to_char(birthday, 'yyyy-mm-dd')
from student;

select
    sysdate,
    to_char(sysdate, 'yyyy-mm-dd HH24:MI:SS'),
    systimestamp,
    to_char(systimestamp, 'yyyy-mm-dd hh24:mi:ss')
from dual;

select
    to_number('12313'), 
    to_number('123.324')
--  to_number('123asdfa') 문자 포함된 문자열은 변환불가
from dual;    

select
    to_char(1234, '9999'),
    to_char(1234, '0999999'),
    to_char(1234, '$999999'),
    '$' || 1234,
    to_char(1234, '9999.99'),
    to_char(12345678, '999,999,999')
from dual;

select
    '2025-12-02' || 3,
    to_date('2025-12-02') + 3,
    to_date('2025-12-02') + 333,
    to_date('25/12/02') + 333,
    to_date('20251202') + 333,
    LAST_DAY('2024-02-03'),
    LAST_DAY(TO_DATE('2024-02-03')),
    to_date('2025-03-04', 'yyyy-mm-dd'),
    to_date('2025-03-04', 'yy-mm-dd'),
    to_date('2025-03-04', 'yyyy,mm,dd')
from dual;


select
    '2026-03-23',
    substr('2026-03-23', 6, 2),
    TO_CHAR(TO_DATE('2026/02/23'), 'MM')
from dual;



