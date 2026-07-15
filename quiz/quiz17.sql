select * from panmae;

select * from product;

select * from gift;


select
    to_char(to_date(pm.p_date),'yyyy-mm-dd') 판매일자,
    pm.p_code 상품코드,
    pd.p_name 상품명,
    to_char(pd.p_price, '9,999') 상품가,
    pm.p_qty 구매수량,
    to_char(pd.p_price * pm.p_qty , '9,999') 총금액,
    to_char(pd.p_price * pm.p_qty * 100, '999,999') 적립포인트,
    
    case
        when pm.p_date = '20110101' then to_char(pd.p_price * pm.p_qty * 200, '999,999')
        else to_char(pd.p_price * pm.p_qty * 100, '999,999')
    end 새해2배적립포인트,
    gf.gname 사은품명,
    to_char(gf.g_start, '999,999') 포인트START,
    to_char(gf.g_end, '999,999') 포인트END
    
from panmae pm inner join product pd
on pm.p_code = pd.p_code
inner join gift gf
on 
case
    when pm.p_date = '20110101' then to_char(pd.p_price * pm.p_qty * 200)
    else to_char(pd.p_price * pm.p_qty * 100)
end between gf.g_start and gf.g_end
order by pm.p_date, pd.p_name;