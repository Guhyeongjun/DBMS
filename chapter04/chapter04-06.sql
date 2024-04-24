-- DML
-- 각 테이블에 데이터를 삽입하는 insert문들을 하나씩 보이시오
-- 상영관에 데이터 삽입
insert into cinema values(1,11,'범죄의도시',15000,7);
-- 고객 테이블에 데이터 삽입
insert into movie_customer
values(22,'김고객','마포');
-- 예약 테이블에 데이터 삽입
insert into reservation values(1,10,22,7,'2024-4-24');
-- 극장 테이블에 데이터 삽입
insert into theater values(33,'롯데시네마','서면본점');

-- 2. 영화의 가격을 10% 인상하시오.
update cinema set movieprice = movieprice * 1.1;

