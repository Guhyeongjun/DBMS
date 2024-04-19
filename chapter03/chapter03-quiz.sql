select *
from customer;
select *
from orders;
select *
from book;
-- (1) 도서번호가 1인 도서의 이름
select bookname
from book
where bookid = 1;
-- (2) 가격이 20,000원 이상인 도서의 이름
select bookname,price
from book
where price >= 20000;
-- (3) 박지성의 총구매액
select sum(saleprice) as "박지성의 총구매액"
from orders
where custid = 1;
-- (4) 박지성의 구매한 도서의 수
select count(*) as "박지성의 구매한 도서의 수"
from orders
where custid = 1;
-- (5) 박지성이 구매한 도서의 출판사 수
select count(distinct publisher) as "박지성이 구매한 도서의 출판사 수"
from book
where bookid <= 3;
-- (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname as "도서의 이름",
    price as 가격,
    1000 as "정가와 판매가격의 차이"
from book
where bookid <= 3;

-- (1) 마당서점 도서의 총수
select count(*) as "도서의 총수"
from book;
-- (2) 마당서점에 도서를 출고하는 출판사의 총수
select count(distinct publisher) as "출판사의 총수"
from book;
-- (3) 모든 고객의 이름, 주소
select name as 이름,
    address as 주소
from customer;
-- (4) 2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서의 주문번호
select orderid as "도서의 주문번호",
    orderdate as "주문 날짜"
from orders
where orderid >= 4 and orderid <= 7;
-- (5) 2020년 7월 4일 ~ 7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select orderid as "도서의 주문번호",
    orderdate as "주문 날짜"
from orders
where orderid < 4 or orderid > 7;
-- (6) 성이 '김'씨인 고객의 이름과 주소
select name as 이름,
    address as 주소
from customer
where name like '김%';
-- (6) 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name as 이름,
    address as 주소
from customer
where name like '김_아%' 
    














