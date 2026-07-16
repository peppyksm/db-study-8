--1번
update temp_professor
set bonus = 200
where position = 'assistant professor';



--2번
update temp_professor
set pay = pay * 1.15
where position = 
(select position from temp_professor
where name = 'Sharon Stone') and
pay < 250;