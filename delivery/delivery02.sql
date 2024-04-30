-- SQL문(배달어플 관련 데이터베이스)

-- (1) Delivery에 있는 customer,menu,orders,payment,shop 테이블의 값을 읽으시오.
select * from customer;
select * from menu;
select * from orders;
select * from payment;
select * from shop;

-- (2) 어플에 가입한 고객을 확인하기 위해 모든 고객의 이름과 이메일을 조회하기
select name,email from customer;

-- (3) 고객들이 상점에서 구매할 메뉴의 정보를 알기 위해 모든 메뉴의 이름과 가격을 조회하기
select name,price from menu;

-- (4) 최소주문 금액이 15000원이상이라 가정하였을 때 메뉴 1개만 시켜도 주문을 시킬수 있는
--     메뉴들만 메뉴의 번호,이름,가격을 조회하기
select menu_id,name,price
from menu
where price >= 15000;

-- (5) 어플 관리를 편하게 하기 위해 상점의 이름을 오름차순으로 나타내시오
select menu_id,name
from menu
order by name asc;

















