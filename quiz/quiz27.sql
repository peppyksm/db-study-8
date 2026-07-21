select * from product_quiz;

1)개별적으로 따로 숫자 계산 후 합치기

select 0 price_group, count(*) products
from product_quiz
where price between 0 and 9999
union all
select 10000, count(*)
from product_quiz
where price between 10000 and 19999
union all
select 20000, count(*)
from product_quiz
where price between 20000 and 29999
union all
select 30000, count(*)
from product_quiz
where price between 30000 and 39999;



2) 가격대 별로 나눠서 그룹지어 갯수세기


2-1) case when 범위 지정
select
    case
        when price between 0 and 9999 then 0
        when price between 10000 and 19999 then 10000
        when price between 20000 and 29999 then 20000
        when price between 30000 and 39999 then 30000
    end price_group,
    count(*) products
from product_quiz
group by
    case
        when price between 0 and 9999 then 0
        when price between 10000 and 19999 then 10000
        when price between 20000 and 29999 then 20000
        when price between 30000 and 39999 then 30000
    end
order by price_group;


2-2) 가격대별로 정리 + 서브쿼리

select price, count(*)
from (
select
    case
        when price between 0 and 9999 then 0
        when price between 10000 and 19999 then 10000
        when price between 20000 and 29999 then 20000
        when price between 30000 and 39999 then 30000
    end price
from product_quiz)
group by price
order by price;



2-3) 가격대를 뽑을때 만원대 숫자 활용

select
    price,
    price/10000,
    trunc(price/10000),
    trunc(price/10000) * 10000,
    trunc(price, -4)
from product_quiz;




select 
    trunc(price, -4) price_group,
    count(*) products
from product_quiz
group by trunc(price, -4)
order by 1;



select price_group, count(*) products
from (
select
    trunc(price, -4) price_group
from product_quiz)
group by price_group
order by 1;