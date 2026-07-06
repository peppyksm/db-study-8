

--1번
SELECT name || q'['s ID : ]' || id || ', WEIGHT is ' || weight || 'kg' 
    AS "ID AND WEIGHT" 
FROM student;


--2번
SELECT ename || '(' || job|| ')' || ' , ' || ename || q'[']' || job || q'[']'
    as "NAME AND JOB"
FROM emp;

--3번
SELECT ename || q'['s sal is $]' || sal
    as "Name and Sal"
FROM emp;