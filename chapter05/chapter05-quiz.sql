-- (1)
select * from mybook;
-- (2)
select bookid,nvl(price,0) from mybook; --  null ���� 0���� ��ü
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