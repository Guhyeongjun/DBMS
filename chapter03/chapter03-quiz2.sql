select *
from orders;

select * 
from book;

select *
from customer;

-- (3) 박지성의 총구매액
select sum(saleprice)
from orders,customer
where orders.custid = 1 and customer.custid = 1;

-- (4) 박지성이 구매한 도서의 수
select count(*)
from orders
where orders.custid = 1;

-- (5) 박지성이 구매한 도서의 출판사 수
select count(distinct publisher)
from orders,book
where orders.custid = 1 and orders.bookid = book.bookid;

-- (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname, price, book.price - orders.saleprice
from book, orders
where orders.custid = 1 and book.bookid = orders.bookid;

-- (7) 박지성이 구매하지 않은 도서의 이름
select bookname
from orders, book
where orders.custid != 1 and orders.bookid = book.bookid;

-- (10) 고객의 이름과 고객별 구매액
select name,sum(saleprice)
from customer,orders
where customer.custid = orders.custid
group by customer.name
order by customer.name;

-- (11) 고객의 이름과 고객이 구매한 도서 목록
select name, bookname
from customer,orders, book
where customer.custid = orders.custid and orders.bookid = book.bookid
order by customer.name;

-- (12) 도서의 가격과 판매가격의 차이가 가장 많은 주문 
select *
from book b, orders o
where b.bookid = o.bookid
and price - saleprice = (
    select max(price-saleprice)
    from book b, orders o
    where b.bookid = o.bookid
    );
    
-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
--select name, avg(saleprice)
--from customer c, orders o
--where c.custid = o.custid
--group by name
--having by(saleprice) > (
--    select avg(saleprice)
--    from orders
--    );

-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select name
from customer c, orders o, book b
where c.custid = o.custid
and o.bookid = b.bookid
and name not like '박지성'
and publisher in ( -- 박지성이 구매한 도서의 출판사
    select b.publisher
    from customer c, orders o, book b
    where c.custid = o.custid
    and o.bookid = b.bookid
    and name like '박지성'
    )
    ;
    
-- 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name,count(b.publisher)
from customer c, orders o, book b
where c.custid = o.custid
and b.bookid = o.bookid
group by name
having count(distinct b.publisher) >= 2;

-- 전체 고객의 30% 이상이 구매한 도서


























