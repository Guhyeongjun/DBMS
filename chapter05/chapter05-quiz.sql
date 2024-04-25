-- (1)
select * from mybook;
-- (2)
select bookid,nvl(price,0) from mybook; --  null 값을 0으로 대체
-- (3)
select * from mybook where price is null;
-- (4) 
select * from mybook where price = bookid * price ;
-- (5)
select bookid, price + 100 from mybook;
-- (6)
select sum(price), avg(price), count(*)
from mybook
where bookid >= 4;